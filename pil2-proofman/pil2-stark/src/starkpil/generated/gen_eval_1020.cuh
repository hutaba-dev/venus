// Auto-generated expression evaluator - matches load__() semantics exactly
// Q expressions: domainExtended=true always, type 1 goes through aux_trace

// Fingerprint: 805e348b  nOps=799 nTemp1=5 nTemp3=5
#define GENERATED_EVAL_NOPS_805e348b 799
#define GENERATED_EVAL_NTEMP1_805e348b 5
#define GENERATED_EVAL_NTEMP3_805e348b 5

template<bool IsCyclic>
__device__ __forceinline__ void eval_expr_805e348b(
    const StepsParams* __restrict__ dParams,
    const DeviceArguments* __restrict__ dArgs,
    const ExpsArguments* __restrict__ dExpsArgs,
    Goldilocks::Element **expressions_params,
    uint32_t bufferCommitsSize, uint64_t row)
{
    const uint64_t domainSize = dExpsArgs->domainSize;
    const uint64_t r = row + threadIdx.x;
    const uint64_t chunkBase = row;

    // stride[0] = -2
    const int64_t stride_0 = dExpsArgs->nextStridesExps[0];
    uint64_t logicalRow_0;
    // stride[1] = 0
    const int64_t stride_1 = dExpsArgs->nextStridesExps[1];
    uint64_t logicalRow_1;
    // stride[2] = 2
    const int64_t stride_2 = dExpsArgs->nextStridesExps[2];
    uint64_t logicalRow_2;
    if constexpr (IsCyclic) {
        logicalRow_0 = (r + stride_0) % domainSize;
        logicalRow_1 = (r + stride_1) % domainSize;
        logicalRow_2 = (r + stride_2) % domainSize;
    } else {
        logicalRow_0 = r + stride_0;
        logicalRow_1 = r + stride_1;
        logicalRow_2 = r + stride_2;
    }

    const bool usePack256_0 = false; // stride=-2 != 0
    const bool usePack256_1 = !IsCyclic && blockDim.x == TILE_HEIGHT;
    const bool usePack256_2 = false; // stride=2 != 0

    const uint64_t nCols_0 = dArgs->mapSectionsN[0];
    const uint64_t nCols_1 = dArgs->mapSectionsN[1];
    const uint64_t nCols_2 = dArgs->mapSectionsN[2];

    // Register-resident temporaries: 5 tmp1 + 15 tmp3 slots
    gl64_t tmp1_0 = gl64_t(uint64_t(0));
    gl64_t tmp1_1 = gl64_t(uint64_t(0));
    gl64_t tmp1_2 = gl64_t(uint64_t(0));
    gl64_t tmp1_3 = gl64_t(uint64_t(0));
    gl64_t tmp1_4 = gl64_t(uint64_t(0));
    gl64_t tmp3_0 = gl64_t(uint64_t(0));
    gl64_t tmp3_1 = gl64_t(uint64_t(0));
    gl64_t tmp3_2 = gl64_t(uint64_t(0));
    gl64_t tmp3_3 = gl64_t(uint64_t(0));
    gl64_t tmp3_4 = gl64_t(uint64_t(0));
    gl64_t tmp3_5 = gl64_t(uint64_t(0));
    gl64_t tmp3_6 = gl64_t(uint64_t(0));
    gl64_t tmp3_7 = gl64_t(uint64_t(0));
    gl64_t tmp3_8 = gl64_t(uint64_t(0));
    gl64_t tmp3_9 = gl64_t(uint64_t(0));
    gl64_t tmp3_10 = gl64_t(uint64_t(0));
    gl64_t tmp3_11 = gl64_t(uint64_t(0));
    gl64_t tmp3_12 = gl64_t(uint64_t(0));
    gl64_t tmp3_13 = gl64_t(uint64_t(0));
    gl64_t tmp3_14 = gl64_t(uint64_t(0));

    // Op 0: dim1x1 sub
    gl64_t s0_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 33, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 33, domainSize, nCols_1))];
    gl64_t s1_0 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_0 - s1_0;
    // Op 1: dim1x1 mul
    gl64_t s0_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 33, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 33, domainSize, nCols_1))];
    tmp1_0 = s0_1 * tmp1_0;
    // Op 2: dim3x1 mul
    gl64_t s0_2_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s0_2_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s0_2_2 = *(gl64_t*)&expressions_params[13][6+2];
    tmp3_0 = s0_2_0 * tmp1_0; tmp3_1 = s0_2_1 * tmp1_0; tmp3_2 = s0_2_2 * tmp1_0;
    // Op 3: dim1x1 sub
    gl64_t s0_3 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 34, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 34, domainSize, nCols_1))];
    gl64_t s1_3 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_3 - s1_3;
    // Op 4: dim1x1 mul
    gl64_t s0_4 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 34, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 34, domainSize, nCols_1))];
    tmp1_0 = s0_4 * tmp1_0;
    // Op 5: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 6: dim3x3 mul
    gl64_t s1_6_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_6_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_6_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA6 = (tmp3_0 + tmp3_1) * (s1_6_0 + s1_6_1);
    gl64_t kB6 = (tmp3_0 + tmp3_2) * (s1_6_0 + s1_6_2);
    gl64_t kC6 = (tmp3_1 + tmp3_2) * (s1_6_1 + s1_6_2);
    gl64_t kD6 = tmp3_0 * s1_6_0;
    gl64_t kE6 = tmp3_1 * s1_6_1;
    gl64_t kF6 = tmp3_2 * s1_6_2;
    gl64_t kG6 = kD6 - kE6;
    tmp3_0 = (kC6 + kG6) - kF6;
    tmp3_1 = ((((kA6 + kC6) - kE6) - kE6) - kD6);
    tmp3_2 = kB6 - kG6;
    // Op 7: dim1x1 mul
    gl64_t s0_7 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 34, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 34, domainSize, nCols_1))];
    gl64_t s1_7 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 33, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 33, domainSize, nCols_1))];
    tmp1_0 = s0_7 * s1_7;
    // Op 8: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 9: dim3x3 mul
    gl64_t s1_9_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_9_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_9_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA9 = (tmp3_0 + tmp3_1) * (s1_9_0 + s1_9_1);
    gl64_t kB9 = (tmp3_0 + tmp3_2) * (s1_9_0 + s1_9_2);
    gl64_t kC9 = (tmp3_1 + tmp3_2) * (s1_9_1 + s1_9_2);
    gl64_t kD9 = tmp3_0 * s1_9_0;
    gl64_t kE9 = tmp3_1 * s1_9_1;
    gl64_t kF9 = tmp3_2 * s1_9_2;
    gl64_t kG9 = kD9 - kE9;
    tmp3_0 = (kC9 + kG9) - kF9;
    tmp3_1 = ((((kA9 + kC9) - kE9) - kE9) - kD9);
    tmp3_2 = kB9 - kG9;
    // Op 10: dim1x1 sub_swap
    gl64_t s0_10 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 35, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 35, domainSize, nCols_1))];
    gl64_t s1_10 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_10 - s0_10;
    // Op 11: dim1x1 mul
    gl64_t s0_11 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 35, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 35, domainSize, nCols_1))];
    tmp1_0 = s0_11 * tmp1_0;
    // Op 12: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 13: dim3x3 mul
    gl64_t s1_13_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_13_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_13_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA13 = (tmp3_0 + tmp3_1) * (s1_13_0 + s1_13_1);
    gl64_t kB13 = (tmp3_0 + tmp3_2) * (s1_13_0 + s1_13_2);
    gl64_t kC13 = (tmp3_1 + tmp3_2) * (s1_13_1 + s1_13_2);
    gl64_t kD13 = tmp3_0 * s1_13_0;
    gl64_t kE13 = tmp3_1 * s1_13_1;
    gl64_t kF13 = tmp3_2 * s1_13_2;
    gl64_t kG13 = kD13 - kE13;
    tmp3_0 = (kC13 + kG13) - kF13;
    tmp3_1 = ((((kA13 + kC13) - kE13) - kE13) - kD13);
    tmp3_2 = kB13 - kG13;
    // Op 14: dim1x1 sub_swap
    gl64_t s0_14 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_1))];
    gl64_t s1_14 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_14 - s0_14;
    // Op 15: dim1x1 mul
    gl64_t s0_15 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_1))];
    tmp1_0 = s0_15 * tmp1_0;
    // Op 16: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 17: dim3x3 mul
    gl64_t s1_17_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_17_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_17_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA17 = (tmp3_0 + tmp3_1) * (s1_17_0 + s1_17_1);
    gl64_t kB17 = (tmp3_0 + tmp3_2) * (s1_17_0 + s1_17_2);
    gl64_t kC17 = (tmp3_1 + tmp3_2) * (s1_17_1 + s1_17_2);
    gl64_t kD17 = tmp3_0 * s1_17_0;
    gl64_t kE17 = tmp3_1 * s1_17_1;
    gl64_t kF17 = tmp3_2 * s1_17_2;
    gl64_t kG17 = kD17 - kE17;
    tmp3_0 = (kC17 + kG17) - kF17;
    tmp3_1 = ((((kA17 + kC17) - kE17) - kE17) - kD17);
    tmp3_2 = kB17 - kG17;
    // Op 18: dim1x1 sub_swap
    gl64_t s0_18 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 37, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 37, domainSize, nCols_1))];
    gl64_t s1_18 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_18 - s0_18;
    // Op 19: dim1x1 mul
    gl64_t s0_19 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 37, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 37, domainSize, nCols_1))];
    tmp1_0 = s0_19 * tmp1_0;
    // Op 20: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 21: dim3x3 mul
    gl64_t s1_21_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_21_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_21_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA21 = (tmp3_0 + tmp3_1) * (s1_21_0 + s1_21_1);
    gl64_t kB21 = (tmp3_0 + tmp3_2) * (s1_21_0 + s1_21_2);
    gl64_t kC21 = (tmp3_1 + tmp3_2) * (s1_21_1 + s1_21_2);
    gl64_t kD21 = tmp3_0 * s1_21_0;
    gl64_t kE21 = tmp3_1 * s1_21_1;
    gl64_t kF21 = tmp3_2 * s1_21_2;
    gl64_t kG21 = kD21 - kE21;
    tmp3_0 = (kC21 + kG21) - kF21;
    tmp3_1 = ((((kA21 + kC21) - kE21) - kE21) - kD21);
    tmp3_2 = kB21 - kG21;
    // Op 22: dim1x1 mul
    gl64_t s0_22 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    gl64_t s1_22 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_22 * s1_22;
    // Op 23: dim1x1 sub_swap
    gl64_t s1_23 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_23 - tmp1_0;
    // Op 24: dim1x1 mul
    gl64_t s0_24 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    gl64_t s1_24 = *(gl64_t*)&expressions_params[9][5];
    tmp1_1 = s0_24 * s1_24;
    // Op 25: dim1x1 sub
    tmp1_1 = tmp1_0 - tmp1_1;
    // Op 26: dim1x1 mul
    gl64_t s0_26 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    gl64_t s1_26 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s0_26 * s1_26;
    // Op 27: dim1x1 mul
    gl64_t s0_27 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    tmp1_0 = s0_27 * tmp1_0;
    // Op 28: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 29: dim1x1 sub
    gl64_t s0_29 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    tmp1_0 = s0_29 - tmp1_0;
    // Op 30: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 31: dim3x3 mul
    gl64_t s1_31_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_31_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_31_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA31 = (tmp3_0 + tmp3_1) * (s1_31_0 + s1_31_1);
    gl64_t kB31 = (tmp3_0 + tmp3_2) * (s1_31_0 + s1_31_2);
    gl64_t kC31 = (tmp3_1 + tmp3_2) * (s1_31_1 + s1_31_2);
    gl64_t kD31 = tmp3_0 * s1_31_0;
    gl64_t kE31 = tmp3_1 * s1_31_1;
    gl64_t kF31 = tmp3_2 * s1_31_2;
    gl64_t kG31 = kD31 - kE31;
    tmp3_0 = (kC31 + kG31) - kF31;
    tmp3_1 = ((((kA31 + kC31) - kE31) - kE31) - kD31);
    tmp3_2 = kB31 - kG31;
    // Op 32: dim1x1 mul
    gl64_t s0_32 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    gl64_t s1_32 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_32 * s1_32;
    // Op 33: dim1x1 sub_swap
    gl64_t s1_33 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_33 - tmp1_0;
    // Op 34: dim1x1 mul
    gl64_t s0_34 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    tmp1_0 = s0_34 * tmp1_0;
    // Op 35: dim1x1 sub
    gl64_t s0_35 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 31, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 31, domainSize, nCols_1))];
    tmp1_0 = s0_35 - tmp1_0;
    // Op 36: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 37: dim3x3 mul
    gl64_t s1_37_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_37_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_37_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA37 = (tmp3_0 + tmp3_1) * (s1_37_0 + s1_37_1);
    gl64_t kB37 = (tmp3_0 + tmp3_2) * (s1_37_0 + s1_37_2);
    gl64_t kC37 = (tmp3_1 + tmp3_2) * (s1_37_1 + s1_37_2);
    gl64_t kD37 = tmp3_0 * s1_37_0;
    gl64_t kE37 = tmp3_1 * s1_37_1;
    gl64_t kF37 = tmp3_2 * s1_37_2;
    gl64_t kG37 = kD37 - kE37;
    tmp3_0 = (kC37 + kG37) - kF37;
    tmp3_1 = ((((kA37 + kC37) - kE37) - kE37) - kD37);
    tmp3_2 = kB37 - kG37;
    // Op 38: dim1x1 mul
    gl64_t s0_38 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    gl64_t s1_38 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_38 * s1_38;
    // Op 39: dim1x1 sub_swap
    gl64_t s1_39 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_39 - tmp1_0;
    // Op 40: dim1x1 mul
    gl64_t s0_40 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    tmp1_0 = s0_40 * tmp1_0;
    // Op 41: dim1x1 sub
    gl64_t s0_41 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 32, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 32, domainSize, nCols_1))];
    tmp1_0 = s0_41 - tmp1_0;
    // Op 42: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 43: dim3x3 mul
    gl64_t s1_43_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_43_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_43_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA43 = (tmp3_0 + tmp3_1) * (s1_43_0 + s1_43_1);
    gl64_t kB43 = (tmp3_0 + tmp3_2) * (s1_43_0 + s1_43_2);
    gl64_t kC43 = (tmp3_1 + tmp3_2) * (s1_43_1 + s1_43_2);
    gl64_t kD43 = tmp3_0 * s1_43_0;
    gl64_t kE43 = tmp3_1 * s1_43_1;
    gl64_t kF43 = tmp3_2 * s1_43_2;
    gl64_t kG43 = kD43 - kE43;
    tmp3_0 = (kC43 + kG43) - kF43;
    tmp3_1 = ((((kA43 + kC43) - kE43) - kE43) - kD43);
    tmp3_2 = kB43 - kG43;
    // Op 44: dim1x1 mul
    gl64_t s0_44 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_1))];
    gl64_t s1_44 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_0 = s0_44 * s1_44;
    // Op 45: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 46: dim3x3 mul
    gl64_t s1_46_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_46_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_46_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA46 = (tmp3_0 + tmp3_1) * (s1_46_0 + s1_46_1);
    gl64_t kB46 = (tmp3_0 + tmp3_2) * (s1_46_0 + s1_46_2);
    gl64_t kC46 = (tmp3_1 + tmp3_2) * (s1_46_1 + s1_46_2);
    gl64_t kD46 = tmp3_0 * s1_46_0;
    gl64_t kE46 = tmp3_1 * s1_46_1;
    gl64_t kF46 = tmp3_2 * s1_46_2;
    gl64_t kG46 = kD46 - kE46;
    tmp3_0 = (kC46 + kG46) - kF46;
    tmp3_1 = ((((kA46 + kC46) - kE46) - kE46) - kD46);
    tmp3_2 = kB46 - kG46;
    // Op 47: dim1x1 mul
    gl64_t s0_47 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_1))];
    gl64_t s1_47 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_47 * s1_47;
    // Op 48: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 49: dim3x3 mul
    gl64_t s1_49_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_49_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_49_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA49 = (tmp3_0 + tmp3_1) * (s1_49_0 + s1_49_1);
    gl64_t kB49 = (tmp3_0 + tmp3_2) * (s1_49_0 + s1_49_2);
    gl64_t kC49 = (tmp3_1 + tmp3_2) * (s1_49_1 + s1_49_2);
    gl64_t kD49 = tmp3_0 * s1_49_0;
    gl64_t kE49 = tmp3_1 * s1_49_1;
    gl64_t kF49 = tmp3_2 * s1_49_2;
    gl64_t kG49 = kD49 - kE49;
    tmp3_0 = (kC49 + kG49) - kF49;
    tmp3_1 = ((((kA49 + kC49) - kE49) - kE49) - kD49);
    tmp3_2 = kB49 - kG49;
    // Op 50: dim1x1 mul
    gl64_t s0_50 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_1))];
    gl64_t s1_50 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_0 = s0_50 * s1_50;
    // Op 51: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 52: dim3x3 mul
    gl64_t s1_52_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_52_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_52_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA52 = (tmp3_0 + tmp3_1) * (s1_52_0 + s1_52_1);
    gl64_t kB52 = (tmp3_0 + tmp3_2) * (s1_52_0 + s1_52_2);
    gl64_t kC52 = (tmp3_1 + tmp3_2) * (s1_52_1 + s1_52_2);
    gl64_t kD52 = tmp3_0 * s1_52_0;
    gl64_t kE52 = tmp3_1 * s1_52_1;
    gl64_t kF52 = tmp3_2 * s1_52_2;
    gl64_t kG52 = kD52 - kE52;
    tmp3_0 = (kC52 + kG52) - kF52;
    tmp3_1 = ((((kA52 + kC52) - kE52) - kE52) - kD52);
    tmp3_2 = kB52 - kG52;
    // Op 53: dim1x1 mul
    gl64_t s0_53 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_1))];
    gl64_t s1_53 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp1_0 = s0_53 * s1_53;
    // Op 54: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 55: dim3x3 mul
    gl64_t s1_55_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_55_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_55_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA55 = (tmp3_0 + tmp3_1) * (s1_55_0 + s1_55_1);
    gl64_t kB55 = (tmp3_0 + tmp3_2) * (s1_55_0 + s1_55_2);
    gl64_t kC55 = (tmp3_1 + tmp3_2) * (s1_55_1 + s1_55_2);
    gl64_t kD55 = tmp3_0 * s1_55_0;
    gl64_t kE55 = tmp3_1 * s1_55_1;
    gl64_t kF55 = tmp3_2 * s1_55_2;
    gl64_t kG55 = kD55 - kE55;
    tmp3_0 = (kC55 + kG55) - kF55;
    tmp3_1 = ((((kA55 + kC55) - kE55) - kE55) - kD55);
    tmp3_2 = kB55 - kG55;
    // Op 56: dim1x1 sub
    gl64_t s0_56 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_56 = *(gl64_t*)&expressions_params[9][26];
    tmp1_0 = s0_56 - s1_56;
    // Op 57: dim1x1 mul
    gl64_t s0_57 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_1))];
    tmp1_0 = s0_57 * tmp1_0;
    // Op 58: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 59: dim3x3 mul
    gl64_t s1_59_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_59_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_59_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA59 = (tmp3_0 + tmp3_1) * (s1_59_0 + s1_59_1);
    gl64_t kB59 = (tmp3_0 + tmp3_2) * (s1_59_0 + s1_59_2);
    gl64_t kC59 = (tmp3_1 + tmp3_2) * (s1_59_1 + s1_59_2);
    gl64_t kD59 = tmp3_0 * s1_59_0;
    gl64_t kE59 = tmp3_1 * s1_59_1;
    gl64_t kF59 = tmp3_2 * s1_59_2;
    gl64_t kG59 = kD59 - kE59;
    tmp3_0 = (kC59 + kG59) - kF59;
    tmp3_1 = ((((kA59 + kC59) - kE59) - kE59) - kD59);
    tmp3_2 = kB59 - kG59;
    // Op 60: dim1x1 sub
    gl64_t s0_60 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_60 = *(gl64_t*)&expressions_params[9][26];
    tmp1_0 = s0_60 - s1_60;
    // Op 61: dim1x1 mul
    gl64_t s0_61 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_1))];
    tmp1_0 = s0_61 * tmp1_0;
    // Op 62: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 63: dim3x3 mul
    gl64_t s1_63_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_63_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_63_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA63 = (tmp3_0 + tmp3_1) * (s1_63_0 + s1_63_1);
    gl64_t kB63 = (tmp3_0 + tmp3_2) * (s1_63_0 + s1_63_2);
    gl64_t kC63 = (tmp3_1 + tmp3_2) * (s1_63_1 + s1_63_2);
    gl64_t kD63 = tmp3_0 * s1_63_0;
    gl64_t kE63 = tmp3_1 * s1_63_1;
    gl64_t kF63 = tmp3_2 * s1_63_2;
    gl64_t kG63 = kD63 - kE63;
    tmp3_0 = (kC63 + kG63) - kF63;
    tmp3_1 = ((((kA63 + kC63) - kE63) - kE63) - kD63);
    tmp3_2 = kB63 - kG63;
    // Op 64: dim1x1 sub_swap
    gl64_t s0_64 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_64 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_64 - s0_64;
    // Op 65: dim1x1 mul
    gl64_t s1_65 = *(gl64_t*)&expressions_params[9][26];
    tmp1_0 = tmp1_0 * s1_65;
    // Op 66: dim1x1 sub
    gl64_t s0_66 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    tmp1_0 = s0_66 - tmp1_0;
    // Op 67: dim1x1 mul
    gl64_t s0_67 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_1))];
    tmp1_0 = s0_67 * tmp1_0;
    // Op 68: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 69: dim3x3 mul
    gl64_t s1_69_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_69_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_69_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA69 = (tmp3_0 + tmp3_1) * (s1_69_0 + s1_69_1);
    gl64_t kB69 = (tmp3_0 + tmp3_2) * (s1_69_0 + s1_69_2);
    gl64_t kC69 = (tmp3_1 + tmp3_2) * (s1_69_1 + s1_69_2);
    gl64_t kD69 = tmp3_0 * s1_69_0;
    gl64_t kE69 = tmp3_1 * s1_69_1;
    gl64_t kF69 = tmp3_2 * s1_69_2;
    gl64_t kG69 = kD69 - kE69;
    tmp3_0 = (kC69 + kG69) - kF69;
    tmp3_1 = ((((kA69 + kC69) - kE69) - kE69) - kD69);
    tmp3_2 = kB69 - kG69;
    // Op 70: dim1x1 sub_swap
    gl64_t s0_70 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_70 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_70 - s0_70;
    // Op 71: dim1x1 mul
    gl64_t s1_71 = *(gl64_t*)&expressions_params[9][26];
    tmp1_0 = tmp1_0 * s1_71;
    // Op 72: dim1x1 sub
    gl64_t s0_72 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_72 - tmp1_0;
    // Op 73: dim1x1 mul
    gl64_t s0_73 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_1))];
    tmp1_0 = s0_73 * tmp1_0;
    // Op 74: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 75: dim3x3 mul
    gl64_t s1_75_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_75_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_75_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA75 = (tmp3_0 + tmp3_1) * (s1_75_0 + s1_75_1);
    gl64_t kB75 = (tmp3_0 + tmp3_2) * (s1_75_0 + s1_75_2);
    gl64_t kC75 = (tmp3_1 + tmp3_2) * (s1_75_1 + s1_75_2);
    gl64_t kD75 = tmp3_0 * s1_75_0;
    gl64_t kE75 = tmp3_1 * s1_75_1;
    gl64_t kF75 = tmp3_2 * s1_75_2;
    gl64_t kG75 = kD75 - kE75;
    tmp3_0 = (kC75 + kG75) - kF75;
    tmp3_1 = ((((kA75 + kC75) - kE75) - kE75) - kD75);
    tmp3_2 = kB75 - kG75;
    // Op 76: dim1x1 sub
    gl64_t s0_76 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    gl64_t s1_76 = *(gl64_t*)&expressions_params[9][26];
    tmp1_0 = s0_76 - s1_76;
    // Op 77: dim1x1 mul
    gl64_t s0_77 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 37, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 37, domainSize, nCols_1))];
    tmp1_0 = s0_77 * tmp1_0;
    // Op 78: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 79: dim3x3 mul
    gl64_t s1_79_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_79_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_79_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA79 = (tmp3_0 + tmp3_1) * (s1_79_0 + s1_79_1);
    gl64_t kB79 = (tmp3_0 + tmp3_2) * (s1_79_0 + s1_79_2);
    gl64_t kC79 = (tmp3_1 + tmp3_2) * (s1_79_1 + s1_79_2);
    gl64_t kD79 = tmp3_0 * s1_79_0;
    gl64_t kE79 = tmp3_1 * s1_79_1;
    gl64_t kF79 = tmp3_2 * s1_79_2;
    gl64_t kG79 = kD79 - kE79;
    tmp3_0 = (kC79 + kG79) - kF79;
    tmp3_1 = ((((kA79 + kC79) - kE79) - kE79) - kD79);
    tmp3_2 = kB79 - kG79;
    // Op 80: dim1x1 sub
    gl64_t s0_80 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    gl64_t s1_80 = *(gl64_t*)&expressions_params[9][26];
    tmp1_0 = s0_80 - s1_80;
    // Op 81: dim1x1 mul
    gl64_t s0_81 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 37, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 37, domainSize, nCols_1))];
    tmp1_0 = s0_81 * tmp1_0;
    // Op 82: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 83: dim3x3 mul
    gl64_t s1_83_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_83_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_83_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA83 = (tmp3_0 + tmp3_1) * (s1_83_0 + s1_83_1);
    gl64_t kB83 = (tmp3_0 + tmp3_2) * (s1_83_0 + s1_83_2);
    gl64_t kC83 = (tmp3_1 + tmp3_2) * (s1_83_1 + s1_83_2);
    gl64_t kD83 = tmp3_0 * s1_83_0;
    gl64_t kE83 = tmp3_1 * s1_83_1;
    gl64_t kF83 = tmp3_2 * s1_83_2;
    gl64_t kG83 = kD83 - kE83;
    tmp3_0 = (kC83 + kG83) - kF83;
    tmp3_1 = ((((kA83 + kC83) - kE83) - kE83) - kD83);
    tmp3_2 = kB83 - kG83;
    // Op 84: dim1x1 sub_swap
    gl64_t s0_84 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_84 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_84 - s0_84;
    // Op 85: dim1x1 mul
    gl64_t s1_85 = *(gl64_t*)&expressions_params[9][26];
    tmp1_0 = tmp1_0 * s1_85;
    // Op 86: dim1x1 sub
    gl64_t s0_86 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_0 = s0_86 - tmp1_0;
    // Op 87: dim1x1 mul
    gl64_t s0_87 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 37, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 37, domainSize, nCols_1))];
    tmp1_0 = s0_87 * tmp1_0;
    // Op 88: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 89: dim3x3 mul
    gl64_t s1_89_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_89_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_89_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA89 = (tmp3_0 + tmp3_1) * (s1_89_0 + s1_89_1);
    gl64_t kB89 = (tmp3_0 + tmp3_2) * (s1_89_0 + s1_89_2);
    gl64_t kC89 = (tmp3_1 + tmp3_2) * (s1_89_1 + s1_89_2);
    gl64_t kD89 = tmp3_0 * s1_89_0;
    gl64_t kE89 = tmp3_1 * s1_89_1;
    gl64_t kF89 = tmp3_2 * s1_89_2;
    gl64_t kG89 = kD89 - kE89;
    tmp3_0 = (kC89 + kG89) - kF89;
    tmp3_1 = ((((kA89 + kC89) - kE89) - kE89) - kD89);
    tmp3_2 = kB89 - kG89;
    // Op 90: dim1x1 sub_swap
    gl64_t s0_90 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_90 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_90 - s0_90;
    // Op 91: dim1x1 mul
    gl64_t s1_91 = *(gl64_t*)&expressions_params[9][26];
    tmp1_0 = tmp1_0 * s1_91;
    // Op 92: dim1x1 sub
    gl64_t s0_92 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp1_0 = s0_92 - tmp1_0;
    // Op 93: dim1x1 mul
    gl64_t s0_93 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 37, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 37, domainSize, nCols_1))];
    tmp1_0 = s0_93 * tmp1_0;
    // Op 94: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 95: dim3x3 mul
    gl64_t s1_95_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_95_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_95_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA95 = (tmp3_0 + tmp3_1) * (s1_95_0 + s1_95_1);
    gl64_t kB95 = (tmp3_0 + tmp3_2) * (s1_95_0 + s1_95_2);
    gl64_t kC95 = (tmp3_1 + tmp3_2) * (s1_95_1 + s1_95_2);
    gl64_t kD95 = tmp3_0 * s1_95_0;
    gl64_t kE95 = tmp3_1 * s1_95_1;
    gl64_t kF95 = tmp3_2 * s1_95_2;
    gl64_t kG95 = kD95 - kE95;
    tmp3_0 = (kC95 + kG95) - kF95;
    tmp3_1 = ((((kA95 + kC95) - kE95) - kE95) - kD95);
    tmp3_2 = kB95 - kG95;
    // Op 96: dim1x1 mul
    gl64_t s0_96 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 37, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 37, domainSize, nCols_1))];
    gl64_t s1_96 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    tmp1_0 = s0_96 * s1_96;
    // Op 97: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 98: dim3x3 mul
    gl64_t s1_98_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_98_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_98_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA98 = (tmp3_0 + tmp3_1) * (s1_98_0 + s1_98_1);
    gl64_t kB98 = (tmp3_0 + tmp3_2) * (s1_98_0 + s1_98_2);
    gl64_t kC98 = (tmp3_1 + tmp3_2) * (s1_98_1 + s1_98_2);
    gl64_t kD98 = tmp3_0 * s1_98_0;
    gl64_t kE98 = tmp3_1 * s1_98_1;
    gl64_t kF98 = tmp3_2 * s1_98_2;
    gl64_t kG98 = kD98 - kE98;
    tmp3_0 = (kC98 + kG98) - kF98;
    tmp3_1 = ((((kA98 + kC98) - kE98) - kE98) - kD98);
    tmp3_2 = kB98 - kG98;
    // Op 99: dim1x1 mul
    gl64_t s0_99 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_99 = *(gl64_t*)&expressions_params[9][27];
    tmp1_0 = s0_99 * s1_99;
    // Op 100: dim1x1 sub
    gl64_t s0_100 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    tmp1_0 = s0_100 - tmp1_0;
    // Op 101: dim1x1 mul
    gl64_t s0_101 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 37, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 37, domainSize, nCols_1))];
    tmp1_0 = s0_101 * tmp1_0;
    // Op 102: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 103: dim3x3 mul
    gl64_t s1_103_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_103_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_103_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA103 = (tmp3_0 + tmp3_1) * (s1_103_0 + s1_103_1);
    gl64_t kB103 = (tmp3_0 + tmp3_2) * (s1_103_0 + s1_103_2);
    gl64_t kC103 = (tmp3_1 + tmp3_2) * (s1_103_1 + s1_103_2);
    gl64_t kD103 = tmp3_0 * s1_103_0;
    gl64_t kE103 = tmp3_1 * s1_103_1;
    gl64_t kF103 = tmp3_2 * s1_103_2;
    gl64_t kG103 = kD103 - kE103;
    tmp3_0 = (kC103 + kG103) - kF103;
    tmp3_1 = ((((kA103 + kC103) - kE103) - kE103) - kD103);
    tmp3_2 = kB103 - kG103;
    // Op 104: dim1x1 mul
    gl64_t s0_104 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 37, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 37, domainSize, nCols_1))];
    gl64_t s1_104 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    tmp1_0 = s0_104 * s1_104;
    // Op 105: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 106: dim3x3 mul
    gl64_t s1_106_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_106_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_106_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA106 = (tmp3_0 + tmp3_1) * (s1_106_0 + s1_106_1);
    gl64_t kB106 = (tmp3_0 + tmp3_2) * (s1_106_0 + s1_106_2);
    gl64_t kC106 = (tmp3_1 + tmp3_2) * (s1_106_1 + s1_106_2);
    gl64_t kD106 = tmp3_0 * s1_106_0;
    gl64_t kE106 = tmp3_1 * s1_106_1;
    gl64_t kF106 = tmp3_2 * s1_106_2;
    gl64_t kG106 = kD106 - kE106;
    tmp3_0 = (kC106 + kG106) - kF106;
    tmp3_1 = ((((kA106 + kC106) - kE106) - kE106) - kD106);
    tmp3_2 = kB106 - kG106;
    // Op 107: dim1x1 sub_swap
    gl64_t s0_107 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_107 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_107 - s0_107;
    // Op 108: dim1x1 mul
    gl64_t s1_108 = *(gl64_t*)&expressions_params[9][27];
    tmp1_0 = tmp1_0 * s1_108;
    // Op 109: dim1x1 sub
    gl64_t s0_109 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    tmp1_0 = s0_109 - tmp1_0;
    // Op 110: dim1x1 mul
    gl64_t s0_110 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 37, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 37, domainSize, nCols_1))];
    tmp1_0 = s0_110 * tmp1_0;
    // Op 111: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 112: dim3x3 mul
    gl64_t s1_112_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_112_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_112_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA112 = (tmp3_0 + tmp3_1) * (s1_112_0 + s1_112_1);
    gl64_t kB112 = (tmp3_0 + tmp3_2) * (s1_112_0 + s1_112_2);
    gl64_t kC112 = (tmp3_1 + tmp3_2) * (s1_112_1 + s1_112_2);
    gl64_t kD112 = tmp3_0 * s1_112_0;
    gl64_t kE112 = tmp3_1 * s1_112_1;
    gl64_t kF112 = tmp3_2 * s1_112_2;
    gl64_t kG112 = kD112 - kE112;
    tmp3_0 = (kC112 + kG112) - kF112;
    tmp3_1 = ((((kA112 + kC112) - kE112) - kE112) - kD112);
    tmp3_2 = kB112 - kG112;
    // Op 113: dim1x1 sub
    gl64_t s0_113 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    gl64_t s1_113 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_1))];
    tmp1_1 = s0_113 - s1_113;
    // Op 114: dim1x1 add
    gl64_t s0_114 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    gl64_t s1_114 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_114 + s1_114;
    // Op 115: dim1x1 add
    gl64_t s0_115 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_0 = s0_115 + tmp1_0;
    // Op 116: dim1x1 add
    gl64_t s0_116 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp1_0 = s0_116 + tmp1_0;
    // Op 117: dim1x1 mul
    gl64_t s0_117 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 38, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 38, domainSize, nCols_1))];
    tmp1_0 = s0_117 * tmp1_0;
    // Op 118: dim1x1 sub_swap
    gl64_t s1_118 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_118 - tmp1_0;
    // Op 119: dim1x1 mul
    tmp1_0 = tmp1_1 * tmp1_0;
    // Op 120: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 121: dim3x3 mul
    gl64_t s1_121_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_121_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_121_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA121 = (tmp3_0 + tmp3_1) * (s1_121_0 + s1_121_1);
    gl64_t kB121 = (tmp3_0 + tmp3_2) * (s1_121_0 + s1_121_2);
    gl64_t kC121 = (tmp3_1 + tmp3_2) * (s1_121_1 + s1_121_2);
    gl64_t kD121 = tmp3_0 * s1_121_0;
    gl64_t kE121 = tmp3_1 * s1_121_1;
    gl64_t kF121 = tmp3_2 * s1_121_2;
    gl64_t kG121 = kD121 - kE121;
    tmp3_0 = (kC121 + kG121) - kF121;
    tmp3_1 = ((((kA121 + kC121) - kE121) - kE121) - kD121);
    tmp3_2 = kB121 - kG121;
    // Op 122: dim1x1 sub_swap
    gl64_t s0_122 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    gl64_t s1_122 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_122 - s0_122;
    // Op 123: dim1x1 mul
    gl64_t s0_123 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_1))];
    tmp1_0 = s0_123 * tmp1_0;
    // Op 124: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 125: dim3x3 mul
    gl64_t s1_125_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_125_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_125_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA125 = (tmp3_0 + tmp3_1) * (s1_125_0 + s1_125_1);
    gl64_t kB125 = (tmp3_0 + tmp3_2) * (s1_125_0 + s1_125_2);
    gl64_t kC125 = (tmp3_1 + tmp3_2) * (s1_125_1 + s1_125_2);
    gl64_t kD125 = tmp3_0 * s1_125_0;
    gl64_t kE125 = tmp3_1 * s1_125_1;
    gl64_t kF125 = tmp3_2 * s1_125_2;
    gl64_t kG125 = kD125 - kE125;
    tmp3_0 = (kC125 + kG125) - kF125;
    tmp3_1 = ((((kA125 + kC125) - kE125) - kE125) - kD125);
    tmp3_2 = kB125 - kG125;
    // Op 126: dim1x1 sub_swap
    gl64_t s0_126 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    gl64_t s1_126 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_126 - s0_126;
    // Op 127: dim1x1 mul
    gl64_t s0_127 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 37, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 37, domainSize, nCols_1))];
    tmp1_0 = s0_127 * tmp1_0;
    // Op 128: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 129: dim3x3 mul
    gl64_t s1_129_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_129_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_129_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA129 = (tmp3_0 + tmp3_1) * (s1_129_0 + s1_129_1);
    gl64_t kB129 = (tmp3_0 + tmp3_2) * (s1_129_0 + s1_129_2);
    gl64_t kC129 = (tmp3_1 + tmp3_2) * (s1_129_1 + s1_129_2);
    gl64_t kD129 = tmp3_0 * s1_129_0;
    gl64_t kE129 = tmp3_1 * s1_129_1;
    gl64_t kF129 = tmp3_2 * s1_129_2;
    gl64_t kG129 = kD129 - kE129;
    tmp3_0 = (kC129 + kG129) - kF129;
    tmp3_1 = ((((kA129 + kC129) - kE129) - kE129) - kD129);
    tmp3_2 = kB129 - kG129;
    // Op 130: dim1x1 sub_swap
    gl64_t s0_130 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 35, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 35, domainSize, nCols_1))];
    gl64_t s1_130 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_130 - s0_130;
    // Op 131: dim1x1 mul
    gl64_t s0_131 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 37, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 37, domainSize, nCols_1))];
    tmp1_0 = s0_131 * tmp1_0;
    // Op 132: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 133: dim3x3 mul
    gl64_t s1_133_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_133_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_133_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA133 = (tmp3_0 + tmp3_1) * (s1_133_0 + s1_133_1);
    gl64_t kB133 = (tmp3_0 + tmp3_2) * (s1_133_0 + s1_133_2);
    gl64_t kC133 = (tmp3_1 + tmp3_2) * (s1_133_1 + s1_133_2);
    gl64_t kD133 = tmp3_0 * s1_133_0;
    gl64_t kE133 = tmp3_1 * s1_133_1;
    gl64_t kF133 = tmp3_2 * s1_133_2;
    gl64_t kG133 = kD133 - kE133;
    tmp3_0 = (kC133 + kG133) - kF133;
    tmp3_1 = ((((kA133 + kC133) - kE133) - kE133) - kD133);
    tmp3_2 = kB133 - kG133;
    // Op 134: dim1x1 mul
    gl64_t s0_134 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 37, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 37, domainSize, nCols_1))];
    gl64_t s1_134 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_1))];
    tmp1_0 = s0_134 * s1_134;
    // Op 135: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 136: dim3x3 mul
    gl64_t s1_136_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_136_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_136_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA136 = (tmp3_0 + tmp3_1) * (s1_136_0 + s1_136_1);
    gl64_t kB136 = (tmp3_0 + tmp3_2) * (s1_136_0 + s1_136_2);
    gl64_t kC136 = (tmp3_1 + tmp3_2) * (s1_136_1 + s1_136_2);
    gl64_t kD136 = tmp3_0 * s1_136_0;
    gl64_t kE136 = tmp3_1 * s1_136_1;
    gl64_t kF136 = tmp3_2 * s1_136_2;
    gl64_t kG136 = kD136 - kE136;
    tmp3_0 = (kC136 + kG136) - kF136;
    tmp3_1 = ((((kA136 + kC136) - kE136) - kE136) - kD136);
    tmp3_2 = kB136 - kG136;
    // Op 137: dim1x1 mul
    gl64_t s0_137 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_1))];
    gl64_t s1_137 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 37, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 37, domainSize, nCols_1))];
    tmp1_0 = s0_137 * s1_137;
    // Op 138: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 139: dim3x3 mul
    gl64_t s1_139_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_139_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_139_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA139 = (tmp3_0 + tmp3_1) * (s1_139_0 + s1_139_1);
    gl64_t kB139 = (tmp3_0 + tmp3_2) * (s1_139_0 + s1_139_2);
    gl64_t kC139 = (tmp3_1 + tmp3_2) * (s1_139_1 + s1_139_2);
    gl64_t kD139 = tmp3_0 * s1_139_0;
    gl64_t kE139 = tmp3_1 * s1_139_1;
    gl64_t kF139 = tmp3_2 * s1_139_2;
    gl64_t kG139 = kD139 - kE139;
    tmp3_0 = (kC139 + kG139) - kF139;
    tmp3_1 = ((((kA139 + kC139) - kE139) - kE139) - kD139);
    tmp3_2 = kB139 - kG139;
    // Op 140: dim1x1 mul
    gl64_t s0_140 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    gl64_t s1_140 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp1_0 = s0_140 * s1_140;
    // Op 141: dim1x1 mul
    gl64_t s0_141 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_0 = s0_141 * tmp1_0;
    // Op 142: dim1x1 sub_swap
    gl64_t s0_142 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    tmp1_1 = tmp1_0 - s0_142;
    // Op 143: dim1x1 mul
    gl64_t s0_143 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    gl64_t s1_143 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_143 * s1_143;
    // Op 144: dim1x1 mul
    gl64_t s0_144 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    tmp1_0 = s0_144 * tmp1_0;
    // Op 145: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 146: dim1x1 mul
    gl64_t s0_146 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    gl64_t s1_146 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    tmp1_1 = s0_146 * s1_146;
    // Op 147: dim1x1 add
    tmp1_1 = tmp1_0 + tmp1_1;
    // Op 148: dim1x1 mul
    gl64_t s0_148 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    gl64_t s1_148 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_148 * s1_148;
    // Op 149: dim1x1 mul
    gl64_t s0_149 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    tmp1_0 = s0_149 * tmp1_0;
    // Op 150: dim1x1 sub
    tmp1_0 = tmp1_1 - tmp1_0;
    // Op 151: dim1x1 mul
    gl64_t s0_151 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_151 = *(gl64_t*)&expressions_params[9][19];
    tmp1_1 = s0_151 * s1_151;
    // Op 152: dim1x1 sub
    tmp1_0 = tmp1_0 - tmp1_1;
    // Op 153: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 154: dim3x3 mul
    gl64_t s1_154_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_154_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_154_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA154 = (tmp3_0 + tmp3_1) * (s1_154_0 + s1_154_1);
    gl64_t kB154 = (tmp3_0 + tmp3_2) * (s1_154_0 + s1_154_2);
    gl64_t kC154 = (tmp3_1 + tmp3_2) * (s1_154_1 + s1_154_2);
    gl64_t kD154 = tmp3_0 * s1_154_0;
    gl64_t kE154 = tmp3_1 * s1_154_1;
    gl64_t kF154 = tmp3_2 * s1_154_2;
    gl64_t kG154 = kD154 - kE154;
    tmp3_0 = (kC154 + kG154) - kF154;
    tmp3_1 = ((((kA154 + kC154) - kE154) - kE154) - kD154);
    tmp3_2 = kB154 - kG154;
    // Op 155: dim1x1 mul
    gl64_t s0_155 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    gl64_t s1_155 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    tmp1_0 = s0_155 * s1_155;
    // Op 156: dim1x1 mul
    gl64_t s0_156 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_1 = s0_156 * tmp1_0;
    // Op 157: dim1x1 mul
    gl64_t s0_157 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    gl64_t s1_157 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp1_0 = s0_157 * s1_157;
    // Op 158: dim1x1 mul
    gl64_t s0_158 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_158 * tmp1_0;
    // Op 159: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 160: dim1x1 sub_swap
    gl64_t s0_160 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    tmp1_1 = tmp1_0 - s0_160;
    // Op 161: dim1x1 mul
    gl64_t s0_161 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    gl64_t s1_161 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_161 * s1_161;
    // Op 162: dim1x1 mul
    gl64_t s0_162 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    tmp1_0 = s0_162 * tmp1_0;
    // Op 163: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 164: dim1x1 mul
    gl64_t s0_164 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    gl64_t s1_164 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    tmp1_1 = s0_164 * s1_164;
    // Op 165: dim1x1 add
    tmp1_1 = tmp1_0 + tmp1_1;
    // Op 166: dim1x1 mul
    gl64_t s0_166 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    gl64_t s1_166 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_166 * s1_166;
    // Op 167: dim1x1 mul
    gl64_t s0_167 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    tmp1_0 = s0_167 * tmp1_0;
    // Op 168: dim1x1 sub
    tmp1_0 = tmp1_1 - tmp1_0;
    // Op 169: dim1x1 add
    gl64_t s0_169 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    tmp1_0 = s0_169 + tmp1_0;
    // Op 170: dim1x1 mul
    gl64_t s0_170 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    gl64_t s1_170 = *(gl64_t*)&expressions_params[9][19];
    tmp1_1 = s0_170 * s1_170;
    // Op 171: dim1x1 sub
    tmp1_0 = tmp1_0 - tmp1_1;
    // Op 172: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 173: dim3x3 mul
    gl64_t s1_173_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_173_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_173_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA173 = (tmp3_0 + tmp3_1) * (s1_173_0 + s1_173_1);
    gl64_t kB173 = (tmp3_0 + tmp3_2) * (s1_173_0 + s1_173_2);
    gl64_t kC173 = (tmp3_1 + tmp3_2) * (s1_173_1 + s1_173_2);
    gl64_t kD173 = tmp3_0 * s1_173_0;
    gl64_t kE173 = tmp3_1 * s1_173_1;
    gl64_t kF173 = tmp3_2 * s1_173_2;
    gl64_t kG173 = kD173 - kE173;
    tmp3_0 = (kC173 + kG173) - kF173;
    tmp3_1 = ((((kA173 + kC173) - kE173) - kE173) - kD173);
    tmp3_2 = kB173 - kG173;
    // Op 174: dim1x1 mul
    gl64_t s0_174 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    gl64_t s1_174 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    tmp1_0 = s0_174 * s1_174;
    // Op 175: dim1x1 mul
    gl64_t s0_175 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_1 = s0_175 * tmp1_0;
    // Op 176: dim1x1 mul
    gl64_t s0_176 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    gl64_t s1_176 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    tmp1_0 = s0_176 * s1_176;
    // Op 177: dim1x1 mul
    gl64_t s0_177 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_177 * tmp1_0;
    // Op 178: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 179: dim1x1 mul
    gl64_t s0_179 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    gl64_t s1_179 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp1_0 = s0_179 * s1_179;
    // Op 180: dim1x1 mul
    gl64_t s0_180 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_0 = s0_180 * tmp1_0;
    // Op 181: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 182: dim1x1 mul
    gl64_t s0_182 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_182 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 32, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 32, domainSize, nCols_1))];
    tmp1_0 = s0_182 * s1_182;
    // Op 183: dim1x1 mul
    gl64_t s0_183 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    tmp1_0 = s0_183 * tmp1_0;
    // Op 184: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 185: dim1x1 mul
    gl64_t s0_185 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    gl64_t s1_185 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 31, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 31, domainSize, nCols_1))];
    tmp1_0 = s0_185 * s1_185;
    // Op 186: dim1x1 mul
    gl64_t s0_186 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    tmp1_0 = s0_186 * tmp1_0;
    // Op 187: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 188: dim1x1 sub_swap
    gl64_t s0_188 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    tmp1_1 = tmp1_0 - s0_188;
    // Op 189: dim1x1 mul
    gl64_t s0_189 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    gl64_t s1_189 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_189 * s1_189;
    // Op 190: dim1x1 mul
    gl64_t s0_190 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    tmp1_0 = s0_190 * tmp1_0;
    // Op 191: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 192: dim1x1 mul
    gl64_t s0_192 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    gl64_t s1_192 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    tmp1_1 = s0_192 * s1_192;
    // Op 193: dim1x1 add
    tmp1_1 = tmp1_0 + tmp1_1;
    // Op 194: dim1x1 mul
    gl64_t s0_194 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    gl64_t s1_194 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_194 * s1_194;
    // Op 195: dim1x1 mul
    gl64_t s0_195 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    tmp1_0 = s0_195 * tmp1_0;
    // Op 196: dim1x1 sub
    tmp1_1 = tmp1_1 - tmp1_0;
    // Op 197: dim1x1 mul
    gl64_t s0_197 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    gl64_t s1_197 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    tmp1_0 = s0_197 * s1_197;
    // Op 198: dim1x1 mul
    gl64_t s0_198 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    tmp1_0 = s0_198 * tmp1_0;
    // Op 199: dim1x1 sub
    tmp1_0 = tmp1_1 - tmp1_0;
    // Op 200: dim1x1 mul
    gl64_t s0_200 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    gl64_t s1_200 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    tmp1_1 = s0_200 * s1_200;
    // Op 201: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_1;
    // Op 202: dim1x1 add
    gl64_t s0_202 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    tmp1_0 = s0_202 + tmp1_0;
    // Op 203: dim1x1 mul
    gl64_t s0_203 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_203 = *(gl64_t*)&expressions_params[9][19];
    tmp1_1 = s0_203 * s1_203;
    // Op 204: dim1x1 sub
    tmp1_0 = tmp1_0 - tmp1_1;
    // Op 205: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 206: dim3x3 mul
    gl64_t s1_206_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_206_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_206_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA206 = (tmp3_0 + tmp3_1) * (s1_206_0 + s1_206_1);
    gl64_t kB206 = (tmp3_0 + tmp3_2) * (s1_206_0 + s1_206_2);
    gl64_t kC206 = (tmp3_1 + tmp3_2) * (s1_206_1 + s1_206_2);
    gl64_t kD206 = tmp3_0 * s1_206_0;
    gl64_t kE206 = tmp3_1 * s1_206_1;
    gl64_t kF206 = tmp3_2 * s1_206_2;
    gl64_t kG206 = kD206 - kE206;
    tmp3_0 = (kC206 + kG206) - kF206;
    tmp3_1 = ((((kA206 + kC206) - kE206) - kE206) - kD206);
    tmp3_2 = kB206 - kG206;
    // Op 207: dim1x1 mul
    gl64_t s0_207 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    gl64_t s1_207 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_207 * s1_207;
    // Op 208: dim1x1 mul
    gl64_t s0_208 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_1 = s0_208 * tmp1_0;
    // Op 209: dim1x1 mul
    gl64_t s0_209 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    gl64_t s1_209 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    tmp1_0 = s0_209 * s1_209;
    // Op 210: dim1x1 mul
    gl64_t s0_210 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_210 * tmp1_0;
    // Op 211: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 212: dim1x1 mul
    gl64_t s0_212 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    gl64_t s1_212 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    tmp1_0 = s0_212 * s1_212;
    // Op 213: dim1x1 mul
    gl64_t s0_213 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_0 = s0_213 * tmp1_0;
    // Op 214: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 215: dim1x1 mul
    gl64_t s0_215 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    gl64_t s1_215 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp1_0 = s0_215 * s1_215;
    // Op 216: dim1x1 mul
    gl64_t s0_216 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp1_0 = s0_216 * tmp1_0;
    // Op 217: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 218: dim1x1 mul
    gl64_t s0_218 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_218 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 32, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 32, domainSize, nCols_1))];
    tmp1_0 = s0_218 * s1_218;
    // Op 219: dim1x1 mul
    gl64_t s0_219 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    tmp1_0 = s0_219 * tmp1_0;
    // Op 220: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 221: dim1x1 mul
    gl64_t s0_221 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    gl64_t s1_221 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 31, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 31, domainSize, nCols_1))];
    tmp1_0 = s0_221 * s1_221;
    // Op 222: dim1x1 mul
    gl64_t s0_222 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    tmp1_0 = s0_222 * tmp1_0;
    // Op 223: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 224: dim1x1 sub_swap
    gl64_t s0_224 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    tmp1_1 = tmp1_0 - s0_224;
    // Op 225: dim1x1 mul
    gl64_t s0_225 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    gl64_t s1_225 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_225 * s1_225;
    // Op 226: dim1x1 mul
    gl64_t s0_226 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    tmp1_0 = s0_226 * tmp1_0;
    // Op 227: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 228: dim1x1 mul
    gl64_t s0_228 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    gl64_t s1_228 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_1 = s0_228 * s1_228;
    // Op 229: dim1x1 add
    tmp1_1 = tmp1_0 + tmp1_1;
    // Op 230: dim1x1 mul
    gl64_t s0_230 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    gl64_t s1_230 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_230 * s1_230;
    // Op 231: dim1x1 mul
    gl64_t s0_231 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_0 = s0_231 * tmp1_0;
    // Op 232: dim1x1 sub
    tmp1_0 = tmp1_1 - tmp1_0;
    // Op 233: dim1x1 add
    gl64_t s0_233 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    tmp1_0 = s0_233 + tmp1_0;
    // Op 234: dim1x1 mul
    gl64_t s0_234 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_234 = *(gl64_t*)&expressions_params[9][19];
    tmp1_1 = s0_234 * s1_234;
    // Op 235: dim1x1 sub
    tmp1_0 = tmp1_0 - tmp1_1;
    // Op 236: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 237: dim3x3 mul
    gl64_t s1_237_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_237_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_237_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA237 = (tmp3_0 + tmp3_1) * (s1_237_0 + s1_237_1);
    gl64_t kB237 = (tmp3_0 + tmp3_2) * (s1_237_0 + s1_237_2);
    gl64_t kC237 = (tmp3_1 + tmp3_2) * (s1_237_1 + s1_237_2);
    gl64_t kD237 = tmp3_0 * s1_237_0;
    gl64_t kE237 = tmp3_1 * s1_237_1;
    gl64_t kF237 = tmp3_2 * s1_237_2;
    gl64_t kG237 = kD237 - kE237;
    tmp3_0 = (kC237 + kG237) - kF237;
    tmp3_1 = ((((kA237 + kC237) - kE237) - kE237) - kD237);
    tmp3_2 = kB237 - kG237;
    // Op 238: dim1x1 mul
    gl64_t s0_238 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    gl64_t s1_238 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_238 * s1_238;
    // Op 239: dim1x1 mul
    gl64_t s0_239 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_1 = s0_239 * tmp1_0;
    // Op 240: dim1x1 mul
    gl64_t s0_240 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    gl64_t s1_240 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    tmp1_0 = s0_240 * s1_240;
    // Op 241: dim1x1 mul
    gl64_t s0_241 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_0 = s0_241 * tmp1_0;
    // Op 242: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 243: dim1x1 mul
    gl64_t s0_243 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    gl64_t s1_243 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    tmp1_0 = s0_243 * s1_243;
    // Op 244: dim1x1 mul
    gl64_t s0_244 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp1_0 = s0_244 * tmp1_0;
    // Op 245: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 246: dim1x1 mul
    gl64_t s0_246 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    gl64_t s1_246 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    tmp1_0 = s0_246 * s1_246;
    // Op 247: dim1x1 mul
    gl64_t s0_247 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    tmp1_0 = s0_247 * tmp1_0;
    // Op 248: dim1x1 add
    tmp1_2 = tmp1_1 + tmp1_0;
    // Op 249: dim1x1 mul
    gl64_t s0_249 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    gl64_t s1_249 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 31, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 31, domainSize, nCols_1))];
    tmp1_0 = s0_249 * s1_249;
    // Op 250: dim1x1 sub_swap
    gl64_t s0_250 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_250 = *(gl64_t*)&expressions_params[9][0];
    tmp1_1 = s1_250 - s0_250;
    // Op 251: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 252: dim1x1 add
    tmp1_1 = tmp1_2 + tmp1_0;
    // Op 253: dim1x1 mul
    gl64_t s0_253 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_253 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 32, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 32, domainSize, nCols_1))];
    tmp1_0 = s0_253 * s1_253;
    // Op 254: dim1x1 sub_swap
    gl64_t s0_254 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_254 = *(gl64_t*)&expressions_params[9][0];
    tmp1_2 = s1_254 - s0_254;
    // Op 255: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_2;
    // Op 256: dim1x1 add
    tmp1_2 = tmp1_1 + tmp1_0;
    // Op 257: dim1x1 mul
    gl64_t s0_257 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    gl64_t s1_257 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    tmp1_0 = s0_257 * s1_257;
    // Op 258: dim1x1 sub_swap
    gl64_t s0_258 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    gl64_t s1_258 = *(gl64_t*)&expressions_params[9][0];
    tmp1_1 = s1_258 - s0_258;
    // Op 259: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 260: dim1x1 sub
    tmp1_2 = tmp1_2 - tmp1_0;
    // Op 261: dim1x1 sub_swap
    gl64_t s0_261 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_261 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_261 - s0_261;
    // Op 262: dim1x1 mul
    gl64_t s0_262 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    tmp1_0 = s0_262 * tmp1_0;
    // Op 263: dim1x1 mul
    gl64_t s0_263 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    tmp1_0 = s0_263 * tmp1_0;
    // Op 264: dim1x1 sub
    tmp1_2 = tmp1_2 - tmp1_0;
    // Op 265: dim1x1 sub_swap
    gl64_t s0_265 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_265 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_265 - s0_265;
    // Op 266: dim1x1 mul
    gl64_t s0_266 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    tmp1_0 = s0_266 * tmp1_0;
    // Op 267: dim1x1 add
    tmp1_2 = tmp1_2 + tmp1_0;
    // Op 268: dim1x1 sub_swap
    gl64_t s0_268 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    gl64_t s1_268 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_268 - s0_268;
    // Op 269: dim1x1 mul
    gl64_t s0_269 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    tmp1_0 = s0_269 * tmp1_0;
    // Op 270: dim1x1 sub
    tmp1_1 = tmp1_2 - tmp1_0;
    // Op 271: dim1x1 mul
    gl64_t s0_271 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    gl64_t s1_271 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_271 * s1_271;
    // Op 272: dim1x1 mul
    gl64_t s0_272 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    tmp1_0 = s0_272 * tmp1_0;
    // Op 273: dim1x1 sub_swap
    gl64_t s0_273 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    gl64_t s1_273 = *(gl64_t*)&expressions_params[9][0];
    tmp1_2 = s1_273 - s0_273;
    // Op 274: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_2;
    // Op 275: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 276: dim1x1 add
    gl64_t s0_276 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    tmp1_0 = s0_276 + tmp1_0;
    // Op 277: dim1x1 mul
    gl64_t s0_277 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_277 = *(gl64_t*)&expressions_params[9][19];
    tmp1_1 = s0_277 * s1_277;
    // Op 278: dim1x1 sub
    tmp1_0 = tmp1_0 - tmp1_1;
    // Op 279: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 280: dim3x3 mul
    gl64_t s1_280_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_280_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_280_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA280 = (tmp3_0 + tmp3_1) * (s1_280_0 + s1_280_1);
    gl64_t kB280 = (tmp3_0 + tmp3_2) * (s1_280_0 + s1_280_2);
    gl64_t kC280 = (tmp3_1 + tmp3_2) * (s1_280_1 + s1_280_2);
    gl64_t kD280 = tmp3_0 * s1_280_0;
    gl64_t kE280 = tmp3_1 * s1_280_1;
    gl64_t kF280 = tmp3_2 * s1_280_2;
    gl64_t kG280 = kD280 - kE280;
    tmp3_0 = (kC280 + kG280) - kF280;
    tmp3_1 = ((((kA280 + kC280) - kE280) - kE280) - kD280);
    tmp3_2 = kB280 - kG280;
    // Op 281: dim1x1 mul
    gl64_t s0_281 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    gl64_t s1_281 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_281 * s1_281;
    // Op 282: dim1x1 mul
    gl64_t s0_282 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_1 = s0_282 * tmp1_0;
    // Op 283: dim1x1 mul
    gl64_t s0_283 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    gl64_t s1_283 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    tmp1_0 = s0_283 * s1_283;
    // Op 284: dim1x1 mul
    gl64_t s0_284 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp1_0 = s0_284 * tmp1_0;
    // Op 285: dim1x1 add
    tmp1_2 = tmp1_1 + tmp1_0;
    // Op 286: dim1x1 mul
    gl64_t s0_286 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_286 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 32, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 32, domainSize, nCols_1))];
    tmp1_0 = s0_286 * s1_286;
    // Op 287: dim1x1 sub_swap
    gl64_t s0_287 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_287 = *(gl64_t*)&expressions_params[9][0];
    tmp1_1 = s1_287 - s0_287;
    // Op 288: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 289: dim1x1 add
    tmp1_1 = tmp1_2 + tmp1_0;
    // Op 290: dim1x1 mul
    gl64_t s0_290 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    gl64_t s1_290 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 31, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 31, domainSize, nCols_1))];
    tmp1_0 = s0_290 * s1_290;
    // Op 291: dim1x1 sub_swap
    gl64_t s0_291 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_291 = *(gl64_t*)&expressions_params[9][0];
    tmp1_2 = s1_291 - s0_291;
    // Op 292: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_2;
    // Op 293: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 294: dim1x1 sub_swap
    gl64_t s0_294 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    gl64_t s1_294 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_294 - s0_294;
    // Op 295: dim1x1 mul
    gl64_t s0_295 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    tmp1_0 = s0_295 * tmp1_0;
    // Op 296: dim1x1 sub
    tmp1_2 = tmp1_1 - tmp1_0;
    // Op 297: dim1x1 mul
    gl64_t s0_297 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    gl64_t s1_297 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_297 * s1_297;
    // Op 298: dim1x1 mul
    gl64_t s0_298 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    tmp1_0 = s0_298 * tmp1_0;
    // Op 299: dim1x1 sub_swap
    gl64_t s0_299 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    gl64_t s1_299 = *(gl64_t*)&expressions_params[9][0];
    tmp1_1 = s1_299 - s0_299;
    // Op 300: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 301: dim1x1 add
    tmp1_0 = tmp1_2 + tmp1_0;
    // Op 302: dim1x1 add
    gl64_t s0_302 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    tmp1_0 = s0_302 + tmp1_0;
    // Op 303: dim1x1 mul
    gl64_t s0_303 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_303 = *(gl64_t*)&expressions_params[9][19];
    tmp1_2 = s0_303 * s1_303;
    // Op 304: dim1x1 sub
    tmp1_0 = tmp1_0 - tmp1_2;
    // Op 305: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 306: dim3x3 mul
    gl64_t s1_306_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_306_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_306_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA306 = (tmp3_0 + tmp3_1) * (s1_306_0 + s1_306_1);
    gl64_t kB306 = (tmp3_0 + tmp3_2) * (s1_306_0 + s1_306_2);
    gl64_t kC306 = (tmp3_1 + tmp3_2) * (s1_306_1 + s1_306_2);
    gl64_t kD306 = tmp3_0 * s1_306_0;
    gl64_t kE306 = tmp3_1 * s1_306_1;
    gl64_t kF306 = tmp3_2 * s1_306_2;
    gl64_t kG306 = kD306 - kE306;
    tmp3_0 = (kC306 + kG306) - kF306;
    tmp3_1 = ((((kA306 + kC306) - kE306) - kE306) - kD306);
    tmp3_2 = kB306 - kG306;
    // Op 307: dim1x1 mul
    gl64_t s0_307 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    gl64_t s1_307 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_307 * s1_307;
    // Op 308: dim1x1 mul
    gl64_t s0_308 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp1_1 = s0_308 * tmp1_0;
    // Op 309: dim1x1 mul
    gl64_t s0_309 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    gl64_t s1_309 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 32, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 32, domainSize, nCols_1))];
    tmp1_0 = s0_309 * s1_309;
    // Op 310: dim1x1 sub_swap
    gl64_t s0_310 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_310 = *(gl64_t*)&expressions_params[9][0];
    tmp1_2 = s1_310 - s0_310;
    // Op 311: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_2;
    // Op 312: dim1x1 add
    tmp1_2 = tmp1_1 + tmp1_0;
    // Op 313: dim1x1 mul
    gl64_t s0_313 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    gl64_t s1_313 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 31, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 31, domainSize, nCols_1))];
    tmp1_0 = s0_313 * s1_313;
    // Op 314: dim1x1 sub_swap
    gl64_t s0_314 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_314 = *(gl64_t*)&expressions_params[9][0];
    tmp1_1 = s1_314 - s0_314;
    // Op 315: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 316: dim1x1 add
    tmp1_2 = tmp1_2 + tmp1_0;
    // Op 317: dim1x1 sub_swap
    gl64_t s0_317 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    gl64_t s1_317 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_317 - s0_317;
    // Op 318: dim1x1 mul
    gl64_t s0_318 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    tmp1_0 = s0_318 * tmp1_0;
    // Op 319: dim1x1 sub
    tmp1_1 = tmp1_2 - tmp1_0;
    // Op 320: dim1x1 mul
    gl64_t s0_320 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    gl64_t s1_320 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_320 * s1_320;
    // Op 321: dim1x1 mul
    gl64_t s0_321 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    tmp1_0 = s0_321 * tmp1_0;
    // Op 322: dim1x1 sub_swap
    gl64_t s0_322 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    gl64_t s1_322 = *(gl64_t*)&expressions_params[9][0];
    tmp1_2 = s1_322 - s0_322;
    // Op 323: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_2;
    // Op 324: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 325: dim1x1 add
    gl64_t s0_325 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_0 = s0_325 + tmp1_0;
    // Op 326: dim1x1 mul
    gl64_t s0_326 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_326 = *(gl64_t*)&expressions_params[9][19];
    tmp1_1 = s0_326 * s1_326;
    // Op 327: dim1x1 sub
    tmp1_0 = tmp1_0 - tmp1_1;
    // Op 328: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 329: dim3x3 mul
    gl64_t s1_329_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_329_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_329_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA329 = (tmp3_0 + tmp3_1) * (s1_329_0 + s1_329_1);
    gl64_t kB329 = (tmp3_0 + tmp3_2) * (s1_329_0 + s1_329_2);
    gl64_t kC329 = (tmp3_1 + tmp3_2) * (s1_329_1 + s1_329_2);
    gl64_t kD329 = tmp3_0 * s1_329_0;
    gl64_t kE329 = tmp3_1 * s1_329_1;
    gl64_t kF329 = tmp3_2 * s1_329_2;
    gl64_t kG329 = kD329 - kE329;
    tmp3_0 = (kC329 + kG329) - kF329;
    tmp3_1 = ((((kA329 + kC329) - kE329) - kE329) - kD329);
    tmp3_2 = kB329 - kG329;
    // Op 330: dim1x1 mul
    gl64_t s0_330 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    gl64_t s1_330 = *(gl64_t*)&expressions_params[9][19];
    tmp1_0 = s0_330 * s1_330;
    // Op 331: dim1x1 mul
    gl64_t s0_331 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    tmp1_0 = s0_331 * tmp1_0;
    // Op 332: dim1x1 sub_swap
    gl64_t s0_332 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_332 = *(gl64_t*)&expressions_params[9][0];
    tmp1_1 = s1_332 - s0_332;
    // Op 333: dim1x1 mul
    tmp1_2 = tmp1_0 * tmp1_1;
    // Op 334: dim1x1 mul
    gl64_t s0_334 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    gl64_t s1_334 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 32, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 32, domainSize, nCols_1))];
    tmp1_0 = s0_334 * s1_334;
    // Op 335: dim1x1 sub_swap
    gl64_t s0_335 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_335 = *(gl64_t*)&expressions_params[9][0];
    tmp1_1 = s1_335 - s0_335;
    // Op 336: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 337: dim1x1 add
    tmp1_1 = tmp1_2 + tmp1_0;
    // Op 338: dim1x1 mul
    gl64_t s0_338 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    gl64_t s1_338 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 31, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 31, domainSize, nCols_1))];
    tmp1_0 = s0_338 * s1_338;
    // Op 339: dim1x1 sub_swap
    gl64_t s0_339 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_339 = *(gl64_t*)&expressions_params[9][0];
    tmp1_2 = s1_339 - s0_339;
    // Op 340: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_2;
    // Op 341: dim1x1 add
    tmp1_2 = tmp1_1 + tmp1_0;
    // Op 342: dim1x1 mul
    gl64_t s0_342 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    gl64_t s1_342 = *(gl64_t*)&expressions_params[9][19];
    tmp1_0 = s0_342 * s1_342;
    // Op 343: dim1x1 sub_swap
    gl64_t s0_343 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    gl64_t s1_343 = *(gl64_t*)&expressions_params[9][0];
    tmp1_1 = s1_343 - s0_343;
    // Op 344: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 345: dim1x1 sub_swap
    gl64_t s0_345 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_345 = *(gl64_t*)&expressions_params[9][0];
    tmp1_1 = s1_345 - s0_345;
    // Op 346: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 347: dim1x1 sub
    tmp1_2 = tmp1_2 - tmp1_0;
    // Op 348: dim1x1 sub_swap
    gl64_t s0_348 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    gl64_t s1_348 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_348 - s0_348;
    // Op 349: dim1x1 mul
    gl64_t s0_349 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_0 = s0_349 * tmp1_0;
    // Op 350: dim1x1 sub
    tmp1_1 = tmp1_2 - tmp1_0;
    // Op 351: dim1x1 mul
    gl64_t s0_351 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    gl64_t s1_351 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_351 * s1_351;
    // Op 352: dim1x1 mul
    gl64_t s0_352 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_0 = s0_352 * tmp1_0;
    // Op 353: dim1x1 sub_swap
    gl64_t s0_353 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    gl64_t s1_353 = *(gl64_t*)&expressions_params[9][0];
    tmp1_2 = s1_353 - s0_353;
    // Op 354: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_2;
    // Op 355: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 356: dim1x1 add
    gl64_t s0_356 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    tmp1_0 = s0_356 + tmp1_0;
    // Op 357: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 358: dim3x3 mul
    gl64_t s1_358_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_358_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_358_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA358 = (tmp3_0 + tmp3_1) * (s1_358_0 + s1_358_1);
    gl64_t kB358 = (tmp3_0 + tmp3_2) * (s1_358_0 + s1_358_2);
    gl64_t kC358 = (tmp3_1 + tmp3_2) * (s1_358_1 + s1_358_2);
    gl64_t kD358 = tmp3_0 * s1_358_0;
    gl64_t kE358 = tmp3_1 * s1_358_1;
    gl64_t kF358 = tmp3_2 * s1_358_2;
    gl64_t kG358 = kD358 - kE358;
    tmp3_0 = (kC358 + kG358) - kF358;
    tmp3_1 = ((((kA358 + kC358) - kE358) - kE358) - kD358);
    tmp3_2 = kB358 - kG358;
    // Op 359: dim1x1 sub_swap
    gl64_t s0_359 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    gl64_t s1_359 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_359 - s0_359;
    // Op 360: dim1x1 mul
    gl64_t s0_360 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    tmp1_0 = s0_360 * tmp1_0;
    // Op 361: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 362: dim3x3 mul
    gl64_t s1_362_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_362_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_362_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA362 = (tmp3_0 + tmp3_1) * (s1_362_0 + s1_362_1);
    gl64_t kB362 = (tmp3_0 + tmp3_2) * (s1_362_0 + s1_362_2);
    gl64_t kC362 = (tmp3_1 + tmp3_2) * (s1_362_1 + s1_362_2);
    gl64_t kD362 = tmp3_0 * s1_362_0;
    gl64_t kE362 = tmp3_1 * s1_362_1;
    gl64_t kF362 = tmp3_2 * s1_362_2;
    gl64_t kG362 = kD362 - kE362;
    tmp3_0 = (kC362 + kG362) - kF362;
    tmp3_1 = ((((kA362 + kC362) - kE362) - kE362) - kD362);
    tmp3_2 = kB362 - kG362;
    // Op 363: dim1x1 sub_swap
    gl64_t s0_363 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_363 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_363 - s0_363;
    // Op 364: dim1x1 mul
    gl64_t s0_364 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    tmp1_0 = s0_364 * tmp1_0;
    // Op 365: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 366: dim3x3 mul
    gl64_t s1_366_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_366_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_366_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA366 = (tmp3_0 + tmp3_1) * (s1_366_0 + s1_366_1);
    gl64_t kB366 = (tmp3_0 + tmp3_2) * (s1_366_0 + s1_366_2);
    gl64_t kC366 = (tmp3_1 + tmp3_2) * (s1_366_1 + s1_366_2);
    gl64_t kD366 = tmp3_0 * s1_366_0;
    gl64_t kE366 = tmp3_1 * s1_366_1;
    gl64_t kF366 = tmp3_2 * s1_366_2;
    gl64_t kG366 = kD366 - kE366;
    tmp3_0 = (kC366 + kG366) - kF366;
    tmp3_1 = ((((kA366 + kC366) - kE366) - kE366) - kD366);
    tmp3_2 = kB366 - kG366;
    // Op 367: dim1x1 sub_swap
    gl64_t s0_367 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    gl64_t s1_367 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_367 - s0_367;
    // Op 368: dim1x1 mul
    gl64_t s0_368 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    tmp1_0 = s0_368 * tmp1_0;
    // Op 369: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 370: dim3x3 mul
    gl64_t s1_370_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_370_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_370_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA370 = (tmp3_0 + tmp3_1) * (s1_370_0 + s1_370_1);
    gl64_t kB370 = (tmp3_0 + tmp3_2) * (s1_370_0 + s1_370_2);
    gl64_t kC370 = (tmp3_1 + tmp3_2) * (s1_370_1 + s1_370_2);
    gl64_t kD370 = tmp3_0 * s1_370_0;
    gl64_t kE370 = tmp3_1 * s1_370_1;
    gl64_t kF370 = tmp3_2 * s1_370_2;
    gl64_t kG370 = kD370 - kE370;
    tmp3_0 = (kC370 + kG370) - kF370;
    tmp3_1 = ((((kA370 + kC370) - kE370) - kE370) - kD370);
    tmp3_2 = kB370 - kG370;
    // Op 371: dim1x1 sub_swap
    gl64_t s0_371 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    gl64_t s1_371 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_371 - s0_371;
    // Op 372: dim1x1 mul
    gl64_t s0_372 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    tmp1_0 = s0_372 * tmp1_0;
    // Op 373: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 374: dim3x3 mul
    gl64_t s1_374_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_374_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_374_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA374 = (tmp3_0 + tmp3_1) * (s1_374_0 + s1_374_1);
    gl64_t kB374 = (tmp3_0 + tmp3_2) * (s1_374_0 + s1_374_2);
    gl64_t kC374 = (tmp3_1 + tmp3_2) * (s1_374_1 + s1_374_2);
    gl64_t kD374 = tmp3_0 * s1_374_0;
    gl64_t kE374 = tmp3_1 * s1_374_1;
    gl64_t kF374 = tmp3_2 * s1_374_2;
    gl64_t kG374 = kD374 - kE374;
    tmp3_0 = (kC374 + kG374) - kF374;
    tmp3_1 = ((((kA374 + kC374) - kE374) - kE374) - kD374);
    tmp3_2 = kB374 - kG374;
    // Op 375: dim1x1 sub_swap
    gl64_t s0_375 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    gl64_t s1_375 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_375 - s0_375;
    // Op 376: dim1x1 mul
    gl64_t s0_376 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    tmp1_0 = s0_376 * tmp1_0;
    // Op 377: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 378: dim3x3 mul
    gl64_t s1_378_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_378_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_378_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA378 = (tmp3_0 + tmp3_1) * (s1_378_0 + s1_378_1);
    gl64_t kB378 = (tmp3_0 + tmp3_2) * (s1_378_0 + s1_378_2);
    gl64_t kC378 = (tmp3_1 + tmp3_2) * (s1_378_1 + s1_378_2);
    gl64_t kD378 = tmp3_0 * s1_378_0;
    gl64_t kE378 = tmp3_1 * s1_378_1;
    gl64_t kF378 = tmp3_2 * s1_378_2;
    gl64_t kG378 = kD378 - kE378;
    tmp3_0 = (kC378 + kG378) - kF378;
    tmp3_1 = ((((kA378 + kC378) - kE378) - kE378) - kD378);
    tmp3_2 = kB378 - kG378;
    // Op 379: dim1x1 sub_swap
    gl64_t s0_379 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    gl64_t s1_379 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_379 - s0_379;
    // Op 380: dim1x1 mul
    gl64_t s0_380 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    tmp1_0 = s0_380 * tmp1_0;
    // Op 381: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 382: dim3x3 mul
    gl64_t s1_382_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_382_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_382_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA382 = (tmp3_0 + tmp3_1) * (s1_382_0 + s1_382_1);
    gl64_t kB382 = (tmp3_0 + tmp3_2) * (s1_382_0 + s1_382_2);
    gl64_t kC382 = (tmp3_1 + tmp3_2) * (s1_382_1 + s1_382_2);
    gl64_t kD382 = tmp3_0 * s1_382_0;
    gl64_t kE382 = tmp3_1 * s1_382_1;
    gl64_t kF382 = tmp3_2 * s1_382_2;
    gl64_t kG382 = kD382 - kE382;
    tmp3_0 = (kC382 + kG382) - kF382;
    tmp3_1 = ((((kA382 + kC382) - kE382) - kE382) - kD382);
    tmp3_2 = kB382 - kG382;
    // Op 383: dim1x1 sub_swap
    gl64_t s0_383 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 27, domainSize, nCols_1))];
    gl64_t s1_383 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_383 - s0_383;
    // Op 384: dim1x1 mul
    gl64_t s0_384 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 27, domainSize, nCols_1))];
    tmp1_0 = s0_384 * tmp1_0;
    // Op 385: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 386: dim3x3 mul
    gl64_t s1_386_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_386_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_386_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA386 = (tmp3_0 + tmp3_1) * (s1_386_0 + s1_386_1);
    gl64_t kB386 = (tmp3_0 + tmp3_2) * (s1_386_0 + s1_386_2);
    gl64_t kC386 = (tmp3_1 + tmp3_2) * (s1_386_1 + s1_386_2);
    gl64_t kD386 = tmp3_0 * s1_386_0;
    gl64_t kE386 = tmp3_1 * s1_386_1;
    gl64_t kF386 = tmp3_2 * s1_386_2;
    gl64_t kG386 = kD386 - kE386;
    tmp3_0 = (kC386 + kG386) - kF386;
    tmp3_1 = ((((kA386 + kC386) - kE386) - kE386) - kD386);
    tmp3_2 = kB386 - kG386;
    // Op 387: dim1x1 mul
    gl64_t s0_387 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 27, domainSize, nCols_1))];
    gl64_t s1_387 = *(gl64_t*)&expressions_params[9][21];
    tmp1_3 = s0_387 * s1_387;
    // Op 388: dim1x1 sub_swap
    gl64_t s0_388 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_388 = *(gl64_t*)&expressions_params[9][0];
    tmp1_2 = s1_388 - s0_388;
    // Op 389: dim1x1 sub_swap
    gl64_t s0_389 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 34, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 34, domainSize, nCols_1))];
    gl64_t s1_389 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_389 - s0_389;
    // Op 390: dim1x1 sub_swap
    gl64_t s0_390 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 33, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 33, domainSize, nCols_1))];
    tmp1_4 = tmp1_0 - s0_390;
    // Op 391: dim1x1 mul
    gl64_t s0_391 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    gl64_t s1_391 = *(gl64_t*)&expressions_params[9][19];
    tmp1_0 = s0_391 * s1_391;
    // Op 392: dim1x1 add
    gl64_t s0_392 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    tmp1_0 = s0_392 + tmp1_0;
    // Op 393: dim1x1 mul
    tmp1_1 = tmp1_4 * tmp1_0;
    // Op 394: dim1x1 mul
    gl64_t s0_394 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    gl64_t s1_394 = *(gl64_t*)&expressions_params[9][19];
    tmp1_0 = s0_394 * s1_394;
    // Op 395: dim1x1 add
    gl64_t s0_395 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    tmp1_0 = s0_395 + tmp1_0;
    // Op 396: dim1x1 mul
    gl64_t s0_396 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 34, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 34, domainSize, nCols_1))];
    tmp1_0 = s0_396 * tmp1_0;
    // Op 397: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 398: dim1x1 mul
    gl64_t s0_398 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    gl64_t s1_398 = *(gl64_t*)&expressions_params[9][19];
    tmp1_0 = s0_398 * s1_398;
    // Op 399: dim1x1 add
    gl64_t s0_399 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    tmp1_0 = s0_399 + tmp1_0;
    // Op 400: dim1x1 mul
    gl64_t s0_400 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 33, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 33, domainSize, nCols_1))];
    tmp1_0 = s0_400 * tmp1_0;
    // Op 401: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 402: dim1x1 mul
    tmp1_0 = tmp1_2 * tmp1_0;
    // Op 403: dim1x1 add
    tmp1_0 = tmp1_3 + tmp1_0;
    // Op 404: dim1x1 sub
    gl64_t s0_404 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 40, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 40, domainSize, nCols_1))];
    tmp1_0 = s0_404 - tmp1_0;
    // Op 405: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 406: dim3x3 mul
    gl64_t s1_406_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_406_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_406_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA406 = (tmp3_0 + tmp3_1) * (s1_406_0 + s1_406_1);
    gl64_t kB406 = (tmp3_0 + tmp3_2) * (s1_406_0 + s1_406_2);
    gl64_t kC406 = (tmp3_1 + tmp3_2) * (s1_406_1 + s1_406_2);
    gl64_t kD406 = tmp3_0 * s1_406_0;
    gl64_t kE406 = tmp3_1 * s1_406_1;
    gl64_t kF406 = tmp3_2 * s1_406_2;
    gl64_t kG406 = kD406 - kE406;
    tmp3_0 = (kC406 + kG406) - kF406;
    tmp3_1 = ((((kA406 + kC406) - kE406) - kE406) - kD406);
    tmp3_2 = kB406 - kG406;
    // Op 407: dim1x1 mul
    gl64_t s0_407 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    gl64_t s1_407 = *(gl64_t*)&expressions_params[9][19];
    tmp1_0 = s0_407 * s1_407;
    // Op 408: dim1x1 add
    gl64_t s0_408 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    tmp1_0 = s0_408 + tmp1_0;
    // Op 409: dim1x1 mul
    gl64_t s0_409 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    tmp1_2 = s0_409 * tmp1_0;
    // Op 410: dim1x1 sub_swap
    gl64_t s0_410 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    gl64_t s1_410 = *(gl64_t*)&expressions_params[9][0];
    tmp1_3 = s1_410 - s0_410;
    // Op 411: dim1x1 mul
    gl64_t s0_411 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    gl64_t s1_411 = *(gl64_t*)&expressions_params[9][19];
    tmp1_0 = s0_411 * s1_411;
    // Op 412: dim1x1 add
    gl64_t s0_412 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    tmp1_0 = s0_412 + tmp1_0;
    // Op 413: dim1x1 mul
    tmp1_0 = tmp1_3 * tmp1_0;
    // Op 414: dim1x1 add
    tmp1_1 = tmp1_2 + tmp1_0;
    // Op 415: dim1x1 mul
    gl64_t s0_415 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    tmp1_0 = s0_415 * tmp1_1;
    // Op 416: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 417: dim3x3 mul
    gl64_t s1_417_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_417_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_417_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA417 = (tmp3_0 + tmp3_1) * (s1_417_0 + s1_417_1);
    gl64_t kB417 = (tmp3_0 + tmp3_2) * (s1_417_0 + s1_417_2);
    gl64_t kC417 = (tmp3_1 + tmp3_2) * (s1_417_1 + s1_417_2);
    gl64_t kD417 = tmp3_0 * s1_417_0;
    gl64_t kE417 = tmp3_1 * s1_417_1;
    gl64_t kF417 = tmp3_2 * s1_417_2;
    gl64_t kG417 = kD417 - kE417;
    tmp3_0 = (kC417 + kG417) - kF417;
    tmp3_1 = ((((kA417 + kC417) - kE417) - kE417) - kD417);
    tmp3_2 = kB417 - kG417;
    // Op 418: dim1x1 mul
    gl64_t s0_418 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    gl64_t s1_418 = *(gl64_t*)&expressions_params[9][19];
    tmp1_0 = s0_418 * s1_418;
    // Op 419: dim1x1 add
    gl64_t s0_419 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_3 = s0_419 + tmp1_0;
    // Op 420: dim1x1 mul
    gl64_t s0_420 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    tmp1_0 = s0_420 * tmp1_3;
    // Op 421: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 422: dim3x3 mul
    gl64_t s1_422_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_422_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_422_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA422 = (tmp3_0 + tmp3_1) * (s1_422_0 + s1_422_1);
    gl64_t kB422 = (tmp3_0 + tmp3_2) * (s1_422_0 + s1_422_2);
    gl64_t kC422 = (tmp3_1 + tmp3_2) * (s1_422_1 + s1_422_2);
    gl64_t kD422 = tmp3_0 * s1_422_0;
    gl64_t kE422 = tmp3_1 * s1_422_1;
    gl64_t kF422 = tmp3_2 * s1_422_2;
    gl64_t kG422 = kD422 - kE422;
    tmp3_12 = (kC422 + kG422) - kF422;
    tmp3_13 = ((((kA422 + kC422) - kE422) - kE422) - kD422);
    tmp3_14 = kB422 - kG422;
    // Op 423: dim3x1 mul
    gl64_t s0_423_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_423_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_423_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_423 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    tmp3_0 = s0_423_0 * s1_423; tmp3_1 = s0_423_1 * s1_423; tmp3_2 = s0_423_2 * s1_423;
    // Op 424: dim3x1 add
    gl64_t s1_424 = *(gl64_t*)&expressions_params[9][1];
    tmp3_0 = tmp3_0 + s1_424; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 425: dim3x3 mul
    gl64_t s1_425_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_425_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_425_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA425 = (tmp3_0 + tmp3_1) * (s1_425_0 + s1_425_1);
    gl64_t kB425 = (tmp3_0 + tmp3_2) * (s1_425_0 + s1_425_2);
    gl64_t kC425 = (tmp3_1 + tmp3_2) * (s1_425_1 + s1_425_2);
    gl64_t kD425 = tmp3_0 * s1_425_0;
    gl64_t kE425 = tmp3_1 * s1_425_1;
    gl64_t kF425 = tmp3_2 * s1_425_2;
    gl64_t kG425 = kD425 - kE425;
    tmp3_0 = (kC425 + kG425) - kF425;
    tmp3_1 = ((((kA425 + kC425) - kE425) - kE425) - kD425);
    tmp3_2 = kB425 - kG425;
    // Op 426: dim3x1 add
    gl64_t s1_426 = *(gl64_t*)&expressions_params[9][2];
    tmp3_9 = tmp3_0 + s1_426; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 427: dim3x3 add
    gl64_t s1_427_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_427_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_427_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_427_0; tmp3_4 = tmp3_10 + s1_427_1; tmp3_5 = tmp3_11 + s1_427_2;
    // Op 428: dim3x1 mul
    gl64_t s0_428_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_428_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_428_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_428 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    tmp3_0 = s0_428_0 * s1_428; tmp3_1 = s0_428_1 * s1_428; tmp3_2 = s0_428_2 * s1_428;
    // Op 429: dim3x1 add
    gl64_t s1_429 = *(gl64_t*)&expressions_params[9][1];
    tmp3_0 = tmp3_0 + s1_429; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 430: dim3x3 mul
    gl64_t s1_430_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_430_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_430_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA430 = (tmp3_0 + tmp3_1) * (s1_430_0 + s1_430_1);
    gl64_t kB430 = (tmp3_0 + tmp3_2) * (s1_430_0 + s1_430_2);
    gl64_t kC430 = (tmp3_1 + tmp3_2) * (s1_430_1 + s1_430_2);
    gl64_t kD430 = tmp3_0 * s1_430_0;
    gl64_t kE430 = tmp3_1 * s1_430_1;
    gl64_t kF430 = tmp3_2 * s1_430_2;
    gl64_t kG430 = kD430 - kE430;
    tmp3_0 = (kC430 + kG430) - kF430;
    tmp3_1 = ((((kA430 + kC430) - kE430) - kE430) - kD430);
    tmp3_2 = kB430 - kG430;
    // Op 431: dim3x1 add
    gl64_t s1_431 = *(gl64_t*)&expressions_params[9][2];
    tmp3_6 = tmp3_0 + s1_431; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 432: dim3x3 add
    gl64_t s1_432_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_432_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_432_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_432_0; tmp3_1 = tmp3_7 + s1_432_1; tmp3_2 = tmp3_8 + s1_432_2;
    // Op 433: dim3x3 mul
    gl64_t kA433 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB433 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC433 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD433 = tmp3_3 * tmp3_0;
    gl64_t kE433 = tmp3_4 * tmp3_1;
    gl64_t kF433 = tmp3_5 * tmp3_2;
    gl64_t kG433 = kD433 - kE433;
    tmp3_0 = (kC433 + kG433) - kF433;
    tmp3_1 = ((((kA433 + kC433) - kE433) - kE433) - kD433);
    tmp3_2 = kB433 - kG433;
    // Op 434: dim3x3 mul
    gl64_t s0_434_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+0, domainSize, nCols_2))];
    gl64_t s0_434_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+1, domainSize, nCols_2))];
    gl64_t s0_434_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+2, domainSize, nCols_2))];
    gl64_t kA434 = (s0_434_0 + s0_434_1) * (tmp3_0 + tmp3_1);
    gl64_t kB434 = (s0_434_0 + s0_434_2) * (tmp3_0 + tmp3_2);
    gl64_t kC434 = (s0_434_1 + s0_434_2) * (tmp3_1 + tmp3_2);
    gl64_t kD434 = s0_434_0 * tmp3_0;
    gl64_t kE434 = s0_434_1 * tmp3_1;
    gl64_t kF434 = s0_434_2 * tmp3_2;
    gl64_t kG434 = kD434 - kE434;
    tmp3_0 = (kC434 + kG434) - kF434;
    tmp3_1 = ((((kA434 + kC434) - kE434) - kE434) - kD434);
    tmp3_2 = kB434 - kG434;
    // Op 435: dim3x3 add
    gl64_t s1_435_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_435_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_435_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_435_0; tmp3_7 = tmp3_7 + s1_435_1; tmp3_8 = tmp3_8 + s1_435_2;
    // Op 436: dim3x1 mul
    gl64_t s1_436 = *(gl64_t*)&expressions_params[9][3];
    tmp3_6 = tmp3_6 * s1_436; tmp3_7 = tmp3_7 * s1_436; tmp3_8 = tmp3_8 * s1_436;
    // Op 437: dim3x3 add
    gl64_t s1_437_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_437_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_437_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_437_0; tmp3_10 = tmp3_10 + s1_437_1; tmp3_11 = tmp3_11 + s1_437_2;
    // Op 438: dim3x1 mul
    gl64_t s1_438 = *(gl64_t*)&expressions_params[9][3];
    tmp3_9 = tmp3_9 * s1_438; tmp3_10 = tmp3_10 * s1_438; tmp3_11 = tmp3_11 * s1_438;
    // Op 439: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 440: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 441: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 442: dim3x3 mul
    gl64_t s1_442_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_442_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_442_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA442 = (tmp3_0 + tmp3_1) * (s1_442_0 + s1_442_1);
    gl64_t kB442 = (tmp3_0 + tmp3_2) * (s1_442_0 + s1_442_2);
    gl64_t kC442 = (tmp3_1 + tmp3_2) * (s1_442_1 + s1_442_2);
    gl64_t kD442 = tmp3_0 * s1_442_0;
    gl64_t kE442 = tmp3_1 * s1_442_1;
    gl64_t kF442 = tmp3_2 * s1_442_2;
    gl64_t kG442 = kD442 - kE442;
    tmp3_3 = (kC442 + kG442) - kF442;
    tmp3_4 = ((((kA442 + kC442) - kE442) - kE442) - kD442);
    tmp3_5 = kB442 - kG442;
    // Op 443: dim3x1 mul
    gl64_t s0_443_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_443_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_443_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_443 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    tmp3_0 = s0_443_0 * s1_443; tmp3_1 = s0_443_1 * s1_443; tmp3_2 = s0_443_2 * s1_443;
    // Op 444: dim3x1 add
    gl64_t s1_444 = *(gl64_t*)&expressions_params[9][1];
    tmp3_0 = tmp3_0 + s1_444; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 445: dim3x3 mul
    gl64_t s1_445_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_445_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_445_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA445 = (tmp3_0 + tmp3_1) * (s1_445_0 + s1_445_1);
    gl64_t kB445 = (tmp3_0 + tmp3_2) * (s1_445_0 + s1_445_2);
    gl64_t kC445 = (tmp3_1 + tmp3_2) * (s1_445_1 + s1_445_2);
    gl64_t kD445 = tmp3_0 * s1_445_0;
    gl64_t kE445 = tmp3_1 * s1_445_1;
    gl64_t kF445 = tmp3_2 * s1_445_2;
    gl64_t kG445 = kD445 - kE445;
    tmp3_0 = (kC445 + kG445) - kF445;
    tmp3_1 = ((((kA445 + kC445) - kE445) - kE445) - kD445);
    tmp3_2 = kB445 - kG445;
    // Op 446: dim3x1 add
    gl64_t s1_446 = *(gl64_t*)&expressions_params[9][2];
    tmp3_9 = tmp3_0 + s1_446; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 447: dim3x3 add
    gl64_t s1_447_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_447_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_447_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_12 = tmp3_9 + s1_447_0; tmp3_13 = tmp3_10 + s1_447_1; tmp3_14 = tmp3_11 + s1_447_2;
    // Op 448: dim3x1 mul
    gl64_t s0_448_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_448_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_448_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_448 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    tmp3_0 = s0_448_0 * s1_448; tmp3_1 = s0_448_1 * s1_448; tmp3_2 = s0_448_2 * s1_448;
    // Op 449: dim3x1 add
    gl64_t s1_449 = *(gl64_t*)&expressions_params[9][1];
    tmp3_0 = tmp3_0 + s1_449; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 450: dim3x3 mul
    gl64_t s1_450_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_450_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_450_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA450 = (tmp3_0 + tmp3_1) * (s1_450_0 + s1_450_1);
    gl64_t kB450 = (tmp3_0 + tmp3_2) * (s1_450_0 + s1_450_2);
    gl64_t kC450 = (tmp3_1 + tmp3_2) * (s1_450_1 + s1_450_2);
    gl64_t kD450 = tmp3_0 * s1_450_0;
    gl64_t kE450 = tmp3_1 * s1_450_1;
    gl64_t kF450 = tmp3_2 * s1_450_2;
    gl64_t kG450 = kD450 - kE450;
    tmp3_0 = (kC450 + kG450) - kF450;
    tmp3_1 = ((((kA450 + kC450) - kE450) - kE450) - kD450);
    tmp3_2 = kB450 - kG450;
    // Op 451: dim3x1 add
    gl64_t s1_451 = *(gl64_t*)&expressions_params[9][2];
    tmp3_6 = tmp3_0 + s1_451; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 452: dim3x3 add
    gl64_t s1_452_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_452_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_452_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_452_0; tmp3_1 = tmp3_7 + s1_452_1; tmp3_2 = tmp3_8 + s1_452_2;
    // Op 453: dim3x3 mul
    gl64_t kA453 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB453 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC453 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD453 = tmp3_12 * tmp3_0;
    gl64_t kE453 = tmp3_13 * tmp3_1;
    gl64_t kF453 = tmp3_14 * tmp3_2;
    gl64_t kG453 = kD453 - kE453;
    tmp3_0 = (kC453 + kG453) - kF453;
    tmp3_1 = ((((kA453 + kC453) - kE453) - kE453) - kD453);
    tmp3_2 = kB453 - kG453;
    // Op 454: dim3x3 mul
    gl64_t s0_454_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+0, domainSize, nCols_2))];
    gl64_t s0_454_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+1, domainSize, nCols_2))];
    gl64_t s0_454_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+2, domainSize, nCols_2))];
    gl64_t kA454 = (s0_454_0 + s0_454_1) * (tmp3_0 + tmp3_1);
    gl64_t kB454 = (s0_454_0 + s0_454_2) * (tmp3_0 + tmp3_2);
    gl64_t kC454 = (s0_454_1 + s0_454_2) * (tmp3_1 + tmp3_2);
    gl64_t kD454 = s0_454_0 * tmp3_0;
    gl64_t kE454 = s0_454_1 * tmp3_1;
    gl64_t kF454 = s0_454_2 * tmp3_2;
    gl64_t kG454 = kD454 - kE454;
    tmp3_0 = (kC454 + kG454) - kF454;
    tmp3_1 = ((((kA454 + kC454) - kE454) - kE454) - kD454);
    tmp3_2 = kB454 - kG454;
    // Op 455: dim3x3 add
    gl64_t s1_455_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_455_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_455_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_455_0; tmp3_7 = tmp3_7 + s1_455_1; tmp3_8 = tmp3_8 + s1_455_2;
    // Op 456: dim3x1 mul
    gl64_t s1_456 = *(gl64_t*)&expressions_params[9][3];
    tmp3_6 = tmp3_6 * s1_456; tmp3_7 = tmp3_7 * s1_456; tmp3_8 = tmp3_8 * s1_456;
    // Op 457: dim3x3 add
    gl64_t s1_457_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_457_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_457_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_457_0; tmp3_10 = tmp3_10 + s1_457_1; tmp3_11 = tmp3_11 + s1_457_2;
    // Op 458: dim3x1 mul
    gl64_t s1_458 = *(gl64_t*)&expressions_params[9][3];
    tmp3_9 = tmp3_9 * s1_458; tmp3_10 = tmp3_10 * s1_458; tmp3_11 = tmp3_11 * s1_458;
    // Op 459: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 460: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 461: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 462: dim3x3 mul
    gl64_t s1_462_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_462_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_462_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA462 = (tmp3_0 + tmp3_1) * (s1_462_0 + s1_462_1);
    gl64_t kB462 = (tmp3_0 + tmp3_2) * (s1_462_0 + s1_462_2);
    gl64_t kC462 = (tmp3_1 + tmp3_2) * (s1_462_1 + s1_462_2);
    gl64_t kD462 = tmp3_0 * s1_462_0;
    gl64_t kE462 = tmp3_1 * s1_462_1;
    gl64_t kF462 = tmp3_2 * s1_462_2;
    gl64_t kG462 = kD462 - kE462;
    tmp3_12 = (kC462 + kG462) - kF462;
    tmp3_13 = ((((kA462 + kC462) - kE462) - kE462) - kD462);
    tmp3_14 = kB462 - kG462;
    // Op 463: dim3x1 mul
    gl64_t s0_463_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_463_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_463_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_463 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp3_0 = s0_463_0 * s1_463; tmp3_1 = s0_463_1 * s1_463; tmp3_2 = s0_463_2 * s1_463;
    // Op 464: dim3x1 add
    gl64_t s1_464 = *(gl64_t*)&expressions_params[9][1];
    tmp3_0 = tmp3_0 + s1_464; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 465: dim3x3 mul
    gl64_t s1_465_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_465_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_465_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA465 = (tmp3_0 + tmp3_1) * (s1_465_0 + s1_465_1);
    gl64_t kB465 = (tmp3_0 + tmp3_2) * (s1_465_0 + s1_465_2);
    gl64_t kC465 = (tmp3_1 + tmp3_2) * (s1_465_1 + s1_465_2);
    gl64_t kD465 = tmp3_0 * s1_465_0;
    gl64_t kE465 = tmp3_1 * s1_465_1;
    gl64_t kF465 = tmp3_2 * s1_465_2;
    gl64_t kG465 = kD465 - kE465;
    tmp3_0 = (kC465 + kG465) - kF465;
    tmp3_1 = ((((kA465 + kC465) - kE465) - kE465) - kD465);
    tmp3_2 = kB465 - kG465;
    // Op 466: dim3x1 add
    gl64_t s1_466 = *(gl64_t*)&expressions_params[9][2];
    tmp3_9 = tmp3_0 + s1_466; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 467: dim3x3 add
    gl64_t s1_467_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_467_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_467_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_467_0; tmp3_4 = tmp3_10 + s1_467_1; tmp3_5 = tmp3_11 + s1_467_2;
    // Op 468: dim3x1 mul
    gl64_t s0_468_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_468_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_468_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_468 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    tmp3_0 = s0_468_0 * s1_468; tmp3_1 = s0_468_1 * s1_468; tmp3_2 = s0_468_2 * s1_468;
    // Op 469: dim3x1 add
    gl64_t s1_469 = *(gl64_t*)&expressions_params[9][1];
    tmp3_0 = tmp3_0 + s1_469; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 470: dim3x3 mul
    gl64_t s1_470_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_470_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_470_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA470 = (tmp3_0 + tmp3_1) * (s1_470_0 + s1_470_1);
    gl64_t kB470 = (tmp3_0 + tmp3_2) * (s1_470_0 + s1_470_2);
    gl64_t kC470 = (tmp3_1 + tmp3_2) * (s1_470_1 + s1_470_2);
    gl64_t kD470 = tmp3_0 * s1_470_0;
    gl64_t kE470 = tmp3_1 * s1_470_1;
    gl64_t kF470 = tmp3_2 * s1_470_2;
    gl64_t kG470 = kD470 - kE470;
    tmp3_0 = (kC470 + kG470) - kF470;
    tmp3_1 = ((((kA470 + kC470) - kE470) - kE470) - kD470);
    tmp3_2 = kB470 - kG470;
    // Op 471: dim3x1 add
    gl64_t s1_471 = *(gl64_t*)&expressions_params[9][2];
    tmp3_6 = tmp3_0 + s1_471; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 472: dim3x3 add
    gl64_t s1_472_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_472_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_472_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_472_0; tmp3_1 = tmp3_7 + s1_472_1; tmp3_2 = tmp3_8 + s1_472_2;
    // Op 473: dim3x3 mul
    gl64_t kA473 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB473 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC473 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD473 = tmp3_3 * tmp3_0;
    gl64_t kE473 = tmp3_4 * tmp3_1;
    gl64_t kF473 = tmp3_5 * tmp3_2;
    gl64_t kG473 = kD473 - kE473;
    tmp3_0 = (kC473 + kG473) - kF473;
    tmp3_1 = ((((kA473 + kC473) - kE473) - kE473) - kD473);
    tmp3_2 = kB473 - kG473;
    // Op 474: dim3x3 mul
    uint64_t s0_474_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_2));
    gl64_t s0_474_0 = *(gl64_t*)&dParams->aux_trace[s0_474_pos];
    gl64_t s0_474_1 = *(gl64_t*)&dParams->aux_trace[s0_474_pos + TILE_HEIGHT];
    gl64_t s0_474_2 = *(gl64_t*)&dParams->aux_trace[s0_474_pos + 2*TILE_HEIGHT];
    gl64_t kA474 = (s0_474_0 + s0_474_1) * (tmp3_0 + tmp3_1);
    gl64_t kB474 = (s0_474_0 + s0_474_2) * (tmp3_0 + tmp3_2);
    gl64_t kC474 = (s0_474_1 + s0_474_2) * (tmp3_1 + tmp3_2);
    gl64_t kD474 = s0_474_0 * tmp3_0;
    gl64_t kE474 = s0_474_1 * tmp3_1;
    gl64_t kF474 = s0_474_2 * tmp3_2;
    gl64_t kG474 = kD474 - kE474;
    tmp3_0 = (kC474 + kG474) - kF474;
    tmp3_1 = ((((kA474 + kC474) - kE474) - kE474) - kD474);
    tmp3_2 = kB474 - kG474;
    // Op 475: dim3x3 add
    gl64_t s1_475_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_475_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_475_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_475_0; tmp3_7 = tmp3_7 + s1_475_1; tmp3_8 = tmp3_8 + s1_475_2;
    // Op 476: dim3x1 mul
    gl64_t s1_476 = *(gl64_t*)&expressions_params[9][3];
    tmp3_6 = tmp3_6 * s1_476; tmp3_7 = tmp3_7 * s1_476; tmp3_8 = tmp3_8 * s1_476;
    // Op 477: dim3x3 add
    gl64_t s1_477_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_477_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_477_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_477_0; tmp3_10 = tmp3_10 + s1_477_1; tmp3_11 = tmp3_11 + s1_477_2;
    // Op 478: dim3x1 mul
    gl64_t s1_478 = *(gl64_t*)&expressions_params[9][3];
    tmp3_9 = tmp3_9 * s1_478; tmp3_10 = tmp3_10 * s1_478; tmp3_11 = tmp3_11 * s1_478;
    // Op 479: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 480: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 481: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 482: dim3x3 mul
    gl64_t s1_482_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_482_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_482_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA482 = (tmp3_0 + tmp3_1) * (s1_482_0 + s1_482_1);
    gl64_t kB482 = (tmp3_0 + tmp3_2) * (s1_482_0 + s1_482_2);
    gl64_t kC482 = (tmp3_1 + tmp3_2) * (s1_482_1 + s1_482_2);
    gl64_t kD482 = tmp3_0 * s1_482_0;
    gl64_t kE482 = tmp3_1 * s1_482_1;
    gl64_t kF482 = tmp3_2 * s1_482_2;
    gl64_t kG482 = kD482 - kE482;
    tmp3_3 = (kC482 + kG482) - kF482;
    tmp3_4 = ((((kA482 + kC482) - kE482) - kE482) - kD482);
    tmp3_5 = kB482 - kG482;
    // Op 483: dim3x1 mul
    gl64_t s0_483_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_483_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_483_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_483 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 43, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 43, domainSize, nCols_1))];
    tmp3_0 = s0_483_0 * s1_483; tmp3_1 = s0_483_1 * s1_483; tmp3_2 = s0_483_2 * s1_483;
    // Op 484: dim3x1 add
    gl64_t s1_484 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 42, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 42, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_484; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 485: dim3x3 mul
    gl64_t s1_485_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_485_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_485_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA485 = (tmp3_0 + tmp3_1) * (s1_485_0 + s1_485_1);
    gl64_t kB485 = (tmp3_0 + tmp3_2) * (s1_485_0 + s1_485_2);
    gl64_t kC485 = (tmp3_1 + tmp3_2) * (s1_485_1 + s1_485_2);
    gl64_t kD485 = tmp3_0 * s1_485_0;
    gl64_t kE485 = tmp3_1 * s1_485_1;
    gl64_t kF485 = tmp3_2 * s1_485_2;
    gl64_t kG485 = kD485 - kE485;
    tmp3_0 = (kC485 + kG485) - kF485;
    tmp3_1 = ((((kA485 + kC485) - kE485) - kE485) - kD485);
    tmp3_2 = kB485 - kG485;
    // Op 486: dim1x1 mul
    gl64_t s0_486 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    gl64_t s1_486 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_486 * s1_486;
    // Op 487: dim1x1 add
    gl64_t s0_487 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    tmp1_0 = s0_487 + tmp1_0;
    // Op 488: dim1x1 mul
    gl64_t s0_488 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    gl64_t s1_488 = *(gl64_t*)&expressions_params[9][6];
    tmp1_2 = s0_488 * s1_488;
    // Op 489: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_2;
    // Op 490: dim1x1 mul
    gl64_t s0_490 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    gl64_t s1_490 = *(gl64_t*)&expressions_params[9][7];
    tmp1_2 = s0_490 * s1_490;
    // Op 491: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_2;
    // Op 492: dim1x1 mul
    gl64_t s0_492 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    gl64_t s1_492 = *(gl64_t*)&expressions_params[9][8];
    tmp1_2 = s0_492 * s1_492;
    // Op 493: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_2;
    // Op 494: dim1x1 mul
    gl64_t s0_494 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    gl64_t s1_494 = *(gl64_t*)&expressions_params[9][9];
    tmp1_2 = s0_494 * s1_494;
    // Op 495: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_2;
    // Op 496: dim1x1 mul
    gl64_t s0_496 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 27, domainSize, nCols_1))];
    gl64_t s1_496 = *(gl64_t*)&expressions_params[9][10];
    tmp1_2 = s0_496 * s1_496;
    // Op 497: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_2;
    // Op 498: dim1x1 mul
    gl64_t s0_498 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_1))];
    gl64_t s1_498 = *(gl64_t*)&expressions_params[9][11];
    tmp1_2 = s0_498 * s1_498;
    // Op 499: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_2;
    // Op 500: dim1x1 mul
    gl64_t s0_500 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 37, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 37, domainSize, nCols_1))];
    gl64_t s1_500 = *(gl64_t*)&expressions_params[9][12];
    tmp1_2 = s0_500 * s1_500;
    // Op 501: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_2;
    // Op 502: dim1x1 mul
    gl64_t s0_502 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 34, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 34, domainSize, nCols_1))];
    gl64_t s1_502 = *(gl64_t*)&expressions_params[9][13];
    tmp1_2 = s0_502 * s1_502;
    // Op 503: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_2;
    // Op 504: dim1x1 mul
    gl64_t s0_504 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 33, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 33, domainSize, nCols_1))];
    gl64_t s1_504 = *(gl64_t*)&expressions_params[9][14];
    tmp1_2 = s0_504 * s1_504;
    // Op 505: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_2;
    // Op 506: dim1x1 mul
    gl64_t s0_506 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 35, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 35, domainSize, nCols_1))];
    gl64_t s1_506 = *(gl64_t*)&expressions_params[9][15];
    tmp1_2 = s0_506 * s1_506;
    // Op 507: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_2;
    // Op 508: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 509: dim3x3 mul
    gl64_t s1_509_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_509_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_509_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA509 = (tmp3_0 + tmp3_1) * (s1_509_0 + s1_509_1);
    gl64_t kB509 = (tmp3_0 + tmp3_2) * (s1_509_0 + s1_509_2);
    gl64_t kC509 = (tmp3_1 + tmp3_2) * (s1_509_1 + s1_509_2);
    gl64_t kD509 = tmp3_0 * s1_509_0;
    gl64_t kE509 = tmp3_1 * s1_509_1;
    gl64_t kF509 = tmp3_2 * s1_509_2;
    gl64_t kG509 = kD509 - kE509;
    tmp3_0 = (kC509 + kG509) - kF509;
    tmp3_1 = ((((kA509 + kC509) - kE509) - kE509) - kD509);
    tmp3_2 = kB509 - kG509;
    // Op 510: dim3x1 add
    gl64_t s1_510 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 39, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 39, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_510; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 511: dim3x3 mul
    gl64_t s1_511_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_511_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_511_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA511 = (tmp3_0 + tmp3_1) * (s1_511_0 + s1_511_1);
    gl64_t kB511 = (tmp3_0 + tmp3_2) * (s1_511_0 + s1_511_2);
    gl64_t kC511 = (tmp3_1 + tmp3_2) * (s1_511_1 + s1_511_2);
    gl64_t kD511 = tmp3_0 * s1_511_0;
    gl64_t kE511 = tmp3_1 * s1_511_1;
    gl64_t kF511 = tmp3_2 * s1_511_2;
    gl64_t kG511 = kD511 - kE511;
    tmp3_0 = (kC511 + kG511) - kF511;
    tmp3_1 = ((((kA511 + kC511) - kE511) - kE511) - kD511);
    tmp3_2 = kB511 - kG511;
    // Op 512: dim3x1 add
    gl64_t s1_512 = *(gl64_t*)&expressions_params[9][16];
    tmp3_9 = tmp3_0 + s1_512; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 513: dim3x3 add
    gl64_t s1_513_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_513_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_513_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_12 = tmp3_9 + s1_513_0; tmp3_13 = tmp3_10 + s1_513_1; tmp3_14 = tmp3_11 + s1_513_2;
    // Op 514: dim3x1 mul
    gl64_t s0_514_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_514_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_514_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_514 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    tmp3_0 = s0_514_0 * s1_514; tmp3_1 = s0_514_1 * s1_514; tmp3_2 = s0_514_2 * s1_514;
    // Op 515: dim1x1 add
    gl64_t s0_515 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 42, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 42, domainSize, nCols_1))];
    gl64_t s1_515 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_515 + s1_515;
    // Op 516: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 517: dim3x3 mul
    gl64_t s1_517_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_517_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_517_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA517 = (tmp3_0 + tmp3_1) * (s1_517_0 + s1_517_1);
    gl64_t kB517 = (tmp3_0 + tmp3_2) * (s1_517_0 + s1_517_2);
    gl64_t kC517 = (tmp3_1 + tmp3_2) * (s1_517_1 + s1_517_2);
    gl64_t kD517 = tmp3_0 * s1_517_0;
    gl64_t kE517 = tmp3_1 * s1_517_1;
    gl64_t kF517 = tmp3_2 * s1_517_2;
    gl64_t kG517 = kD517 - kE517;
    tmp3_0 = (kC517 + kG517) - kF517;
    tmp3_1 = ((((kA517 + kC517) - kE517) - kE517) - kD517);
    tmp3_2 = kB517 - kG517;
    // Op 518: dim3x1 add
    gl64_t s1_518 = *(gl64_t*)&expressions_params[9][2];
    tmp3_6 = tmp3_0 + s1_518; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 519: dim3x3 add
    gl64_t s1_519_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_519_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_519_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_519_0; tmp3_1 = tmp3_7 + s1_519_1; tmp3_2 = tmp3_8 + s1_519_2;
    // Op 520: dim3x3 mul
    gl64_t kA520 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB520 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC520 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD520 = tmp3_12 * tmp3_0;
    gl64_t kE520 = tmp3_13 * tmp3_1;
    gl64_t kF520 = tmp3_14 * tmp3_2;
    gl64_t kG520 = kD520 - kE520;
    tmp3_0 = (kC520 + kG520) - kF520;
    tmp3_1 = ((((kA520 + kC520) - kE520) - kE520) - kD520);
    tmp3_2 = kB520 - kG520;
    // Op 521: dim3x3 mul
    uint64_t s0_521_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_2));
    gl64_t s0_521_0 = *(gl64_t*)&dParams->aux_trace[s0_521_pos];
    gl64_t s0_521_1 = *(gl64_t*)&dParams->aux_trace[s0_521_pos + TILE_HEIGHT];
    gl64_t s0_521_2 = *(gl64_t*)&dParams->aux_trace[s0_521_pos + 2*TILE_HEIGHT];
    gl64_t kA521 = (s0_521_0 + s0_521_1) * (tmp3_0 + tmp3_1);
    gl64_t kB521 = (s0_521_0 + s0_521_2) * (tmp3_0 + tmp3_2);
    gl64_t kC521 = (s0_521_1 + s0_521_2) * (tmp3_1 + tmp3_2);
    gl64_t kD521 = s0_521_0 * tmp3_0;
    gl64_t kE521 = s0_521_1 * tmp3_1;
    gl64_t kF521 = s0_521_2 * tmp3_2;
    gl64_t kG521 = kD521 - kE521;
    tmp3_0 = (kC521 + kG521) - kF521;
    tmp3_1 = ((((kA521 + kC521) - kE521) - kE521) - kD521);
    tmp3_2 = kB521 - kG521;
    // Op 522: dim3x3 add
    gl64_t s1_522_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_522_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_522_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_522_0; tmp3_7 = tmp3_7 + s1_522_1; tmp3_8 = tmp3_8 + s1_522_2;
    // Op 523: dim3x1 mul
    gl64_t s1_523 = *(gl64_t*)&expressions_params[9][3];
    tmp3_6 = tmp3_6 * s1_523; tmp3_7 = tmp3_7 * s1_523; tmp3_8 = tmp3_8 * s1_523;
    // Op 524: dim3x3 add
    gl64_t s1_524_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_524_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_524_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_524_0; tmp3_10 = tmp3_10 + s1_524_1; tmp3_11 = tmp3_11 + s1_524_2;
    // Op 525: dim3x1 mul
    gl64_t s1_525 = *(gl64_t*)&expressions_params[9][3];
    tmp3_9 = tmp3_9 * s1_525; tmp3_10 = tmp3_10 * s1_525; tmp3_11 = tmp3_11 * s1_525;
    // Op 526: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 527: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 528: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 529: dim3x3 mul
    gl64_t s1_529_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_529_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_529_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA529 = (tmp3_0 + tmp3_1) * (s1_529_0 + s1_529_1);
    gl64_t kB529 = (tmp3_0 + tmp3_2) * (s1_529_0 + s1_529_2);
    gl64_t kC529 = (tmp3_1 + tmp3_2) * (s1_529_1 + s1_529_2);
    gl64_t kD529 = tmp3_0 * s1_529_0;
    gl64_t kE529 = tmp3_1 * s1_529_1;
    gl64_t kF529 = tmp3_2 * s1_529_2;
    gl64_t kG529 = kD529 - kE529;
    tmp3_12 = (kC529 + kG529) - kF529;
    tmp3_13 = ((((kA529 + kC529) - kE529) - kE529) - kD529);
    tmp3_14 = kB529 - kG529;
    // Op 530: dim3x1 mul
    gl64_t s0_530_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_530_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_530_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_530 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp3_0 = s0_530_0 * s1_530; tmp3_1 = s0_530_1 * s1_530; tmp3_2 = s0_530_2 * s1_530;
    // Op 531: dim1x1 add
    gl64_t s0_531 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 42, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 42, domainSize, nCols_1))];
    gl64_t s1_531 = *(gl64_t*)&expressions_params[9][17];
    tmp1_0 = s0_531 + s1_531;
    // Op 532: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 533: dim3x3 mul
    gl64_t s1_533_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_533_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_533_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA533 = (tmp3_0 + tmp3_1) * (s1_533_0 + s1_533_1);
    gl64_t kB533 = (tmp3_0 + tmp3_2) * (s1_533_0 + s1_533_2);
    gl64_t kC533 = (tmp3_1 + tmp3_2) * (s1_533_1 + s1_533_2);
    gl64_t kD533 = tmp3_0 * s1_533_0;
    gl64_t kE533 = tmp3_1 * s1_533_1;
    gl64_t kF533 = tmp3_2 * s1_533_2;
    gl64_t kG533 = kD533 - kE533;
    tmp3_0 = (kC533 + kG533) - kF533;
    tmp3_1 = ((((kA533 + kC533) - kE533) - kE533) - kD533);
    tmp3_2 = kB533 - kG533;
    // Op 534: dim3x1 add
    gl64_t s1_534 = *(gl64_t*)&expressions_params[9][2];
    tmp3_9 = tmp3_0 + s1_534; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 535: dim3x3 add
    gl64_t s1_535_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_535_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_535_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_535_0; tmp3_4 = tmp3_10 + s1_535_1; tmp3_5 = tmp3_11 + s1_535_2;
    // Op 536: dim3x1 mul
    gl64_t s0_536_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_536_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_536_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_536 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    tmp3_0 = s0_536_0 * s1_536; tmp3_1 = s0_536_1 * s1_536; tmp3_2 = s0_536_2 * s1_536;
    // Op 537: dim1x1 add
    gl64_t s0_537 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 43, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 43, domainSize, nCols_1))];
    gl64_t s1_537 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_537 + s1_537;
    // Op 538: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 539: dim3x3 mul
    gl64_t s1_539_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_539_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_539_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA539 = (tmp3_0 + tmp3_1) * (s1_539_0 + s1_539_1);
    gl64_t kB539 = (tmp3_0 + tmp3_2) * (s1_539_0 + s1_539_2);
    gl64_t kC539 = (tmp3_1 + tmp3_2) * (s1_539_1 + s1_539_2);
    gl64_t kD539 = tmp3_0 * s1_539_0;
    gl64_t kE539 = tmp3_1 * s1_539_1;
    gl64_t kF539 = tmp3_2 * s1_539_2;
    gl64_t kG539 = kD539 - kE539;
    tmp3_0 = (kC539 + kG539) - kF539;
    tmp3_1 = ((((kA539 + kC539) - kE539) - kE539) - kD539);
    tmp3_2 = kB539 - kG539;
    // Op 540: dim3x1 add
    gl64_t s1_540 = *(gl64_t*)&expressions_params[9][2];
    tmp3_6 = tmp3_0 + s1_540; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 541: dim3x3 add
    gl64_t s1_541_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_541_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_541_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_541_0; tmp3_1 = tmp3_7 + s1_541_1; tmp3_2 = tmp3_8 + s1_541_2;
    // Op 542: dim3x3 mul
    gl64_t kA542 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB542 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC542 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD542 = tmp3_3 * tmp3_0;
    gl64_t kE542 = tmp3_4 * tmp3_1;
    gl64_t kF542 = tmp3_5 * tmp3_2;
    gl64_t kG542 = kD542 - kE542;
    tmp3_0 = (kC542 + kG542) - kF542;
    tmp3_1 = ((((kA542 + kC542) - kE542) - kE542) - kD542);
    tmp3_2 = kB542 - kG542;
    // Op 543: dim3x3 mul
    gl64_t s0_543_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+0, domainSize, nCols_2))];
    gl64_t s0_543_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+1, domainSize, nCols_2))];
    gl64_t s0_543_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+2, domainSize, nCols_2))];
    gl64_t kA543 = (s0_543_0 + s0_543_1) * (tmp3_0 + tmp3_1);
    gl64_t kB543 = (s0_543_0 + s0_543_2) * (tmp3_0 + tmp3_2);
    gl64_t kC543 = (s0_543_1 + s0_543_2) * (tmp3_1 + tmp3_2);
    gl64_t kD543 = s0_543_0 * tmp3_0;
    gl64_t kE543 = s0_543_1 * tmp3_1;
    gl64_t kF543 = s0_543_2 * tmp3_2;
    gl64_t kG543 = kD543 - kE543;
    tmp3_0 = (kC543 + kG543) - kF543;
    tmp3_1 = ((((kA543 + kC543) - kE543) - kE543) - kD543);
    tmp3_2 = kB543 - kG543;
    // Op 544: dim3x3 add
    gl64_t s1_544_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_544_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_544_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_544_0; tmp3_7 = tmp3_7 + s1_544_1; tmp3_8 = tmp3_8 + s1_544_2;
    // Op 545: dim3x1 mul
    gl64_t s1_545 = *(gl64_t*)&expressions_params[9][3];
    tmp3_6 = tmp3_6 * s1_545; tmp3_7 = tmp3_7 * s1_545; tmp3_8 = tmp3_8 * s1_545;
    // Op 546: dim3x3 add
    gl64_t s1_546_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_546_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_546_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_546_0; tmp3_10 = tmp3_10 + s1_546_1; tmp3_11 = tmp3_11 + s1_546_2;
    // Op 547: dim3x1 mul
    gl64_t s1_547 = *(gl64_t*)&expressions_params[9][3];
    tmp3_9 = tmp3_9 * s1_547; tmp3_10 = tmp3_10 * s1_547; tmp3_11 = tmp3_11 * s1_547;
    // Op 548: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 549: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 550: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 551: dim3x3 mul
    gl64_t s1_551_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_551_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_551_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA551 = (tmp3_0 + tmp3_1) * (s1_551_0 + s1_551_1);
    gl64_t kB551 = (tmp3_0 + tmp3_2) * (s1_551_0 + s1_551_2);
    gl64_t kC551 = (tmp3_1 + tmp3_2) * (s1_551_1 + s1_551_2);
    gl64_t kD551 = tmp3_0 * s1_551_0;
    gl64_t kE551 = tmp3_1 * s1_551_1;
    gl64_t kF551 = tmp3_2 * s1_551_2;
    gl64_t kG551 = kD551 - kE551;
    tmp3_3 = (kC551 + kG551) - kF551;
    tmp3_4 = ((((kA551 + kC551) - kE551) - kE551) - kD551);
    tmp3_5 = kB551 - kG551;
    // Op 552: dim3x1 mul
    gl64_t s0_552_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_552_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_552_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_552 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    tmp3_0 = s0_552_0 * s1_552; tmp3_1 = s0_552_1 * s1_552; tmp3_2 = s0_552_2 * s1_552;
    // Op 553: dim1x1 add
    gl64_t s0_553 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 43, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 43, domainSize, nCols_1))];
    gl64_t s1_553 = *(gl64_t*)&expressions_params[9][17];
    tmp1_0 = s0_553 + s1_553;
    // Op 554: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 555: dim3x3 mul
    gl64_t s1_555_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_555_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_555_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA555 = (tmp3_0 + tmp3_1) * (s1_555_0 + s1_555_1);
    gl64_t kB555 = (tmp3_0 + tmp3_2) * (s1_555_0 + s1_555_2);
    gl64_t kC555 = (tmp3_1 + tmp3_2) * (s1_555_1 + s1_555_2);
    gl64_t kD555 = tmp3_0 * s1_555_0;
    gl64_t kE555 = tmp3_1 * s1_555_1;
    gl64_t kF555 = tmp3_2 * s1_555_2;
    gl64_t kG555 = kD555 - kE555;
    tmp3_0 = (kC555 + kG555) - kF555;
    tmp3_1 = ((((kA555 + kC555) - kE555) - kE555) - kD555);
    tmp3_2 = kB555 - kG555;
    // Op 556: dim3x1 add
    gl64_t s1_556 = *(gl64_t*)&expressions_params[9][2];
    tmp3_9 = tmp3_0 + s1_556; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 557: dim3x3 add
    gl64_t s1_557_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_557_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_557_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_12 = tmp3_9 + s1_557_0; tmp3_13 = tmp3_10 + s1_557_1; tmp3_14 = tmp3_11 + s1_557_2;
    // Op 558: dim3x1 mul
    gl64_t s0_558_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_558_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_558_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_558 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp3_0 = s0_558_0 * s1_558; tmp3_1 = s0_558_1 * s1_558; tmp3_2 = s0_558_2 * s1_558;
    // Op 559: dim3x1 add
    gl64_t s1_559 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 42, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 42, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_559; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 560: dim3x3 mul
    gl64_t s1_560_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_560_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_560_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA560 = (tmp3_0 + tmp3_1) * (s1_560_0 + s1_560_1);
    gl64_t kB560 = (tmp3_0 + tmp3_2) * (s1_560_0 + s1_560_2);
    gl64_t kC560 = (tmp3_1 + tmp3_2) * (s1_560_1 + s1_560_2);
    gl64_t kD560 = tmp3_0 * s1_560_0;
    gl64_t kE560 = tmp3_1 * s1_560_1;
    gl64_t kF560 = tmp3_2 * s1_560_2;
    gl64_t kG560 = kD560 - kE560;
    tmp3_0 = (kC560 + kG560) - kF560;
    tmp3_1 = ((((kA560 + kC560) - kE560) - kE560) - kD560);
    tmp3_2 = kB560 - kG560;
    // Op 561: dim3x1 add
    gl64_t s1_561 = *(gl64_t*)&expressions_params[9][2];
    tmp3_6 = tmp3_0 + s1_561; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 562: dim3x3 add
    gl64_t s1_562_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_562_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_562_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_562_0; tmp3_1 = tmp3_7 + s1_562_1; tmp3_2 = tmp3_8 + s1_562_2;
    // Op 563: dim3x3 mul
    gl64_t kA563 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB563 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC563 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD563 = tmp3_12 * tmp3_0;
    gl64_t kE563 = tmp3_13 * tmp3_1;
    gl64_t kF563 = tmp3_14 * tmp3_2;
    gl64_t kG563 = kD563 - kE563;
    tmp3_0 = (kC563 + kG563) - kF563;
    tmp3_1 = ((((kA563 + kC563) - kE563) - kE563) - kD563);
    tmp3_2 = kB563 - kG563;
    // Op 564: dim3x3 mul
    gl64_t s0_564_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+0, domainSize, nCols_2))];
    gl64_t s0_564_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+1, domainSize, nCols_2))];
    gl64_t s0_564_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+2, domainSize, nCols_2))];
    gl64_t kA564 = (s0_564_0 + s0_564_1) * (tmp3_0 + tmp3_1);
    gl64_t kB564 = (s0_564_0 + s0_564_2) * (tmp3_0 + tmp3_2);
    gl64_t kC564 = (s0_564_1 + s0_564_2) * (tmp3_1 + tmp3_2);
    gl64_t kD564 = s0_564_0 * tmp3_0;
    gl64_t kE564 = s0_564_1 * tmp3_1;
    gl64_t kF564 = s0_564_2 * tmp3_2;
    gl64_t kG564 = kD564 - kE564;
    tmp3_0 = (kC564 + kG564) - kF564;
    tmp3_1 = ((((kA564 + kC564) - kE564) - kE564) - kD564);
    tmp3_2 = kB564 - kG564;
    // Op 565: dim3x3 add
    gl64_t s1_565_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_565_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_565_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_565_0; tmp3_7 = tmp3_7 + s1_565_1; tmp3_8 = tmp3_8 + s1_565_2;
    // Op 566: dim3x1 mul
    gl64_t s1_566 = *(gl64_t*)&expressions_params[9][3];
    tmp3_6 = tmp3_6 * s1_566; tmp3_7 = tmp3_7 * s1_566; tmp3_8 = tmp3_8 * s1_566;
    // Op 567: dim3x3 add
    gl64_t s1_567_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_567_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_567_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_567_0; tmp3_10 = tmp3_10 + s1_567_1; tmp3_11 = tmp3_11 + s1_567_2;
    // Op 568: dim3x1 mul
    gl64_t s1_568 = *(gl64_t*)&expressions_params[9][3];
    tmp3_9 = tmp3_9 * s1_568; tmp3_10 = tmp3_10 * s1_568; tmp3_11 = tmp3_11 * s1_568;
    // Op 569: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 570: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 571: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 572: dim3x3 mul
    gl64_t s1_572_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_572_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_572_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA572 = (tmp3_0 + tmp3_1) * (s1_572_0 + s1_572_1);
    gl64_t kB572 = (tmp3_0 + tmp3_2) * (s1_572_0 + s1_572_2);
    gl64_t kC572 = (tmp3_1 + tmp3_2) * (s1_572_1 + s1_572_2);
    gl64_t kD572 = tmp3_0 * s1_572_0;
    gl64_t kE572 = tmp3_1 * s1_572_1;
    gl64_t kF572 = tmp3_2 * s1_572_2;
    gl64_t kG572 = kD572 - kE572;
    tmp3_12 = (kC572 + kG572) - kF572;
    tmp3_13 = ((((kA572 + kC572) - kE572) - kE572) - kD572);
    tmp3_14 = kB572 - kG572;
    // Op 573: dim3x1 mul
    gl64_t s0_573_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_573_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_573_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_573 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp3_0 = s0_573_0 * s1_573; tmp3_1 = s0_573_1 * s1_573; tmp3_2 = s0_573_2 * s1_573;
    // Op 574: dim1x1 add
    gl64_t s0_574 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 42, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 42, domainSize, nCols_1))];
    gl64_t s1_574 = *(gl64_t*)&expressions_params[9][18];
    tmp1_0 = s0_574 + s1_574;
    // Op 575: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 576: dim3x3 mul
    gl64_t s1_576_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_576_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_576_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA576 = (tmp3_0 + tmp3_1) * (s1_576_0 + s1_576_1);
    gl64_t kB576 = (tmp3_0 + tmp3_2) * (s1_576_0 + s1_576_2);
    gl64_t kC576 = (tmp3_1 + tmp3_2) * (s1_576_1 + s1_576_2);
    gl64_t kD576 = tmp3_0 * s1_576_0;
    gl64_t kE576 = tmp3_1 * s1_576_1;
    gl64_t kF576 = tmp3_2 * s1_576_2;
    gl64_t kG576 = kD576 - kE576;
    tmp3_0 = (kC576 + kG576) - kF576;
    tmp3_1 = ((((kA576 + kC576) - kE576) - kE576) - kD576);
    tmp3_2 = kB576 - kG576;
    // Op 577: dim3x1 add
    gl64_t s1_577 = *(gl64_t*)&expressions_params[9][2];
    tmp3_9 = tmp3_0 + s1_577; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 578: dim3x3 add
    gl64_t s1_578_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_578_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_578_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_578_0; tmp3_4 = tmp3_10 + s1_578_1; tmp3_5 = tmp3_11 + s1_578_2;
    // Op 579: dim3x1 mul
    gl64_t s0_579_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_579_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_579_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_579 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    tmp3_0 = s0_579_0 * s1_579; tmp3_1 = s0_579_1 * s1_579; tmp3_2 = s0_579_2 * s1_579;
    // Op 580: dim3x1 add
    gl64_t s1_580 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 43, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 43, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_580; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 581: dim3x3 mul
    gl64_t s1_581_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_581_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_581_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA581 = (tmp3_0 + tmp3_1) * (s1_581_0 + s1_581_1);
    gl64_t kB581 = (tmp3_0 + tmp3_2) * (s1_581_0 + s1_581_2);
    gl64_t kC581 = (tmp3_1 + tmp3_2) * (s1_581_1 + s1_581_2);
    gl64_t kD581 = tmp3_0 * s1_581_0;
    gl64_t kE581 = tmp3_1 * s1_581_1;
    gl64_t kF581 = tmp3_2 * s1_581_2;
    gl64_t kG581 = kD581 - kE581;
    tmp3_0 = (kC581 + kG581) - kF581;
    tmp3_1 = ((((kA581 + kC581) - kE581) - kE581) - kD581);
    tmp3_2 = kB581 - kG581;
    // Op 582: dim3x1 add
    gl64_t s1_582 = *(gl64_t*)&expressions_params[9][2];
    tmp3_6 = tmp3_0 + s1_582; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 583: dim3x3 add
    gl64_t s1_583_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_583_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_583_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_583_0; tmp3_1 = tmp3_7 + s1_583_1; tmp3_2 = tmp3_8 + s1_583_2;
    // Op 584: dim3x3 mul
    gl64_t kA584 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB584 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC584 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD584 = tmp3_3 * tmp3_0;
    gl64_t kE584 = tmp3_4 * tmp3_1;
    gl64_t kF584 = tmp3_5 * tmp3_2;
    gl64_t kG584 = kD584 - kE584;
    tmp3_0 = (kC584 + kG584) - kF584;
    tmp3_1 = ((((kA584 + kC584) - kE584) - kE584) - kD584);
    tmp3_2 = kB584 - kG584;
    // Op 585: dim3x3 mul
    uint64_t s0_585_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_2));
    gl64_t s0_585_0 = *(gl64_t*)&dParams->aux_trace[s0_585_pos];
    gl64_t s0_585_1 = *(gl64_t*)&dParams->aux_trace[s0_585_pos + TILE_HEIGHT];
    gl64_t s0_585_2 = *(gl64_t*)&dParams->aux_trace[s0_585_pos + 2*TILE_HEIGHT];
    gl64_t kA585 = (s0_585_0 + s0_585_1) * (tmp3_0 + tmp3_1);
    gl64_t kB585 = (s0_585_0 + s0_585_2) * (tmp3_0 + tmp3_2);
    gl64_t kC585 = (s0_585_1 + s0_585_2) * (tmp3_1 + tmp3_2);
    gl64_t kD585 = s0_585_0 * tmp3_0;
    gl64_t kE585 = s0_585_1 * tmp3_1;
    gl64_t kF585 = s0_585_2 * tmp3_2;
    gl64_t kG585 = kD585 - kE585;
    tmp3_0 = (kC585 + kG585) - kF585;
    tmp3_1 = ((((kA585 + kC585) - kE585) - kE585) - kD585);
    tmp3_2 = kB585 - kG585;
    // Op 586: dim3x3 add
    gl64_t s1_586_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_586_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_586_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_586_0; tmp3_7 = tmp3_7 + s1_586_1; tmp3_8 = tmp3_8 + s1_586_2;
    // Op 587: dim3x1 mul
    gl64_t s1_587 = *(gl64_t*)&expressions_params[9][3];
    tmp3_6 = tmp3_6 * s1_587; tmp3_7 = tmp3_7 * s1_587; tmp3_8 = tmp3_8 * s1_587;
    // Op 588: dim3x3 add
    gl64_t s1_588_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_588_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_588_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_588_0; tmp3_10 = tmp3_10 + s1_588_1; tmp3_11 = tmp3_11 + s1_588_2;
    // Op 589: dim3x1 mul
    gl64_t s1_589 = *(gl64_t*)&expressions_params[9][3];
    tmp3_9 = tmp3_9 * s1_589; tmp3_10 = tmp3_10 * s1_589; tmp3_11 = tmp3_11 * s1_589;
    // Op 590: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 591: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 592: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 593: dim3x3 mul
    gl64_t s1_593_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_593_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_593_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA593 = (tmp3_0 + tmp3_1) * (s1_593_0 + s1_593_1);
    gl64_t kB593 = (tmp3_0 + tmp3_2) * (s1_593_0 + s1_593_2);
    gl64_t kC593 = (tmp3_1 + tmp3_2) * (s1_593_1 + s1_593_2);
    gl64_t kD593 = tmp3_0 * s1_593_0;
    gl64_t kE593 = tmp3_1 * s1_593_1;
    gl64_t kF593 = tmp3_2 * s1_593_2;
    gl64_t kG593 = kD593 - kE593;
    tmp3_3 = (kC593 + kG593) - kF593;
    tmp3_4 = ((((kA593 + kC593) - kE593) - kE593) - kD593);
    tmp3_5 = kB593 - kG593;
    // Op 594: dim3x1 mul
    gl64_t s0_594_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_594_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_594_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_594 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp3_0 = s0_594_0 * s1_594; tmp3_1 = s0_594_1 * s1_594; tmp3_2 = s0_594_2 * s1_594;
    // Op 595: dim1x1 add
    gl64_t s0_595 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 43, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 43, domainSize, nCols_1))];
    gl64_t s1_595 = *(gl64_t*)&expressions_params[9][18];
    tmp1_0 = s0_595 + s1_595;
    // Op 596: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 597: dim3x3 mul
    gl64_t s1_597_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_597_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_597_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA597 = (tmp3_0 + tmp3_1) * (s1_597_0 + s1_597_1);
    gl64_t kB597 = (tmp3_0 + tmp3_2) * (s1_597_0 + s1_597_2);
    gl64_t kC597 = (tmp3_1 + tmp3_2) * (s1_597_1 + s1_597_2);
    gl64_t kD597 = tmp3_0 * s1_597_0;
    gl64_t kE597 = tmp3_1 * s1_597_1;
    gl64_t kF597 = tmp3_2 * s1_597_2;
    gl64_t kG597 = kD597 - kE597;
    tmp3_0 = (kC597 + kG597) - kF597;
    tmp3_1 = ((((kA597 + kC597) - kE597) - kE597) - kD597);
    tmp3_2 = kB597 - kG597;
    // Op 598: dim3x1 add
    gl64_t s1_598 = *(gl64_t*)&expressions_params[9][2];
    tmp3_9 = tmp3_0 + s1_598; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 599: dim3x3 add
    gl64_t s1_599_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_599_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_599_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_12 = tmp3_9 + s1_599_0; tmp3_13 = tmp3_10 + s1_599_1; tmp3_14 = tmp3_11 + s1_599_2;
    // Op 600: dim3x1 mul
    gl64_t s0_600_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_600_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_600_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_600 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp3_0 = s0_600_0 * s1_600; tmp3_1 = s0_600_1 * s1_600; tmp3_2 = s0_600_2 * s1_600;
    // Op 601: dim3x3 mul
    gl64_t s1_601_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_601_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_601_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA601 = (tmp3_0 + tmp3_1) * (s1_601_0 + s1_601_1);
    gl64_t kB601 = (tmp3_0 + tmp3_2) * (s1_601_0 + s1_601_2);
    gl64_t kC601 = (tmp3_1 + tmp3_2) * (s1_601_1 + s1_601_2);
    gl64_t kD601 = tmp3_0 * s1_601_0;
    gl64_t kE601 = tmp3_1 * s1_601_1;
    gl64_t kF601 = tmp3_2 * s1_601_2;
    gl64_t kG601 = kD601 - kE601;
    tmp3_0 = (kC601 + kG601) - kF601;
    tmp3_1 = ((((kA601 + kC601) - kE601) - kE601) - kD601);
    tmp3_2 = kB601 - kG601;
    // Op 602: dim3x1 add
    gl64_t s1_602 = *(gl64_t*)&expressions_params[9][2];
    tmp3_6 = tmp3_0 + s1_602; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 603: dim3x3 add
    gl64_t s1_603_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_603_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_603_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_603_0; tmp3_1 = tmp3_7 + s1_603_1; tmp3_2 = tmp3_8 + s1_603_2;
    // Op 604: dim3x3 mul
    gl64_t kA604 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB604 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC604 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD604 = tmp3_12 * tmp3_0;
    gl64_t kE604 = tmp3_13 * tmp3_1;
    gl64_t kF604 = tmp3_14 * tmp3_2;
    gl64_t kG604 = kD604 - kE604;
    tmp3_0 = (kC604 + kG604) - kF604;
    tmp3_1 = ((((kA604 + kC604) - kE604) - kE604) - kD604);
    tmp3_2 = kB604 - kG604;
    // Op 605: dim3x3 mul
    uint64_t s0_605_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_2));
    gl64_t s0_605_0 = *(gl64_t*)&dParams->aux_trace[s0_605_pos];
    gl64_t s0_605_1 = *(gl64_t*)&dParams->aux_trace[s0_605_pos + TILE_HEIGHT];
    gl64_t s0_605_2 = *(gl64_t*)&dParams->aux_trace[s0_605_pos + 2*TILE_HEIGHT];
    gl64_t kA605 = (s0_605_0 + s0_605_1) * (tmp3_0 + tmp3_1);
    gl64_t kB605 = (s0_605_0 + s0_605_2) * (tmp3_0 + tmp3_2);
    gl64_t kC605 = (s0_605_1 + s0_605_2) * (tmp3_1 + tmp3_2);
    gl64_t kD605 = s0_605_0 * tmp3_0;
    gl64_t kE605 = s0_605_1 * tmp3_1;
    gl64_t kF605 = s0_605_2 * tmp3_2;
    gl64_t kG605 = kD605 - kE605;
    tmp3_0 = (kC605 + kG605) - kF605;
    tmp3_1 = ((((kA605 + kC605) - kE605) - kE605) - kD605);
    tmp3_2 = kB605 - kG605;
    // Op 606: dim3x3 add
    gl64_t s1_606_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_606_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_606_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_606_0; tmp3_7 = tmp3_7 + s1_606_1; tmp3_8 = tmp3_8 + s1_606_2;
    // Op 607: dim3x1 mul
    gl64_t s1_607 = *(gl64_t*)&expressions_params[9][3];
    tmp3_6 = tmp3_6 * s1_607; tmp3_7 = tmp3_7 * s1_607; tmp3_8 = tmp3_8 * s1_607;
    // Op 608: dim3x3 add
    gl64_t s1_608_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_608_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_608_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_608_0; tmp3_10 = tmp3_10 + s1_608_1; tmp3_11 = tmp3_11 + s1_608_2;
    // Op 609: dim3x1 mul
    gl64_t s1_609 = *(gl64_t*)&expressions_params[9][3];
    tmp3_9 = tmp3_9 * s1_609; tmp3_10 = tmp3_10 * s1_609; tmp3_11 = tmp3_11 * s1_609;
    // Op 610: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 611: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 612: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 613: dim3x3 mul
    gl64_t s1_613_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_613_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_613_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA613 = (tmp3_0 + tmp3_1) * (s1_613_0 + s1_613_1);
    gl64_t kB613 = (tmp3_0 + tmp3_2) * (s1_613_0 + s1_613_2);
    gl64_t kC613 = (tmp3_1 + tmp3_2) * (s1_613_1 + s1_613_2);
    gl64_t kD613 = tmp3_0 * s1_613_0;
    gl64_t kE613 = tmp3_1 * s1_613_1;
    gl64_t kF613 = tmp3_2 * s1_613_2;
    gl64_t kG613 = kD613 - kE613;
    tmp3_12 = (kC613 + kG613) - kF613;
    tmp3_13 = ((((kA613 + kC613) - kE613) - kE613) - kD613);
    tmp3_14 = kB613 - kG613;
    // Op 614: dim3x1 mul
    gl64_t s0_614_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_614_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_614_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_614 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp3_0 = s0_614_0 * s1_614; tmp3_1 = s0_614_1 * s1_614; tmp3_2 = s0_614_2 * s1_614;
    // Op 615: dim3x3 mul
    gl64_t s1_615_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_615_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_615_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA615 = (tmp3_0 + tmp3_1) * (s1_615_0 + s1_615_1);
    gl64_t kB615 = (tmp3_0 + tmp3_2) * (s1_615_0 + s1_615_2);
    gl64_t kC615 = (tmp3_1 + tmp3_2) * (s1_615_1 + s1_615_2);
    gl64_t kD615 = tmp3_0 * s1_615_0;
    gl64_t kE615 = tmp3_1 * s1_615_1;
    gl64_t kF615 = tmp3_2 * s1_615_2;
    gl64_t kG615 = kD615 - kE615;
    tmp3_0 = (kC615 + kG615) - kF615;
    tmp3_1 = ((((kA615 + kC615) - kE615) - kE615) - kD615);
    tmp3_2 = kB615 - kG615;
    // Op 616: dim3x1 add
    gl64_t s1_616 = *(gl64_t*)&expressions_params[9][2];
    tmp3_9 = tmp3_0 + s1_616; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 617: dim3x3 add
    gl64_t s1_617_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_617_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_617_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_617_0; tmp3_4 = tmp3_10 + s1_617_1; tmp3_5 = tmp3_11 + s1_617_2;
    // Op 618: dim3x1 mul
    gl64_t s0_618_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_618_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_618_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_618 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    tmp3_0 = s0_618_0 * s1_618; tmp3_1 = s0_618_1 * s1_618; tmp3_2 = s0_618_2 * s1_618;
    // Op 619: dim3x3 mul
    gl64_t s1_619_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_619_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_619_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA619 = (tmp3_0 + tmp3_1) * (s1_619_0 + s1_619_1);
    gl64_t kB619 = (tmp3_0 + tmp3_2) * (s1_619_0 + s1_619_2);
    gl64_t kC619 = (tmp3_1 + tmp3_2) * (s1_619_1 + s1_619_2);
    gl64_t kD619 = tmp3_0 * s1_619_0;
    gl64_t kE619 = tmp3_1 * s1_619_1;
    gl64_t kF619 = tmp3_2 * s1_619_2;
    gl64_t kG619 = kD619 - kE619;
    tmp3_0 = (kC619 + kG619) - kF619;
    tmp3_1 = ((((kA619 + kC619) - kE619) - kE619) - kD619);
    tmp3_2 = kB619 - kG619;
    // Op 620: dim3x1 add
    gl64_t s1_620 = *(gl64_t*)&expressions_params[9][2];
    tmp3_6 = tmp3_0 + s1_620; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 621: dim3x3 add
    gl64_t s1_621_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_621_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_621_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_621_0; tmp3_1 = tmp3_7 + s1_621_1; tmp3_2 = tmp3_8 + s1_621_2;
    // Op 622: dim3x3 mul
    gl64_t kA622 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB622 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC622 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD622 = tmp3_3 * tmp3_0;
    gl64_t kE622 = tmp3_4 * tmp3_1;
    gl64_t kF622 = tmp3_5 * tmp3_2;
    gl64_t kG622 = kD622 - kE622;
    tmp3_0 = (kC622 + kG622) - kF622;
    tmp3_1 = ((((kA622 + kC622) - kE622) - kE622) - kD622);
    tmp3_2 = kB622 - kG622;
    // Op 623: dim3x3 mul
    gl64_t s0_623_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 27+0, domainSize, nCols_2))];
    gl64_t s0_623_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 27+1, domainSize, nCols_2))];
    gl64_t s0_623_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 27+2, domainSize, nCols_2))];
    gl64_t kA623 = (s0_623_0 + s0_623_1) * (tmp3_0 + tmp3_1);
    gl64_t kB623 = (s0_623_0 + s0_623_2) * (tmp3_0 + tmp3_2);
    gl64_t kC623 = (s0_623_1 + s0_623_2) * (tmp3_1 + tmp3_2);
    gl64_t kD623 = s0_623_0 * tmp3_0;
    gl64_t kE623 = s0_623_1 * tmp3_1;
    gl64_t kF623 = s0_623_2 * tmp3_2;
    gl64_t kG623 = kD623 - kE623;
    tmp3_0 = (kC623 + kG623) - kF623;
    tmp3_1 = ((((kA623 + kC623) - kE623) - kE623) - kD623);
    tmp3_2 = kB623 - kG623;
    // Op 624: dim3x3 add
    gl64_t s1_624_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_624_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_624_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_624_0; tmp3_7 = tmp3_7 + s1_624_1; tmp3_8 = tmp3_8 + s1_624_2;
    // Op 625: dim3x1 mul
    gl64_t s1_625 = *(gl64_t*)&expressions_params[9][3];
    tmp3_6 = tmp3_6 * s1_625; tmp3_7 = tmp3_7 * s1_625; tmp3_8 = tmp3_8 * s1_625;
    // Op 626: dim3x3 add
    gl64_t s1_626_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_626_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_626_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_626_0; tmp3_10 = tmp3_10 + s1_626_1; tmp3_11 = tmp3_11 + s1_626_2;
    // Op 627: dim3x1 mul
    gl64_t s1_627 = *(gl64_t*)&expressions_params[9][3];
    tmp3_9 = tmp3_9 * s1_627; tmp3_10 = tmp3_10 * s1_627; tmp3_11 = tmp3_11 * s1_627;
    // Op 628: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 629: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 630: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 631: dim3x3 mul
    gl64_t s1_631_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_631_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_631_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA631 = (tmp3_0 + tmp3_1) * (s1_631_0 + s1_631_1);
    gl64_t kB631 = (tmp3_0 + tmp3_2) * (s1_631_0 + s1_631_2);
    gl64_t kC631 = (tmp3_1 + tmp3_2) * (s1_631_1 + s1_631_2);
    gl64_t kD631 = tmp3_0 * s1_631_0;
    gl64_t kE631 = tmp3_1 * s1_631_1;
    gl64_t kF631 = tmp3_2 * s1_631_2;
    gl64_t kG631 = kD631 - kE631;
    tmp3_3 = (kC631 + kG631) - kF631;
    tmp3_4 = ((((kA631 + kC631) - kE631) - kE631) - kD631);
    tmp3_5 = kB631 - kG631;
    // Op 632: dim3x1 mul
    gl64_t s0_632_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_632_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_632_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_632 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    tmp3_0 = s0_632_0 * s1_632; tmp3_1 = s0_632_1 * s1_632; tmp3_2 = s0_632_2 * s1_632;
    // Op 633: dim3x3 mul
    gl64_t s1_633_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_633_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_633_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA633 = (tmp3_0 + tmp3_1) * (s1_633_0 + s1_633_1);
    gl64_t kB633 = (tmp3_0 + tmp3_2) * (s1_633_0 + s1_633_2);
    gl64_t kC633 = (tmp3_1 + tmp3_2) * (s1_633_1 + s1_633_2);
    gl64_t kD633 = tmp3_0 * s1_633_0;
    gl64_t kE633 = tmp3_1 * s1_633_1;
    gl64_t kF633 = tmp3_2 * s1_633_2;
    gl64_t kG633 = kD633 - kE633;
    tmp3_0 = (kC633 + kG633) - kF633;
    tmp3_1 = ((((kA633 + kC633) - kE633) - kE633) - kD633);
    tmp3_2 = kB633 - kG633;
    // Op 634: dim3x1 add
    gl64_t s1_634 = *(gl64_t*)&expressions_params[9][2];
    tmp3_9 = tmp3_0 + s1_634; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 635: dim3x3 add
    gl64_t s1_635_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_635_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_635_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_12 = tmp3_9 + s1_635_0; tmp3_13 = tmp3_10 + s1_635_1; tmp3_14 = tmp3_11 + s1_635_2;
    // Op 636: dim3x1 mul
    gl64_t s0_636_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_636_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_636_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_636 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    tmp3_0 = s0_636_0 * s1_636; tmp3_1 = s0_636_1 * s1_636; tmp3_2 = s0_636_2 * s1_636;
    // Op 637: dim3x3 mul
    gl64_t s1_637_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_637_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_637_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA637 = (tmp3_0 + tmp3_1) * (s1_637_0 + s1_637_1);
    gl64_t kB637 = (tmp3_0 + tmp3_2) * (s1_637_0 + s1_637_2);
    gl64_t kC637 = (tmp3_1 + tmp3_2) * (s1_637_1 + s1_637_2);
    gl64_t kD637 = tmp3_0 * s1_637_0;
    gl64_t kE637 = tmp3_1 * s1_637_1;
    gl64_t kF637 = tmp3_2 * s1_637_2;
    gl64_t kG637 = kD637 - kE637;
    tmp3_0 = (kC637 + kG637) - kF637;
    tmp3_1 = ((((kA637 + kC637) - kE637) - kE637) - kD637);
    tmp3_2 = kB637 - kG637;
    // Op 638: dim3x1 add
    gl64_t s1_638 = *(gl64_t*)&expressions_params[9][2];
    tmp3_6 = tmp3_0 + s1_638; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 639: dim3x3 add
    gl64_t s1_639_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_639_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_639_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_639_0; tmp3_1 = tmp3_7 + s1_639_1; tmp3_2 = tmp3_8 + s1_639_2;
    // Op 640: dim3x3 mul
    gl64_t kA640 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB640 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC640 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD640 = tmp3_12 * tmp3_0;
    gl64_t kE640 = tmp3_13 * tmp3_1;
    gl64_t kF640 = tmp3_14 * tmp3_2;
    gl64_t kG640 = kD640 - kE640;
    tmp3_0 = (kC640 + kG640) - kF640;
    tmp3_1 = ((((kA640 + kC640) - kE640) - kE640) - kD640);
    tmp3_2 = kB640 - kG640;
    // Op 641: dim3x3 mul
    gl64_t s0_641_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 30+0, domainSize, nCols_2))];
    gl64_t s0_641_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 30+1, domainSize, nCols_2))];
    gl64_t s0_641_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 30+2, domainSize, nCols_2))];
    gl64_t kA641 = (s0_641_0 + s0_641_1) * (tmp3_0 + tmp3_1);
    gl64_t kB641 = (s0_641_0 + s0_641_2) * (tmp3_0 + tmp3_2);
    gl64_t kC641 = (s0_641_1 + s0_641_2) * (tmp3_1 + tmp3_2);
    gl64_t kD641 = s0_641_0 * tmp3_0;
    gl64_t kE641 = s0_641_1 * tmp3_1;
    gl64_t kF641 = s0_641_2 * tmp3_2;
    gl64_t kG641 = kD641 - kE641;
    tmp3_0 = (kC641 + kG641) - kF641;
    tmp3_1 = ((((kA641 + kC641) - kE641) - kE641) - kD641);
    tmp3_2 = kB641 - kG641;
    // Op 642: dim3x3 add
    gl64_t s1_642_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_642_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_642_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_642_0; tmp3_7 = tmp3_7 + s1_642_1; tmp3_8 = tmp3_8 + s1_642_2;
    // Op 643: dim3x1 mul
    gl64_t s1_643 = *(gl64_t*)&expressions_params[9][3];
    tmp3_6 = tmp3_6 * s1_643; tmp3_7 = tmp3_7 * s1_643; tmp3_8 = tmp3_8 * s1_643;
    // Op 644: dim3x3 add
    gl64_t s1_644_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_644_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_644_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_644_0; tmp3_10 = tmp3_10 + s1_644_1; tmp3_11 = tmp3_11 + s1_644_2;
    // Op 645: dim3x1 mul
    gl64_t s1_645 = *(gl64_t*)&expressions_params[9][3];
    tmp3_9 = tmp3_9 * s1_645; tmp3_10 = tmp3_10 * s1_645; tmp3_11 = tmp3_11 * s1_645;
    // Op 646: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 647: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 648: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 649: dim3x3 mul
    gl64_t s1_649_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_649_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_649_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA649 = (tmp3_0 + tmp3_1) * (s1_649_0 + s1_649_1);
    gl64_t kB649 = (tmp3_0 + tmp3_2) * (s1_649_0 + s1_649_2);
    gl64_t kC649 = (tmp3_1 + tmp3_2) * (s1_649_1 + s1_649_2);
    gl64_t kD649 = tmp3_0 * s1_649_0;
    gl64_t kE649 = tmp3_1 * s1_649_1;
    gl64_t kF649 = tmp3_2 * s1_649_2;
    gl64_t kG649 = kD649 - kE649;
    tmp3_12 = (kC649 + kG649) - kF649;
    tmp3_13 = ((((kA649 + kC649) - kE649) - kE649) - kD649);
    tmp3_14 = kB649 - kG649;
    // Op 650: dim3x1 mul
    gl64_t s0_650_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_650_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_650_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_650 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp3_0 = s0_650_0 * s1_650; tmp3_1 = s0_650_1 * s1_650; tmp3_2 = s0_650_2 * s1_650;
    // Op 651: dim3x3 mul
    gl64_t s1_651_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_651_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_651_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA651 = (tmp3_0 + tmp3_1) * (s1_651_0 + s1_651_1);
    gl64_t kB651 = (tmp3_0 + tmp3_2) * (s1_651_0 + s1_651_2);
    gl64_t kC651 = (tmp3_1 + tmp3_2) * (s1_651_1 + s1_651_2);
    gl64_t kD651 = tmp3_0 * s1_651_0;
    gl64_t kE651 = tmp3_1 * s1_651_1;
    gl64_t kF651 = tmp3_2 * s1_651_2;
    gl64_t kG651 = kD651 - kE651;
    tmp3_0 = (kC651 + kG651) - kF651;
    tmp3_1 = ((((kA651 + kC651) - kE651) - kE651) - kD651);
    tmp3_2 = kB651 - kG651;
    // Op 652: dim3x1 add
    gl64_t s1_652 = *(gl64_t*)&expressions_params[9][2];
    tmp3_9 = tmp3_0 + s1_652; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 653: dim3x3 add
    gl64_t s1_653_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_653_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_653_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_653_0; tmp3_4 = tmp3_10 + s1_653_1; tmp3_5 = tmp3_11 + s1_653_2;
    // Op 654: dim3x1 mul
    gl64_t s0_654_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_654_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_654_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_654 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    tmp3_0 = s0_654_0 * s1_654; tmp3_1 = s0_654_1 * s1_654; tmp3_2 = s0_654_2 * s1_654;
    // Op 655: dim3x3 mul
    gl64_t s1_655_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_655_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_655_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA655 = (tmp3_0 + tmp3_1) * (s1_655_0 + s1_655_1);
    gl64_t kB655 = (tmp3_0 + tmp3_2) * (s1_655_0 + s1_655_2);
    gl64_t kC655 = (tmp3_1 + tmp3_2) * (s1_655_1 + s1_655_2);
    gl64_t kD655 = tmp3_0 * s1_655_0;
    gl64_t kE655 = tmp3_1 * s1_655_1;
    gl64_t kF655 = tmp3_2 * s1_655_2;
    gl64_t kG655 = kD655 - kE655;
    tmp3_0 = (kC655 + kG655) - kF655;
    tmp3_1 = ((((kA655 + kC655) - kE655) - kE655) - kD655);
    tmp3_2 = kB655 - kG655;
    // Op 656: dim3x1 add
    gl64_t s1_656 = *(gl64_t*)&expressions_params[9][2];
    tmp3_6 = tmp3_0 + s1_656; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 657: dim3x3 add
    gl64_t s1_657_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_657_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_657_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_657_0; tmp3_1 = tmp3_7 + s1_657_1; tmp3_2 = tmp3_8 + s1_657_2;
    // Op 658: dim3x3 mul
    gl64_t kA658 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB658 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC658 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD658 = tmp3_3 * tmp3_0;
    gl64_t kE658 = tmp3_4 * tmp3_1;
    gl64_t kF658 = tmp3_5 * tmp3_2;
    gl64_t kG658 = kD658 - kE658;
    tmp3_0 = (kC658 + kG658) - kF658;
    tmp3_1 = ((((kA658 + kC658) - kE658) - kE658) - kD658);
    tmp3_2 = kB658 - kG658;
    // Op 659: dim3x3 mul
    uint64_t s0_659_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 33, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 33, domainSize, nCols_2));
    gl64_t s0_659_0 = *(gl64_t*)&dParams->aux_trace[s0_659_pos];
    gl64_t s0_659_1 = *(gl64_t*)&dParams->aux_trace[s0_659_pos + TILE_HEIGHT];
    gl64_t s0_659_2 = *(gl64_t*)&dParams->aux_trace[s0_659_pos + 2*TILE_HEIGHT];
    gl64_t kA659 = (s0_659_0 + s0_659_1) * (tmp3_0 + tmp3_1);
    gl64_t kB659 = (s0_659_0 + s0_659_2) * (tmp3_0 + tmp3_2);
    gl64_t kC659 = (s0_659_1 + s0_659_2) * (tmp3_1 + tmp3_2);
    gl64_t kD659 = s0_659_0 * tmp3_0;
    gl64_t kE659 = s0_659_1 * tmp3_1;
    gl64_t kF659 = s0_659_2 * tmp3_2;
    gl64_t kG659 = kD659 - kE659;
    tmp3_0 = (kC659 + kG659) - kF659;
    tmp3_1 = ((((kA659 + kC659) - kE659) - kE659) - kD659);
    tmp3_2 = kB659 - kG659;
    // Op 660: dim3x3 add
    gl64_t s1_660_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_660_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_660_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_660_0; tmp3_7 = tmp3_7 + s1_660_1; tmp3_8 = tmp3_8 + s1_660_2;
    // Op 661: dim3x1 mul
    gl64_t s1_661 = *(gl64_t*)&expressions_params[9][3];
    tmp3_6 = tmp3_6 * s1_661; tmp3_7 = tmp3_7 * s1_661; tmp3_8 = tmp3_8 * s1_661;
    // Op 662: dim3x3 add
    gl64_t s1_662_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_662_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_662_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_662_0; tmp3_10 = tmp3_10 + s1_662_1; tmp3_11 = tmp3_11 + s1_662_2;
    // Op 663: dim3x1 mul
    gl64_t s1_663 = *(gl64_t*)&expressions_params[9][3];
    tmp3_9 = tmp3_9 * s1_663; tmp3_10 = tmp3_10 * s1_663; tmp3_11 = tmp3_11 * s1_663;
    // Op 664: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 665: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 666: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 667: dim3x3 mul
    gl64_t s1_667_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_667_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_667_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA667 = (tmp3_0 + tmp3_1) * (s1_667_0 + s1_667_1);
    gl64_t kB667 = (tmp3_0 + tmp3_2) * (s1_667_0 + s1_667_2);
    gl64_t kC667 = (tmp3_1 + tmp3_2) * (s1_667_1 + s1_667_2);
    gl64_t kD667 = tmp3_0 * s1_667_0;
    gl64_t kE667 = tmp3_1 * s1_667_1;
    gl64_t kF667 = tmp3_2 * s1_667_2;
    gl64_t kG667 = kD667 - kE667;
    tmp3_12 = (kC667 + kG667) - kF667;
    tmp3_13 = ((((kA667 + kC667) - kE667) - kE667) - kD667);
    tmp3_14 = kB667 - kG667;
    // Op 668: dim3x1 mul
    gl64_t s0_668_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_668_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_668_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_668 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    tmp3_0 = s0_668_0 * s1_668; tmp3_1 = s0_668_1 * s1_668; tmp3_2 = s0_668_2 * s1_668;
    // Op 669: dim3x3 mul
    gl64_t s1_669_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_669_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_669_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA669 = (tmp3_0 + tmp3_1) * (s1_669_0 + s1_669_1);
    gl64_t kB669 = (tmp3_0 + tmp3_2) * (s1_669_0 + s1_669_2);
    gl64_t kC669 = (tmp3_1 + tmp3_2) * (s1_669_1 + s1_669_2);
    gl64_t kD669 = tmp3_0 * s1_669_0;
    gl64_t kE669 = tmp3_1 * s1_669_1;
    gl64_t kF669 = tmp3_2 * s1_669_2;
    gl64_t kG669 = kD669 - kE669;
    tmp3_0 = (kC669 + kG669) - kF669;
    tmp3_1 = ((((kA669 + kC669) - kE669) - kE669) - kD669);
    tmp3_2 = kB669 - kG669;
    // Op 670: dim3x1 add
    gl64_t s1_670 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_670; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 671: dim3x3 add
    gl64_t s1_671_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_671_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_671_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_671_0; tmp3_1 = tmp3_1 + s1_671_1; tmp3_2 = tmp3_2 + s1_671_2;
    // Op 672: dim3x3 mul
    uint64_t s0_672_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_2));
    gl64_t s0_672_0 = *(gl64_t*)&dParams->aux_trace[s0_672_pos];
    gl64_t s0_672_1 = *(gl64_t*)&dParams->aux_trace[s0_672_pos + TILE_HEIGHT];
    gl64_t s0_672_2 = *(gl64_t*)&dParams->aux_trace[s0_672_pos + 2*TILE_HEIGHT];
    gl64_t kA672 = (s0_672_0 + s0_672_1) * (tmp3_0 + tmp3_1);
    gl64_t kB672 = (s0_672_0 + s0_672_2) * (tmp3_0 + tmp3_2);
    gl64_t kC672 = (s0_672_1 + s0_672_2) * (tmp3_1 + tmp3_2);
    gl64_t kD672 = s0_672_0 * tmp3_0;
    gl64_t kE672 = s0_672_1 * tmp3_1;
    gl64_t kF672 = s0_672_2 * tmp3_2;
    gl64_t kG672 = kD672 - kE672;
    tmp3_0 = (kC672 + kG672) - kF672;
    tmp3_1 = ((((kA672 + kC672) - kE672) - kE672) - kD672);
    tmp3_2 = kB672 - kG672;
    // Op 673: dim3x1 add
    gl64_t s1_673 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_673; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 674: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 675: dim3x3 mul
    gl64_t s1_675_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_675_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_675_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA675 = (tmp3_0 + tmp3_1) * (s1_675_0 + s1_675_1);
    gl64_t kB675 = (tmp3_0 + tmp3_2) * (s1_675_0 + s1_675_2);
    gl64_t kC675 = (tmp3_1 + tmp3_2) * (s1_675_1 + s1_675_2);
    gl64_t kD675 = tmp3_0 * s1_675_0;
    gl64_t kE675 = tmp3_1 * s1_675_1;
    gl64_t kF675 = tmp3_2 * s1_675_2;
    gl64_t kG675 = kD675 - kE675;
    tmp3_12 = (kC675 + kG675) - kF675;
    tmp3_13 = ((((kA675 + kC675) - kE675) - kE675) - kD675);
    tmp3_14 = kB675 - kG675;
    // Op 676: dim3x1 mul
    gl64_t s0_676_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_676_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_676_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_676 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_1))];
    tmp3_0 = s0_676_0 * s1_676; tmp3_1 = s0_676_1 * s1_676; tmp3_2 = s0_676_2 * s1_676;
    // Op 677: dim3x1 add
    gl64_t s1_677 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 40, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 40, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_677; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 678: dim3x3 mul
    gl64_t s1_678_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_678_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_678_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA678 = (tmp3_0 + tmp3_1) * (s1_678_0 + s1_678_1);
    gl64_t kB678 = (tmp3_0 + tmp3_2) * (s1_678_0 + s1_678_2);
    gl64_t kC678 = (tmp3_1 + tmp3_2) * (s1_678_1 + s1_678_2);
    gl64_t kD678 = tmp3_0 * s1_678_0;
    gl64_t kE678 = tmp3_1 * s1_678_1;
    gl64_t kF678 = tmp3_2 * s1_678_2;
    gl64_t kG678 = kD678 - kE678;
    tmp3_0 = (kC678 + kG678) - kF678;
    tmp3_1 = ((((kA678 + kC678) - kE678) - kE678) - kD678);
    tmp3_2 = kB678 - kG678;
    // Op 679: dim1x1 mul
    gl64_t s0_679 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    gl64_t s1_679 = *(gl64_t*)&expressions_params[9][19];
    tmp1_0 = s0_679 * s1_679;
    // Op 680: dim1x1 add
    gl64_t s0_680 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    tmp1_0 = s0_680 + tmp1_0;
    // Op 681: dim1x1 mul
    tmp1_4 = tmp1_4 * tmp1_0;
    // Op 682: dim1x1 mul
    gl64_t s0_682 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    gl64_t s1_682 = *(gl64_t*)&expressions_params[9][19];
    tmp1_0 = s0_682 * s1_682;
    // Op 683: dim1x1 add
    gl64_t s0_683 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    tmp1_0 = s0_683 + tmp1_0;
    // Op 684: dim1x1 mul
    gl64_t s0_684 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 34, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 34, domainSize, nCols_1))];
    tmp1_0 = s0_684 * tmp1_0;
    // Op 685: dim1x1 add
    tmp1_4 = tmp1_4 + tmp1_0;
    // Op 686: dim1x1 mul
    gl64_t s0_686 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_686 = *(gl64_t*)&expressions_params[9][19];
    tmp1_0 = s0_686 * s1_686;
    // Op 687: dim1x1 add
    gl64_t s0_687 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp1_0 = s0_687 + tmp1_0;
    // Op 688: dim1x1 mul
    gl64_t s0_688 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 33, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 33, domainSize, nCols_1))];
    tmp1_0 = s0_688 * tmp1_0;
    // Op 689: dim1x1 add
    tmp1_0 = tmp1_4 + tmp1_0;
    // Op 690: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 691: dim3x3 mul
    gl64_t s1_691_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_691_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_691_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA691 = (tmp3_0 + tmp3_1) * (s1_691_0 + s1_691_1);
    gl64_t kB691 = (tmp3_0 + tmp3_2) * (s1_691_0 + s1_691_2);
    gl64_t kC691 = (tmp3_1 + tmp3_2) * (s1_691_1 + s1_691_2);
    gl64_t kD691 = tmp3_0 * s1_691_0;
    gl64_t kE691 = tmp3_1 * s1_691_1;
    gl64_t kF691 = tmp3_2 * s1_691_2;
    gl64_t kG691 = kD691 - kE691;
    tmp3_0 = (kC691 + kG691) - kF691;
    tmp3_1 = ((((kA691 + kC691) - kE691) - kE691) - kD691);
    tmp3_2 = kB691 - kG691;
    // Op 692: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_3; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 693: dim3x3 mul
    gl64_t s1_693_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_693_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_693_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA693 = (tmp3_0 + tmp3_1) * (s1_693_0 + s1_693_1);
    gl64_t kB693 = (tmp3_0 + tmp3_2) * (s1_693_0 + s1_693_2);
    gl64_t kC693 = (tmp3_1 + tmp3_2) * (s1_693_1 + s1_693_2);
    gl64_t kD693 = tmp3_0 * s1_693_0;
    gl64_t kE693 = tmp3_1 * s1_693_1;
    gl64_t kF693 = tmp3_2 * s1_693_2;
    gl64_t kG693 = kD693 - kE693;
    tmp3_0 = (kC693 + kG693) - kF693;
    tmp3_1 = ((((kA693 + kC693) - kE693) - kE693) - kD693);
    tmp3_2 = kB693 - kG693;
    // Op 694: dim1x1 mul
    gl64_t s0_694 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    gl64_t s1_694 = *(gl64_t*)&expressions_params[9][19];
    tmp1_3 = s0_694 * s1_694;
    // Op 695: dim1x1 add
    gl64_t s0_695 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_3 = s0_695 + tmp1_3;
    // Op 696: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_3; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 697: dim3x3 mul
    gl64_t s1_697_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_697_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_697_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA697 = (tmp3_0 + tmp3_1) * (s1_697_0 + s1_697_1);
    gl64_t kB697 = (tmp3_0 + tmp3_2) * (s1_697_0 + s1_697_2);
    gl64_t kC697 = (tmp3_1 + tmp3_2) * (s1_697_1 + s1_697_2);
    gl64_t kD697 = tmp3_0 * s1_697_0;
    gl64_t kE697 = tmp3_1 * s1_697_1;
    gl64_t kF697 = tmp3_2 * s1_697_2;
    gl64_t kG697 = kD697 - kE697;
    tmp3_0 = (kC697 + kG697) - kF697;
    tmp3_1 = ((((kA697 + kC697) - kE697) - kE697) - kD697);
    tmp3_2 = kB697 - kG697;
    // Op 698: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_1; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 699: dim3x3 mul
    gl64_t s1_699_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_699_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_699_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA699 = (tmp3_0 + tmp3_1) * (s1_699_0 + s1_699_1);
    gl64_t kB699 = (tmp3_0 + tmp3_2) * (s1_699_0 + s1_699_2);
    gl64_t kC699 = (tmp3_1 + tmp3_2) * (s1_699_1 + s1_699_2);
    gl64_t kD699 = tmp3_0 * s1_699_0;
    gl64_t kE699 = tmp3_1 * s1_699_1;
    gl64_t kF699 = tmp3_2 * s1_699_2;
    gl64_t kG699 = kD699 - kE699;
    tmp3_0 = (kC699 + kG699) - kF699;
    tmp3_1 = ((((kA699 + kC699) - kE699) - kE699) - kD699);
    tmp3_2 = kB699 - kG699;
    // Op 700: dim1x1 mul
    gl64_t s0_700 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    gl64_t s1_700 = *(gl64_t*)&expressions_params[9][19];
    tmp1_1 = s0_700 * s1_700;
    // Op 701: dim1x1 add
    gl64_t s0_701 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    tmp1_1 = s0_701 + tmp1_1;
    // Op 702: dim1x1 mul
    gl64_t s0_702 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    tmp1_0 = s0_702 * tmp1_1;
    // Op 703: dim1x1 sub_swap
    gl64_t s0_703 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    gl64_t s1_703 = *(gl64_t*)&expressions_params[9][0];
    tmp1_3 = s1_703 - s0_703;
    // Op 704: dim1x1 mul
    gl64_t s0_704 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_704 = *(gl64_t*)&expressions_params[9][19];
    tmp1_1 = s0_704 * s1_704;
    // Op 705: dim1x1 add
    gl64_t s0_705 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp1_1 = s0_705 + tmp1_1;
    // Op 706: dim1x1 mul
    tmp1_1 = tmp1_3 * tmp1_1;
    // Op 707: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_1;
    // Op 708: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 709: dim3x3 mul
    gl64_t s1_709_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_709_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_709_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA709 = (tmp3_0 + tmp3_1) * (s1_709_0 + s1_709_1);
    gl64_t kB709 = (tmp3_0 + tmp3_2) * (s1_709_0 + s1_709_2);
    gl64_t kC709 = (tmp3_1 + tmp3_2) * (s1_709_1 + s1_709_2);
    gl64_t kD709 = tmp3_0 * s1_709_0;
    gl64_t kE709 = tmp3_1 * s1_709_1;
    gl64_t kF709 = tmp3_2 * s1_709_2;
    gl64_t kG709 = kD709 - kE709;
    tmp3_0 = (kC709 + kG709) - kF709;
    tmp3_1 = ((((kA709 + kC709) - kE709) - kE709) - kD709);
    tmp3_2 = kB709 - kG709;
    // Op 710: dim3x1 add
    gl64_t s1_710 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 39, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 39, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_710; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 711: dim3x3 mul
    gl64_t s1_711_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_711_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_711_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA711 = (tmp3_0 + tmp3_1) * (s1_711_0 + s1_711_1);
    gl64_t kB711 = (tmp3_0 + tmp3_2) * (s1_711_0 + s1_711_2);
    gl64_t kC711 = (tmp3_1 + tmp3_2) * (s1_711_1 + s1_711_2);
    gl64_t kD711 = tmp3_0 * s1_711_0;
    gl64_t kE711 = tmp3_1 * s1_711_1;
    gl64_t kF711 = tmp3_2 * s1_711_2;
    gl64_t kG711 = kD711 - kE711;
    tmp3_0 = (kC711 + kG711) - kF711;
    tmp3_1 = ((((kA711 + kC711) - kE711) - kE711) - kD711);
    tmp3_2 = kB711 - kG711;
    // Op 712: dim3x1 add
    gl64_t s1_712 = *(gl64_t*)&expressions_params[9][20];
    tmp3_0 = tmp3_0 + s1_712; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 713: dim3x3 add
    gl64_t s1_713_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_713_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_713_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_713_0; tmp3_1 = tmp3_1 + s1_713_1; tmp3_2 = tmp3_2 + s1_713_2;
    // Op 714: dim3x3 mul
    gl64_t s0_714_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 39+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 39+0, domainSize, nCols_2))];
    gl64_t s0_714_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 39+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 39+1, domainSize, nCols_2))];
    gl64_t s0_714_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 39+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 39+2, domainSize, nCols_2))];
    gl64_t kA714 = (s0_714_0 + s0_714_1) * (tmp3_0 + tmp3_1);
    gl64_t kB714 = (s0_714_0 + s0_714_2) * (tmp3_0 + tmp3_2);
    gl64_t kC714 = (s0_714_1 + s0_714_2) * (tmp3_1 + tmp3_2);
    gl64_t kD714 = s0_714_0 * tmp3_0;
    gl64_t kE714 = s0_714_1 * tmp3_1;
    gl64_t kF714 = s0_714_2 * tmp3_2;
    gl64_t kG714 = kD714 - kE714;
    tmp3_0 = (kC714 + kG714) - kF714;
    tmp3_1 = ((((kA714 + kC714) - kE714) - kE714) - kD714);
    tmp3_2 = kB714 - kG714;
    // Op 715: dim3x1 sub
    gl64_t s1_715 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 41, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 41, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 - s1_715; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 716: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 717: dim3x3 mul
    gl64_t s1_717_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_717_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_717_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA717 = (tmp3_0 + tmp3_1) * (s1_717_0 + s1_717_1);
    gl64_t kB717 = (tmp3_0 + tmp3_2) * (s1_717_0 + s1_717_2);
    gl64_t kC717 = (tmp3_1 + tmp3_2) * (s1_717_1 + s1_717_2);
    gl64_t kD717 = tmp3_0 * s1_717_0;
    gl64_t kE717 = tmp3_1 * s1_717_1;
    gl64_t kF717 = tmp3_2 * s1_717_2;
    gl64_t kG717 = kD717 - kE717;
    tmp3_12 = (kC717 + kG717) - kF717;
    tmp3_13 = ((((kA717 + kC717) - kE717) - kE717) - kD717);
    tmp3_14 = kB717 - kG717;
    // Op 718: dim3x3 mul
    gl64_t s0_718_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_718_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_718_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_718_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_718_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_718_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA718 = (s0_718_0 + s0_718_1) * (s1_718_0 + s1_718_1);
    gl64_t kB718 = (s0_718_0 + s0_718_2) * (s1_718_0 + s1_718_2);
    gl64_t kC718 = (s0_718_1 + s0_718_2) * (s1_718_1 + s1_718_2);
    gl64_t kD718 = s0_718_0 * s1_718_0;
    gl64_t kE718 = s0_718_1 * s1_718_1;
    gl64_t kF718 = s0_718_2 * s1_718_2;
    gl64_t kG718 = kD718 - kE718;
    tmp3_0 = (kC718 + kG718) - kF718;
    tmp3_1 = ((((kA718 + kC718) - kE718) - kE718) - kD718);
    tmp3_2 = kB718 - kG718;
    // Op 719: dim3x1 add
    gl64_t s1_719 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_719; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 720: dim3x3 mul
    gl64_t s1_720_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_720_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_720_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA720 = (tmp3_0 + tmp3_1) * (s1_720_0 + s1_720_1);
    gl64_t kB720 = (tmp3_0 + tmp3_2) * (s1_720_0 + s1_720_2);
    gl64_t kC720 = (tmp3_1 + tmp3_2) * (s1_720_1 + s1_720_2);
    gl64_t kD720 = tmp3_0 * s1_720_0;
    gl64_t kE720 = tmp3_1 * s1_720_1;
    gl64_t kF720 = tmp3_2 * s1_720_2;
    gl64_t kG720 = kD720 - kE720;
    tmp3_0 = (kC720 + kG720) - kF720;
    tmp3_1 = ((((kA720 + kC720) - kE720) - kE720) - kD720);
    tmp3_2 = kB720 - kG720;
    // Op 721: dim1x1 mul
    gl64_t s0_721 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    gl64_t s1_721 = *(gl64_t*)&expressions_params[9][19];
    tmp1_0 = s0_721 * s1_721;
    // Op 722: dim1x1 add
    gl64_t s0_722 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_1 = s0_722 + tmp1_0;
    // Op 723: dim1x1 mul
    gl64_t s0_723 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_723 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    tmp1_0 = s0_723 * s1_723;
    // Op 724: dim1x1 mul
    gl64_t s1_724 = *(gl64_t*)&expressions_params[9][21];
    tmp1_0 = tmp1_0 * s1_724;
    // Op 725: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 726: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 727: dim3x3 mul
    gl64_t s1_727_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_727_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_727_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA727 = (tmp3_0 + tmp3_1) * (s1_727_0 + s1_727_1);
    gl64_t kB727 = (tmp3_0 + tmp3_2) * (s1_727_0 + s1_727_2);
    gl64_t kC727 = (tmp3_1 + tmp3_2) * (s1_727_1 + s1_727_2);
    gl64_t kD727 = tmp3_0 * s1_727_0;
    gl64_t kE727 = tmp3_1 * s1_727_1;
    gl64_t kF727 = tmp3_2 * s1_727_2;
    gl64_t kG727 = kD727 - kE727;
    tmp3_0 = (kC727 + kG727) - kF727;
    tmp3_1 = ((((kA727 + kC727) - kE727) - kE727) - kD727);
    tmp3_2 = kB727 - kG727;
    // Op 728: dim1x1 mul
    gl64_t s0_728 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    gl64_t s1_728 = *(gl64_t*)&expressions_params[9][19];
    tmp1_0 = s0_728 * s1_728;
    // Op 729: dim1x1 add
    gl64_t s0_729 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_0 = s0_729 + tmp1_0;
    // Op 730: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 731: dim3x3 mul
    gl64_t s1_731_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_731_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_731_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA731 = (tmp3_0 + tmp3_1) * (s1_731_0 + s1_731_1);
    gl64_t kB731 = (tmp3_0 + tmp3_2) * (s1_731_0 + s1_731_2);
    gl64_t kC731 = (tmp3_1 + tmp3_2) * (s1_731_1 + s1_731_2);
    gl64_t kD731 = tmp3_0 * s1_731_0;
    gl64_t kE731 = tmp3_1 * s1_731_1;
    gl64_t kF731 = tmp3_2 * s1_731_2;
    gl64_t kG731 = kD731 - kE731;
    tmp3_0 = (kC731 + kG731) - kF731;
    tmp3_1 = ((((kA731 + kC731) - kE731) - kE731) - kD731);
    tmp3_2 = kB731 - kG731;
    // Op 732: dim1x1 mul
    gl64_t s0_732 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    gl64_t s1_732 = *(gl64_t*)&expressions_params[9][19];
    tmp1_0 = s0_732 * s1_732;
    // Op 733: dim1x1 add
    gl64_t s0_733 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    tmp1_1 = s0_733 + tmp1_0;
    // Op 734: dim1x1 mul
    gl64_t s0_734 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_734 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    tmp1_0 = s0_734 * s1_734;
    // Op 735: dim1x1 mul
    gl64_t s1_735 = *(gl64_t*)&expressions_params[9][21];
    tmp1_0 = tmp1_0 * s1_735;
    // Op 736: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 737: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 738: dim3x3 mul
    gl64_t s1_738_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_738_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_738_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA738 = (tmp3_0 + tmp3_1) * (s1_738_0 + s1_738_1);
    gl64_t kB738 = (tmp3_0 + tmp3_2) * (s1_738_0 + s1_738_2);
    gl64_t kC738 = (tmp3_1 + tmp3_2) * (s1_738_1 + s1_738_2);
    gl64_t kD738 = tmp3_0 * s1_738_0;
    gl64_t kE738 = tmp3_1 * s1_738_1;
    gl64_t kF738 = tmp3_2 * s1_738_2;
    gl64_t kG738 = kD738 - kE738;
    tmp3_0 = (kC738 + kG738) - kF738;
    tmp3_1 = ((((kA738 + kC738) - kE738) - kE738) - kD738);
    tmp3_2 = kB738 - kG738;
    // Op 739: dim1x1 mul
    gl64_t s0_739 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    gl64_t s1_739 = *(gl64_t*)&expressions_params[9][19];
    tmp1_0 = s0_739 * s1_739;
    // Op 740: dim1x1 add
    gl64_t s0_740 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    tmp1_0 = s0_740 + tmp1_0;
    // Op 741: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 742: dim3x3 mul
    gl64_t s1_742_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_742_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_742_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA742 = (tmp3_0 + tmp3_1) * (s1_742_0 + s1_742_1);
    gl64_t kB742 = (tmp3_0 + tmp3_2) * (s1_742_0 + s1_742_2);
    gl64_t kC742 = (tmp3_1 + tmp3_2) * (s1_742_1 + s1_742_2);
    gl64_t kD742 = tmp3_0 * s1_742_0;
    gl64_t kE742 = tmp3_1 * s1_742_1;
    gl64_t kF742 = tmp3_2 * s1_742_2;
    gl64_t kG742 = kD742 - kE742;
    tmp3_0 = (kC742 + kG742) - kF742;
    tmp3_1 = ((((kA742 + kC742) - kE742) - kE742) - kD742);
    tmp3_2 = kB742 - kG742;
    // Op 743: dim1x1 sub_swap
    gl64_t s0_743 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    gl64_t s1_743 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_743 - s0_743;
    // Op 744: dim1x1 sub_swap
    gl64_t s0_744 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    gl64_t s1_744 = *(gl64_t*)&expressions_params[9][0];
    tmp1_1 = s1_744 - s0_744;
    // Op 745: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 746: dim1x1 mul
    gl64_t s1_746 = *(gl64_t*)&expressions_params[9][22];
    tmp1_1 = tmp1_0 * s1_746;
    // Op 747: dim1x1 sub_swap
    gl64_t s0_747 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    gl64_t s1_747 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_747 - s0_747;
    // Op 748: dim1x1 mul
    gl64_t s0_748 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    tmp1_0 = s0_748 * tmp1_0;
    // Op 749: dim1x1 mul
    gl64_t s1_749 = *(gl64_t*)&expressions_params[9][23];
    tmp1_0 = tmp1_0 * s1_749;
    // Op 750: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 751: dim1x1 sub_swap
    gl64_t s0_751 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    gl64_t s1_751 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_751 - s0_751;
    // Op 752: dim1x1 mul
    gl64_t s0_752 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    tmp1_0 = s0_752 * tmp1_0;
    // Op 753: dim1x1 mul
    gl64_t s1_753 = *(gl64_t*)&expressions_params[9][24];
    tmp1_0 = tmp1_0 * s1_753;
    // Op 754: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 755: dim1x1 mul
    gl64_t s0_755 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    gl64_t s1_755 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    tmp1_0 = s0_755 * s1_755;
    // Op 756: dim1x1 mul
    gl64_t s1_756 = *(gl64_t*)&expressions_params[9][7];
    tmp1_0 = tmp1_0 * s1_756;
    // Op 757: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 758: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 759: dim3x3 mul
    gl64_t s1_759_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_759_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_759_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA759 = (tmp3_0 + tmp3_1) * (s1_759_0 + s1_759_1);
    gl64_t kB759 = (tmp3_0 + tmp3_2) * (s1_759_0 + s1_759_2);
    gl64_t kC759 = (tmp3_1 + tmp3_2) * (s1_759_1 + s1_759_2);
    gl64_t kD759 = tmp3_0 * s1_759_0;
    gl64_t kE759 = tmp3_1 * s1_759_1;
    gl64_t kF759 = tmp3_2 * s1_759_2;
    gl64_t kG759 = kD759 - kE759;
    tmp3_0 = (kC759 + kG759) - kF759;
    tmp3_1 = ((((kA759 + kC759) - kE759) - kE759) - kD759);
    tmp3_2 = kB759 - kG759;
    // Op 760: dim3x1 add
    gl64_t s1_760 = *(gl64_t*)&expressions_params[9][20];
    tmp3_0 = tmp3_0 + s1_760; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 761: dim3x3 add
    gl64_t s1_761_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_761_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_761_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_761_0; tmp3_1 = tmp3_1 + s1_761_1; tmp3_2 = tmp3_2 + s1_761_2;
    // Op 762: dim3x3 mul
    gl64_t s0_762_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 42+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 42+0, domainSize, nCols_2))];
    gl64_t s0_762_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 42+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 42+1, domainSize, nCols_2))];
    gl64_t s0_762_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 42+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 42+2, domainSize, nCols_2))];
    gl64_t kA762 = (s0_762_0 + s0_762_1) * (tmp3_0 + tmp3_1);
    gl64_t kB762 = (s0_762_0 + s0_762_2) * (tmp3_0 + tmp3_2);
    gl64_t kC762 = (s0_762_1 + s0_762_2) * (tmp3_1 + tmp3_2);
    gl64_t kD762 = s0_762_0 * tmp3_0;
    gl64_t kE762 = s0_762_1 * tmp3_1;
    gl64_t kF762 = s0_762_2 * tmp3_2;
    gl64_t kG762 = kD762 - kE762;
    tmp3_0 = (kC762 + kG762) - kF762;
    tmp3_1 = ((((kA762 + kC762) - kE762) - kE762) - kD762);
    tmp3_2 = kB762 - kG762;
    // Op 763: dim1x1 sub_swap
    gl64_t s0_763 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_1))];
    gl64_t s1_763 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_763 - s0_763;
    // Op 764: dim1x1 mul
    gl64_t s0_764 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    tmp1_0 = s0_764 * tmp1_0;
    // Op 765: dim1x1 sub_swap
    gl64_t s1_765 = *(gl64_t*)&expressions_params[9][25];
    tmp1_0 = s1_765 - tmp1_0;
    // Op 766: dim3x1 sub
    tmp3_0 = tmp3_0 - tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 767: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 768: dim3x3 mul
    gl64_t s1_768_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_768_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_768_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA768 = (tmp3_0 + tmp3_1) * (s1_768_0 + s1_768_1);
    gl64_t kB768 = (tmp3_0 + tmp3_2) * (s1_768_0 + s1_768_2);
    gl64_t kC768 = (tmp3_1 + tmp3_2) * (s1_768_1 + s1_768_2);
    gl64_t kD768 = tmp3_0 * s1_768_0;
    gl64_t kE768 = tmp3_1 * s1_768_1;
    gl64_t kF768 = tmp3_2 * s1_768_2;
    gl64_t kG768 = kD768 - kE768;
    tmp3_6 = (kC768 + kG768) - kF768;
    tmp3_7 = ((((kA768 + kC768) - kE768) - kE768) - kD768);
    tmp3_8 = kB768 - kG768;
    // Op 769: dim1x1 sub_swap
    gl64_t s0_769 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    gl64_t s1_769 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_769 - s0_769;
    // Op 770: dim3x1 mul
    uint64_t s0_770_pos = dExpsArgs->mapOffsetsExps[2] + (false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_2) : getBufferOffset(logicalRow_0, 0, domainSize, nCols_2));
    gl64_t s0_770_0 = *(gl64_t*)&dParams->aux_trace[s0_770_pos];
    gl64_t s0_770_1 = *(gl64_t*)&dParams->aux_trace[s0_770_pos + TILE_HEIGHT];
    gl64_t s0_770_2 = *(gl64_t*)&dParams->aux_trace[s0_770_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_770_0 * tmp1_0; tmp3_1 = s0_770_1 * tmp1_0; tmp3_2 = s0_770_2 * tmp1_0;
    // Op 771: dim3x3 sub
    uint64_t s0_771_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_2));
    gl64_t s0_771_0 = *(gl64_t*)&dParams->aux_trace[s0_771_pos];
    gl64_t s0_771_1 = *(gl64_t*)&dParams->aux_trace[s0_771_pos + TILE_HEIGHT];
    gl64_t s0_771_2 = *(gl64_t*)&dParams->aux_trace[s0_771_pos + 2*TILE_HEIGHT];
    tmp3_12 = s0_771_0 - tmp3_0; tmp3_13 = s0_771_1 - tmp3_1; tmp3_14 = s0_771_2 - tmp3_2;
    // Op 772: dim3x3 add
    gl64_t s0_772_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+0, domainSize, nCols_2))];
    gl64_t s0_772_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+1, domainSize, nCols_2))];
    gl64_t s0_772_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+2, domainSize, nCols_2))];
    gl64_t s1_772_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+0, domainSize, nCols_2))];
    gl64_t s1_772_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+1, domainSize, nCols_2))];
    gl64_t s1_772_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+2, domainSize, nCols_2))];
    tmp3_0 = s0_772_0 + s1_772_0; tmp3_1 = s0_772_1 + s1_772_1; tmp3_2 = s0_772_2 + s1_772_2;
    // Op 773: dim3x3 add
    uint64_t s0_773_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_2));
    gl64_t s0_773_0 = *(gl64_t*)&dParams->aux_trace[s0_773_pos];
    gl64_t s0_773_1 = *(gl64_t*)&dParams->aux_trace[s0_773_pos + TILE_HEIGHT];
    gl64_t s0_773_2 = *(gl64_t*)&dParams->aux_trace[s0_773_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_773_0 + tmp3_0; tmp3_1 = s0_773_1 + tmp3_1; tmp3_2 = s0_773_2 + tmp3_2;
    // Op 774: dim3x3 add
    uint64_t s0_774_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_2));
    gl64_t s0_774_0 = *(gl64_t*)&dParams->aux_trace[s0_774_pos];
    gl64_t s0_774_1 = *(gl64_t*)&dParams->aux_trace[s0_774_pos + TILE_HEIGHT];
    gl64_t s0_774_2 = *(gl64_t*)&dParams->aux_trace[s0_774_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_774_0 + tmp3_0; tmp3_1 = s0_774_1 + tmp3_1; tmp3_2 = s0_774_2 + tmp3_2;
    // Op 775: dim3x3 add
    gl64_t s0_775_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+0, domainSize, nCols_2))];
    gl64_t s0_775_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+1, domainSize, nCols_2))];
    gl64_t s0_775_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+2, domainSize, nCols_2))];
    tmp3_0 = s0_775_0 + tmp3_0; tmp3_1 = s0_775_1 + tmp3_1; tmp3_2 = s0_775_2 + tmp3_2;
    // Op 776: dim3x3 add
    gl64_t s0_776_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+0, domainSize, nCols_2))];
    gl64_t s0_776_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+1, domainSize, nCols_2))];
    gl64_t s0_776_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+2, domainSize, nCols_2))];
    tmp3_0 = s0_776_0 + tmp3_0; tmp3_1 = s0_776_1 + tmp3_1; tmp3_2 = s0_776_2 + tmp3_2;
    // Op 777: dim3x3 add
    uint64_t s0_777_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_2));
    gl64_t s0_777_0 = *(gl64_t*)&dParams->aux_trace[s0_777_pos];
    gl64_t s0_777_1 = *(gl64_t*)&dParams->aux_trace[s0_777_pos + TILE_HEIGHT];
    gl64_t s0_777_2 = *(gl64_t*)&dParams->aux_trace[s0_777_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_777_0 + tmp3_0; tmp3_1 = s0_777_1 + tmp3_1; tmp3_2 = s0_777_2 + tmp3_2;
    // Op 778: dim3x3 add
    uint64_t s0_778_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_2));
    gl64_t s0_778_0 = *(gl64_t*)&dParams->aux_trace[s0_778_pos];
    gl64_t s0_778_1 = *(gl64_t*)&dParams->aux_trace[s0_778_pos + TILE_HEIGHT];
    gl64_t s0_778_2 = *(gl64_t*)&dParams->aux_trace[s0_778_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_778_0 + tmp3_0; tmp3_1 = s0_778_1 + tmp3_1; tmp3_2 = s0_778_2 + tmp3_2;
    // Op 779: dim3x3 add
    gl64_t s0_779_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 27+0, domainSize, nCols_2))];
    gl64_t s0_779_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 27+1, domainSize, nCols_2))];
    gl64_t s0_779_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 27+2, domainSize, nCols_2))];
    tmp3_0 = s0_779_0 + tmp3_0; tmp3_1 = s0_779_1 + tmp3_1; tmp3_2 = s0_779_2 + tmp3_2;
    // Op 780: dim3x3 add
    gl64_t s0_780_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 30+0, domainSize, nCols_2))];
    gl64_t s0_780_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 30+1, domainSize, nCols_2))];
    gl64_t s0_780_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 30+2, domainSize, nCols_2))];
    tmp3_0 = s0_780_0 + tmp3_0; tmp3_1 = s0_780_1 + tmp3_1; tmp3_2 = s0_780_2 + tmp3_2;
    // Op 781: dim3x3 add
    uint64_t s0_781_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 33, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 33, domainSize, nCols_2));
    gl64_t s0_781_0 = *(gl64_t*)&dParams->aux_trace[s0_781_pos];
    gl64_t s0_781_1 = *(gl64_t*)&dParams->aux_trace[s0_781_pos + TILE_HEIGHT];
    gl64_t s0_781_2 = *(gl64_t*)&dParams->aux_trace[s0_781_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_781_0 + tmp3_0; tmp3_1 = s0_781_1 + tmp3_1; tmp3_2 = s0_781_2 + tmp3_2;
    // Op 782: dim3x3 add
    uint64_t s0_782_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_2));
    gl64_t s0_782_0 = *(gl64_t*)&dParams->aux_trace[s0_782_pos];
    gl64_t s0_782_1 = *(gl64_t*)&dParams->aux_trace[s0_782_pos + TILE_HEIGHT];
    gl64_t s0_782_2 = *(gl64_t*)&dParams->aux_trace[s0_782_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_782_0 + tmp3_0; tmp3_1 = s0_782_1 + tmp3_1; tmp3_2 = s0_782_2 + tmp3_2;
    // Op 783: dim3x3 add
    gl64_t s0_783_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 39+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 39+0, domainSize, nCols_2))];
    gl64_t s0_783_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 39+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 39+1, domainSize, nCols_2))];
    gl64_t s0_783_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 39+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 39+2, domainSize, nCols_2))];
    tmp3_0 = s0_783_0 + tmp3_0; tmp3_1 = s0_783_1 + tmp3_1; tmp3_2 = s0_783_2 + tmp3_2;
    // Op 784: dim3x3 add
    gl64_t s0_784_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 42+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 42+0, domainSize, nCols_2))];
    gl64_t s0_784_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 42+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 42+1, domainSize, nCols_2))];
    gl64_t s0_784_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 42+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 42+2, domainSize, nCols_2))];
    tmp3_0 = s0_784_0 + tmp3_0; tmp3_1 = s0_784_1 + tmp3_1; tmp3_2 = s0_784_2 + tmp3_2;
    // Op 785: dim3x3 sub
    tmp3_12 = tmp3_12 - tmp3_0; tmp3_13 = tmp3_13 - tmp3_1; tmp3_14 = tmp3_14 - tmp3_2;
    // Op 786: dim3x1 mul
    gl64_t s0_786_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_786_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_786_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_786 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    tmp3_0 = s0_786_0 * s1_786; tmp3_1 = s0_786_1 * s1_786; tmp3_2 = s0_786_2 * s1_786;
    // Op 787: dim3x1 add
    gl64_t s1_787 = *(gl64_t*)&expressions_params[9][1];
    tmp3_0 = tmp3_0 + s1_787; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 788: dim3x3 mul
    gl64_t s1_788_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_788_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_788_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA788 = (tmp3_0 + tmp3_1) * (s1_788_0 + s1_788_1);
    gl64_t kB788 = (tmp3_0 + tmp3_2) * (s1_788_0 + s1_788_2);
    gl64_t kC788 = (tmp3_1 + tmp3_2) * (s1_788_1 + s1_788_2);
    gl64_t kD788 = tmp3_0 * s1_788_0;
    gl64_t kE788 = tmp3_1 * s1_788_1;
    gl64_t kF788 = tmp3_2 * s1_788_2;
    gl64_t kG788 = kD788 - kE788;
    tmp3_0 = (kC788 + kG788) - kF788;
    tmp3_1 = ((((kA788 + kC788) - kE788) - kE788) - kD788);
    tmp3_2 = kB788 - kG788;
    // Op 789: dim3x1 add
    gl64_t s1_789 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_789; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 790: dim3x3 add
    gl64_t s1_790_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_790_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_790_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_790_0; tmp3_1 = tmp3_1 + s1_790_1; tmp3_2 = tmp3_2 + s1_790_2;
    // Op 791: dim3x3 mul
    gl64_t kA791 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB791 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC791 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD791 = tmp3_12 * tmp3_0;
    gl64_t kE791 = tmp3_13 * tmp3_1;
    gl64_t kF791 = tmp3_14 * tmp3_2;
    gl64_t kG791 = kD791 - kE791;
    tmp3_0 = (kC791 + kG791) - kF791;
    tmp3_1 = ((((kA791 + kC791) - kE791) - kE791) - kD791);
    tmp3_2 = kB791 - kG791;
    // Op 792: dim3x1 add
    gl64_t s1_792 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_792; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 793: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 794: dim3x3 mul
    gl64_t s1_794_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_794_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_794_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA794 = (tmp3_0 + tmp3_1) * (s1_794_0 + s1_794_1);
    gl64_t kB794 = (tmp3_0 + tmp3_2) * (s1_794_0 + s1_794_2);
    gl64_t kC794 = (tmp3_1 + tmp3_2) * (s1_794_1 + s1_794_2);
    gl64_t kD794 = tmp3_0 * s1_794_0;
    gl64_t kE794 = tmp3_1 * s1_794_1;
    gl64_t kF794 = tmp3_2 * s1_794_2;
    gl64_t kG794 = kD794 - kE794;
    tmp3_6 = (kC794 + kG794) - kF794;
    tmp3_7 = ((((kA794 + kC794) - kE794) - kE794) - kD794);
    tmp3_8 = kB794 - kG794;
    // Op 795: dim3x3 sub_swap
    uint64_t s0_795_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_2));
    gl64_t s0_795_0 = *(gl64_t*)&dParams->aux_trace[s0_795_pos];
    gl64_t s0_795_1 = *(gl64_t*)&dParams->aux_trace[s0_795_pos + TILE_HEIGHT];
    gl64_t s0_795_2 = *(gl64_t*)&dParams->aux_trace[s0_795_pos + 2*TILE_HEIGHT];
    gl64_t s1_795_0 = *(gl64_t*)&expressions_params[12][0];
    gl64_t s1_795_1 = *(gl64_t*)&expressions_params[12][0+1];
    gl64_t s1_795_2 = *(gl64_t*)&expressions_params[12][0+2];
    tmp3_0 = s1_795_0 - s0_795_0; tmp3_1 = s1_795_1 - s0_795_1; tmp3_2 = s1_795_2 - s0_795_2;
    // Op 796: dim3x1 mul
    gl64_t s1_796 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp3_0 = tmp3_0 * s1_796; tmp3_1 = tmp3_1 * s1_796; tmp3_2 = tmp3_2 * s1_796;
    // Op 797: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 798: dim3x1 mul
    gl64_t s1_798 = *(gl64_t*)&dParams->aux_trace[dArgs->zi_offset + (1 - 1) * domainSize + row + threadIdx.x];
    tmp3_0 = tmp3_0 * s1_798; tmp3_1 = tmp3_1 * s1_798; tmp3_2 = tmp3_2 * s1_798;

    // Write final result to shared memory and store to output
    *(gl64_t*)&expressions_params[bufferCommitsSize + 1][0 * blockDim.x + threadIdx.x] = tmp3_0;
    *(gl64_t*)&expressions_params[bufferCommitsSize + 1][1 * blockDim.x + threadIdx.x] = tmp3_1;
    *(gl64_t*)&expressions_params[bufferCommitsSize + 1][2 * blockDim.x + threadIdx.x] = tmp3_2;
    storePolynomial__((ExpsArguments*)dExpsArgs, (Goldilocks::Element*)&expressions_params[bufferCommitsSize + 1][0 * blockDim.x], row);
}
