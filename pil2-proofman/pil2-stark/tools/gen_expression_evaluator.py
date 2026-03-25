#!/usr/bin/env python3
"""
Generate optimized CUDA expression evaluator from bytecode dump.

Reads the binary dump created by the expression instrumentation and generates
a .cu file with register-resident intermediates and no interpreter overhead.

Usage: python3 gen_expression_evaluator.py /tmp/expr_dump_*.bin -o generated_eval.cuh
"""

import struct
import sys
import os
import glob


def read_dump(path):
    with open(path, 'rb') as f:
        data = f.read()
    off = 0
    nOps, nArgs, nTemp1, nTemp3, destDim, bufferCommitSize = struct.unpack_from('<6I', data, off)
    off += 24
    ops = list(struct.unpack_from(f'<{nOps}B', data, off))
    off += nOps
    args = list(struct.unpack_from(f'<{nArgs}H', data, off))
    off += nArgs * 2
    nNumbers, = struct.unpack_from('<I', data, off)
    off += 4
    numbers = list(struct.unpack_from(f'<{nNumbers}Q', data, off))
    return {
        'nOps': nOps, 'nArgs': nArgs, 'nTemp1': nTemp1, 'nTemp3': nTemp3,
        'destDim': destDim, 'bufferCommitSize': bufferCommitSize,
        'ops': ops, 'args': args, 'numbers': numbers, 'nNumbers': nNumbers
    }


def gen_load(src_type, src_arg, src_offset, dim, base, var_prefix):
    """Generate CUDA code to load a source operand. Returns (code_lines, var_names).
    All variables are declared in the OUTER scope (no curly-brace blocks)."""
    lines = []

    # Temp buffers: direct register access
    if src_type == base:  # tmp1
        return lines, [f'tmp1_{src_arg}', None, None]
    if src_type == base + 1:  # tmp3
        if dim == 1:
            return lines, [f'tmp3_{src_arg}_0', None, None]
        return lines, [f'tmp3_{src_arg}_0', f'tmp3_{src_arg}_1', f'tmp3_{src_arg}_2']

    # Broadcast constants (same for all threads)
    if src_type >= base + 2:
        if dim == 1:
            v = f'{var_prefix}'
            lines.append(f'gl64_t {v} = *(gl64_t*)&expressions_params[{src_type}][{src_arg}];')
            return lines, [v, None, None]
        else:
            v0, v1, v2 = f'{var_prefix}_0', f'{var_prefix}_1', f'{var_prefix}_2'
            lines.append(f'gl64_t {v0} = *(gl64_t*)&expressions_params[{src_type}][{src_arg}];')
            lines.append(f'gl64_t {v1} = *(gl64_t*)&expressions_params[{src_type}][{src_arg}+1];')
            lines.append(f'gl64_t {v2} = *(gl64_t*)&expressions_params[{src_type}][{src_arg}+2];')
            return lines, [v0, v1, v2]

    # zi (zerofier inverse)
    if src_type == 4:
        v = f'{var_prefix}'
        lines.append(f'gl64_t {v} = *(gl64_t*)&dParams->aux_trace[dArgs->zi_offset + ({src_arg} - 1) * domainSize + row + threadIdx.x];')
        return lines, [v, None, None]

    # constPols (type 0)
    if src_type == 0:
        ncols = 'dArgs->mapSectionsN[0]'
        baseptr = 'dExpsArgs->domainExtended ? dParams->pConstPolsExtendedTreeAddress : dParams->pConstPolsAddress'
        if dim == 1:
            v = f'{var_prefix}'
            lines.append(f'gl64_t {v} = *(gl64_t*)&({baseptr})[usePack256 ? getBufferOffset_pack256(chunkBase, {src_arg}, domainSize, {ncols}) : getBufferOffset(logicalRow_{src_offset}, {src_arg}, domainSize, {ncols})];')
            return lines, [v, None, None]
        else:
            v0, v1, v2 = f'{var_prefix}_0', f'{var_prefix}_1', f'{var_prefix}_2'
            for d in range(3):
                lines.append(f'gl64_t {var_prefix}_{d} = *(gl64_t*)&({baseptr})[usePack256 ? getBufferOffset_pack256(chunkBase, {src_arg}+{d}, domainSize, {ncols}) : getBufferOffset(logicalRow_{src_offset}, {src_arg}+{d}, domainSize, {ncols})];')
            return lines, [v0, v1, v2]

    # trace stage 1 (type 1)
    if src_type == 1:
        ncols = 'dArgs->mapSectionsN[1]'
        if dim == 1:
            v = f'{var_prefix}'
            lines.append(f'gl64_t {v} = *(gl64_t*)&dParams->trace[usePack256 ? getBufferOffset_pack256(chunkBase, {src_arg}, domainSize, {ncols}) : getBufferOffset(logicalRow_{src_offset}, {src_arg}, domainSize, {ncols})];')
            return lines, [v, None, None]
        else:
            v0, v1, v2 = f'{var_prefix}_0', f'{var_prefix}_1', f'{var_prefix}_2'
            for d in range(3):
                lines.append(f'gl64_t {var_prefix}_{d} = *(gl64_t*)&dParams->trace[usePack256 ? getBufferOffset_pack256(chunkBase, {src_arg}+{d}, domainSize, {ncols}) : getBufferOffset(logicalRow_{src_offset}, {src_arg}+{d}, domainSize, {ncols})];')
            return lines, [v0, v1, v2]

    # aux_trace stages 2-3 (types 2-3)
    if src_type >= 2 and src_type <= 3:
        ncols = f'dArgs->mapSectionsN[{src_type}]'
        if dim == 1:
            v = f'{var_prefix}'
            lines.append(f'gl64_t {v} = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[{src_type}] + (usePack256 ? getBufferOffset_pack256(chunkBase, {src_arg}, domainSize, {ncols}) : getBufferOffset(logicalRow_{src_offset}, {src_arg}, domainSize, {ncols}))];')
            return lines, [v, None, None]
        else:
            v0, v1, v2 = f'{var_prefix}_0', f'{var_prefix}_1', f'{var_prefix}_2'
            # Use same-tile fast path when col % 4 <= 1
            if isinstance(src_arg, int) and (src_arg & 3) <= 1:
                lines.append(f'uint64_t {var_prefix}_pos = dExpsArgs->mapOffsetsExps[{src_type}] + (usePack256 ? getBufferOffset_pack256(chunkBase, {src_arg}, domainSize, {ncols}) : getBufferOffset(logicalRow_{src_offset}, {src_arg}, domainSize, {ncols}));')
                lines.append(f'gl64_t {v0} = *(gl64_t*)&dParams->aux_trace[{var_prefix}_pos];')
                lines.append(f'gl64_t {v1} = *(gl64_t*)&dParams->aux_trace[{var_prefix}_pos + TILE_HEIGHT];')
                lines.append(f'gl64_t {v2} = *(gl64_t*)&dParams->aux_trace[{var_prefix}_pos + 2*TILE_HEIGHT];')
            else:
                for d in range(3):
                    lines.append(f'gl64_t {var_prefix}_{d} = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[{src_type}] + (usePack256 ? getBufferOffset_pack256(chunkBase, {src_arg}+{d}, domainSize, {ncols}) : getBufferOffset(logicalRow_{src_offset}, {src_arg}+{d}, domainSize, {ncols}))];')
            return lines, [v0, v1, v2]

    # Custom commits (type 5+, where base = bufferCommitSize)
    if src_type >= 5 and src_type < base:
        nstages = base - 3  # bufferCommitSize = 1 + nStages + 3 + nCustoms, nStages is 2 typically
        idx = src_type - (nstages + 1)  # approximate custom commit index
        if dim == 1:
            v = f'{var_prefix}'
            lines.append(f'gl64_t {v} = *(gl64_t*)&dParams->pCustomCommitsFixed[dExpsArgs->mapOffsetsCustomExps[{idx}] + getBufferOffset(logicalRow_{src_offset}, {src_arg}, domainSize, dArgs->mapSectionsNCustomFixed[{idx}])];')
            return lines, [v, None, None]
        else:
            v0, v1, v2 = f'{var_prefix}_0', f'{var_prefix}_1', f'{var_prefix}_2'
            for d in range(3):
                lines.append(f'gl64_t {var_prefix}_{d} = *(gl64_t*)&dParams->pCustomCommitsFixed[dExpsArgs->mapOffsetsCustomExps[{idx}] + getBufferOffset(logicalRow_{src_offset}, {src_arg}+{d}, domainSize, dArgs->mapSectionsNCustomFixed[{idx}])];')
            return lines, [v0, v1, v2]

    # Fallback
    v = f'{var_prefix}'
    lines.append(f'gl64_t {v} = gl64_t(uint64_t(0)); // unknown type {src_type}')
    return lines, [v, None, None]


def generate_evaluator(dump, out_path):
    nOps = dump['nOps']
    nTemp1 = dump['nTemp1']
    nTemp3 = dump['nTemp3']
    destDim = dump['destDim']
    base = dump['bufferCommitSize']
    ops = dump['ops']
    args = dump['args']

    # Collect unique stride offsets used
    stride_offsets = set()
    for i in range(nOps):
        a = args[i*8:(i+1)*8]
        stride_offsets.add(a[4])
        stride_offsets.add(a[7])

    lines = []
    lines.append('// Auto-generated expression evaluator')
    lines.append('// Register-resident temporaries eliminate shared memory overhead')
    lines.append('')
    lines.append('template<bool IsCyclic>')
    lines.append('__device__ __forceinline__ void eval_expression_generated_(')
    lines.append('    const StepsParams* __restrict__ dParams,')
    lines.append('    const DeviceArguments* __restrict__ dArgs,')
    lines.append('    const ExpsArguments* __restrict__ dExpsArgs,')
    lines.append('    Goldilocks::Element **expressions_params,')
    lines.append(f'    uint32_t bufferCommitsSize, uint64_t row)')
    lines.append('{')
    lines.append('    const uint64_t domainSize = dExpsArgs->domainSize;')
    lines.append('    const uint64_t r = row + threadIdx.x;')
    lines.append('    const bool usePack256 = !IsCyclic && blockDim.x == TILE_HEIGHT;')
    lines.append('    const uint64_t chunkBase = row;')
    lines.append('')

    # Declare logical rows for each stride offset
    for so in sorted(stride_offsets):
        lines.append(f'    uint64_t logicalRow_{so};')
    lines.append('    if constexpr (IsCyclic) {')
    for so in sorted(stride_offsets):
        lines.append(f'        logicalRow_{so} = (r + dExpsArgs->nextStridesExps[{so}]) % domainSize;')
    lines.append('    } else {')
    for so in sorted(stride_offsets):
        lines.append(f'        logicalRow_{so} = r + dExpsArgs->nextStridesExps[{so}];')
    lines.append('    }')

    # Register-resident temporaries
    lines.append('')
    lines.append('    // Register-resident temporaries')
    for t in range(nTemp1):
        lines.append(f'    gl64_t tmp1_{t} = gl64_t(uint64_t(0));')
    for t in range(nTemp3):
        lines.append(f'    gl64_t tmp3_{t}_0 = gl64_t(uint64_t(0)), tmp3_{t}_1 = gl64_t(uint64_t(0)), tmp3_{t}_2 = gl64_t(uint64_t(0));')

    lines.append('')
    lines.append('    // Straight-line evaluation')

    last_dest_type = None
    last_dest_idx = None

    for i in range(nOps):
        a = args[i*8:(i+1)*8]
        arith_op = a[0]
        dest_idx = a[1]
        src0_type, src0_arg, src0_offset = a[2], a[3], a[4]
        src1_type, src1_arg, src1_offset = a[5], a[6], a[7]
        op_type = ops[i]

        arith_names = {0: 'add', 1: 'sub', 2: 'mul', 3: 'sub_swap'}
        dim0 = 1 if op_type == 0 else 3
        dim1 = 1 if op_type <= 1 else 3

        if op_type == 0:
            dest_var = f'tmp1_{dest_idx}'
            last_dest_type = 'tmp1'
        else:
            dest_var = f'tmp3_{dest_idx}'
            last_dest_type = 'tmp3'
        last_dest_idx = dest_idx

        lines.append(f'    // Op {i}: {["dim1x1","dim3x1","dim3x3"][op_type]} {arith_names[arith_op]}')

        # Generate source loads (all in outer scope, no curly-brace blocks)
        src0_lines, src0_vars = gen_load(src0_type, src0_arg, src0_offset, dim0, base, f's0_{i}')
        src1_lines, src1_vars = gen_load(src1_type, src1_arg, src1_offset, dim1, base, f's1_{i}')

        for l in src0_lines:
            lines.append(f'    {l}')
        for l in src1_lines:
            lines.append(f'    {l}')

        # Generate arithmetic
        if op_type == 0:  # dim1x1
            av, bv = src0_vars[0], src1_vars[0]
            if arith_op == 0:   lines.append(f'    {dest_var} = {av} + {bv};')
            elif arith_op == 1: lines.append(f'    {dest_var} = {av} - {bv};')
            elif arith_op == 2: lines.append(f'    {dest_var} = {av} * {bv};')
            elif arith_op == 3: lines.append(f'    {dest_var} = {bv} - {av};')

        elif op_type == 1:  # dim3x1
            a0, a1, a2 = src0_vars
            b0 = src1_vars[0]
            d0, d1, d2 = f'{dest_var}_0', f'{dest_var}_1', f'{dest_var}_2'
            if arith_op == 0:
                lines.append(f'    {d0} = {a0} + {b0}; {d1} = {a1}; {d2} = {a2};')
            elif arith_op == 1:
                lines.append(f'    {d0} = {a0} - {b0}; {d1} = {a1}; {d2} = {a2};')
            elif arith_op == 2:
                lines.append(f'    {d0} = {a0} * {b0}; {d1} = {a1} * {b0}; {d2} = {a2} * {b0};')
            elif arith_op == 3:
                lines.append(f'    {d0} = {b0} - {a0}; {d1} = -({a1}); {d2} = -({a2});')

        elif op_type == 2:  # dim3x3
            a0, a1, a2 = src0_vars
            b0, b1, b2 = src1_vars
            d0, d1, d2 = f'{dest_var}_0', f'{dest_var}_1', f'{dest_var}_2'
            if arith_op == 0:
                lines.append(f'    {d0} = {a0} + {b0}; {d1} = {a1} + {b1}; {d2} = {a2} + {b2};')
            elif arith_op == 1:
                lines.append(f'    {d0} = {a0} - {b0}; {d1} = {a1} - {b1}; {d2} = {a2} - {b2};')
            elif arith_op == 2:
                lines.append(f'    {d0} = ({a0} + {a1}) * ({b0} + {b1});')
                lines.append(f'    gl64_t B_{i} = ({a0} + {a2}) * ({b0} + {b2});')
                lines.append(f'    gl64_t C_{i} = ({a1} + {a2}) * ({b1} + {b2});')
                lines.append(f'    gl64_t D_{i} = {a0} * {b0};')
                lines.append(f'    gl64_t E_{i} = {a1} * {b1};')
                lines.append(f'    gl64_t F_{i} = {a2} * {b2};')
                lines.append(f'    gl64_t G_{i} = D_{i} - E_{i};')
                lines.append(f'    gl64_t A_{i} = {d0};')  # d0 holds (a0+a1)*(b0+b1)
                lines.append(f'    {d0} = (C_{i} + G_{i}) - F_{i};')
                lines.append(f'    {d1} = ((((A_{i} + C_{i}) - E_{i}) - E_{i}) - D_{i});')
                lines.append(f'    {d2} = B_{i} - G_{i};')
            elif arith_op == 3:
                lines.append(f'    {d0} = {b0} - {a0}; {d1} = {b1} - {a1}; {d2} = {b2} - {a2};')

    # Write result to the location storePolynomial__ expects
    lines.append('')
    lines.append('    // Write final result to shared memory for storePolynomial__')
    if last_dest_type == 'tmp3':
        lines.append(f'    expressions_params[bufferCommitsSize + 1][{last_dest_idx} * blockDim.x * 3 + threadIdx.x] = (Goldilocks::Element)tmp3_{last_dest_idx}_0;')
        lines.append(f'    expressions_params[bufferCommitsSize + 1][{last_dest_idx} * blockDim.x * 3 + blockDim.x + threadIdx.x] = (Goldilocks::Element)tmp3_{last_dest_idx}_1;')
        lines.append(f'    expressions_params[bufferCommitsSize + 1][{last_dest_idx} * blockDim.x * 3 + 2*blockDim.x + threadIdx.x] = (Goldilocks::Element)tmp3_{last_dest_idx}_2;')
    elif last_dest_type == 'tmp1':
        lines.append(f'    expressions_params[bufferCommitsSize][{last_dest_idx} * blockDim.x + threadIdx.x] = (Goldilocks::Element)tmp1_{last_dest_idx};')
    lines.append('}')

    with open(out_path, 'w') as f:
        f.write('\n'.join(lines))
        f.write('\n')

    print(f"Generated evaluator: {nOps} ops, {nTemp1} tmp1 + {nTemp3} tmp3 regs -> {out_path}")
    return True


if __name__ == '__main__':
    dump_files = glob.glob('/tmp/expr_dump_*.bin')
    if not dump_files:
        print("No dump files found. Run prove with dump instrumentation first.")
        sys.exit(1)

    for path in dump_files:
        dump = read_dump(path)
        expId = os.path.basename(path).replace('expr_dump_', '').replace('.bin', '')
        out = f'/tmp/generated_eval_{expId}.cuh'
        generate_evaluator(dump, out)
