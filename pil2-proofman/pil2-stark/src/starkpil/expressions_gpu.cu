#include "expressions_gpu.cuh"
#include "cuda_utils.cuh"
#include "cuda_utils.hpp"
#include "gl64_tooling.cuh"
#include "goldilocks_cubic_extension.cuh"

extern __shared__ Goldilocks::Element scratchpad[];

// Pre-decoded operand: all metadata resolved at init time, no branching at runtime
struct PreDecodedSrc {
    uint16_t paramsIdx;   // index into expressions_params[]
    uint16_t col;         // column for getBufferOffset
    uint16_t nCols;       // nCols for getBufferOffset
    int64_t  stride;      // pre-resolved stride value (0 for no stride)
    uint64_t baseOffset;  // offset from expressions_params[paramsIdx] base
    uint8_t  dim;         // 1 or 3
    bool     isConst;     // true if broadcast (same value for all rows)
};

struct PreDecodedOp {
    uint8_t dimCombo;     // 0=1x1, 1=3x1, 2=3x3
    uint8_t arithOp;      // 0=add, 1=sub, 2=mul, 3=sub_swap
    uint16_t destIdx;     // temp buffer slot index
    PreDecodedSrc src[2]; // two source operands
};

ExpressionsGPU::ExpressionsGPU(SetupCtx &setupCtx, uint32_t nRowsPack, uint32_t nBlocks) : ExpressionsCtx(setupCtx), nRowsPack(nRowsPack), nBlocks(nBlocks)
{
    
    uint32_t ns = 1 + setupCtx.starkInfo.nStages + 1;
    uint32_t nCustoms = setupCtx.starkInfo.customCommits.size();
    uint32_t nOpenings = setupCtx.starkInfo.openingPoints.size();
    uint32_t nStages_ = setupCtx.starkInfo.nStages;
    uint64_t N = 1 << setupCtx.starkInfo.starkStruct.nBits;
    uint64_t NExtended = 1 << setupCtx.starkInfo.starkStruct.nBitsExt;

    bufferCommitSize = 1 + nStages_ + 3 + nCustoms;

    h_deviceArgs.N = N;
    h_deviceArgs.NExtended = NExtended;
    h_deviceArgs.nBlocks = nBlocks;
    h_deviceArgs.nStages = nStages_;
    h_deviceArgs.nCustomCommits = nCustoms;
    h_deviceArgs.bufferCommitSize = bufferCommitSize;
    
    h_deviceArgs.zi_offset = setupCtx.starkInfo.mapOffsets[std::make_pair("zi", true)];

    CHECKCUDAERR(cudaMalloc(&h_deviceArgs.mapOffsets, ns * sizeof(uint64_t)));
    CHECKCUDAERR(cudaMalloc(&h_deviceArgs.mapOffsetsExtended, ns * sizeof(uint64_t)));
    CHECKCUDAERR(cudaMalloc(&h_deviceArgs.mapOffsetsCustomFixed, nCustoms * sizeof(uint64_t)));
    CHECKCUDAERR(cudaMalloc(&h_deviceArgs.mapOffsetsCustomFixedExtended, nCustoms * sizeof(uint64_t)));
    CHECKCUDAERR(cudaMalloc(&h_deviceArgs.nextStrides, nOpenings * sizeof(uint64_t)));
    CHECKCUDAERR(cudaMalloc(&h_deviceArgs.nextStridesExtended, nOpenings * sizeof(uint64_t)));
    CHECKCUDAERR(cudaMalloc(&h_deviceArgs.mapSectionsN, ns * sizeof(uint64_t)));
    CHECKCUDAERR(cudaMalloc(&h_deviceArgs.mapSectionsNCustomFixed, nCustoms * sizeof(uint64_t)));

    CHECKCUDAERR(cudaMemcpy(h_deviceArgs.mapOffsets, mapOffsets, ns * sizeof(uint64_t), cudaMemcpyHostToDevice));
    CHECKCUDAERR(cudaMemcpy(h_deviceArgs.mapOffsetsExtended, mapOffsetsExtended, ns * sizeof(uint64_t), cudaMemcpyHostToDevice));
    CHECKCUDAERR(cudaMemcpy(h_deviceArgs.mapOffsetsCustomFixed, mapOffsetsCustomFixed, nCustoms * sizeof(uint64_t), cudaMemcpyHostToDevice));
    CHECKCUDAERR(cudaMemcpy(h_deviceArgs.mapOffsetsCustomFixedExtended, mapOffsetsCustomFixedExtended, nCustoms * sizeof(uint64_t), cudaMemcpyHostToDevice));
    CHECKCUDAERR(cudaMemcpy(h_deviceArgs.nextStrides, nextStrides, nOpenings * sizeof(uint64_t), cudaMemcpyHostToDevice));
    CHECKCUDAERR(cudaMemcpy(h_deviceArgs.nextStridesExtended, nextStridesExtended, nOpenings * sizeof(uint64_t), cudaMemcpyHostToDevice));
    CHECKCUDAERR(cudaMemcpy(h_deviceArgs.mapSectionsN, mapSectionsN, ns * sizeof(uint64_t), cudaMemcpyHostToDevice));
    CHECKCUDAERR(cudaMemcpy(h_deviceArgs.mapSectionsNCustomFixed, mapSectionsNCustomFixed, nCustoms * sizeof(uint64_t), cudaMemcpyHostToDevice));


    ParserArgs parserArgs = setupCtx.expressionsBin.expressionsBinArgsExpressions;
    CHECKCUDAERR(cudaMalloc(&h_deviceArgs.numbers, parserArgs.nNumbers * sizeof(Goldilocks::Element)));
    CHECKCUDAERR(cudaMemcpy(h_deviceArgs.numbers, (Goldilocks::Element *)parserArgs.numbers, parserArgs.nNumbers * sizeof(Goldilocks::Element),cudaMemcpyHostToDevice));

    CHECKCUDAERR(cudaMalloc(&h_deviceArgs.ops, setupCtx.expressionsBin.nOpsTotal * sizeof(uint8_t)));   
    CHECKCUDAERR(cudaMalloc(&h_deviceArgs.args, setupCtx.expressionsBin.nArgsTotal * sizeof(uint16_t))); 
    CHECKCUDAERR(cudaMemcpy(h_deviceArgs.ops, parserArgs.ops, setupCtx.expressionsBin.nOpsTotal * sizeof(uint8_t), cudaMemcpyHostToDevice));
    CHECKCUDAERR(cudaMemcpy(h_deviceArgs.args, parserArgs.args, setupCtx.expressionsBin.nArgsTotal * sizeof(uint16_t), cudaMemcpyHostToDevice));

    ParserArgs parserArgsConstraints = setupCtx.expressionsBin.expressionsBinArgsConstraints;
    CHECKCUDAERR(cudaMalloc(&h_deviceArgs.numbersConstraints, parserArgsConstraints.nNumbers * sizeof(Goldilocks::Element)));
    CHECKCUDAERR(cudaMemcpy(h_deviceArgs.numbersConstraints, (Goldilocks::Element *)parserArgsConstraints.numbers, parserArgsConstraints.nNumbers * sizeof(Goldilocks::Element),cudaMemcpyHostToDevice));

    CHECKCUDAERR(cudaMalloc(&h_deviceArgs.opsConstraints, setupCtx.expressionsBin.nOpsDebug * sizeof(uint8_t)));   
    CHECKCUDAERR(cudaMalloc(&h_deviceArgs.argsConstraints, setupCtx.expressionsBin.nArgsDebug * sizeof(uint16_t))); 
    CHECKCUDAERR(cudaMemcpy(h_deviceArgs.opsConstraints, parserArgsConstraints.ops, setupCtx.expressionsBin.nOpsDebug * sizeof(uint8_t), cudaMemcpyHostToDevice));
    CHECKCUDAERR(cudaMemcpy(h_deviceArgs.argsConstraints, parserArgsConstraints.args, setupCtx.expressionsBin.nArgsDebug * sizeof(uint16_t), cudaMemcpyHostToDevice));


    CHECKCUDAERR(cudaMalloc(&d_deviceArgs, sizeof(DeviceArguments)));
    CHECKCUDAERR(cudaMemcpy(d_deviceArgs, &h_deviceArgs, sizeof(DeviceArguments), cudaMemcpyHostToDevice));
};

ExpressionsGPU::~ExpressionsGPU()
{
    CHECKCUDAERR(cudaFree(h_deviceArgs.mapOffsets));
    CHECKCUDAERR(cudaFree(h_deviceArgs.mapOffsetsExtended));
    CHECKCUDAERR(cudaFree(h_deviceArgs.nextStrides));
    CHECKCUDAERR(cudaFree(h_deviceArgs.nextStridesExtended));
    CHECKCUDAERR(cudaFree(h_deviceArgs.mapOffsetsCustomFixed));
    CHECKCUDAERR(cudaFree(h_deviceArgs.mapOffsetsCustomFixedExtended));
    CHECKCUDAERR(cudaFree(h_deviceArgs.mapSectionsN));
    CHECKCUDAERR(cudaFree(h_deviceArgs.mapSectionsNCustomFixed));
    CHECKCUDAERR(cudaFree(h_deviceArgs.numbers));
    CHECKCUDAERR(cudaFree(h_deviceArgs.ops));
    CHECKCUDAERR(cudaFree(h_deviceArgs.args));
    CHECKCUDAERR(cudaFree(h_deviceArgs.numbersConstraints));
    CHECKCUDAERR(cudaFree(h_deviceArgs.opsConstraints));
    CHECKCUDAERR(cudaFree(h_deviceArgs.argsConstraints));

    CHECKCUDAERR(cudaFree(d_deviceArgs));

    // Free pre-decoded ops
    for (auto &kv : d_predecOps) {
        CHECKCUDAERR(cudaFree(kv.second));
    }
}

void ExpressionsGPU::preDecodeExpression(uint64_t expId)
{
    if (d_predecOps.count(expId)) return;

    ParserParams &pp = setupCtx.expressionsBin.expressionsInfo[expId];
    ParserArgs &pa = setupCtx.expressionsBin.expressionsBinArgsExpressions;
    uint8_t *ops = &pa.ops[pp.opsOffset];
    uint16_t *args = &pa.args[pp.argsOffset];

    uint32_t base = bufferCommitSize;

    std::vector<PreDecodedOpGPU> h_ops(pp.nOps);
    for (uint32_t i = 0; i < pp.nOps; i++) {
        uint16_t *a = &args[i * 8];
        h_ops[i].dimCombo = ops[i];
        h_ops[i].arithOp = (uint8_t)a[0];
        h_ops[i].destIdx = a[1];

        for (int s = 0; s < 2; s++) {
            uint16_t type = a[2 + s*3];
            uint16_t argIdx = a[3 + s*3];
            uint16_t argOff = a[4 + s*3];

            PreDecodedSrcGPU &src = h_ops[i].src[s];
            src.paramsIdx = type;
            src.col = argIdx;
            src.stride = 0;
            src.baseOffset = 0;
            src.nCols = 0;
            src.isConst = 0;

            // Determine dim from op type
            if (s == 0) {
                src.dim = (ops[i] == 0) ? 1 : 3;
            } else {
                src.dim = (ops[i] <= 1) ? 1 : 3;
            }

            // Temp buffers: no getBufferOffset needed
            if (type == base || type == base + 1) {
                src.nCols = 0;
                src.isConst = 0;
                continue;
            }

            // Constants/broadcasts: same value for all threads
            if (type >= base + 2) {
                src.isConst = 1;
                src.nCols = 0;
                continue;
            }

            // Polynomial data: needs getBufferOffset at runtime
            src.isConst = 0;
            if (type == 4) {
                // zi: special offset computation
                src.nCols = 0;
            } else if (type == 0) {
                // constPols
                src.nCols = mapSectionsN[0];
            } else if (type >= 1 && type <= 3) {
                src.nCols = mapSectionsN[type];
                if (type >= 2) {
                    src.baseOffset = mapOffsetsExtended[type];
                }
            } else {
                // custom commits
                uint64_t idx = type - (setupCtx.starkInfo.nStages + 4);
                src.nCols = mapSectionsNCustomFixed[idx];
                src.baseOffset = mapOffsetsCustomFixedExtended[idx];
            }

            // Resolve stride offset
            if (argOff < setupCtx.starkInfo.openingPoints.size()) {
                src.stride = nextStridesExtended[argOff];
            }
        }
    }

    PreDecodedOpGPU *d_ops;
    CHECKCUDAERR(cudaMalloc(&d_ops, pp.nOps * sizeof(PreDecodedOpGPU)));
    CHECKCUDAERR(cudaMemcpy(d_ops, h_ops.data(), pp.nOps * sizeof(PreDecodedOpGPU), cudaMemcpyHostToDevice));
    d_predecOps[expId] = d_ops;
    predecNOps[expId] = pp.nOps;
}

void ExpressionsGPU::calculateExpressions_gpu(StepsParams *d_params, Dest dest, uint64_t domainSize, bool domainExtended, ExpsArguments *d_expsArgs, DestParamsGPU *d_destParams, Goldilocks::Element *pinned_exps_params, Goldilocks::Element *pinned_exps_args, uint64_t& countId, TimerGPU &timer, cudaStream_t stream, bool constraints)
{
    ExpsArguments h_expsArgs;

    uint32_t nrowsPack = std::min(static_cast<uint32_t>(nRowsPack), static_cast<uint32_t>(domainSize));
    h_expsArgs.nRowsPack = nrowsPack;
    
    h_expsArgs.mapOffsetsExps = domainExtended ? h_deviceArgs.mapOffsetsExtended : h_deviceArgs.mapOffsets;            
    h_expsArgs.mapOffsetsCustomExps = domainExtended ? h_deviceArgs.mapOffsetsCustomFixedExtended : h_deviceArgs.mapOffsetsCustomFixed;
    h_expsArgs.nextStridesExps = domainExtended ? h_deviceArgs.nextStridesExtended : h_deviceArgs.nextStrides;

    h_expsArgs.k_min = domainExtended
                             ? uint64_t((minRowExtended + h_expsArgs.nRowsPack - 1) / h_expsArgs.nRowsPack) * h_expsArgs.nRowsPack
                             : uint64_t((minRow + h_expsArgs.nRowsPack - 1) / h_expsArgs.nRowsPack) * h_expsArgs.nRowsPack;
    h_expsArgs.k_max = domainExtended
                             ? uint64_t(maxRowExtended / h_expsArgs.nRowsPack) * h_expsArgs.nRowsPack
                             : uint64_t(maxRow / h_expsArgs.nRowsPack) * h_expsArgs.nRowsPack;

    h_expsArgs.maxTemp1Size = 0;
    h_expsArgs.maxTemp3Size = 0;

    h_expsArgs.offsetTmp1 = setupCtx.starkInfo.mapOffsets[std::make_pair("tmp1", false)];
    h_expsArgs.offsetTmp3 = setupCtx.starkInfo.mapOffsets[std::make_pair("tmp3", false)];
    h_expsArgs.offsetDestVals = setupCtx.starkInfo.mapOffsets[std::make_pair("destVals", false)];

    for (uint64_t k = 0; k < dest.params.size(); ++k)
    {
        ParserParams &parserParams = constraints 
            ? setupCtx.expressionsBin.constraintsInfoDebug[dest.params[k].expId]
            : setupCtx.expressionsBin.expressionsInfo[dest.params[k].expId];
        if (parserParams.nTemp1*h_expsArgs.nRowsPack > h_expsArgs.maxTemp1Size) {
            h_expsArgs.maxTemp1Size = parserParams.nTemp1*h_expsArgs.nRowsPack;
        }
        if (parserParams.nTemp3*h_expsArgs.nRowsPack*FIELD_EXTENSION > h_expsArgs.maxTemp3Size) {
            h_expsArgs.maxTemp3Size = parserParams.nTemp3*h_expsArgs.nRowsPack*FIELD_EXTENSION;
        }
    }

    h_expsArgs.domainSize = domainSize;
    h_expsArgs.domainExtended = domainExtended;

    h_expsArgs.dest_gpu = dest.dest_gpu;
    h_expsArgs.dest_domainSize = dest.domainSize;
    h_expsArgs.dest_stageCols = dest.stageCols;
    h_expsArgs.dest_stagePos = dest.stagePos;
    h_expsArgs.dest_dim = dest.dim;
    h_expsArgs.dest_expr = dest.expr;
    h_expsArgs.dest_nParams = dest.params.size();

    assert(dest.params.size() == 1 || dest.params.size() == 2);

    DestParamsGPU* h_dest_params = new DestParamsGPU[h_expsArgs.dest_nParams];
    for (uint64_t j = 0; j < h_expsArgs.dest_nParams; ++j){

        ParserParams &parserParams = constraints 
            ? setupCtx.expressionsBin.constraintsInfoDebug[dest.params[j].expId]
            : setupCtx.expressionsBin.expressionsInfo[dest.params[j].expId];
        h_dest_params[j].dim = dest.params[j].dim;
        h_dest_params[j].stage = dest.params[j].stage;
        h_dest_params[j].stagePos = dest.params[j].stagePos;
        h_dest_params[j].polsMapId = dest.params[j].polsMapId;
        h_dest_params[j].rowOffsetIndex = dest.params[j].rowOffsetIndex;
        h_dest_params[j].inverse = dest.params[j].inverse;
        h_dest_params[j].op = dest.params[j].op;
        h_dest_params[j].value = dest.params[j].value;
        h_dest_params[j].nOps = parserParams.nOps;
        h_dest_params[j].opsOffset = parserParams.opsOffset;
        h_dest_params[j].nArgs = parserParams.nArgs;
        h_dest_params[j].argsOffset =parserParams.argsOffset;
    }

    memcpy(pinned_exps_params + countId * 2 * sizeof(DestParamsGPU), h_dest_params, h_expsArgs.dest_nParams * sizeof(DestParamsGPU));
    CHECKCUDAERR(cudaMemcpyAsync(d_destParams, pinned_exps_params + countId * 2 * sizeof(DestParamsGPU), h_expsArgs.dest_nParams * sizeof(DestParamsGPU), cudaMemcpyHostToDevice, stream));
    delete[] h_dest_params;

    memcpy(pinned_exps_args + countId * sizeof(ExpsArguments), &h_expsArgs, sizeof(ExpsArguments));
    CHECKCUDAERR(cudaMemcpyAsync(d_expsArgs, pinned_exps_args + countId * sizeof(ExpsArguments), sizeof(ExpsArguments), cudaMemcpyHostToDevice, stream));

    uint32_t nblocks_ = static_cast<uint32_t>(std::min<uint64_t>(static_cast<uint64_t>(nBlocks),(domainSize + nrowsPack - 1) / nrowsPack));
    uint32_t nthreads_ = nblocks_ == 1 ? domainSize : nrowsPack;
    dim3 nBlocks_ =  nblocks_;
    dim3 nThreads_ = nthreads_;
    
    assert(bufferCommitSize  + 9  < 32);
    size_t ptrMem = 32 * sizeof(Goldilocks::Element);
    size_t tmpMem = (h_expsArgs.maxTemp1Size + h_expsArgs.maxTemp3Size) * sizeof(Goldilocks::Element);
    bool useTmpInShared = tmpMem <= 40960 && tmpMem > 0;
    size_t sharedMem = useTmpInShared ? (ptrMem + tmpMem) : ptrMem;

    TimerStartCategoryGPU(timer, EXPRESSIONS);
    computeExpressions_<<<nBlocks_, nThreads_, sharedMem, stream>>>(d_params, d_deviceArgs, d_expsArgs, d_destParams, constraints);
    TimerStopCategoryGPU(timer, EXPRESSIONS);
}

void ExpressionsGPU::calculateExpressionsQ_gpu(StepsParams *d_params, Dest dest, uint64_t domainSize, bool domainExtended, ExpsArguments *d_expsArgs, DestParamsGPU *d_destParams, Goldilocks::Element *pinned_exps_params, Goldilocks::Element *pinned_exps_args, uint64_t& countId, TimerGPU &timer, cudaStream_t stream)
{
    ExpsArguments h_expsArgs;

    uint32_t nrowsPack = std::min(static_cast<uint32_t>(nRowsPack), static_cast<uint32_t>(domainSize));
    h_expsArgs.nRowsPack = nrowsPack;
    
    h_expsArgs.mapOffsetsExps = domainExtended ? h_deviceArgs.mapOffsetsExtended : h_deviceArgs.mapOffsets;            
    h_expsArgs.mapOffsetsCustomExps = domainExtended ? h_deviceArgs.mapOffsetsCustomFixedExtended : h_deviceArgs.mapOffsetsCustomFixed;
    h_expsArgs.nextStridesExps = domainExtended ? h_deviceArgs.nextStridesExtended : h_deviceArgs.nextStrides;

    h_expsArgs.k_min = domainExtended
                             ? uint64_t((minRowExtended + h_expsArgs.nRowsPack - 1) / h_expsArgs.nRowsPack) * h_expsArgs.nRowsPack
                             : uint64_t((minRow + h_expsArgs.nRowsPack - 1) / h_expsArgs.nRowsPack) * h_expsArgs.nRowsPack;
    h_expsArgs.k_max = domainExtended
                             ? uint64_t(maxRowExtended / h_expsArgs.nRowsPack) * h_expsArgs.nRowsPack
                             : uint64_t(maxRow / h_expsArgs.nRowsPack) * h_expsArgs.nRowsPack;

    h_expsArgs.maxTemp1Size = 0;
    h_expsArgs.maxTemp3Size = 0;

    h_expsArgs.offsetTmp1 = setupCtx.starkInfo.mapOffsets[std::make_pair("tmp1", false)];
    h_expsArgs.offsetTmp3 = setupCtx.starkInfo.mapOffsets[std::make_pair("tmp3", false)];
    h_expsArgs.offsetDestVals = setupCtx.starkInfo.mapOffsets[std::make_pair("destVals", false)];

    for (uint64_t k = 0; k < dest.params.size(); ++k)
    {
        ParserParams &parserParams = setupCtx.expressionsBin.expressionsInfo[dest.params[k].expId];
        if (parserParams.nTemp1*h_expsArgs.nRowsPack > h_expsArgs.maxTemp1Size) {
            h_expsArgs.maxTemp1Size = parserParams.nTemp1*h_expsArgs.nRowsPack;
        }
        if (parserParams.nTemp3*h_expsArgs.nRowsPack*FIELD_EXTENSION > h_expsArgs.maxTemp3Size) {
            h_expsArgs.maxTemp3Size = parserParams.nTemp3*h_expsArgs.nRowsPack*FIELD_EXTENSION;
        }
    }

    h_expsArgs.domainSize = domainSize;
    h_expsArgs.domainExtended = domainExtended;

    h_expsArgs.dest_gpu = dest.dest_gpu;
    h_expsArgs.dest_domainSize = dest.domainSize;
    h_expsArgs.dest_stageCols = dest.stageCols;
    h_expsArgs.dest_stagePos = dest.stagePos;
    h_expsArgs.dest_dim = dest.dim;
    h_expsArgs.dest_expr = dest.expr;
    h_expsArgs.dest_nParams = dest.params.size();

    DestParamsGPU* h_dest_params = new DestParamsGPU[h_expsArgs.dest_nParams];
    for (uint64_t j = 0; j < h_expsArgs.dest_nParams; ++j){

        ParserParams &parserParams = setupCtx.expressionsBin.expressionsInfo[dest.params[j].expId];
        h_dest_params[j].dim = dest.params[j].dim;
        h_dest_params[j].stage = dest.params[j].stage;
        h_dest_params[j].stagePos = dest.params[j].stagePos;
        h_dest_params[j].polsMapId = dest.params[j].polsMapId;
        h_dest_params[j].rowOffsetIndex = dest.params[j].rowOffsetIndex;
        h_dest_params[j].inverse = dest.params[j].inverse;
        h_dest_params[j].op = dest.params[j].op;
        h_dest_params[j].value = dest.params[j].value;
        h_dest_params[j].nOps = parserParams.nOps;
        h_dest_params[j].opsOffset = parserParams.opsOffset;
        h_dest_params[j].nArgs = parserParams.nArgs;
        h_dest_params[j].argsOffset =parserParams.argsOffset;
    }

    memcpy(pinned_exps_params + countId * 2 * sizeof(DestParamsGPU), h_dest_params, h_expsArgs.dest_nParams * sizeof(DestParamsGPU));
    CHECKCUDAERR(cudaMemcpyAsync(d_destParams, pinned_exps_params + countId * 2 * sizeof(DestParamsGPU), h_expsArgs.dest_nParams * sizeof(DestParamsGPU), cudaMemcpyHostToDevice, stream));
    delete[] h_dest_params;

    memcpy(pinned_exps_args + countId * sizeof(ExpsArguments), &h_expsArgs, sizeof(ExpsArguments));
    CHECKCUDAERR(cudaMemcpyAsync(d_expsArgs, pinned_exps_args + countId * sizeof(ExpsArguments), sizeof(ExpsArguments), cudaMemcpyHostToDevice, stream));

    uint32_t nblocks_ = static_cast<uint32_t>(std::min<uint64_t>(static_cast<uint64_t>(nBlocks),(domainSize + nrowsPack - 1) / nrowsPack));
    uint32_t nthreads_ = nblocks_ == 1 ? domainSize : nrowsPack;
    dim3 nBlocks_ =  nblocks_;
    dim3 nThreads_ = nthreads_;
    
    assert(bufferCommitSize  + 9  < 32);
    // Include temp buffers in dynamic shared memory if they fit in 40KB budget
    size_t ptrMem = 32 * sizeof(Goldilocks::Element);
    size_t tmpMem = (h_expsArgs.maxTemp1Size + h_expsArgs.maxTemp3Size) * sizeof(Goldilocks::Element);
    bool useTmpInShared = tmpMem <= 40960 && tmpMem > 0;
    size_t sharedMem = useTmpInShared ? (ptrMem + tmpMem) : ptrMem;

    TimerStartCategoryGPU(timer, EXPRESSIONS);
    computeExpression_<<<nBlocks_, nThreads_, sharedMem, stream>>>(d_params, d_deviceArgs, d_expsArgs, d_destParams);
    CHECKCUDAERR(cudaGetLastError());
    TimerStopCategoryGPU(timer, EXPRESSIONS);
}

__device__ __forceinline__ void load__(
    const DeviceArguments* __restrict__ dArgs,
    const ExpsArguments* __restrict__ dExpsArgs,
    const StepsParams* __restrict__ dParams,
    Goldilocks::Element** __restrict__ exprParams,
    const uint16_t type,
    const uint16_t argIdx,
    const uint16_t argOffset,
    const uint64_t row,
    const uint64_t dim,
    const bool isCyclic,
    gl64_t*& out0,
    gl64_t*& out1,
    gl64_t*& out2

) {

    const uint32_t r = row + threadIdx.x;
    const uint64_t base = dArgs->bufferCommitSize;
    const uint64_t domainSize = dExpsArgs->domainSize;

    // Fast-path: temporary/intermediate buffers
    if (type == base || type == base + 1) {
        //return &exprParams[type][argIdx * blockDim.x];
        if(dim == 1 ){
            out0 = (gl64_t*)&exprParams[type][argIdx * blockDim.x + threadIdx.x];
            out1 = nullptr;
            out2 = nullptr;
            return;
        } else {
            out0 =  (gl64_t*)&exprParams[type][argIdx * blockDim.x + threadIdx.x];
            out1 =  (gl64_t*)&exprParams[type][argIdx * blockDim.x + threadIdx.x + blockDim.x];
            out2 =  (gl64_t*)&exprParams[type][argIdx * blockDim.x + threadIdx.x + 2*blockDim.x];
            return;
        }
    }

    // Fast-path: constants
    if (type >= base + 2) {
        if(dim == 1 ){
            out0 = (gl64_t*)&exprParams[type][argIdx];
            out1 = nullptr;
            out2 = nullptr;
            return;
        } else {
            out0 = (gl64_t*)&exprParams[type][argIdx];
            out1 = (gl64_t*)&exprParams[type][argIdx + 1];
            out2 = (gl64_t*)&exprParams[type][argIdx + 2];
            return;
        }
    }

    const int64_t stride = dExpsArgs->nextStridesExps[argOffset];
    const uint64_t logicalRow = isCyclic ? (r + stride) % domainSize : (r + stride);

    // Use pack256 fast path when non-cyclic, stride==0, and blockDim==TILE_HEIGHT
    const bool usePack256 = !isCyclic && stride == 0 && blockDim.x == TILE_HEIGHT;
    const uint64_t chunkBase = row; // row is always blockDim.x-aligned

    // ConstPols
    if (type == 0) {
        const Goldilocks::Element* basePtr = dExpsArgs->domainExtended
            ? dParams->pConstPolsExtendedTreeAddress
            : dParams->pConstPolsAddress;

        const uint64_t nCols0 = dArgs->mapSectionsN[0];
        const uint64_t pos = usePack256
            ? getBufferOffset_pack256(chunkBase, argIdx, domainSize, nCols0)
            : getBufferOffset(logicalRow, argIdx, domainSize, nCols0);
        out0 = (gl64_t*)&basePtr[pos];
        out1 = nullptr;
        out2 = nullptr;
        return;
    }

    // Trace and aux_trace
    if (type >= 1 && type <= 3) {
        const uint64_t offset = dExpsArgs->mapOffsetsExps[type];
        const uint64_t nCols = dArgs->mapSectionsN[type];

        if (type == 1 && !dExpsArgs->domainExtended) {
            const uint64_t pos = usePack256
                ? getBufferOffset_pack256(chunkBase, argIdx, domainSize, nCols)
                : getBufferOffset(logicalRow, argIdx, domainSize, nCols);
            out0 = (gl64_t*)&dParams->trace[pos];
            out1 = nullptr;
            out2 = nullptr;
            return;
        } else if (dim == 3 && (argIdx & 3) <= 1) {
            // Same-tile fast path: all 3 extension columns in same tile
            // col_block values are argIdx&3, (argIdx+1)&3, (argIdx+2)&3 - all consecutive
            // Offsets differ by TILE_HEIGHT between consecutive columns in same tile
            const uint64_t pos0 = usePack256
                ? getBufferOffset_pack256(chunkBase, argIdx, domainSize, nCols)
                : getBufferOffset(logicalRow, argIdx, domainSize, nCols);
            out0 = (gl64_t*)&dParams->aux_trace[offset + pos0];
            out1 = (gl64_t*)&dParams->aux_trace[offset + pos0 + TILE_HEIGHT];
            out2 = (gl64_t*)&dParams->aux_trace[offset + pos0 + 2 * TILE_HEIGHT];
            return;
        } else {
            #pragma unroll
            for (uint64_t d = 0; d < dim; d++) {
                const uint64_t pos_ = usePack256
                    ? getBufferOffset_pack256(chunkBase, argIdx+d, domainSize, nCols)
                    : getBufferOffset(logicalRow, argIdx+d, domainSize, nCols);
                if(d == 0) out0 = (gl64_t*)&dParams->aux_trace[offset + pos_];
                if(d == 1) out1 = (gl64_t*)&dParams->aux_trace[offset + pos_];
                if(d == 2) out2 = (gl64_t*)&dParams->aux_trace[offset + pos_];
            }
            return;
        }
    }

    // Special case: zi
    if (type == 4) {
        //return &dParams->aux_trace[dArgs->zi_offset + (argIdx - 1) * domainSize + row];
        out0 = (gl64_t*)&dParams->aux_trace[dArgs->zi_offset + (argIdx - 1) * domainSize + row + threadIdx.x];
        out1 = nullptr;
        out2 = nullptr;
        return;
    }
    // Custom commits
    const uint64_t idx = type - (dArgs->nStages + 4);
    const uint64_t offset = dExpsArgs->mapOffsetsCustomExps[idx];
    const uint64_t nCols = dArgs->mapSectionsNCustomFixed[idx];
    const uint64_t pos = getBufferOffset(logicalRow, argIdx, domainSize, nCols);

    out0 = (gl64_t*)&dParams->pCustomCommitsFixed[offset + pos];
    out1 = nullptr;
    out2 = nullptr;
    return;
}

__device__ __noinline__ void storePolynomial__(ExpsArguments *d_expsArgs, Goldilocks::Element *destVals, uint64_t row)
{
    #pragma unroll
    for (uint32_t i = 0; i < d_expsArgs->dest_dim; i++) {
        if (!d_expsArgs->dest_expr) {
            uint64_t col = d_expsArgs->dest_stagePos + i;
            uint64_t nRows = d_expsArgs->dest_domainSize;
            uint64_t nCols = d_expsArgs->dest_stageCols;
            uint64_t idx = getBufferOffset(row + threadIdx.x, col, nRows, nCols);
            d_expsArgs->dest_gpu[idx] = destVals[i * blockDim.x + threadIdx.x];
        } else {
            d_expsArgs->dest_gpu[(row + threadIdx.x) * d_expsArgs->dest_dim + i] = destVals[i * blockDim.x + threadIdx.x];
        }
    }
}

__device__ __noinline__ void multiplyPolynomials__(ExpsArguments *d_expsArgs, DestParamsGPU *d_destParams, DeviceArguments *d_deviceArgs, gl64_t *destVals, uint64_t row)
{
    if (d_expsArgs->dest_dim == 1)
    {
        gl64_gpu::op_gpu(2, &destVals[0], &destVals[0], false, &destVals[FIELD_EXTENSION * blockDim.x], false);
    }
    else
    {
        if (d_destParams[0].dim == FIELD_EXTENSION && d_destParams[1].dim == FIELD_EXTENSION)
        {
            Goldilocks3GPU::mul_gpu_no_const(&destVals[0], &destVals[0], &destVals[FIELD_EXTENSION * blockDim.x]);
        }
        else if (d_destParams[0].dim == FIELD_EXTENSION && d_destParams[1].dim == 1)
        {
            Goldilocks3GPU::mul_31_gpu_no_const(&destVals[0], &destVals[0], &destVals[FIELD_EXTENSION * blockDim.x]);
        }
        else
        {
            Goldilocks3GPU::mul_31_gpu_no_const(&destVals[FIELD_EXTENSION * blockDim.x], &destVals[FIELD_EXTENSION * blockDim.x], &destVals[0]);
            destVals[threadIdx.x] = destVals[FIELD_EXTENSION * blockDim.x + threadIdx.x];
            destVals[blockDim.x + threadIdx.x] = destVals[(FIELD_EXTENSION + 1) * blockDim.x + threadIdx.x];
            destVals[2 * blockDim.x + threadIdx.x] = destVals[(FIELD_EXTENSION + 2) * blockDim.x + threadIdx.x];
        }
    }
    storePolynomial__(d_expsArgs, (Goldilocks::Element *)destVals, row);
}

__device__ __noinline__ void getInversePolinomial__(gl64_t *polynomial, uint64_t dim)
{
    int idx = threadIdx.x;
    if (dim == 1)
    {
        polynomial[idx] = polynomial[idx].reciprocal();
    }
    else if (dim == FIELD_EXTENSION)
    {
        Goldilocks3GPU::Element aux;
        aux[0] = polynomial[idx];
        aux[1] = polynomial[blockDim.x + idx];
        aux[2] = polynomial[2 * blockDim.x + idx];
        Goldilocks3GPU::inv(aux, aux);
        polynomial[idx] = aux[0];
        polynomial[blockDim.x + idx] = aux[1];
        polynomial[2 * blockDim.x + idx] = aux[2];
    }
}

__device__ __noinline__ bool caseNoOperations__(StepsParams *d_params, DeviceArguments *d_deviceArgs, ExpsArguments *d_expsArgs, DestParamsGPU *d_destParams, Goldilocks::Element *destVals, uint32_t k, uint64_t row)
{

    uint32_t r = row + threadIdx.x;

    if (d_destParams[k].op == opType::cm || d_destParams[k].op == opType::const_)
    { // roger: assumeixes k==0 en aqeusta part?
        uint64_t openingPointIndex = d_destParams[k].rowOffsetIndex;
        uint64_t stagePos = d_destParams[k].stagePos;
        int64_t o = d_expsArgs->nextStridesExps[openingPointIndex];
        uint64_t l = (r + o) % d_expsArgs->domainSize;
        uint64_t nCols = d_deviceArgs->mapSectionsN[0];
        if (d_destParams[k].op == opType::const_)
        {
            uint64_t pos = getBufferOffset(l, stagePos, d_expsArgs->domainSize, nCols);
            destVals[threadIdx.x] = d_params->pConstPolsAddress[pos];
        }
        else
        {
            uint64_t offset = d_expsArgs->mapOffsetsExps[d_destParams[k].stage];
            uint64_t nCols = d_deviceArgs->mapSectionsN[d_destParams[k].stage];
            if (d_destParams[k].stage == 1)
            {
                uint64_t pos = getBufferOffset(l, stagePos, d_expsArgs->domainSize, nCols); 
                destVals[threadIdx.x] = d_params->trace[pos];
            }
            else
            {
                for (uint64_t d = 0; d < d_destParams[k].dim; ++d)
                {
                    uint64_t pos = getBufferOffset(l, stagePos + d, d_expsArgs->domainSize, nCols);
                    destVals[threadIdx.x + d * blockDim.x] = d_params->aux_trace[offset + pos];
                }
            }
        }

        if (d_destParams[k].inverse)
        {
            getInversePolinomial__((gl64_t*) &destVals[k * FIELD_EXTENSION * blockDim.x], d_destParams[k].dim);
        }
        return true;
    }
    else if (d_destParams[k].op == opType::number)
    {
        destVals[k * FIELD_EXTENSION * blockDim.x + threadIdx.x].fe = d_destParams[k].value;
        return true;
    }
    else if (d_destParams[k].op == opType::airvalue)
    {
        if(d_destParams[k].dim == 1) {
            destVals[k * FIELD_EXTENSION * blockDim.x + threadIdx.x] = d_params->airValues[d_destParams[k].polsMapId];
        } else {
            destVals[k * FIELD_EXTENSION * blockDim.x + threadIdx.x] = d_params->airValues[d_destParams[k].polsMapId];
            destVals[k * FIELD_EXTENSION * blockDim.x + threadIdx.x + blockDim.x] = d_params->airValues[d_destParams[k].polsMapId + 1];
            destVals[k * FIELD_EXTENSION * blockDim.x + threadIdx.x + 2 * blockDim.x] = d_params->airValues[d_destParams[k].polsMapId + 2];
        }
        return true;
    }
    return false;
}

__device__ __forceinline__ void op_gpu_p2(uint64_t op, gl64_t *C, const gl64_t *a, const gl64_t *b)
{
    switch (op)
    {
        case 0: C[threadIdx.x] = *a + *b; break;
        case 1: C[threadIdx.x] = *a - *b; break;
        case 2: C[threadIdx.x] = *a * (*b); break;
        case 3: C[threadIdx.x] = *b - *a; break;
    }
}

__device__ __forceinline__ void op_31_gpu_p2(uint64_t op, gl64_t *C, const gl64_t *a0, const gl64_t *a1, const gl64_t *a2, const gl64_t *b ){

    switch (op)
    {
    case 0: {
        C[threadIdx.x] = *a0 + *b;
        C[blockDim.x + threadIdx.x] = *a1;
        C[2 * blockDim.x + threadIdx.x] = *a2;
        break;
    }
    case 1: {
        C[threadIdx.x] = *a0 - *b;
        C[blockDim.x + threadIdx.x] = *a1;
        C[2 * blockDim.x + threadIdx.x] = *a2;
        break;
    }
    case 2: {
        C[threadIdx.x] = *a0 * (*b);
        C[blockDim.x + threadIdx.x] = *a1 * (*b);
        C[2 * blockDim.x + threadIdx.x] = *a2 * (*b);
        break;
    }
    case 3: {
        C[threadIdx.x] = *b - *a0;
        C[blockDim.x + threadIdx.x] = -(*a1);
        C[2 * blockDim.x + threadIdx.x] = -(*a2);
        break;
    }
    }
}

__device__ __forceinline__ void op_33_gpu_p2(uint64_t op, gl64_t *C, const gl64_t *a0, const gl64_t *a1, const gl64_t *a2, const gl64_t *b0, const gl64_t *b1, const gl64_t *b2){
    switch (op)
    {
    case 0: {
            C[threadIdx.x] = (*a0) + (*b0);
            C[blockDim.x + threadIdx.x] = (*a1) + (*b1);
            C[2 * blockDim.x + threadIdx.x] = (*a2) + (*b2);

        break;
    }
    case 1: {

            C[threadIdx.x] = (*a0) - (*b0);
            C[blockDim.x + threadIdx.x] = (*a1) - (*b1);
            C[2 * blockDim.x + threadIdx.x] = (*a2) - (*b2);

        break;
    }
    case 2: {
            gl64_t A_ = ((*a0) + (*a1)) * ((*b0) + (*b1));
            gl64_t B_ = ((*a0) + (*a2)) * ((*b0) + (*b2));
            gl64_t C_ = ((*a1) + (*a2)) * ((*b1) + (*b2));
            gl64_t D_ = (*a0) * (*b0 );
            gl64_t E_ = (*a1) * (*b1);
            gl64_t F_ = (*a2) * (*b2);
            gl64_t G_ = D_ - E_;
            C[threadIdx.x] = (C_ + G_) - F_;
            C[blockDim.x + threadIdx.x] = ((((A_ + C_) - E_) - E_) - D_);
            C[2 * blockDim.x + threadIdx.x] = B_ - G_;
        break;
    }
    case 3: {
            C[threadIdx.x] = (*b0) - (*a0);
            C[blockDim.x + threadIdx.x] =  (*b1) -  (*a1);
            C[2 * blockDim.x + threadIdx.x] = (*b2) -  (*a2);
        break;
    }
    }
}

__global__  void computeExpressions_(StepsParams *d_params, DeviceArguments *d_deviceArgs, ExpsArguments *d_expsArgs, DestParamsGPU *d_destParams, bool constraints)
{

    int chunk_idx = blockIdx.x;
    uint64_t nchunks = d_expsArgs->domainSize / blockDim.x;

    uint32_t bufferCommitsSize = d_deviceArgs->bufferCommitSize;
    Goldilocks::Element **expressions_params = (Goldilocks::Element **)scratchpad;

    // Use temp buffers in dynamic shared memory if launch allocated space for them
    Goldilocks::Element *smem_after_ptrs_s = scratchpad + 32;
    uint64_t tmpTotal_s = d_expsArgs->maxTemp1Size + d_expsArgs->maxTemp3Size;
    bool useTmpSmem_s = tmpTotal_s > 0 && tmpTotal_s <= 5120;

    if (threadIdx.x == 0)
    {
        if (useTmpSmem_s) {
            expressions_params[bufferCommitsSize + 0] = smem_after_ptrs_s;
            expressions_params[bufferCommitsSize + 1] = smem_after_ptrs_s + d_expsArgs->maxTemp1Size;
        } else {
            expressions_params[bufferCommitsSize + 0] = (&d_params->aux_trace[d_expsArgs->offsetTmp1 + blockIdx.x * d_expsArgs->maxTemp1Size]);
            expressions_params[bufferCommitsSize + 1] = (&d_params->aux_trace[d_expsArgs->offsetTmp3 + blockIdx.x * d_expsArgs->maxTemp3Size]);
        }
        expressions_params[bufferCommitsSize + 2] = d_params->publicInputs;
        expressions_params[bufferCommitsSize + 3] = constraints ? d_deviceArgs->numbersConstraints : d_deviceArgs->numbers;
        expressions_params[bufferCommitsSize + 4] = d_params->airValues;
        expressions_params[bufferCommitsSize + 5] = d_params->proofValues;
        expressions_params[bufferCommitsSize + 6] = d_params->airgroupValues;
        expressions_params[bufferCommitsSize + 7] = d_params->challenges;
        expressions_params[bufferCommitsSize + 8] = d_params->evals;
    }
    __syncthreads();
    Goldilocks::Element *destVals = &(d_params->aux_trace[d_expsArgs->offsetDestVals + blockIdx.x * d_expsArgs->dest_nParams * blockDim.x * FIELD_EXTENSION]); 

    while (chunk_idx < nchunks)
    {
        uint64_t i = chunk_idx * blockDim.x;
        bool isCyclic = i < d_expsArgs->k_min || i >= d_expsArgs->k_max;
#pragma unroll 1
        for (uint64_t k = 0; k < d_expsArgs->dest_nParams; ++k)
        {
            if(caseNoOperations__(d_params, d_deviceArgs, d_expsArgs, d_destParams, destVals, k, i)){
                continue;
            }
            uint8_t *ops = constraints ? &d_deviceArgs->opsConstraints[d_destParams[k].opsOffset] : &d_deviceArgs->ops[d_destParams[k].opsOffset];
            uint16_t *args = constraints ? &d_deviceArgs->argsConstraints[d_destParams[k].argsOffset] : &d_deviceArgs->args[d_destParams[k].argsOffset];
            gl64_t *a0, *a1, *a2, *b0, *b1, *b2;

            uint64_t i_args = 0;
            uint64_t nOps = d_destParams[k].nOps;
            for (uint64_t kk = 0; kk < nOps; ++kk)

            {

                switch (ops[kk])
                {
                case 0:
                {
                    // OPERATION WITH DEST: dim1 - SRC0: dim1 - SRC1: dim1
                    load__(d_deviceArgs, d_expsArgs, d_params, expressions_params, args[i_args + 2], args[i_args + 3], args[i_args + 4], i, 1, isCyclic, a0, a1, a2);
                    load__(d_deviceArgs, d_expsArgs, d_params, expressions_params, args[i_args + 5], args[i_args + 6], args[i_args + 7], i, 1, isCyclic, b0, b1, b2);
                    gl64_t *res = (gl64_t*) (kk == nOps - 1 ? &destVals[k * FIELD_EXTENSION * blockDim.x] : &expressions_params[bufferCommitsSize][args[i_args + 1] * blockDim.x]);
                    op_gpu_p2(args[i_args], res, a0, b0);
                    i_args += 8;
                    break;
                }
                case 1:
                {
                    // OPERATION WITH DEST: dim3 - SRC0: dim3 - SRC1: dim1
                    load__(d_deviceArgs, d_expsArgs, d_params, expressions_params, args[i_args + 2], args[i_args + 3], args[i_args + 4], i, 3, isCyclic, a0, a1, a2);
                    load__(d_deviceArgs, d_expsArgs, d_params, expressions_params, args[i_args + 5], args[i_args + 6], args[i_args + 7], i, 1, isCyclic, b0, b1, b2);
                    gl64_t *res = (gl64_t*) (kk == nOps - 1 ? &destVals[k * FIELD_EXTENSION * blockDim.x] : &expressions_params[bufferCommitsSize + 1][args[i_args + 1] * blockDim.x]);
                    op_31_gpu_p2(args[i_args], res, a0, a1, a2, b0);
                    i_args += 8;
                    break;
                }
                case 2:
                {
                    // OPERATION WITH DEST: dim3 - SRC0: dim3 - SRC1: dim3
                    load__(d_deviceArgs, d_expsArgs, d_params, expressions_params, args[i_args + 2], args[i_args + 3], args[i_args + 4], i, 3, isCyclic, a0, a1, a2);
                    load__(d_deviceArgs, d_expsArgs, d_params, expressions_params, args[i_args + 5], args[i_args + 6], args[i_args + 7], i, 3, isCyclic, b0, b1, b2);
                    gl64_t *res = (gl64_t*) (kk == nOps - 1 ? &destVals[k * FIELD_EXTENSION * blockDim.x] : &expressions_params[bufferCommitsSize + 1][args[i_args + 1] * blockDim.x]);
                    op_33_gpu_p2(args[i_args], res, a0, a1, a2, b0, b1, b2);
                    i_args += 8;
                    break;
                }
                default:
                {
                    printf(" Wrong operation! %d \n", ops[kk]);
                }
                }
            }
            if (i_args !=  d_destParams[k].nArgs){
                printf(" %lu consumed args - %lu expected args \n", i_args, d_destParams[k].nArgs);
            }
            if (d_destParams[k].inverse)
            {
                getInversePolinomial__((gl64_t*) &destVals[k * FIELD_EXTENSION * blockDim.x], d_destParams[k].dim);
            }
            
        }

        if (d_expsArgs->dest_nParams == 2)
        {

            multiplyPolynomials__(d_expsArgs, d_destParams, d_deviceArgs, (gl64_t*) destVals, i);
        } else {
            storePolynomial__(d_expsArgs, destVals, i);
        }

        chunk_idx += gridDim.x;
    }

}


template<bool IsCyclic>
__device__ __forceinline__ void computeExpression_chunk_(
    StepsParams *d_params, DeviceArguments *d_deviceArgs, ExpsArguments *d_expsArgs,
    DestParamsGPU *d_destParams, Goldilocks::Element **expressions_params,
    uint32_t bufferCommitsSize, uint64_t i,
    const uint8_t * __restrict__ ops, const uint16_t * __restrict__ args)
{
    gl64_t *a0, *a1, *a2, *b0, *b1, *b2;
    gl64_t *res;

    uint64_t i_args = 0;
    uint64_t nOps = d_destParams[0].nOps;
    for (uint64_t kk = 0; kk < nOps; ++kk)
    {
        switch (ops[kk])
        {
        case 0:
        {
            load__(d_deviceArgs, d_expsArgs, d_params, expressions_params, args[i_args + 2], args[i_args + 3], args[i_args + 4], i, 1, IsCyclic, a0, a1, a2);
            load__(d_deviceArgs, d_expsArgs, d_params, expressions_params, args[i_args + 5], args[i_args + 6], args[i_args + 7], i, 1, IsCyclic, b0, b1, b2);
            res = (gl64_t*)&expressions_params[bufferCommitsSize][args[i_args + 1] * blockDim.x];
            op_gpu_p2(args[i_args], res, a0, b0);
            i_args += 8;
            break;
        }
        case 1:
        {
            load__(d_deviceArgs, d_expsArgs, d_params, expressions_params, args[i_args + 2], args[i_args + 3], args[i_args + 4], i, 3, IsCyclic, a0, a1, a2);
            load__(d_deviceArgs, d_expsArgs, d_params, expressions_params, args[i_args + 5], args[i_args + 6], args[i_args + 7], i, 1, IsCyclic, b0, b1, b2);
            res = (gl64_t*)&expressions_params[bufferCommitsSize + 1][args[i_args + 1] * blockDim.x];
            op_31_gpu_p2(args[i_args], res, a0, a1, a2, b0);
            i_args += 8;
            break;
        }
        case 2:
        {
            load__(d_deviceArgs, d_expsArgs, d_params, expressions_params, args[i_args + 2], args[i_args + 3], args[i_args + 4], i, 3, IsCyclic, a0, a1, a2);
            load__(d_deviceArgs, d_expsArgs, d_params, expressions_params, args[i_args + 5], args[i_args + 6], args[i_args + 7], i, 3, IsCyclic, b0, b1, b2);
            res = (gl64_t*)&expressions_params[bufferCommitsSize + 1][args[i_args + 1] * blockDim.x];
            op_33_gpu_p2(args[i_args], res, a0, a1, a2, b0, b1, b2);
            i_args += 8;
            break;
        }
        default:
        {
            printf(" Wrong operation! %d \n", ops[kk]);
        }
        }
    }
    if (i_args != d_destParams[0].nArgs){
        printf(" %lu consumed args - %lu expected args \n", i_args, d_destParams[0].nArgs);
    }

    storePolynomial__(d_expsArgs, (Goldilocks::Element *)res, i);
}

__global__  void computeExpression_(StepsParams *d_params, DeviceArguments *d_deviceArgs, ExpsArguments *d_expsArgs, DestParamsGPU *d_destParams)
{

    int chunk_idx = blockIdx.x;
    uint64_t nchunks = d_expsArgs->domainSize / blockDim.x;

    uint32_t bufferCommitsSize = d_deviceArgs->bufferCommitSize;
    Goldilocks::Element **expressions_params = (Goldilocks::Element **)scratchpad;

    // Static shared memory for ops/args staging
    __shared__ uint8_t ops_staged[256];
    __shared__ uint16_t args_staged[2048];

    uint64_t nOps = d_destParams[0].nOps;
    uint64_t nArgs = d_destParams[0].nArgs;

    // Use temp buffers in dynamic shared memory if launch allocated space for them
    Goldilocks::Element *smem_after_ptrs = scratchpad + 32;
    uint64_t tmpTotal = d_expsArgs->maxTemp1Size + d_expsArgs->maxTemp3Size;
    bool useTmpSmem = tmpTotal > 0 && tmpTotal <= 5120;

    if (threadIdx.x == 0)
    {
        if (useTmpSmem) {
            expressions_params[bufferCommitsSize + 0] = smem_after_ptrs;
            expressions_params[bufferCommitsSize + 1] = smem_after_ptrs + d_expsArgs->maxTemp1Size;
        } else {
            expressions_params[bufferCommitsSize + 0] = (&d_params->aux_trace[d_expsArgs->offsetTmp1 + blockIdx.x * d_expsArgs->maxTemp1Size]);
            expressions_params[bufferCommitsSize + 1] = (&d_params->aux_trace[d_expsArgs->offsetTmp3 + blockIdx.x * d_expsArgs->maxTemp3Size]);
        }
        expressions_params[bufferCommitsSize + 2] = d_params->publicInputs;
        expressions_params[bufferCommitsSize + 3] = d_deviceArgs->numbers;
        expressions_params[bufferCommitsSize + 4] = d_params->airValues;
        expressions_params[bufferCommitsSize + 5] = d_params->proofValues;
        expressions_params[bufferCommitsSize + 6] = d_params->airgroupValues;
        expressions_params[bufferCommitsSize + 7] = d_params->challenges;
        expressions_params[bufferCommitsSize + 8] = d_params->evals;
    }
    // Stage ops and args cooperatively
    const uint8_t *g_ops = &d_deviceArgs->ops[d_destParams[0].opsOffset];
    const uint16_t *g_args = &d_deviceArgs->args[d_destParams[0].argsOffset];
    for (uint32_t t = threadIdx.x; t < nOps && t < 256; t += blockDim.x) ops_staged[t] = g_ops[t];
    for (uint32_t t = threadIdx.x; t < nArgs && t < 2048; t += blockDim.x) args_staged[t] = g_args[t];
    __syncthreads();

    const uint8_t *active_ops = (nOps <= 256) ? ops_staged : g_ops;
    const uint16_t *active_args = (nArgs <= 2048) ? args_staged : g_args;

    uint64_t k_min_chunk = d_expsArgs->k_min / blockDim.x;
    uint64_t k_max_chunk = d_expsArgs->k_max / blockDim.x;

    while (chunk_idx < nchunks)
    {
        uint64_t i = chunk_idx * blockDim.x;
        if (chunk_idx < k_min_chunk || chunk_idx >= k_max_chunk) {
            computeExpression_chunk_<true>(d_params, d_deviceArgs, d_expsArgs, d_destParams, expressions_params, bufferCommitsSize, i, active_ops, active_args);
        } else {
            computeExpression_chunk_<false>(d_params, d_deviceArgs, d_expsArgs, d_destParams, expressions_params, bufferCommitsSize, i, active_ops, active_args);
        }

        chunk_idx += gridDim.x;
    }

}

// Pre-decoded inline load: uses pre-resolved metadata but dispatches through
// the same pointer paths as the original load__ function
__device__ __forceinline__ void load_predecoded_gpu_(
    const PreDecodedSrcGPU &src,
    const DeviceArguments* __restrict__ dArgs,
    const ExpsArguments* __restrict__ dExpsArgs,
    const StepsParams* __restrict__ dParams,
    Goldilocks::Element **expressions_params,
    uint64_t row, uint64_t domainSize, bool isCyclic,
    gl64_t *&out0, gl64_t *&out1, gl64_t *&out2)
{
    const uint32_t base = dArgs->bufferCommitSize;

    // Temp buffers (base+0, base+1): stored in expressions_params
    if (src.paramsIdx == base || src.paramsIdx == base + 1) {
        out0 = (gl64_t*)&expressions_params[src.paramsIdx][src.col * blockDim.x + threadIdx.x];
        if (src.dim >= 3) {
            out1 = (gl64_t*)&expressions_params[src.paramsIdx][(src.col + 1) * blockDim.x + threadIdx.x];
            out2 = (gl64_t*)&expressions_params[src.paramsIdx][(src.col + 2) * blockDim.x + threadIdx.x];
        } else { out1 = nullptr; out2 = nullptr; }
        return;
    }

    // Constants/broadcasts (base+2 and above): stored in expressions_params
    if (src.paramsIdx >= base + 2) {
        out0 = (gl64_t*)&expressions_params[src.paramsIdx][src.col];
        out1 = (src.dim >= 3) ? (gl64_t*)&expressions_params[src.paramsIdx][src.col + 1] : nullptr;
        out2 = (src.dim >= 3) ? (gl64_t*)&expressions_params[src.paramsIdx][src.col + 2] : nullptr;
        return;
    }

    // Polynomial data: use dParams directly (same as original load__)
    uint64_t r = row + threadIdx.x;
    uint64_t logicalRow = isCyclic ? (r + src.stride) % domainSize : (r + src.stride);
    const bool usePack256 = !isCyclic && src.stride == 0 && blockDim.x == TILE_HEIGHT;

    // zi
    if (src.paramsIdx == 4) {
        out0 = (gl64_t*)&dParams->aux_trace[dArgs->zi_offset + (src.col - 1) * domainSize + row + threadIdx.x];
        out1 = nullptr; out2 = nullptr;
        return;
    }

    // constPols (type 0)
    if (src.paramsIdx == 0) {
        const Goldilocks::Element* basePtr = dExpsArgs->domainExtended
            ? dParams->pConstPolsExtendedTreeAddress : dParams->pConstPolsAddress;
        uint64_t nCols0 = dArgs->mapSectionsN[0];
        uint64_t pos = usePack256 ? getBufferOffset_pack256(row, src.col, domainSize, nCols0)
                                  : getBufferOffset(logicalRow, src.col, domainSize, nCols0);
        out0 = (gl64_t*)&basePtr[pos];
        out1 = nullptr; out2 = nullptr;
        return;
    }

    // Trace/aux_trace (types 1-3)
    if (src.paramsIdx >= 1 && src.paramsIdx <= 3) {
        uint64_t offset = dExpsArgs->mapOffsetsExps[src.paramsIdx];
        uint64_t nCols = dArgs->mapSectionsN[src.paramsIdx];

        if (src.paramsIdx == 1 && !dExpsArgs->domainExtended) {
            uint64_t pos = usePack256 ? getBufferOffset_pack256(row, src.col, domainSize, nCols)
                                      : getBufferOffset(logicalRow, src.col, domainSize, nCols);
            out0 = (gl64_t*)&dParams->trace[pos];
            out1 = nullptr; out2 = nullptr;
            return;
        }

        if (src.dim == 3 && (src.col & 3) <= 1) {
            uint64_t pos0 = usePack256 ? getBufferOffset_pack256(row, src.col, domainSize, nCols)
                                       : getBufferOffset(logicalRow, src.col, domainSize, nCols);
            out0 = (gl64_t*)&dParams->aux_trace[offset + pos0];
            out1 = (gl64_t*)&dParams->aux_trace[offset + pos0 + TILE_HEIGHT];
            out2 = (gl64_t*)&dParams->aux_trace[offset + pos0 + 2 * TILE_HEIGHT];
            return;
        }

        for (uint64_t d = 0; d < src.dim; d++) {
            uint64_t pos_ = usePack256 ? getBufferOffset_pack256(row, src.col + d, domainSize, nCols)
                                       : getBufferOffset(logicalRow, src.col + d, domainSize, nCols);
            if (d == 0) out0 = (gl64_t*)&dParams->aux_trace[offset + pos_];
            if (d == 1) out1 = (gl64_t*)&dParams->aux_trace[offset + pos_];
            if (d == 2) out2 = (gl64_t*)&dParams->aux_trace[offset + pos_];
        }
        return;
    }

    // Custom commits (type 5+)
    uint64_t idx = src.paramsIdx - (dArgs->nStages + 4);
    uint64_t cOffset = dExpsArgs->mapOffsetsCustomExps[idx];
    uint64_t cNCols = dArgs->mapSectionsNCustomFixed[idx];
    uint64_t pos = getBufferOffset(logicalRow, src.col, domainSize, cNCols);
    out0 = (gl64_t*)&dParams->pCustomCommitsFixed[cOffset + pos];
    out1 = nullptr; out2 = nullptr;
}

// Pre-decoded expression evaluator kernel: uses pre-resolved metadata
// Eliminates ops/args array reads and load__ type-branching
template<bool IsCyclic>
__device__ __forceinline__ void computeExpression_predecoded_chunk_(
    StepsParams *d_params, DeviceArguments *d_deviceArgs, ExpsArguments *d_expsArgs,
    Goldilocks::Element **expressions_params,
    uint32_t bufferCommitsSize, uint64_t i,
    const PreDecodedOpGPU * __restrict__ predecOps, uint32_t nOps)
{
    gl64_t *a0, *a1, *a2, *b0, *b1, *b2;
    gl64_t *res = nullptr;
    uint64_t domainSize = d_expsArgs->domainSize;

    for (uint32_t kk = 0; kk < nOps; ++kk) {
        const PreDecodedOpGPU &op = predecOps[kk];

        load_predecoded_gpu_(op.src[0], d_deviceArgs, d_expsArgs, d_params, expressions_params, i, domainSize, IsCyclic, a0, a1, a2);
        load_predecoded_gpu_(op.src[1], d_deviceArgs, d_expsArgs, d_params, expressions_params, i, domainSize, IsCyclic, b0, b1, b2);

        switch (op.dimCombo) {
        case 0:
            res = (gl64_t*)&expressions_params[bufferCommitsSize][op.destIdx * blockDim.x];
            op_gpu_p2(op.arithOp, res, a0, b0);
            break;
        case 1:
            res = (gl64_t*)&expressions_params[bufferCommitsSize + 1][op.destIdx * blockDim.x];
            op_31_gpu_p2(op.arithOp, res, a0, a1, a2, b0);
            break;
        case 2:
            res = (gl64_t*)&expressions_params[bufferCommitsSize + 1][op.destIdx * blockDim.x];
            op_33_gpu_p2(op.arithOp, res, a0, a1, a2, b0, b1, b2);
            break;
        }
    }

    storePolynomial__(d_expsArgs, (Goldilocks::Element *)res, i);
}

__global__ void computeExpression_predecoded_(StepsParams *d_params, DeviceArguments *d_deviceArgs,
    ExpsArguments *d_expsArgs, DestParamsGPU *d_destParams,
    PreDecodedOpGPU *d_predecOps, uint32_t nPredecOps)
{
    int chunk_idx = blockIdx.x;
    uint64_t nchunks = d_expsArgs->domainSize / blockDim.x;

    uint32_t bufferCommitsSize = d_deviceArgs->bufferCommitSize;
    Goldilocks::Element **expressions_params = (Goldilocks::Element **)scratchpad;

    // Use temp buffers in dynamic shared memory if launch allocated space for them
    Goldilocks::Element *smem_after_ptrs = scratchpad + 32;
    uint64_t tmpTotal = d_expsArgs->maxTemp1Size + d_expsArgs->maxTemp3Size;
    bool useTmpSmem = tmpTotal > 0 && tmpTotal <= 5120;

    if (threadIdx.x == 0) {
        if (useTmpSmem) {
            expressions_params[bufferCommitsSize + 0] = smem_after_ptrs;
            expressions_params[bufferCommitsSize + 1] = smem_after_ptrs + d_expsArgs->maxTemp1Size;
        } else {
            expressions_params[bufferCommitsSize + 0] = (&d_params->aux_trace[d_expsArgs->offsetTmp1 + blockIdx.x * d_expsArgs->maxTemp1Size]);
            expressions_params[bufferCommitsSize + 1] = (&d_params->aux_trace[d_expsArgs->offsetTmp3 + blockIdx.x * d_expsArgs->maxTemp3Size]);
        }
        expressions_params[bufferCommitsSize + 2] = d_params->publicInputs;
        expressions_params[bufferCommitsSize + 3] = d_deviceArgs->numbers;
        expressions_params[bufferCommitsSize + 4] = d_params->airValues;
        expressions_params[bufferCommitsSize + 5] = d_params->proofValues;
        expressions_params[bufferCommitsSize + 6] = d_params->airgroupValues;
        expressions_params[bufferCommitsSize + 7] = d_params->challenges;
        expressions_params[bufferCommitsSize + 8] = d_params->evals;
    }
    __syncthreads();

    uint64_t k_min_chunk = d_expsArgs->k_min / blockDim.x;
    uint64_t k_max_chunk = d_expsArgs->k_max / blockDim.x;

    while (chunk_idx < nchunks) {
        uint64_t i = chunk_idx * blockDim.x;
        if (chunk_idx < k_min_chunk || chunk_idx >= k_max_chunk) {
            computeExpression_predecoded_chunk_<true>(d_params, d_deviceArgs, d_expsArgs, expressions_params, bufferCommitsSize, i, d_predecOps, nPredecOps);
        } else {
            computeExpression_predecoded_chunk_<false>(d_params, d_deviceArgs, d_expsArgs, expressions_params, bufferCommitsSize, i, d_predecOps, nPredecOps);
        }
        chunk_idx += gridDim.x;
    }
}