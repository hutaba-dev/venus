// Auto-generated expression evaluator - matches load__() semantics exactly
// Q expressions: domainExtended=true always, type 1 goes through aux_trace

// Fingerprint: 831d811b  nOps=1026 nTemp1=7 nTemp3=5
#define GENERATED_EVAL_NOPS_831d811b 1026
#define GENERATED_EVAL_NTEMP1_831d811b 7
#define GENERATED_EVAL_NTEMP3_831d811b 5

template<bool IsCyclic>
__device__ __forceinline__ void eval_expr_831d811b(
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

    // Register-resident temporaries: 7 tmp1 + 15 tmp3 slots
    gl64_t tmp1_0 = gl64_t(uint64_t(0));
    gl64_t tmp1_1 = gl64_t(uint64_t(0));
    gl64_t tmp1_2 = gl64_t(uint64_t(0));
    gl64_t tmp1_3 = gl64_t(uint64_t(0));
    gl64_t tmp1_4 = gl64_t(uint64_t(0));
    gl64_t tmp1_5 = gl64_t(uint64_t(0));
    gl64_t tmp1_6 = gl64_t(uint64_t(0));
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

    // Op 0: dim1x1 sub_swap
    gl64_t s0_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_0 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_0 - s0_0;
    // Op 1: dim1x1 mul
    gl64_t s0_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    tmp1_0 = s0_1 * tmp1_0;
    // Op 2: dim3x1 mul
    gl64_t s0_2_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s0_2_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s0_2_2 = *(gl64_t*)&expressions_params[13][6+2];
    tmp3_0 = s0_2_0 * tmp1_0; tmp3_1 = s0_2_1 * tmp1_0; tmp3_2 = s0_2_2 * tmp1_0;
    // Op 3: dim1x1 sub_swap
    gl64_t s0_3 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_3 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_3 - s0_3;
    // Op 4: dim1x1 mul
    gl64_t s0_4 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
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
    // Op 7: dim1x1 sub_swap
    gl64_t s0_7 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_7 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_7 - s0_7;
    // Op 8: dim1x1 mul
    gl64_t s0_8 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    tmp1_0 = s0_8 * tmp1_0;
    // Op 9: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 10: dim3x3 mul
    gl64_t s1_10_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_10_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_10_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA10 = (tmp3_0 + tmp3_1) * (s1_10_0 + s1_10_1);
    gl64_t kB10 = (tmp3_0 + tmp3_2) * (s1_10_0 + s1_10_2);
    gl64_t kC10 = (tmp3_1 + tmp3_2) * (s1_10_1 + s1_10_2);
    gl64_t kD10 = tmp3_0 * s1_10_0;
    gl64_t kE10 = tmp3_1 * s1_10_1;
    gl64_t kF10 = tmp3_2 * s1_10_2;
    gl64_t kG10 = kD10 - kE10;
    tmp3_0 = (kC10 + kG10) - kF10;
    tmp3_1 = ((((kA10 + kC10) - kE10) - kE10) - kD10);
    tmp3_2 = kB10 - kG10;
    // Op 11: dim1x1 sub_swap
    gl64_t s0_11 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_11 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_11 - s0_11;
    // Op 12: dim1x1 mul
    gl64_t s0_12 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp1_0 = s0_12 * tmp1_0;
    // Op 13: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 14: dim3x3 mul
    gl64_t s1_14_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_14_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_14_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA14 = (tmp3_0 + tmp3_1) * (s1_14_0 + s1_14_1);
    gl64_t kB14 = (tmp3_0 + tmp3_2) * (s1_14_0 + s1_14_2);
    gl64_t kC14 = (tmp3_1 + tmp3_2) * (s1_14_1 + s1_14_2);
    gl64_t kD14 = tmp3_0 * s1_14_0;
    gl64_t kE14 = tmp3_1 * s1_14_1;
    gl64_t kF14 = tmp3_2 * s1_14_2;
    gl64_t kG14 = kD14 - kE14;
    tmp3_0 = (kC14 + kG14) - kF14;
    tmp3_1 = ((((kA14 + kC14) - kE14) - kE14) - kD14);
    tmp3_2 = kB14 - kG14;
    // Op 15: dim1x1 sub_swap
    gl64_t s0_15 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_15 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_15 - s0_15;
    // Op 16: dim1x1 mul
    gl64_t s0_16 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp1_0 = s0_16 * tmp1_0;
    // Op 17: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 18: dim3x3 mul
    gl64_t s1_18_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_18_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_18_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA18 = (tmp3_0 + tmp3_1) * (s1_18_0 + s1_18_1);
    gl64_t kB18 = (tmp3_0 + tmp3_2) * (s1_18_0 + s1_18_2);
    gl64_t kC18 = (tmp3_1 + tmp3_2) * (s1_18_1 + s1_18_2);
    gl64_t kD18 = tmp3_0 * s1_18_0;
    gl64_t kE18 = tmp3_1 * s1_18_1;
    gl64_t kF18 = tmp3_2 * s1_18_2;
    gl64_t kG18 = kD18 - kE18;
    tmp3_0 = (kC18 + kG18) - kF18;
    tmp3_1 = ((((kA18 + kC18) - kE18) - kE18) - kD18);
    tmp3_2 = kB18 - kG18;
    // Op 19: dim1x1 sub_swap
    gl64_t s0_19 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_19 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_19 - s0_19;
    // Op 20: dim1x1 mul
    gl64_t s0_20 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    tmp1_0 = s0_20 * tmp1_0;
    // Op 21: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 22: dim3x3 mul
    gl64_t s1_22_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_22_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_22_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA22 = (tmp3_0 + tmp3_1) * (s1_22_0 + s1_22_1);
    gl64_t kB22 = (tmp3_0 + tmp3_2) * (s1_22_0 + s1_22_2);
    gl64_t kC22 = (tmp3_1 + tmp3_2) * (s1_22_1 + s1_22_2);
    gl64_t kD22 = tmp3_0 * s1_22_0;
    gl64_t kE22 = tmp3_1 * s1_22_1;
    gl64_t kF22 = tmp3_2 * s1_22_2;
    gl64_t kG22 = kD22 - kE22;
    tmp3_0 = (kC22 + kG22) - kF22;
    tmp3_1 = ((((kA22 + kC22) - kE22) - kE22) - kD22);
    tmp3_2 = kB22 - kG22;
    // Op 23: dim1x1 sub_swap
    gl64_t s0_23 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    gl64_t s1_23 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_23 - s0_23;
    // Op 24: dim1x1 mul
    gl64_t s0_24 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    tmp1_0 = s0_24 * tmp1_0;
    // Op 25: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 26: dim3x3 mul
    gl64_t s1_26_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_26_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_26_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA26 = (tmp3_0 + tmp3_1) * (s1_26_0 + s1_26_1);
    gl64_t kB26 = (tmp3_0 + tmp3_2) * (s1_26_0 + s1_26_2);
    gl64_t kC26 = (tmp3_1 + tmp3_2) * (s1_26_1 + s1_26_2);
    gl64_t kD26 = tmp3_0 * s1_26_0;
    gl64_t kE26 = tmp3_1 * s1_26_1;
    gl64_t kF26 = tmp3_2 * s1_26_2;
    gl64_t kG26 = kD26 - kE26;
    tmp3_0 = (kC26 + kG26) - kF26;
    tmp3_1 = ((((kA26 + kC26) - kE26) - kE26) - kD26);
    tmp3_2 = kB26 - kG26;
    // Op 27: dim1x1 sub_swap
    gl64_t s0_27 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    gl64_t s1_27 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_27 - s0_27;
    // Op 28: dim1x1 mul
    gl64_t s0_28 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_28 * tmp1_0;
    // Op 29: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 30: dim3x3 mul
    gl64_t s1_30_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_30_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_30_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA30 = (tmp3_0 + tmp3_1) * (s1_30_0 + s1_30_1);
    gl64_t kB30 = (tmp3_0 + tmp3_2) * (s1_30_0 + s1_30_2);
    gl64_t kC30 = (tmp3_1 + tmp3_2) * (s1_30_1 + s1_30_2);
    gl64_t kD30 = tmp3_0 * s1_30_0;
    gl64_t kE30 = tmp3_1 * s1_30_1;
    gl64_t kF30 = tmp3_2 * s1_30_2;
    gl64_t kG30 = kD30 - kE30;
    tmp3_0 = (kC30 + kG30) - kF30;
    tmp3_1 = ((((kA30 + kC30) - kE30) - kE30) - kD30);
    tmp3_2 = kB30 - kG30;
    // Op 31: dim1x1 add
    gl64_t s0_31 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_31 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    tmp1_0 = s0_31 + s1_31;
    // Op 32: dim1x1 add
    gl64_t s0_32 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    tmp1_0 = s0_32 + tmp1_0;
    // Op 33: dim1x1 add
    gl64_t s0_33 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_5 = s0_33 + tmp1_0;
    // Op 34: dim1x1 sub_swap
    gl64_t s1_34 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_34 - tmp1_5;
    // Op 35: dim1x1 mul
    tmp1_0 = tmp1_5 * tmp1_0;
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
    // Op 38: dim1x1 sub_swap
    gl64_t s0_38 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    gl64_t s1_38 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_38 - s0_38;
    // Op 39: dim1x1 mul
    gl64_t s0_39 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_0 = s0_39 * tmp1_0;
    // Op 40: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 41: dim3x3 mul
    gl64_t s1_41_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_41_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_41_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA41 = (tmp3_0 + tmp3_1) * (s1_41_0 + s1_41_1);
    gl64_t kB41 = (tmp3_0 + tmp3_2) * (s1_41_0 + s1_41_2);
    gl64_t kC41 = (tmp3_1 + tmp3_2) * (s1_41_1 + s1_41_2);
    gl64_t kD41 = tmp3_0 * s1_41_0;
    gl64_t kE41 = tmp3_1 * s1_41_1;
    gl64_t kF41 = tmp3_2 * s1_41_2;
    gl64_t kG41 = kD41 - kE41;
    tmp3_0 = (kC41 + kG41) - kF41;
    tmp3_1 = ((((kA41 + kC41) - kE41) - kE41) - kD41);
    tmp3_2 = kB41 - kG41;
    // Op 42: dim1x1 sub_swap
    gl64_t s0_42 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    gl64_t s1_42 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_42 - s0_42;
    // Op 43: dim1x1 mul
    gl64_t s0_43 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_43 * tmp1_0;
    // Op 44: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 45: dim3x3 mul
    gl64_t s1_45_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_45_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_45_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA45 = (tmp3_0 + tmp3_1) * (s1_45_0 + s1_45_1);
    gl64_t kB45 = (tmp3_0 + tmp3_2) * (s1_45_0 + s1_45_2);
    gl64_t kC45 = (tmp3_1 + tmp3_2) * (s1_45_1 + s1_45_2);
    gl64_t kD45 = tmp3_0 * s1_45_0;
    gl64_t kE45 = tmp3_1 * s1_45_1;
    gl64_t kF45 = tmp3_2 * s1_45_2;
    gl64_t kG45 = kD45 - kE45;
    tmp3_0 = (kC45 + kG45) - kF45;
    tmp3_1 = ((((kA45 + kC45) - kE45) - kE45) - kD45);
    tmp3_2 = kB45 - kG45;
    // Op 46: dim1x1 sub_swap
    gl64_t s0_46 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    gl64_t s1_46 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_46 - s0_46;
    // Op 47: dim1x1 mul
    gl64_t s0_47 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_0 = s0_47 * tmp1_0;
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
    // Op 50: dim1x1 sub_swap
    gl64_t s0_50 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    gl64_t s1_50 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_50 - s0_50;
    // Op 51: dim1x1 mul
    gl64_t s0_51 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp1_0 = s0_51 * tmp1_0;
    // Op 52: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 53: dim3x3 mul
    gl64_t s1_53_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_53_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_53_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA53 = (tmp3_0 + tmp3_1) * (s1_53_0 + s1_53_1);
    gl64_t kB53 = (tmp3_0 + tmp3_2) * (s1_53_0 + s1_53_2);
    gl64_t kC53 = (tmp3_1 + tmp3_2) * (s1_53_1 + s1_53_2);
    gl64_t kD53 = tmp3_0 * s1_53_0;
    gl64_t kE53 = tmp3_1 * s1_53_1;
    gl64_t kF53 = tmp3_2 * s1_53_2;
    gl64_t kG53 = kD53 - kE53;
    tmp3_0 = (kC53 + kG53) - kF53;
    tmp3_1 = ((((kA53 + kC53) - kE53) - kE53) - kD53);
    tmp3_2 = kB53 - kG53;
    // Op 54: dim1x1 sub_swap
    gl64_t s0_54 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    gl64_t s1_54 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_54 - s0_54;
    // Op 55: dim1x1 mul
    gl64_t s0_55 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    tmp1_0 = s0_55 * tmp1_0;
    // Op 56: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 57: dim3x3 mul
    gl64_t s1_57_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_57_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_57_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA57 = (tmp3_0 + tmp3_1) * (s1_57_0 + s1_57_1);
    gl64_t kB57 = (tmp3_0 + tmp3_2) * (s1_57_0 + s1_57_2);
    gl64_t kC57 = (tmp3_1 + tmp3_2) * (s1_57_1 + s1_57_2);
    gl64_t kD57 = tmp3_0 * s1_57_0;
    gl64_t kE57 = tmp3_1 * s1_57_1;
    gl64_t kF57 = tmp3_2 * s1_57_2;
    gl64_t kG57 = kD57 - kE57;
    tmp3_0 = (kC57 + kG57) - kF57;
    tmp3_1 = ((((kA57 + kC57) - kE57) - kE57) - kD57);
    tmp3_2 = kB57 - kG57;
    // Op 58: dim1x1 sub_swap
    gl64_t s0_58 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    gl64_t s1_58 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_58 - s0_58;
    // Op 59: dim1x1 mul
    gl64_t s0_59 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    tmp1_0 = s0_59 * tmp1_0;
    // Op 60: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 61: dim3x3 mul
    gl64_t s1_61_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_61_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_61_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA61 = (tmp3_0 + tmp3_1) * (s1_61_0 + s1_61_1);
    gl64_t kB61 = (tmp3_0 + tmp3_2) * (s1_61_0 + s1_61_2);
    gl64_t kC61 = (tmp3_1 + tmp3_2) * (s1_61_1 + s1_61_2);
    gl64_t kD61 = tmp3_0 * s1_61_0;
    gl64_t kE61 = tmp3_1 * s1_61_1;
    gl64_t kF61 = tmp3_2 * s1_61_2;
    gl64_t kG61 = kD61 - kE61;
    tmp3_0 = (kC61 + kG61) - kF61;
    tmp3_1 = ((((kA61 + kC61) - kE61) - kE61) - kD61);
    tmp3_2 = kB61 - kG61;
    // Op 62: dim1x1 sub_swap
    gl64_t s0_62 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    gl64_t s1_62 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_62 - s0_62;
    // Op 63: dim1x1 mul
    gl64_t s0_63 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    tmp1_0 = s0_63 * tmp1_0;
    // Op 64: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 65: dim3x3 mul
    gl64_t s1_65_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_65_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_65_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA65 = (tmp3_0 + tmp3_1) * (s1_65_0 + s1_65_1);
    gl64_t kB65 = (tmp3_0 + tmp3_2) * (s1_65_0 + s1_65_2);
    gl64_t kC65 = (tmp3_1 + tmp3_2) * (s1_65_1 + s1_65_2);
    gl64_t kD65 = tmp3_0 * s1_65_0;
    gl64_t kE65 = tmp3_1 * s1_65_1;
    gl64_t kF65 = tmp3_2 * s1_65_2;
    gl64_t kG65 = kD65 - kE65;
    tmp3_0 = (kC65 + kG65) - kF65;
    tmp3_1 = ((((kA65 + kC65) - kE65) - kE65) - kD65);
    tmp3_2 = kB65 - kG65;
    // Op 66: dim1x1 add
    gl64_t s0_66 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    gl64_t s1_66 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_66 + s1_66;
    // Op 67: dim1x1 add
    gl64_t s0_67 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_0 = s0_67 + tmp1_0;
    // Op 68: dim1x1 add
    gl64_t s0_68 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp1_0 = s0_68 + tmp1_0;
    // Op 69: dim1x1 add
    gl64_t s0_69 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    tmp1_0 = s0_69 + tmp1_0;
    // Op 70: dim1x1 add
    gl64_t s0_70 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    tmp1_0 = s0_70 + tmp1_0;
    // Op 71: dim1x1 add
    gl64_t s0_71 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    tmp1_3 = s0_71 + tmp1_0;
    // Op 72: dim1x1 sub_swap
    gl64_t s1_72 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_72 - tmp1_3;
    // Op 73: dim1x1 mul
    tmp1_0 = tmp1_3 * tmp1_0;
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
    // Op 76: dim1x1 sub_swap
    gl64_t s0_76 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    gl64_t s1_76 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_76 - s0_76;
    // Op 77: dim1x1 mul
    gl64_t s0_77 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
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
    // Op 80: dim1x1 sub_swap
    gl64_t s0_80 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    gl64_t s1_80 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_80 - s0_80;
    // Op 81: dim1x1 mul
    gl64_t s0_81 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
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
    gl64_t s1_84 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_84 - tmp1_5;
    // Op 85: dim1x1 mul
    gl64_t s0_85 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    tmp1_0 = s0_85 * tmp1_0;
    // Op 86: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 87: dim3x3 mul
    gl64_t s1_87_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_87_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_87_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA87 = (tmp3_0 + tmp3_1) * (s1_87_0 + s1_87_1);
    gl64_t kB87 = (tmp3_0 + tmp3_2) * (s1_87_0 + s1_87_2);
    gl64_t kC87 = (tmp3_1 + tmp3_2) * (s1_87_1 + s1_87_2);
    gl64_t kD87 = tmp3_0 * s1_87_0;
    gl64_t kE87 = tmp3_1 * s1_87_1;
    gl64_t kF87 = tmp3_2 * s1_87_2;
    gl64_t kG87 = kD87 - kE87;
    tmp3_0 = (kC87 + kG87) - kF87;
    tmp3_1 = ((((kA87 + kC87) - kE87) - kE87) - kD87);
    tmp3_2 = kB87 - kG87;
    // Op 88: dim1x1 sub_swap
    gl64_t s0_88 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    gl64_t s1_88 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_88 - s0_88;
    // Op 89: dim1x1 mul
    gl64_t s0_89 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_0 = s0_89 * tmp1_0;
    // Op 90: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 91: dim3x3 mul
    gl64_t s1_91_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_91_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_91_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA91 = (tmp3_0 + tmp3_1) * (s1_91_0 + s1_91_1);
    gl64_t kB91 = (tmp3_0 + tmp3_2) * (s1_91_0 + s1_91_2);
    gl64_t kC91 = (tmp3_1 + tmp3_2) * (s1_91_1 + s1_91_2);
    gl64_t kD91 = tmp3_0 * s1_91_0;
    gl64_t kE91 = tmp3_1 * s1_91_1;
    gl64_t kF91 = tmp3_2 * s1_91_2;
    gl64_t kG91 = kD91 - kE91;
    tmp3_0 = (kC91 + kG91) - kF91;
    tmp3_1 = ((((kA91 + kC91) - kE91) - kE91) - kD91);
    tmp3_2 = kB91 - kG91;
    // Op 92: dim1x1 sub
    gl64_t s0_92 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    gl64_t s1_92 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_0 = s0_92 - s1_92;
    // Op 93: dim1x1 mul
    gl64_t s0_93 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
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
    // Op 96: dim1x1 sub
    gl64_t s0_96 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    gl64_t s1_96 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_0 = s0_96 - s1_96;
    // Op 97: dim1x1 mul
    gl64_t s0_97 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_97 * tmp1_0;
    // Op 98: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 99: dim3x3 mul
    gl64_t s1_99_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_99_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_99_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA99 = (tmp3_0 + tmp3_1) * (s1_99_0 + s1_99_1);
    gl64_t kB99 = (tmp3_0 + tmp3_2) * (s1_99_0 + s1_99_2);
    gl64_t kC99 = (tmp3_1 + tmp3_2) * (s1_99_1 + s1_99_2);
    gl64_t kD99 = tmp3_0 * s1_99_0;
    gl64_t kE99 = tmp3_1 * s1_99_1;
    gl64_t kF99 = tmp3_2 * s1_99_2;
    gl64_t kG99 = kD99 - kE99;
    tmp3_0 = (kC99 + kG99) - kF99;
    tmp3_1 = ((((kA99 + kC99) - kE99) - kE99) - kD99);
    tmp3_2 = kB99 - kG99;
    // Op 100: dim1x1 sub
    gl64_t s0_100 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    gl64_t s1_100 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_0 = s0_100 - s1_100;
    // Op 101: dim1x1 mul
    gl64_t s0_101 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
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
    // Op 104: dim1x1 sub
    gl64_t s0_104 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    gl64_t s1_104 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_0 = s0_104 - s1_104;
    // Op 105: dim1x1 mul
    gl64_t s0_105 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_105 * tmp1_0;
    // Op 106: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 107: dim3x3 mul
    gl64_t s1_107_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_107_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_107_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA107 = (tmp3_0 + tmp3_1) * (s1_107_0 + s1_107_1);
    gl64_t kB107 = (tmp3_0 + tmp3_2) * (s1_107_0 + s1_107_2);
    gl64_t kC107 = (tmp3_1 + tmp3_2) * (s1_107_1 + s1_107_2);
    gl64_t kD107 = tmp3_0 * s1_107_0;
    gl64_t kE107 = tmp3_1 * s1_107_1;
    gl64_t kF107 = tmp3_2 * s1_107_2;
    gl64_t kG107 = kD107 - kE107;
    tmp3_0 = (kC107 + kG107) - kF107;
    tmp3_1 = ((((kA107 + kC107) - kE107) - kE107) - kD107);
    tmp3_2 = kB107 - kG107;
    // Op 108: dim1x1 sub
    gl64_t s0_108 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 27, domainSize, nCols_1))];
    gl64_t s1_108 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_0 = s0_108 - s1_108;
    // Op 109: dim1x1 mul
    gl64_t s0_109 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_109 * tmp1_0;
    // Op 110: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 111: dim3x3 mul
    gl64_t s1_111_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_111_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_111_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA111 = (tmp3_0 + tmp3_1) * (s1_111_0 + s1_111_1);
    gl64_t kB111 = (tmp3_0 + tmp3_2) * (s1_111_0 + s1_111_2);
    gl64_t kC111 = (tmp3_1 + tmp3_2) * (s1_111_1 + s1_111_2);
    gl64_t kD111 = tmp3_0 * s1_111_0;
    gl64_t kE111 = tmp3_1 * s1_111_1;
    gl64_t kF111 = tmp3_2 * s1_111_2;
    gl64_t kG111 = kD111 - kE111;
    tmp3_0 = (kC111 + kG111) - kF111;
    tmp3_1 = ((((kA111 + kC111) - kE111) - kE111) - kD111);
    tmp3_2 = kB111 - kG111;
    // Op 112: dim1x1 sub
    gl64_t s0_112 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_112 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_0 = s0_112 - s1_112;
    // Op 113: dim1x1 mul
    gl64_t s0_113 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_113 * tmp1_0;
    // Op 114: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 115: dim3x3 mul
    gl64_t s1_115_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_115_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_115_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA115 = (tmp3_0 + tmp3_1) * (s1_115_0 + s1_115_1);
    gl64_t kB115 = (tmp3_0 + tmp3_2) * (s1_115_0 + s1_115_2);
    gl64_t kC115 = (tmp3_1 + tmp3_2) * (s1_115_1 + s1_115_2);
    gl64_t kD115 = tmp3_0 * s1_115_0;
    gl64_t kE115 = tmp3_1 * s1_115_1;
    gl64_t kF115 = tmp3_2 * s1_115_2;
    gl64_t kG115 = kD115 - kE115;
    tmp3_0 = (kC115 + kG115) - kF115;
    tmp3_1 = ((((kA115 + kC115) - kE115) - kE115) - kD115);
    tmp3_2 = kB115 - kG115;
    // Op 116: dim1x1 sub
    gl64_t s0_116 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    gl64_t s1_116 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_0 = s0_116 - s1_116;
    // Op 117: dim1x1 mul
    gl64_t s0_117 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_117 * tmp1_0;
    // Op 118: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 119: dim3x3 mul
    gl64_t s1_119_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_119_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_119_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA119 = (tmp3_0 + tmp3_1) * (s1_119_0 + s1_119_1);
    gl64_t kB119 = (tmp3_0 + tmp3_2) * (s1_119_0 + s1_119_2);
    gl64_t kC119 = (tmp3_1 + tmp3_2) * (s1_119_1 + s1_119_2);
    gl64_t kD119 = tmp3_0 * s1_119_0;
    gl64_t kE119 = tmp3_1 * s1_119_1;
    gl64_t kF119 = tmp3_2 * s1_119_2;
    gl64_t kG119 = kD119 - kE119;
    tmp3_0 = (kC119 + kG119) - kF119;
    tmp3_1 = ((((kA119 + kC119) - kE119) - kE119) - kD119);
    tmp3_2 = kB119 - kG119;
    // Op 120: dim1x1 sub
    gl64_t s0_120 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    gl64_t s1_120 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_0 = s0_120 - s1_120;
    // Op 121: dim1x1 mul
    gl64_t s0_121 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_121 * tmp1_0;
    // Op 122: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 123: dim3x3 mul
    gl64_t s1_123_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_123_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_123_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA123 = (tmp3_0 + tmp3_1) * (s1_123_0 + s1_123_1);
    gl64_t kB123 = (tmp3_0 + tmp3_2) * (s1_123_0 + s1_123_2);
    gl64_t kC123 = (tmp3_1 + tmp3_2) * (s1_123_1 + s1_123_2);
    gl64_t kD123 = tmp3_0 * s1_123_0;
    gl64_t kE123 = tmp3_1 * s1_123_1;
    gl64_t kF123 = tmp3_2 * s1_123_2;
    gl64_t kG123 = kD123 - kE123;
    tmp3_0 = (kC123 + kG123) - kF123;
    tmp3_1 = ((((kA123 + kC123) - kE123) - kE123) - kD123);
    tmp3_2 = kB123 - kG123;
    // Op 124: dim1x1 sub
    gl64_t s0_124 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 31, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 31, domainSize, nCols_1))];
    gl64_t s1_124 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_0 = s0_124 - s1_124;
    // Op 125: dim1x1 mul
    gl64_t s0_125 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_125 * tmp1_0;
    // Op 126: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 127: dim3x3 mul
    gl64_t s1_127_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_127_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_127_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA127 = (tmp3_0 + tmp3_1) * (s1_127_0 + s1_127_1);
    gl64_t kB127 = (tmp3_0 + tmp3_2) * (s1_127_0 + s1_127_2);
    gl64_t kC127 = (tmp3_1 + tmp3_2) * (s1_127_1 + s1_127_2);
    gl64_t kD127 = tmp3_0 * s1_127_0;
    gl64_t kE127 = tmp3_1 * s1_127_1;
    gl64_t kF127 = tmp3_2 * s1_127_2;
    gl64_t kG127 = kD127 - kE127;
    tmp3_0 = (kC127 + kG127) - kF127;
    tmp3_1 = ((((kA127 + kC127) - kE127) - kE127) - kD127);
    tmp3_2 = kB127 - kG127;
    // Op 128: dim1x1 sub
    gl64_t s0_128 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 32, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 32, domainSize, nCols_1))];
    gl64_t s1_128 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_0 = s0_128 - s1_128;
    // Op 129: dim1x1 mul
    gl64_t s0_129 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_129 * tmp1_0;
    // Op 130: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 131: dim3x3 mul
    gl64_t s1_131_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_131_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_131_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA131 = (tmp3_0 + tmp3_1) * (s1_131_0 + s1_131_1);
    gl64_t kB131 = (tmp3_0 + tmp3_2) * (s1_131_0 + s1_131_2);
    gl64_t kC131 = (tmp3_1 + tmp3_2) * (s1_131_1 + s1_131_2);
    gl64_t kD131 = tmp3_0 * s1_131_0;
    gl64_t kE131 = tmp3_1 * s1_131_1;
    gl64_t kF131 = tmp3_2 * s1_131_2;
    gl64_t kG131 = kD131 - kE131;
    tmp3_0 = (kC131 + kG131) - kF131;
    tmp3_1 = ((((kA131 + kC131) - kE131) - kE131) - kD131);
    tmp3_2 = kB131 - kG131;
    // Op 132: dim1x1 sub
    gl64_t s0_132 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 33, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 33, domainSize, nCols_1))];
    gl64_t s1_132 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_0 = s0_132 - s1_132;
    // Op 133: dim1x1 mul
    gl64_t s0_133 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_133 * tmp1_0;
    // Op 134: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 135: dim3x3 mul
    gl64_t s1_135_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_135_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_135_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA135 = (tmp3_0 + tmp3_1) * (s1_135_0 + s1_135_1);
    gl64_t kB135 = (tmp3_0 + tmp3_2) * (s1_135_0 + s1_135_2);
    gl64_t kC135 = (tmp3_1 + tmp3_2) * (s1_135_1 + s1_135_2);
    gl64_t kD135 = tmp3_0 * s1_135_0;
    gl64_t kE135 = tmp3_1 * s1_135_1;
    gl64_t kF135 = tmp3_2 * s1_135_2;
    gl64_t kG135 = kD135 - kE135;
    tmp3_0 = (kC135 + kG135) - kF135;
    tmp3_1 = ((((kA135 + kC135) - kE135) - kE135) - kD135);
    tmp3_2 = kB135 - kG135;
    // Op 136: dim1x1 sub
    gl64_t s0_136 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 34, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 34, domainSize, nCols_1))];
    gl64_t s1_136 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_0 = s0_136 - s1_136;
    // Op 137: dim1x1 mul
    gl64_t s0_137 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_137 * tmp1_0;
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
    // Op 140: dim1x1 sub
    gl64_t s0_140 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 35, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 35, domainSize, nCols_1))];
    gl64_t s1_140 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_0 = s0_140 - s1_140;
    // Op 141: dim1x1 mul
    gl64_t s0_141 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_141 * tmp1_0;
    // Op 142: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 143: dim3x3 mul
    gl64_t s1_143_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_143_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_143_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA143 = (tmp3_0 + tmp3_1) * (s1_143_0 + s1_143_1);
    gl64_t kB143 = (tmp3_0 + tmp3_2) * (s1_143_0 + s1_143_2);
    gl64_t kC143 = (tmp3_1 + tmp3_2) * (s1_143_1 + s1_143_2);
    gl64_t kD143 = tmp3_0 * s1_143_0;
    gl64_t kE143 = tmp3_1 * s1_143_1;
    gl64_t kF143 = tmp3_2 * s1_143_2;
    gl64_t kG143 = kD143 - kE143;
    tmp3_0 = (kC143 + kG143) - kF143;
    tmp3_1 = ((((kA143 + kC143) - kE143) - kE143) - kD143);
    tmp3_2 = kB143 - kG143;
    // Op 144: dim1x1 sub
    gl64_t s0_144 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_1))];
    gl64_t s1_144 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_0 = s0_144 - s1_144;
    // Op 145: dim1x1 mul
    gl64_t s0_145 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_145 * tmp1_0;
    // Op 146: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 147: dim3x3 mul
    gl64_t s1_147_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_147_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_147_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA147 = (tmp3_0 + tmp3_1) * (s1_147_0 + s1_147_1);
    gl64_t kB147 = (tmp3_0 + tmp3_2) * (s1_147_0 + s1_147_2);
    gl64_t kC147 = (tmp3_1 + tmp3_2) * (s1_147_1 + s1_147_2);
    gl64_t kD147 = tmp3_0 * s1_147_0;
    gl64_t kE147 = tmp3_1 * s1_147_1;
    gl64_t kF147 = tmp3_2 * s1_147_2;
    gl64_t kG147 = kD147 - kE147;
    tmp3_0 = (kC147 + kG147) - kF147;
    tmp3_1 = ((((kA147 + kC147) - kE147) - kE147) - kD147);
    tmp3_2 = kB147 - kG147;
    // Op 148: dim1x1 sub
    gl64_t s0_148 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 37, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 37, domainSize, nCols_1))];
    gl64_t s1_148 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_0 = s0_148 - s1_148;
    // Op 149: dim1x1 mul
    gl64_t s0_149 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_149 * tmp1_0;
    // Op 150: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 151: dim3x3 mul
    gl64_t s1_151_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_151_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_151_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA151 = (tmp3_0 + tmp3_1) * (s1_151_0 + s1_151_1);
    gl64_t kB151 = (tmp3_0 + tmp3_2) * (s1_151_0 + s1_151_2);
    gl64_t kC151 = (tmp3_1 + tmp3_2) * (s1_151_1 + s1_151_2);
    gl64_t kD151 = tmp3_0 * s1_151_0;
    gl64_t kE151 = tmp3_1 * s1_151_1;
    gl64_t kF151 = tmp3_2 * s1_151_2;
    gl64_t kG151 = kD151 - kE151;
    tmp3_0 = (kC151 + kG151) - kF151;
    tmp3_1 = ((((kA151 + kC151) - kE151) - kE151) - kD151);
    tmp3_2 = kB151 - kG151;
    // Op 152: dim1x1 sub
    gl64_t s0_152 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 38, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 38, domainSize, nCols_1))];
    gl64_t s1_152 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_0 = s0_152 - s1_152;
    // Op 153: dim1x1 mul
    gl64_t s0_153 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_153 * tmp1_0;
    // Op 154: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 155: dim3x3 mul
    gl64_t s1_155_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_155_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_155_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA155 = (tmp3_0 + tmp3_1) * (s1_155_0 + s1_155_1);
    gl64_t kB155 = (tmp3_0 + tmp3_2) * (s1_155_0 + s1_155_2);
    gl64_t kC155 = (tmp3_1 + tmp3_2) * (s1_155_1 + s1_155_2);
    gl64_t kD155 = tmp3_0 * s1_155_0;
    gl64_t kE155 = tmp3_1 * s1_155_1;
    gl64_t kF155 = tmp3_2 * s1_155_2;
    gl64_t kG155 = kD155 - kE155;
    tmp3_0 = (kC155 + kG155) - kF155;
    tmp3_1 = ((((kA155 + kC155) - kE155) - kE155) - kD155);
    tmp3_2 = kB155 - kG155;
    // Op 156: dim1x1 sub_swap
    gl64_t s0_156 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 47, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 47, domainSize, nCols_1))];
    gl64_t s1_156 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_156 - s0_156;
    // Op 157: dim1x1 mul
    gl64_t s0_157 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 47, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 47, domainSize, nCols_1))];
    tmp1_0 = s0_157 * tmp1_0;
    // Op 158: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 159: dim3x3 mul
    gl64_t s1_159_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_159_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_159_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA159 = (tmp3_0 + tmp3_1) * (s1_159_0 + s1_159_1);
    gl64_t kB159 = (tmp3_0 + tmp3_2) * (s1_159_0 + s1_159_2);
    gl64_t kC159 = (tmp3_1 + tmp3_2) * (s1_159_1 + s1_159_2);
    gl64_t kD159 = tmp3_0 * s1_159_0;
    gl64_t kE159 = tmp3_1 * s1_159_1;
    gl64_t kF159 = tmp3_2 * s1_159_2;
    gl64_t kG159 = kD159 - kE159;
    tmp3_0 = (kC159 + kG159) - kF159;
    tmp3_1 = ((((kA159 + kC159) - kE159) - kE159) - kD159);
    tmp3_2 = kB159 - kG159;
    // Op 160: dim1x1 sub_swap
    gl64_t s0_160 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 48, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 48, domainSize, nCols_1))];
    gl64_t s1_160 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_160 - s0_160;
    // Op 161: dim1x1 mul
    gl64_t s0_161 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 48, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 48, domainSize, nCols_1))];
    tmp1_0 = s0_161 * tmp1_0;
    // Op 162: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 163: dim3x3 mul
    gl64_t s1_163_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_163_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_163_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA163 = (tmp3_0 + tmp3_1) * (s1_163_0 + s1_163_1);
    gl64_t kB163 = (tmp3_0 + tmp3_2) * (s1_163_0 + s1_163_2);
    gl64_t kC163 = (tmp3_1 + tmp3_2) * (s1_163_1 + s1_163_2);
    gl64_t kD163 = tmp3_0 * s1_163_0;
    gl64_t kE163 = tmp3_1 * s1_163_1;
    gl64_t kF163 = tmp3_2 * s1_163_2;
    gl64_t kG163 = kD163 - kE163;
    tmp3_0 = (kC163 + kG163) - kF163;
    tmp3_1 = ((((kA163 + kC163) - kE163) - kE163) - kD163);
    tmp3_2 = kB163 - kG163;
    // Op 164: dim1x1 sub_swap
    gl64_t s0_164 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 49, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 49, domainSize, nCols_1))];
    gl64_t s1_164 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_164 - s0_164;
    // Op 165: dim1x1 mul
    gl64_t s0_165 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 49, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 49, domainSize, nCols_1))];
    tmp1_0 = s0_165 * tmp1_0;
    // Op 166: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 167: dim3x3 mul
    gl64_t s1_167_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_167_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_167_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA167 = (tmp3_0 + tmp3_1) * (s1_167_0 + s1_167_1);
    gl64_t kB167 = (tmp3_0 + tmp3_2) * (s1_167_0 + s1_167_2);
    gl64_t kC167 = (tmp3_1 + tmp3_2) * (s1_167_1 + s1_167_2);
    gl64_t kD167 = tmp3_0 * s1_167_0;
    gl64_t kE167 = tmp3_1 * s1_167_1;
    gl64_t kF167 = tmp3_2 * s1_167_2;
    gl64_t kG167 = kD167 - kE167;
    tmp3_0 = (kC167 + kG167) - kF167;
    tmp3_1 = ((((kA167 + kC167) - kE167) - kE167) - kD167);
    tmp3_2 = kB167 - kG167;
    // Op 168: dim1x1 sub_swap
    gl64_t s0_168 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 50, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 50, domainSize, nCols_1))];
    gl64_t s1_168 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_168 - s0_168;
    // Op 169: dim1x1 mul
    gl64_t s0_169 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 50, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 50, domainSize, nCols_1))];
    tmp1_0 = s0_169 * tmp1_0;
    // Op 170: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 171: dim3x3 mul
    gl64_t s1_171_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_171_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_171_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA171 = (tmp3_0 + tmp3_1) * (s1_171_0 + s1_171_1);
    gl64_t kB171 = (tmp3_0 + tmp3_2) * (s1_171_0 + s1_171_2);
    gl64_t kC171 = (tmp3_1 + tmp3_2) * (s1_171_1 + s1_171_2);
    gl64_t kD171 = tmp3_0 * s1_171_0;
    gl64_t kE171 = tmp3_1 * s1_171_1;
    gl64_t kF171 = tmp3_2 * s1_171_2;
    gl64_t kG171 = kD171 - kE171;
    tmp3_0 = (kC171 + kG171) - kF171;
    tmp3_1 = ((((kA171 + kC171) - kE171) - kE171) - kD171);
    tmp3_2 = kB171 - kG171;
    // Op 172: dim1x1 sub_swap
    gl64_t s0_172 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 51, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 51, domainSize, nCols_1))];
    gl64_t s1_172 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_172 - s0_172;
    // Op 173: dim1x1 mul
    gl64_t s0_173 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 51, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 51, domainSize, nCols_1))];
    tmp1_0 = s0_173 * tmp1_0;
    // Op 174: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 175: dim3x3 mul
    gl64_t s1_175_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_175_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_175_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA175 = (tmp3_0 + tmp3_1) * (s1_175_0 + s1_175_1);
    gl64_t kB175 = (tmp3_0 + tmp3_2) * (s1_175_0 + s1_175_2);
    gl64_t kC175 = (tmp3_1 + tmp3_2) * (s1_175_1 + s1_175_2);
    gl64_t kD175 = tmp3_0 * s1_175_0;
    gl64_t kE175 = tmp3_1 * s1_175_1;
    gl64_t kF175 = tmp3_2 * s1_175_2;
    gl64_t kG175 = kD175 - kE175;
    tmp3_0 = (kC175 + kG175) - kF175;
    tmp3_1 = ((((kA175 + kC175) - kE175) - kE175) - kD175);
    tmp3_2 = kB175 - kG175;
    // Op 176: dim1x1 sub_swap
    gl64_t s0_176 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 52, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 52, domainSize, nCols_1))];
    gl64_t s1_176 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_176 - s0_176;
    // Op 177: dim1x1 mul
    gl64_t s0_177 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 52, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 52, domainSize, nCols_1))];
    tmp1_0 = s0_177 * tmp1_0;
    // Op 178: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 179: dim3x3 mul
    gl64_t s1_179_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_179_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_179_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA179 = (tmp3_0 + tmp3_1) * (s1_179_0 + s1_179_1);
    gl64_t kB179 = (tmp3_0 + tmp3_2) * (s1_179_0 + s1_179_2);
    gl64_t kC179 = (tmp3_1 + tmp3_2) * (s1_179_1 + s1_179_2);
    gl64_t kD179 = tmp3_0 * s1_179_0;
    gl64_t kE179 = tmp3_1 * s1_179_1;
    gl64_t kF179 = tmp3_2 * s1_179_2;
    gl64_t kG179 = kD179 - kE179;
    tmp3_0 = (kC179 + kG179) - kF179;
    tmp3_1 = ((((kA179 + kC179) - kE179) - kE179) - kD179);
    tmp3_2 = kB179 - kG179;
    // Op 180: dim1x1 sub_swap
    gl64_t s0_180 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 53, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 53, domainSize, nCols_1))];
    gl64_t s1_180 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_180 - s0_180;
    // Op 181: dim1x1 mul
    gl64_t s0_181 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 53, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 53, domainSize, nCols_1))];
    tmp1_0 = s0_181 * tmp1_0;
    // Op 182: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 183: dim3x3 mul
    gl64_t s1_183_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_183_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_183_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA183 = (tmp3_0 + tmp3_1) * (s1_183_0 + s1_183_1);
    gl64_t kB183 = (tmp3_0 + tmp3_2) * (s1_183_0 + s1_183_2);
    gl64_t kC183 = (tmp3_1 + tmp3_2) * (s1_183_1 + s1_183_2);
    gl64_t kD183 = tmp3_0 * s1_183_0;
    gl64_t kE183 = tmp3_1 * s1_183_1;
    gl64_t kF183 = tmp3_2 * s1_183_2;
    gl64_t kG183 = kD183 - kE183;
    tmp3_0 = (kC183 + kG183) - kF183;
    tmp3_1 = ((((kA183 + kC183) - kE183) - kE183) - kD183);
    tmp3_2 = kB183 - kG183;
    // Op 184: dim1x1 sub_swap
    gl64_t s0_184 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 54, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 54, domainSize, nCols_1))];
    gl64_t s1_184 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_184 - s0_184;
    // Op 185: dim1x1 mul
    gl64_t s0_185 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 54, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 54, domainSize, nCols_1))];
    tmp1_0 = s0_185 * tmp1_0;
    // Op 186: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 187: dim3x3 mul
    gl64_t s1_187_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_187_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_187_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA187 = (tmp3_0 + tmp3_1) * (s1_187_0 + s1_187_1);
    gl64_t kB187 = (tmp3_0 + tmp3_2) * (s1_187_0 + s1_187_2);
    gl64_t kC187 = (tmp3_1 + tmp3_2) * (s1_187_1 + s1_187_2);
    gl64_t kD187 = tmp3_0 * s1_187_0;
    gl64_t kE187 = tmp3_1 * s1_187_1;
    gl64_t kF187 = tmp3_2 * s1_187_2;
    gl64_t kG187 = kD187 - kE187;
    tmp3_0 = (kC187 + kG187) - kF187;
    tmp3_1 = ((((kA187 + kC187) - kE187) - kE187) - kD187);
    tmp3_2 = kB187 - kG187;
    // Op 188: dim1x1 sub_swap
    gl64_t s0_188 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 57, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 57, domainSize, nCols_1))];
    gl64_t s1_188 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_188 - s0_188;
    // Op 189: dim1x1 mul
    gl64_t s0_189 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 57, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 57, domainSize, nCols_1))];
    tmp1_0 = s0_189 * tmp1_0;
    // Op 190: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 191: dim3x3 mul
    gl64_t s1_191_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_191_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_191_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA191 = (tmp3_0 + tmp3_1) * (s1_191_0 + s1_191_1);
    gl64_t kB191 = (tmp3_0 + tmp3_2) * (s1_191_0 + s1_191_2);
    gl64_t kC191 = (tmp3_1 + tmp3_2) * (s1_191_1 + s1_191_2);
    gl64_t kD191 = tmp3_0 * s1_191_0;
    gl64_t kE191 = tmp3_1 * s1_191_1;
    gl64_t kF191 = tmp3_2 * s1_191_2;
    gl64_t kG191 = kD191 - kE191;
    tmp3_0 = (kC191 + kG191) - kF191;
    tmp3_1 = ((((kA191 + kC191) - kE191) - kE191) - kD191);
    tmp3_2 = kB191 - kG191;
    // Op 192: dim1x1 sub_swap
    gl64_t s0_192 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 48, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 48, domainSize, nCols_1))];
    gl64_t s1_192 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_192 - s0_192;
    // Op 193: dim1x1 mul
    gl64_t s0_193 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 47, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 47, domainSize, nCols_1))];
    tmp1_0 = s0_193 * tmp1_0;
    // Op 194: dim1x1 sub
    gl64_t s0_194 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 39, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 39, domainSize, nCols_1))];
    gl64_t s1_194 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 46, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 46, domainSize, nCols_1))];
    tmp1_1 = s0_194 - s1_194;
    // Op 195: dim1x1 mul
    tmp1_2 = tmp1_0 * tmp1_1;
    // Op 196: dim1x1 sub_swap
    gl64_t s0_196 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 49, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 49, domainSize, nCols_1))];
    gl64_t s1_196 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_196 - s0_196;
    // Op 197: dim1x1 mul
    gl64_t s0_197 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 48, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 48, domainSize, nCols_1))];
    tmp1_0 = s0_197 * tmp1_0;
    // Op 198: dim1x1 sub
    gl64_t s0_198 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 40, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 40, domainSize, nCols_1))];
    gl64_t s1_198 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 46, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 46, domainSize, nCols_1))];
    tmp1_1 = s0_198 - s1_198;
    // Op 199: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 200: dim1x1 add
    tmp1_1 = tmp1_2 + tmp1_0;
    // Op 201: dim1x1 sub_swap
    gl64_t s0_201 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 50, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 50, domainSize, nCols_1))];
    gl64_t s1_201 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_201 - s0_201;
    // Op 202: dim1x1 mul
    gl64_t s0_202 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 49, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 49, domainSize, nCols_1))];
    tmp1_0 = s0_202 * tmp1_0;
    // Op 203: dim1x1 sub
    gl64_t s0_203 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 41, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 41, domainSize, nCols_1))];
    gl64_t s1_203 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 46, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 46, domainSize, nCols_1))];
    tmp1_2 = s0_203 - s1_203;
    // Op 204: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_2;
    // Op 205: dim1x1 add
    tmp1_2 = tmp1_1 + tmp1_0;
    // Op 206: dim1x1 sub_swap
    gl64_t s0_206 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 51, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 51, domainSize, nCols_1))];
    gl64_t s1_206 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_206 - s0_206;
    // Op 207: dim1x1 mul
    gl64_t s0_207 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 50, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 50, domainSize, nCols_1))];
    tmp1_0 = s0_207 * tmp1_0;
    // Op 208: dim1x1 sub
    gl64_t s0_208 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 42, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 42, domainSize, nCols_1))];
    gl64_t s1_208 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 46, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 46, domainSize, nCols_1))];
    tmp1_1 = s0_208 - s1_208;
    // Op 209: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 210: dim1x1 add
    tmp1_1 = tmp1_2 + tmp1_0;
    // Op 211: dim1x1 sub_swap
    gl64_t s0_211 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 52, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 52, domainSize, nCols_1))];
    gl64_t s1_211 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_211 - s0_211;
    // Op 212: dim1x1 mul
    gl64_t s0_212 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 51, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 51, domainSize, nCols_1))];
    tmp1_0 = s0_212 * tmp1_0;
    // Op 213: dim1x1 sub
    gl64_t s0_213 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 43, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 43, domainSize, nCols_1))];
    gl64_t s1_213 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 46, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 46, domainSize, nCols_1))];
    tmp1_2 = s0_213 - s1_213;
    // Op 214: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_2;
    // Op 215: dim1x1 add
    tmp1_2 = tmp1_1 + tmp1_0;
    // Op 216: dim1x1 sub_swap
    gl64_t s0_216 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 53, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 53, domainSize, nCols_1))];
    gl64_t s1_216 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_216 - s0_216;
    // Op 217: dim1x1 mul
    gl64_t s0_217 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 52, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 52, domainSize, nCols_1))];
    tmp1_0 = s0_217 * tmp1_0;
    // Op 218: dim1x1 sub
    gl64_t s0_218 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 44, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 44, domainSize, nCols_1))];
    gl64_t s1_218 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 46, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 46, domainSize, nCols_1))];
    tmp1_1 = s0_218 - s1_218;
    // Op 219: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 220: dim1x1 add
    tmp1_1 = tmp1_2 + tmp1_0;
    // Op 221: dim1x1 sub_swap
    gl64_t s0_221 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 54, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 54, domainSize, nCols_1))];
    gl64_t s1_221 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_221 - s0_221;
    // Op 222: dim1x1 mul
    gl64_t s0_222 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 53, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 53, domainSize, nCols_1))];
    tmp1_0 = s0_222 * tmp1_0;
    // Op 223: dim1x1 sub
    gl64_t s0_223 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 45, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 45, domainSize, nCols_1))];
    gl64_t s1_223 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 46, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 46, domainSize, nCols_1))];
    tmp1_2 = s0_223 - s1_223;
    // Op 224: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_2;
    // Op 225: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 226: dim1x1 add
    gl64_t s0_226 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 46, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 46, domainSize, nCols_1))];
    tmp1_0 = s0_226 + tmp1_0;
    // Op 227: dim1x1 sub
    gl64_t s0_227 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 55, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 55, domainSize, nCols_1))];
    tmp1_0 = s0_227 - tmp1_0;
    // Op 228: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 229: dim3x3 mul
    gl64_t s1_229_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_229_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_229_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA229 = (tmp3_0 + tmp3_1) * (s1_229_0 + s1_229_1);
    gl64_t kB229 = (tmp3_0 + tmp3_2) * (s1_229_0 + s1_229_2);
    gl64_t kC229 = (tmp3_1 + tmp3_2) * (s1_229_1 + s1_229_2);
    gl64_t kD229 = tmp3_0 * s1_229_0;
    gl64_t kE229 = tmp3_1 * s1_229_1;
    gl64_t kF229 = tmp3_2 * s1_229_2;
    gl64_t kG229 = kD229 - kE229;
    tmp3_0 = (kC229 + kG229) - kF229;
    tmp3_1 = ((((kA229 + kC229) - kE229) - kE229) - kD229);
    tmp3_2 = kB229 - kG229;
    // Op 230: dim1x1 mul
    gl64_t s0_230 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 57, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 57, domainSize, nCols_1))];
    gl64_t s1_230 = *(gl64_t*)&expressions_params[9][1];
    tmp1_1 = s0_230 * s1_230;
    // Op 231: dim1x1 mul
    gl64_t s0_231 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 57, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 57, domainSize, nCols_1))];
    gl64_t s1_231 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_231 * s1_231;
    // Op 232: dim1x1 sub_swap
    gl64_t s1_232 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_232 - tmp1_0;
    // Op 233: dim1x1 mul
    gl64_t s0_233 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 56, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 56, domainSize, nCols_1))];
    tmp1_0 = s0_233 * tmp1_0;
    // Op 234: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 235: dim1x1 sub
    gl64_t s0_235 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    tmp1_0 = s0_235 - tmp1_0;
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
    gl64_t s0_238 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 47, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 47, domainSize, nCols_1))];
    gl64_t s1_238 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    tmp1_1 = s0_238 * s1_238;
    // Op 239: dim1x1 mul
    gl64_t s0_239 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 48, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 48, domainSize, nCols_1))];
    gl64_t s1_239 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_239 * s1_239;
    // Op 240: dim1x1 mul
    gl64_t s0_240 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    tmp1_0 = s0_240 * tmp1_0;
    // Op 241: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 242: dim1x1 mul
    gl64_t s0_242 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 49, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 49, domainSize, nCols_1))];
    gl64_t s1_242 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_242 * s1_242;
    // Op 243: dim1x1 mul
    gl64_t s0_243 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    tmp1_0 = s0_243 * tmp1_0;
    // Op 244: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 245: dim1x1 mul
    gl64_t s0_245 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 50, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 50, domainSize, nCols_1))];
    gl64_t s1_245 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_245 * s1_245;
    // Op 246: dim1x1 mul
    gl64_t s0_246 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    tmp1_0 = s0_246 * tmp1_0;
    // Op 247: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 248: dim1x1 mul
    gl64_t s0_248 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_2 = s0_248 * tmp1_0;
    // Op 249: dim1x1 mul
    gl64_t s0_249 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 47, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 47, domainSize, nCols_1))];
    gl64_t s1_249 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    tmp1_1 = s0_249 * s1_249;
    // Op 250: dim1x1 mul
    gl64_t s0_250 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 48, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 48, domainSize, nCols_1))];
    gl64_t s1_250 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_250 * s1_250;
    // Op 251: dim1x1 mul
    gl64_t s0_251 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    tmp1_0 = s0_251 * tmp1_0;
    // Op 252: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 253: dim1x1 mul
    gl64_t s0_253 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 49, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 49, domainSize, nCols_1))];
    gl64_t s1_253 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_253 * s1_253;
    // Op 254: dim1x1 mul
    gl64_t s0_254 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    tmp1_0 = s0_254 * tmp1_0;
    // Op 255: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 256: dim1x1 mul
    gl64_t s0_256 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 50, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 50, domainSize, nCols_1))];
    gl64_t s1_256 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_256 * s1_256;
    // Op 257: dim1x1 mul
    gl64_t s0_257 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 27, domainSize, nCols_1))];
    tmp1_0 = s0_257 * tmp1_0;
    // Op 258: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 259: dim1x1 mul
    gl64_t s0_259 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_259 * tmp1_0;
    // Op 260: dim1x1 add
    tmp1_1 = tmp1_2 + tmp1_0;
    // Op 261: dim1x1 mul
    gl64_t s0_261 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 47, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 47, domainSize, nCols_1))];
    gl64_t s1_261 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    tmp1_2 = s0_261 * s1_261;
    // Op 262: dim1x1 mul
    gl64_t s0_262 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 48, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 48, domainSize, nCols_1))];
    gl64_t s1_262 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_262 * s1_262;
    // Op 263: dim1x1 mul
    gl64_t s0_263 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    tmp1_0 = s0_263 * tmp1_0;
    // Op 264: dim1x1 add
    tmp1_2 = tmp1_2 + tmp1_0;
    // Op 265: dim1x1 mul
    gl64_t s0_265 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 49, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 49, domainSize, nCols_1))];
    gl64_t s1_265 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_265 * s1_265;
    // Op 266: dim1x1 mul
    gl64_t s0_266 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 27, domainSize, nCols_1))];
    tmp1_0 = s0_266 * tmp1_0;
    // Op 267: dim1x1 add
    tmp1_2 = tmp1_2 + tmp1_0;
    // Op 268: dim1x1 mul
    gl64_t s0_268 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 50, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 50, domainSize, nCols_1))];
    gl64_t s1_268 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_268 * s1_268;
    // Op 269: dim1x1 mul
    gl64_t s0_269 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    tmp1_0 = s0_269 * tmp1_0;
    // Op 270: dim1x1 add
    tmp1_0 = tmp1_2 + tmp1_0;
    // Op 271: dim1x1 mul
    gl64_t s0_271 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_0 = s0_271 * tmp1_0;
    // Op 272: dim1x1 add
    tmp1_2 = tmp1_1 + tmp1_0;
    // Op 273: dim1x1 mul
    gl64_t s0_273 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 47, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 47, domainSize, nCols_1))];
    gl64_t s1_273 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    tmp1_1 = s0_273 * s1_273;
    // Op 274: dim1x1 mul
    gl64_t s0_274 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 48, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 48, domainSize, nCols_1))];
    gl64_t s1_274 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_274 * s1_274;
    // Op 275: dim1x1 mul
    gl64_t s0_275 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 27, domainSize, nCols_1))];
    tmp1_0 = s0_275 * tmp1_0;
    // Op 276: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 277: dim1x1 mul
    gl64_t s0_277 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 49, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 49, domainSize, nCols_1))];
    gl64_t s1_277 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_277 * s1_277;
    // Op 278: dim1x1 mul
    gl64_t s0_278 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    tmp1_0 = s0_278 * tmp1_0;
    // Op 279: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 280: dim1x1 mul
    gl64_t s0_280 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 50, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 50, domainSize, nCols_1))];
    gl64_t s1_280 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_280 * s1_280;
    // Op 281: dim1x1 mul
    gl64_t s0_281 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    tmp1_0 = s0_281 * tmp1_0;
    // Op 282: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 283: dim1x1 mul
    gl64_t s0_283 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp1_0 = s0_283 * tmp1_0;
    // Op 284: dim1x1 add
    tmp1_1 = tmp1_2 + tmp1_0;
    // Op 285: dim1x1 mul
    gl64_t s0_285 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 47, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 47, domainSize, nCols_1))];
    gl64_t s1_285 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 27, domainSize, nCols_1))];
    tmp1_2 = s0_285 * s1_285;
    // Op 286: dim1x1 mul
    gl64_t s0_286 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 48, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 48, domainSize, nCols_1))];
    gl64_t s1_286 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_286 * s1_286;
    // Op 287: dim1x1 mul
    gl64_t s0_287 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    tmp1_0 = s0_287 * tmp1_0;
    // Op 288: dim1x1 add
    tmp1_2 = tmp1_2 + tmp1_0;
    // Op 289: dim1x1 mul
    gl64_t s0_289 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 49, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 49, domainSize, nCols_1))];
    gl64_t s1_289 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_289 * s1_289;
    // Op 290: dim1x1 mul
    gl64_t s0_290 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    tmp1_0 = s0_290 * tmp1_0;
    // Op 291: dim1x1 add
    tmp1_2 = tmp1_2 + tmp1_0;
    // Op 292: dim1x1 mul
    gl64_t s0_292 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 50, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 50, domainSize, nCols_1))];
    gl64_t s1_292 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_292 * s1_292;
    // Op 293: dim1x1 mul
    gl64_t s0_293 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    tmp1_0 = s0_293 * tmp1_0;
    // Op 294: dim1x1 add
    tmp1_0 = tmp1_2 + tmp1_0;
    // Op 295: dim1x1 mul
    gl64_t s0_295 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    tmp1_0 = s0_295 * tmp1_0;
    // Op 296: dim1x1 add
    tmp1_2 = tmp1_1 + tmp1_0;
    // Op 297: dim1x1 mul
    gl64_t s0_297 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 47, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 47, domainSize, nCols_1))];
    gl64_t s1_297 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    tmp1_1 = s0_297 * s1_297;
    // Op 298: dim1x1 mul
    gl64_t s0_298 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 48, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 48, domainSize, nCols_1))];
    gl64_t s1_298 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_298 * s1_298;
    // Op 299: dim1x1 mul
    gl64_t s0_299 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    tmp1_0 = s0_299 * tmp1_0;
    // Op 300: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 301: dim1x1 mul
    gl64_t s0_301 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 49, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 49, domainSize, nCols_1))];
    gl64_t s1_301 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_301 * s1_301;
    // Op 302: dim1x1 mul
    gl64_t s0_302 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    tmp1_0 = s0_302 * tmp1_0;
    // Op 303: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 304: dim1x1 mul
    gl64_t s0_304 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 50, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 50, domainSize, nCols_1))];
    gl64_t s1_304 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_304 * s1_304;
    // Op 305: dim1x1 mul
    gl64_t s0_305 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 31, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 31, domainSize, nCols_1))];
    tmp1_0 = s0_305 * tmp1_0;
    // Op 306: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 307: dim1x1 mul
    gl64_t s0_307 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    tmp1_0 = s0_307 * tmp1_0;
    // Op 308: dim1x1 add
    tmp1_1 = tmp1_2 + tmp1_0;
    // Op 309: dim1x1 mul
    gl64_t s0_309 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 47, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 47, domainSize, nCols_1))];
    gl64_t s1_309 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    tmp1_2 = s0_309 * s1_309;
    // Op 310: dim1x1 mul
    gl64_t s0_310 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 48, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 48, domainSize, nCols_1))];
    gl64_t s1_310 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_310 * s1_310;
    // Op 311: dim1x1 mul
    gl64_t s0_311 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    tmp1_0 = s0_311 * tmp1_0;
    // Op 312: dim1x1 add
    tmp1_2 = tmp1_2 + tmp1_0;
    // Op 313: dim1x1 mul
    gl64_t s0_313 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 49, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 49, domainSize, nCols_1))];
    gl64_t s1_313 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_313 * s1_313;
    // Op 314: dim1x1 mul
    gl64_t s0_314 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 31, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 31, domainSize, nCols_1))];
    tmp1_0 = s0_314 * tmp1_0;
    // Op 315: dim1x1 add
    tmp1_2 = tmp1_2 + tmp1_0;
    // Op 316: dim1x1 mul
    gl64_t s0_316 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 50, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 50, domainSize, nCols_1))];
    gl64_t s1_316 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_316 * s1_316;
    // Op 317: dim1x1 mul
    gl64_t s0_317 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 32, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 32, domainSize, nCols_1))];
    tmp1_0 = s0_317 * tmp1_0;
    // Op 318: dim1x1 add
    tmp1_0 = tmp1_2 + tmp1_0;
    // Op 319: dim1x1 mul
    gl64_t s0_319 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    tmp1_0 = s0_319 * tmp1_0;
    // Op 320: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 321: dim1x1 sub_swap
    gl64_t s1_321 = *(gl64_t*)&expressions_params[9][0];
    tmp1_2 = s1_321 - tmp1_3;
    // Op 322: dim1x1 mul
    gl64_t s0_322 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 47, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 47, domainSize, nCols_1))];
    gl64_t s1_322 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    tmp1_0 = s0_322 * s1_322;
    // Op 323: dim1x1 mul
    gl64_t s0_323 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 48, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 48, domainSize, nCols_1))];
    gl64_t s1_323 = *(gl64_t*)&expressions_params[9][3];
    tmp1_3 = s0_323 * s1_323;
    // Op 324: dim1x1 mul
    gl64_t s0_324 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 31, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 31, domainSize, nCols_1))];
    tmp1_3 = s0_324 * tmp1_3;
    // Op 325: dim1x1 add
    tmp1_3 = tmp1_0 + tmp1_3;
    // Op 326: dim1x1 mul
    gl64_t s0_326 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 49, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 49, domainSize, nCols_1))];
    gl64_t s1_326 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_326 * s1_326;
    // Op 327: dim1x1 mul
    gl64_t s0_327 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 32, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 32, domainSize, nCols_1))];
    tmp1_0 = s0_327 * tmp1_0;
    // Op 328: dim1x1 add
    tmp1_3 = tmp1_3 + tmp1_0;
    // Op 329: dim1x1 mul
    gl64_t s0_329 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 50, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 50, domainSize, nCols_1))];
    gl64_t s1_329 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_329 * s1_329;
    // Op 330: dim1x1 mul
    gl64_t s0_330 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 33, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 33, domainSize, nCols_1))];
    tmp1_0 = s0_330 * tmp1_0;
    // Op 331: dim1x1 add
    tmp1_0 = tmp1_3 + tmp1_0;
    // Op 332: dim1x1 mul
    tmp1_0 = tmp1_2 * tmp1_0;
    // Op 333: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 334: dim1x1 sub_swap
    gl64_t s0_334 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 47, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 47, domainSize, nCols_1))];
    gl64_t s1_334 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_334 - s0_334;
    // Op 335: dim1x1 mul
    gl64_t s0_335 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 39, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 39, domainSize, nCols_1))];
    tmp1_0 = s0_335 * tmp1_0;
    // Op 336: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 337: dim1x1 sub_swap
    gl64_t s0_337 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 48, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 48, domainSize, nCols_1))];
    gl64_t s1_337 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_337 - s0_337;
    // Op 338: dim1x1 mul
    gl64_t s1_338 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = tmp1_0 * s1_338;
    // Op 339: dim1x1 mul
    gl64_t s0_339 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 40, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 40, domainSize, nCols_1))];
    tmp1_0 = s0_339 * tmp1_0;
    // Op 340: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 341: dim1x1 sub_swap
    gl64_t s0_341 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 49, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 49, domainSize, nCols_1))];
    gl64_t s1_341 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_341 - s0_341;
    // Op 342: dim1x1 mul
    gl64_t s1_342 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 * s1_342;
    // Op 343: dim1x1 mul
    gl64_t s0_343 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 41, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 41, domainSize, nCols_1))];
    tmp1_0 = s0_343 * tmp1_0;
    // Op 344: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 345: dim1x1 sub_swap
    gl64_t s0_345 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 50, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 50, domainSize, nCols_1))];
    gl64_t s1_345 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_345 - s0_345;
    // Op 346: dim1x1 mul
    gl64_t s1_346 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = tmp1_0 * s1_346;
    // Op 347: dim1x1 mul
    gl64_t s0_347 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 42, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 42, domainSize, nCols_1))];
    tmp1_0 = s0_347 * tmp1_0;
    // Op 348: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 349: dim1x1 sub
    gl64_t s0_349 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 62, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 62, domainSize, nCols_1))];
    tmp1_0 = s0_349 - tmp1_0;
    // Op 350: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 351: dim3x3 mul
    gl64_t s1_351_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_351_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_351_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA351 = (tmp3_0 + tmp3_1) * (s1_351_0 + s1_351_1);
    gl64_t kB351 = (tmp3_0 + tmp3_2) * (s1_351_0 + s1_351_2);
    gl64_t kC351 = (tmp3_1 + tmp3_2) * (s1_351_1 + s1_351_2);
    gl64_t kD351 = tmp3_0 * s1_351_0;
    gl64_t kE351 = tmp3_1 * s1_351_1;
    gl64_t kF351 = tmp3_2 * s1_351_2;
    gl64_t kG351 = kD351 - kE351;
    tmp3_0 = (kC351 + kG351) - kF351;
    tmp3_1 = ((((kA351 + kC351) - kE351) - kE351) - kD351);
    tmp3_2 = kB351 - kG351;
    // Op 352: dim1x1 mul
    gl64_t s0_352 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 51, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 51, domainSize, nCols_1))];
    gl64_t s1_352 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 27, domainSize, nCols_1))];
    tmp1_1 = s0_352 * s1_352;
    // Op 353: dim1x1 mul
    gl64_t s0_353 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 52, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 52, domainSize, nCols_1))];
    gl64_t s1_353 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_353 * s1_353;
    // Op 354: dim1x1 mul
    gl64_t s0_354 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    tmp1_0 = s0_354 * tmp1_0;
    // Op 355: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 356: dim1x1 mul
    gl64_t s0_356 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 53, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 53, domainSize, nCols_1))];
    gl64_t s1_356 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_356 * s1_356;
    // Op 357: dim1x1 mul
    gl64_t s0_357 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    tmp1_0 = s0_357 * tmp1_0;
    // Op 358: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 359: dim1x1 mul
    gl64_t s0_359 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 54, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 54, domainSize, nCols_1))];
    gl64_t s1_359 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_359 * s1_359;
    // Op 360: dim1x1 mul
    gl64_t s0_360 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    tmp1_0 = s0_360 * tmp1_0;
    // Op 361: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 362: dim1x1 mul
    gl64_t s0_362 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_3 = s0_362 * tmp1_0;
    // Op 363: dim1x1 mul
    gl64_t s0_363 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 51, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 51, domainSize, nCols_1))];
    gl64_t s1_363 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    tmp1_1 = s0_363 * s1_363;
    // Op 364: dim1x1 mul
    gl64_t s0_364 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 52, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 52, domainSize, nCols_1))];
    gl64_t s1_364 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_364 * s1_364;
    // Op 365: dim1x1 mul
    gl64_t s0_365 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    tmp1_0 = s0_365 * tmp1_0;
    // Op 366: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 367: dim1x1 mul
    gl64_t s0_367 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 53, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 53, domainSize, nCols_1))];
    gl64_t s1_367 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_367 * s1_367;
    // Op 368: dim1x1 mul
    gl64_t s0_368 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    tmp1_0 = s0_368 * tmp1_0;
    // Op 369: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 370: dim1x1 mul
    gl64_t s0_370 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 54, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 54, domainSize, nCols_1))];
    gl64_t s1_370 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_370 * s1_370;
    // Op 371: dim1x1 mul
    gl64_t s0_371 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 31, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 31, domainSize, nCols_1))];
    tmp1_0 = s0_371 * tmp1_0;
    // Op 372: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 373: dim1x1 mul
    gl64_t s0_373 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_373 * tmp1_0;
    // Op 374: dim1x1 add
    tmp1_1 = tmp1_3 + tmp1_0;
    // Op 375: dim1x1 mul
    gl64_t s0_375 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 51, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 51, domainSize, nCols_1))];
    gl64_t s1_375 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    tmp1_3 = s0_375 * s1_375;
    // Op 376: dim1x1 mul
    gl64_t s0_376 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 52, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 52, domainSize, nCols_1))];
    gl64_t s1_376 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_376 * s1_376;
    // Op 377: dim1x1 mul
    gl64_t s0_377 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    tmp1_0 = s0_377 * tmp1_0;
    // Op 378: dim1x1 add
    tmp1_3 = tmp1_3 + tmp1_0;
    // Op 379: dim1x1 mul
    gl64_t s0_379 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 53, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 53, domainSize, nCols_1))];
    gl64_t s1_379 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_379 * s1_379;
    // Op 380: dim1x1 mul
    gl64_t s0_380 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 31, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 31, domainSize, nCols_1))];
    tmp1_0 = s0_380 * tmp1_0;
    // Op 381: dim1x1 add
    tmp1_3 = tmp1_3 + tmp1_0;
    // Op 382: dim1x1 mul
    gl64_t s0_382 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 54, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 54, domainSize, nCols_1))];
    gl64_t s1_382 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_382 * s1_382;
    // Op 383: dim1x1 mul
    gl64_t s0_383 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 32, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 32, domainSize, nCols_1))];
    tmp1_0 = s0_383 * tmp1_0;
    // Op 384: dim1x1 add
    tmp1_0 = tmp1_3 + tmp1_0;
    // Op 385: dim1x1 mul
    gl64_t s0_385 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_0 = s0_385 * tmp1_0;
    // Op 386: dim1x1 add
    tmp1_3 = tmp1_1 + tmp1_0;
    // Op 387: dim1x1 mul
    gl64_t s0_387 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 51, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 51, domainSize, nCols_1))];
    gl64_t s1_387 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    tmp1_1 = s0_387 * s1_387;
    // Op 388: dim1x1 mul
    gl64_t s0_388 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 52, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 52, domainSize, nCols_1))];
    gl64_t s1_388 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_388 * s1_388;
    // Op 389: dim1x1 mul
    gl64_t s0_389 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 31, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 31, domainSize, nCols_1))];
    tmp1_0 = s0_389 * tmp1_0;
    // Op 390: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 391: dim1x1 mul
    gl64_t s0_391 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 53, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 53, domainSize, nCols_1))];
    gl64_t s1_391 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_391 * s1_391;
    // Op 392: dim1x1 mul
    gl64_t s0_392 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 32, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 32, domainSize, nCols_1))];
    tmp1_0 = s0_392 * tmp1_0;
    // Op 393: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 394: dim1x1 mul
    gl64_t s0_394 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 54, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 54, domainSize, nCols_1))];
    gl64_t s1_394 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_394 * s1_394;
    // Op 395: dim1x1 mul
    gl64_t s0_395 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 33, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 33, domainSize, nCols_1))];
    tmp1_0 = s0_395 * tmp1_0;
    // Op 396: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 397: dim1x1 mul
    gl64_t s0_397 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp1_0 = s0_397 * tmp1_0;
    // Op 398: dim1x1 add
    tmp1_1 = tmp1_3 + tmp1_0;
    // Op 399: dim1x1 mul
    gl64_t s0_399 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 51, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 51, domainSize, nCols_1))];
    gl64_t s1_399 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 31, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 31, domainSize, nCols_1))];
    tmp1_3 = s0_399 * s1_399;
    // Op 400: dim1x1 mul
    gl64_t s0_400 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 52, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 52, domainSize, nCols_1))];
    gl64_t s1_400 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_400 * s1_400;
    // Op 401: dim1x1 mul
    gl64_t s0_401 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 32, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 32, domainSize, nCols_1))];
    tmp1_0 = s0_401 * tmp1_0;
    // Op 402: dim1x1 add
    tmp1_3 = tmp1_3 + tmp1_0;
    // Op 403: dim1x1 mul
    gl64_t s0_403 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 53, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 53, domainSize, nCols_1))];
    gl64_t s1_403 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_403 * s1_403;
    // Op 404: dim1x1 mul
    gl64_t s0_404 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 33, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 33, domainSize, nCols_1))];
    tmp1_0 = s0_404 * tmp1_0;
    // Op 405: dim1x1 add
    tmp1_3 = tmp1_3 + tmp1_0;
    // Op 406: dim1x1 mul
    gl64_t s0_406 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 54, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 54, domainSize, nCols_1))];
    gl64_t s1_406 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_406 * s1_406;
    // Op 407: dim1x1 mul
    gl64_t s0_407 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 34, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 34, domainSize, nCols_1))];
    tmp1_0 = s0_407 * tmp1_0;
    // Op 408: dim1x1 add
    tmp1_0 = tmp1_3 + tmp1_0;
    // Op 409: dim1x1 mul
    gl64_t s0_409 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    tmp1_0 = s0_409 * tmp1_0;
    // Op 410: dim1x1 add
    tmp1_3 = tmp1_1 + tmp1_0;
    // Op 411: dim1x1 mul
    gl64_t s0_411 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 51, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 51, domainSize, nCols_1))];
    gl64_t s1_411 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 32, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 32, domainSize, nCols_1))];
    tmp1_1 = s0_411 * s1_411;
    // Op 412: dim1x1 mul
    gl64_t s0_412 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 52, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 52, domainSize, nCols_1))];
    gl64_t s1_412 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_412 * s1_412;
    // Op 413: dim1x1 mul
    gl64_t s0_413 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 33, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 33, domainSize, nCols_1))];
    tmp1_0 = s0_413 * tmp1_0;
    // Op 414: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 415: dim1x1 mul
    gl64_t s0_415 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 53, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 53, domainSize, nCols_1))];
    gl64_t s1_415 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_415 * s1_415;
    // Op 416: dim1x1 mul
    gl64_t s0_416 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 34, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 34, domainSize, nCols_1))];
    tmp1_0 = s0_416 * tmp1_0;
    // Op 417: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 418: dim1x1 mul
    gl64_t s0_418 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 54, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 54, domainSize, nCols_1))];
    gl64_t s1_418 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_418 * s1_418;
    // Op 419: dim1x1 mul
    gl64_t s0_419 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 35, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 35, domainSize, nCols_1))];
    tmp1_0 = s0_419 * tmp1_0;
    // Op 420: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 421: dim1x1 mul
    gl64_t s0_421 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    tmp1_0 = s0_421 * tmp1_0;
    // Op 422: dim1x1 add
    tmp1_1 = tmp1_3 + tmp1_0;
    // Op 423: dim1x1 mul
    gl64_t s0_423 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 51, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 51, domainSize, nCols_1))];
    gl64_t s1_423 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 33, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 33, domainSize, nCols_1))];
    tmp1_3 = s0_423 * s1_423;
    // Op 424: dim1x1 mul
    gl64_t s0_424 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 52, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 52, domainSize, nCols_1))];
    gl64_t s1_424 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_424 * s1_424;
    // Op 425: dim1x1 mul
    gl64_t s0_425 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 34, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 34, domainSize, nCols_1))];
    tmp1_0 = s0_425 * tmp1_0;
    // Op 426: dim1x1 add
    tmp1_3 = tmp1_3 + tmp1_0;
    // Op 427: dim1x1 mul
    gl64_t s0_427 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 53, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 53, domainSize, nCols_1))];
    gl64_t s1_427 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_427 * s1_427;
    // Op 428: dim1x1 mul
    gl64_t s0_428 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 35, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 35, domainSize, nCols_1))];
    tmp1_0 = s0_428 * tmp1_0;
    // Op 429: dim1x1 add
    tmp1_3 = tmp1_3 + tmp1_0;
    // Op 430: dim1x1 mul
    gl64_t s0_430 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 54, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 54, domainSize, nCols_1))];
    gl64_t s1_430 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_430 * s1_430;
    // Op 431: dim1x1 mul
    gl64_t s0_431 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_1))];
    tmp1_0 = s0_431 * tmp1_0;
    // Op 432: dim1x1 add
    tmp1_0 = tmp1_3 + tmp1_0;
    // Op 433: dim1x1 mul
    gl64_t s0_433 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    tmp1_0 = s0_433 * tmp1_0;
    // Op 434: dim1x1 add
    tmp1_3 = tmp1_1 + tmp1_0;
    // Op 435: dim1x1 mul
    gl64_t s0_435 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 51, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 51, domainSize, nCols_1))];
    gl64_t s1_435 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 34, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 34, domainSize, nCols_1))];
    tmp1_1 = s0_435 * s1_435;
    // Op 436: dim1x1 mul
    gl64_t s0_436 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 52, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 52, domainSize, nCols_1))];
    gl64_t s1_436 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_436 * s1_436;
    // Op 437: dim1x1 mul
    gl64_t s0_437 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 35, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 35, domainSize, nCols_1))];
    tmp1_0 = s0_437 * tmp1_0;
    // Op 438: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 439: dim1x1 mul
    gl64_t s0_439 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 53, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 53, domainSize, nCols_1))];
    gl64_t s1_439 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_439 * s1_439;
    // Op 440: dim1x1 mul
    gl64_t s0_440 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_1))];
    tmp1_0 = s0_440 * tmp1_0;
    // Op 441: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 442: dim1x1 mul
    gl64_t s0_442 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 54, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 54, domainSize, nCols_1))];
    gl64_t s1_442 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_442 * s1_442;
    // Op 443: dim1x1 mul
    gl64_t s0_443 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 37, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 37, domainSize, nCols_1))];
    tmp1_0 = s0_443 * tmp1_0;
    // Op 444: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 445: dim1x1 mul
    tmp1_0 = tmp1_2 * tmp1_0;
    // Op 446: dim1x1 add
    tmp1_3 = tmp1_3 + tmp1_0;
    // Op 447: dim1x1 sub_swap
    gl64_t s0_447 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 51, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 51, domainSize, nCols_1))];
    gl64_t s1_447 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_447 - s0_447;
    // Op 448: dim1x1 mul
    gl64_t s0_448 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 43, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 43, domainSize, nCols_1))];
    tmp1_0 = s0_448 * tmp1_0;
    // Op 449: dim1x1 add
    tmp1_3 = tmp1_3 + tmp1_0;
    // Op 450: dim1x1 sub_swap
    gl64_t s0_450 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 52, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 52, domainSize, nCols_1))];
    gl64_t s1_450 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_450 - s0_450;
    // Op 451: dim1x1 mul
    gl64_t s1_451 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = tmp1_0 * s1_451;
    // Op 452: dim1x1 mul
    gl64_t s0_452 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 44, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 44, domainSize, nCols_1))];
    tmp1_0 = s0_452 * tmp1_0;
    // Op 453: dim1x1 add
    tmp1_3 = tmp1_3 + tmp1_0;
    // Op 454: dim1x1 sub_swap
    gl64_t s0_454 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 53, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 53, domainSize, nCols_1))];
    gl64_t s1_454 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_454 - s0_454;
    // Op 455: dim1x1 mul
    gl64_t s1_455 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 * s1_455;
    // Op 456: dim1x1 mul
    gl64_t s0_456 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 45, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 45, domainSize, nCols_1))];
    tmp1_0 = s0_456 * tmp1_0;
    // Op 457: dim1x1 add
    tmp1_3 = tmp1_3 + tmp1_0;
    // Op 458: dim1x1 sub_swap
    gl64_t s0_458 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 54, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 54, domainSize, nCols_1))];
    gl64_t s1_458 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_458 - s0_458;
    // Op 459: dim1x1 mul
    gl64_t s1_459 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = tmp1_0 * s1_459;
    // Op 460: dim1x1 mul
    gl64_t s0_460 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 46, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 46, domainSize, nCols_1))];
    tmp1_0 = s0_460 * tmp1_0;
    // Op 461: dim1x1 add
    tmp1_0 = tmp1_3 + tmp1_0;
    // Op 462: dim1x1 sub
    gl64_t s0_462 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 63, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 63, domainSize, nCols_1))];
    tmp1_0 = s0_462 - tmp1_0;
    // Op 463: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 464: dim3x3 mul
    gl64_t s1_464_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_464_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_464_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA464 = (tmp3_0 + tmp3_1) * (s1_464_0 + s1_464_1);
    gl64_t kB464 = (tmp3_0 + tmp3_2) * (s1_464_0 + s1_464_2);
    gl64_t kC464 = (tmp3_1 + tmp3_2) * (s1_464_1 + s1_464_2);
    gl64_t kD464 = tmp3_0 * s1_464_0;
    gl64_t kE464 = tmp3_1 * s1_464_1;
    gl64_t kF464 = tmp3_2 * s1_464_2;
    gl64_t kG464 = kD464 - kE464;
    tmp3_0 = (kC464 + kG464) - kF464;
    tmp3_1 = ((((kA464 + kC464) - kE464) - kE464) - kD464);
    tmp3_2 = kB464 - kG464;
    // Op 465: dim1x1 mul
    gl64_t s0_465 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 50, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 50, domainSize, nCols_1))];
    gl64_t s1_465 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_465 * s1_465;
    // Op 466: dim1x1 mul
    gl64_t s0_466 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    tmp1_0 = s0_466 * tmp1_0;
    // Op 467: dim1x1 mul
    gl64_t s0_467 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp1_1 = s0_467 * tmp1_0;
    // Op 468: dim1x1 mul
    gl64_t s0_468 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 49, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 49, domainSize, nCols_1))];
    gl64_t s1_468 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_468 * s1_468;
    // Op 469: dim1x1 mul
    gl64_t s0_469 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    tmp1_3 = s0_469 * tmp1_0;
    // Op 470: dim1x1 mul
    gl64_t s0_470 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 50, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 50, domainSize, nCols_1))];
    gl64_t s1_470 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_470 * s1_470;
    // Op 471: dim1x1 mul
    gl64_t s0_471 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    tmp1_0 = s0_471 * tmp1_0;
    // Op 472: dim1x1 add
    tmp1_0 = tmp1_3 + tmp1_0;
    // Op 473: dim1x1 mul
    gl64_t s0_473 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_0 = s0_473 * tmp1_0;
    // Op 474: dim1x1 add
    tmp1_3 = tmp1_1 + tmp1_0;
    // Op 475: dim1x1 mul
    gl64_t s0_475 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 48, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 48, domainSize, nCols_1))];
    gl64_t s1_475 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_475 * s1_475;
    // Op 476: dim1x1 mul
    gl64_t s0_476 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    tmp1_1 = s0_476 * tmp1_0;
    // Op 477: dim1x1 mul
    gl64_t s0_477 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 49, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 49, domainSize, nCols_1))];
    gl64_t s1_477 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_477 * s1_477;
    // Op 478: dim1x1 mul
    gl64_t s0_478 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    tmp1_0 = s0_478 * tmp1_0;
    // Op 479: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 480: dim1x1 mul
    gl64_t s0_480 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 50, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 50, domainSize, nCols_1))];
    gl64_t s1_480 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_480 * s1_480;
    // Op 481: dim1x1 mul
    gl64_t s0_481 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    tmp1_0 = s0_481 * tmp1_0;
    // Op 482: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 483: dim1x1 mul
    gl64_t s0_483 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_483 * tmp1_0;
    // Op 484: dim1x1 add
    tmp1_3 = tmp1_3 + tmp1_0;
    // Op 485: dim1x1 sub_swap
    gl64_t s0_485 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 47, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 47, domainSize, nCols_1))];
    gl64_t s1_485 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_485 - s0_485;
    // Op 486: dim1x1 mul
    gl64_t s0_486 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 39, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 39, domainSize, nCols_1))];
    tmp1_0 = s0_486 * tmp1_0;
    // Op 487: dim1x1 add
    tmp1_3 = tmp1_3 + tmp1_0;
    // Op 488: dim1x1 sub_swap
    gl64_t s0_488 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 48, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 48, domainSize, nCols_1))];
    gl64_t s1_488 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_488 - s0_488;
    // Op 489: dim1x1 mul
    gl64_t s1_489 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = tmp1_0 * s1_489;
    // Op 490: dim1x1 mul
    gl64_t s0_490 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 40, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 40, domainSize, nCols_1))];
    tmp1_0 = s0_490 * tmp1_0;
    // Op 491: dim1x1 add
    tmp1_3 = tmp1_3 + tmp1_0;
    // Op 492: dim1x1 sub_swap
    gl64_t s0_492 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 49, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 49, domainSize, nCols_1))];
    gl64_t s1_492 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_492 - s0_492;
    // Op 493: dim1x1 mul
    gl64_t s1_493 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 * s1_493;
    // Op 494: dim1x1 mul
    gl64_t s0_494 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 41, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 41, domainSize, nCols_1))];
    tmp1_0 = s0_494 * tmp1_0;
    // Op 495: dim1x1 add
    tmp1_3 = tmp1_3 + tmp1_0;
    // Op 496: dim1x1 sub_swap
    gl64_t s0_496 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 50, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 50, domainSize, nCols_1))];
    gl64_t s1_496 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_496 - s0_496;
    // Op 497: dim1x1 mul
    gl64_t s1_497 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = tmp1_0 * s1_497;
    // Op 498: dim1x1 mul
    gl64_t s0_498 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 42, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 42, domainSize, nCols_1))];
    tmp1_0 = s0_498 * tmp1_0;
    // Op 499: dim1x1 add
    tmp1_0 = tmp1_3 + tmp1_0;
    // Op 500: dim1x1 sub
    gl64_t s0_500 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 64, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 64, domainSize, nCols_1))];
    tmp1_0 = s0_500 - tmp1_0;
    // Op 501: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 502: dim3x3 mul
    gl64_t s1_502_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_502_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_502_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA502 = (tmp3_0 + tmp3_1) * (s1_502_0 + s1_502_1);
    gl64_t kB502 = (tmp3_0 + tmp3_2) * (s1_502_0 + s1_502_2);
    gl64_t kC502 = (tmp3_1 + tmp3_2) * (s1_502_1 + s1_502_2);
    gl64_t kD502 = tmp3_0 * s1_502_0;
    gl64_t kE502 = tmp3_1 * s1_502_1;
    gl64_t kF502 = tmp3_2 * s1_502_2;
    gl64_t kG502 = kD502 - kE502;
    tmp3_0 = (kC502 + kG502) - kF502;
    tmp3_1 = ((((kA502 + kC502) - kE502) - kE502) - kD502);
    tmp3_2 = kB502 - kG502;
    // Op 503: dim1x1 mul
    gl64_t s0_503 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 54, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 54, domainSize, nCols_1))];
    gl64_t s1_503 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_503 * s1_503;
    // Op 504: dim1x1 mul
    gl64_t s0_504 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    tmp1_0 = s0_504 * tmp1_0;
    // Op 505: dim1x1 mul
    tmp1_1 = tmp1_2 * tmp1_0;
    // Op 506: dim1x1 mul
    gl64_t s0_506 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 53, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 53, domainSize, nCols_1))];
    gl64_t s1_506 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_506 * s1_506;
    // Op 507: dim1x1 mul
    gl64_t s0_507 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    tmp1_3 = s0_507 * tmp1_0;
    // Op 508: dim1x1 mul
    gl64_t s0_508 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 54, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 54, domainSize, nCols_1))];
    gl64_t s1_508 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_508 * s1_508;
    // Op 509: dim1x1 mul
    gl64_t s0_509 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    tmp1_0 = s0_509 * tmp1_0;
    // Op 510: dim1x1 add
    tmp1_0 = tmp1_3 + tmp1_0;
    // Op 511: dim1x1 mul
    gl64_t s0_511 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    tmp1_0 = s0_511 * tmp1_0;
    // Op 512: dim1x1 add
    tmp1_3 = tmp1_1 + tmp1_0;
    // Op 513: dim1x1 mul
    gl64_t s0_513 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 52, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 52, domainSize, nCols_1))];
    gl64_t s1_513 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_513 * s1_513;
    // Op 514: dim1x1 mul
    gl64_t s0_514 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    tmp1_1 = s0_514 * tmp1_0;
    // Op 515: dim1x1 mul
    gl64_t s0_515 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 53, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 53, domainSize, nCols_1))];
    gl64_t s1_515 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_515 * s1_515;
    // Op 516: dim1x1 mul
    gl64_t s0_516 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    tmp1_0 = s0_516 * tmp1_0;
    // Op 517: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 518: dim1x1 mul
    gl64_t s0_518 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 54, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 54, domainSize, nCols_1))];
    gl64_t s1_518 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_518 * s1_518;
    // Op 519: dim1x1 mul
    gl64_t s0_519 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    tmp1_0 = s0_519 * tmp1_0;
    // Op 520: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 521: dim1x1 mul
    gl64_t s0_521 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    tmp1_0 = s0_521 * tmp1_0;
    // Op 522: dim1x1 add
    tmp1_1 = tmp1_3 + tmp1_0;
    // Op 523: dim1x1 mul
    gl64_t s0_523 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 51, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 51, domainSize, nCols_1))];
    gl64_t s1_523 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    tmp1_3 = s0_523 * s1_523;
    // Op 524: dim1x1 mul
    gl64_t s0_524 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 52, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 52, domainSize, nCols_1))];
    gl64_t s1_524 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_524 * s1_524;
    // Op 525: dim1x1 mul
    gl64_t s0_525 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    tmp1_0 = s0_525 * tmp1_0;
    // Op 526: dim1x1 add
    tmp1_3 = tmp1_3 + tmp1_0;
    // Op 527: dim1x1 mul
    gl64_t s0_527 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 53, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 53, domainSize, nCols_1))];
    gl64_t s1_527 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_527 * s1_527;
    // Op 528: dim1x1 mul
    gl64_t s0_528 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    tmp1_0 = s0_528 * tmp1_0;
    // Op 529: dim1x1 add
    tmp1_3 = tmp1_3 + tmp1_0;
    // Op 530: dim1x1 mul
    gl64_t s0_530 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 54, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 54, domainSize, nCols_1))];
    gl64_t s1_530 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_530 * s1_530;
    // Op 531: dim1x1 mul
    gl64_t s0_531 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    tmp1_0 = s0_531 * tmp1_0;
    // Op 532: dim1x1 add
    tmp1_0 = tmp1_3 + tmp1_0;
    // Op 533: dim1x1 mul
    gl64_t s0_533 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    tmp1_0 = s0_533 * tmp1_0;
    // Op 534: dim1x1 add
    tmp1_3 = tmp1_1 + tmp1_0;
    // Op 535: dim1x1 mul
    gl64_t s0_535 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 51, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 51, domainSize, nCols_1))];
    gl64_t s1_535 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    tmp1_1 = s0_535 * s1_535;
    // Op 536: dim1x1 mul
    gl64_t s0_536 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 52, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 52, domainSize, nCols_1))];
    gl64_t s1_536 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_536 * s1_536;
    // Op 537: dim1x1 mul
    gl64_t s0_537 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    tmp1_0 = s0_537 * tmp1_0;
    // Op 538: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 539: dim1x1 mul
    gl64_t s0_539 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 53, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 53, domainSize, nCols_1))];
    gl64_t s1_539 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_539 * s1_539;
    // Op 540: dim1x1 mul
    gl64_t s0_540 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    tmp1_0 = s0_540 * tmp1_0;
    // Op 541: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 542: dim1x1 mul
    gl64_t s0_542 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 54, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 54, domainSize, nCols_1))];
    gl64_t s1_542 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_542 * s1_542;
    // Op 543: dim1x1 mul
    gl64_t s0_543 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 27, domainSize, nCols_1))];
    tmp1_0 = s0_543 * tmp1_0;
    // Op 544: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 545: dim1x1 mul
    gl64_t s0_545 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp1_0 = s0_545 * tmp1_0;
    // Op 546: dim1x1 add
    tmp1_1 = tmp1_3 + tmp1_0;
    // Op 547: dim1x1 mul
    gl64_t s0_547 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 51, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 51, domainSize, nCols_1))];
    gl64_t s1_547 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    tmp1_3 = s0_547 * s1_547;
    // Op 548: dim1x1 mul
    gl64_t s0_548 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 52, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 52, domainSize, nCols_1))];
    gl64_t s1_548 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_548 * s1_548;
    // Op 549: dim1x1 mul
    gl64_t s0_549 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    tmp1_0 = s0_549 * tmp1_0;
    // Op 550: dim1x1 add
    tmp1_3 = tmp1_3 + tmp1_0;
    // Op 551: dim1x1 mul
    gl64_t s0_551 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 53, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 53, domainSize, nCols_1))];
    gl64_t s1_551 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_551 * s1_551;
    // Op 552: dim1x1 mul
    gl64_t s0_552 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 27, domainSize, nCols_1))];
    tmp1_0 = s0_552 * tmp1_0;
    // Op 553: dim1x1 add
    tmp1_3 = tmp1_3 + tmp1_0;
    // Op 554: dim1x1 mul
    gl64_t s0_554 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 54, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 54, domainSize, nCols_1))];
    gl64_t s1_554 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_554 * s1_554;
    // Op 555: dim1x1 mul
    gl64_t s0_555 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    tmp1_0 = s0_555 * tmp1_0;
    // Op 556: dim1x1 add
    tmp1_0 = tmp1_3 + tmp1_0;
    // Op 557: dim1x1 mul
    gl64_t s0_557 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_0 = s0_557 * tmp1_0;
    // Op 558: dim1x1 add
    tmp1_3 = tmp1_1 + tmp1_0;
    // Op 559: dim1x1 mul
    gl64_t s0_559 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 51, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 51, domainSize, nCols_1))];
    gl64_t s1_559 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    tmp1_1 = s0_559 * s1_559;
    // Op 560: dim1x1 mul
    gl64_t s0_560 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 52, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 52, domainSize, nCols_1))];
    gl64_t s1_560 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_560 * s1_560;
    // Op 561: dim1x1 mul
    gl64_t s0_561 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 27, domainSize, nCols_1))];
    tmp1_0 = s0_561 * tmp1_0;
    // Op 562: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 563: dim1x1 mul
    gl64_t s0_563 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 53, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 53, domainSize, nCols_1))];
    gl64_t s1_563 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_563 * s1_563;
    // Op 564: dim1x1 mul
    gl64_t s0_564 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    tmp1_0 = s0_564 * tmp1_0;
    // Op 565: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_0;
    // Op 566: dim1x1 mul
    gl64_t s0_566 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 54, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 54, domainSize, nCols_1))];
    gl64_t s1_566 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_566 * s1_566;
    // Op 567: dim1x1 mul
    gl64_t s0_567 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    tmp1_0 = s0_567 * tmp1_0;
    // Op 568: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 569: dim1x1 mul
    gl64_t s0_569 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_569 * tmp1_0;
    // Op 570: dim1x1 add
    tmp1_3 = tmp1_3 + tmp1_0;
    // Op 571: dim1x1 sub_swap
    gl64_t s0_571 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 51, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 51, domainSize, nCols_1))];
    gl64_t s1_571 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_571 - s0_571;
    // Op 572: dim1x1 mul
    gl64_t s0_572 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 43, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 43, domainSize, nCols_1))];
    tmp1_0 = s0_572 * tmp1_0;
    // Op 573: dim1x1 add
    tmp1_3 = tmp1_3 + tmp1_0;
    // Op 574: dim1x1 sub_swap
    gl64_t s0_574 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 52, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 52, domainSize, nCols_1))];
    gl64_t s1_574 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_574 - s0_574;
    // Op 575: dim1x1 mul
    gl64_t s1_575 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = tmp1_0 * s1_575;
    // Op 576: dim1x1 mul
    gl64_t s0_576 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 44, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 44, domainSize, nCols_1))];
    tmp1_0 = s0_576 * tmp1_0;
    // Op 577: dim1x1 add
    tmp1_3 = tmp1_3 + tmp1_0;
    // Op 578: dim1x1 sub_swap
    gl64_t s0_578 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 53, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 53, domainSize, nCols_1))];
    gl64_t s1_578 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_578 - s0_578;
    // Op 579: dim1x1 mul
    gl64_t s1_579 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 * s1_579;
    // Op 580: dim1x1 mul
    gl64_t s0_580 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 45, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 45, domainSize, nCols_1))];
    tmp1_0 = s0_580 * tmp1_0;
    // Op 581: dim1x1 add
    tmp1_3 = tmp1_3 + tmp1_0;
    // Op 582: dim1x1 sub_swap
    gl64_t s0_582 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 54, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 54, domainSize, nCols_1))];
    gl64_t s1_582 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_582 - s0_582;
    // Op 583: dim1x1 mul
    gl64_t s1_583 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = tmp1_0 * s1_583;
    // Op 584: dim1x1 mul
    gl64_t s0_584 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 46, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 46, domainSize, nCols_1))];
    tmp1_0 = s0_584 * tmp1_0;
    // Op 585: dim1x1 add
    tmp1_0 = tmp1_3 + tmp1_0;
    // Op 586: dim1x1 sub
    gl64_t s0_586 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 65, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 65, domainSize, nCols_1))];
    tmp1_0 = s0_586 - tmp1_0;
    // Op 587: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 588: dim3x3 mul
    gl64_t s1_588_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_588_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_588_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA588 = (tmp3_0 + tmp3_1) * (s1_588_0 + s1_588_1);
    gl64_t kB588 = (tmp3_0 + tmp3_2) * (s1_588_0 + s1_588_2);
    gl64_t kC588 = (tmp3_1 + tmp3_2) * (s1_588_1 + s1_588_2);
    gl64_t kD588 = tmp3_0 * s1_588_0;
    gl64_t kE588 = tmp3_1 * s1_588_1;
    gl64_t kF588 = tmp3_2 * s1_588_2;
    gl64_t kG588 = kD588 - kE588;
    tmp3_0 = (kC588 + kG588) - kF588;
    tmp3_1 = ((((kA588 + kC588) - kE588) - kE588) - kD588);
    tmp3_2 = kB588 - kG588;
    // Op 589: dim1x1 sub
    gl64_t s0_589 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 64, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 64, domainSize, nCols_1))];
    gl64_t s1_589 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 62, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 62, domainSize, nCols_1))];
    tmp1_0 = s0_589 - s1_589;
    // Op 590: dim1x1 mul
    gl64_t s0_590 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    tmp1_0 = s0_590 * tmp1_0;
    // Op 591: dim1x1 add
    gl64_t s0_591 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 62, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 62, domainSize, nCols_1))];
    tmp1_0 = s0_591 + tmp1_0;
    // Op 592: dim1x1 sub
    gl64_t s0_592 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 60, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 60, domainSize, nCols_1))];
    tmp1_0 = s0_592 - tmp1_0;
    // Op 593: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 594: dim3x3 mul
    gl64_t s1_594_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_594_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_594_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA594 = (tmp3_0 + tmp3_1) * (s1_594_0 + s1_594_1);
    gl64_t kB594 = (tmp3_0 + tmp3_2) * (s1_594_0 + s1_594_2);
    gl64_t kC594 = (tmp3_1 + tmp3_2) * (s1_594_1 + s1_594_2);
    gl64_t kD594 = tmp3_0 * s1_594_0;
    gl64_t kE594 = tmp3_1 * s1_594_1;
    gl64_t kF594 = tmp3_2 * s1_594_2;
    gl64_t kG594 = kD594 - kE594;
    tmp3_0 = (kC594 + kG594) - kF594;
    tmp3_1 = ((((kA594 + kC594) - kE594) - kE594) - kD594);
    tmp3_2 = kB594 - kG594;
    // Op 595: dim1x1 sub
    gl64_t s0_595 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 65, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 65, domainSize, nCols_1))];
    gl64_t s1_595 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 63, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 63, domainSize, nCols_1))];
    tmp1_0 = s0_595 - s1_595;
    // Op 596: dim1x1 mul
    gl64_t s0_596 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    tmp1_0 = s0_596 * tmp1_0;
    // Op 597: dim1x1 add
    gl64_t s0_597 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 63, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 63, domainSize, nCols_1))];
    tmp1_0 = s0_597 + tmp1_0;
    // Op 598: dim1x1 sub
    gl64_t s0_598 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 61, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 61, domainSize, nCols_1))];
    tmp1_0 = s0_598 - tmp1_0;
    // Op 599: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 600: dim3x3 mul
    gl64_t s1_600_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_600_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_600_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA600 = (tmp3_0 + tmp3_1) * (s1_600_0 + s1_600_1);
    gl64_t kB600 = (tmp3_0 + tmp3_2) * (s1_600_0 + s1_600_2);
    gl64_t kC600 = (tmp3_1 + tmp3_2) * (s1_600_1 + s1_600_2);
    gl64_t kD600 = tmp3_0 * s1_600_0;
    gl64_t kE600 = tmp3_1 * s1_600_1;
    gl64_t kF600 = tmp3_2 * s1_600_2;
    gl64_t kG600 = kD600 - kE600;
    tmp3_0 = (kC600 + kG600) - kF600;
    tmp3_1 = ((((kA600 + kC600) - kE600) - kE600) - kD600);
    tmp3_2 = kB600 - kG600;
    // Op 601: dim1x1 mul
    gl64_t s0_601 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_601 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_2))];
    tmp1_0 = s0_601 * s1_601;
    // Op 602: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 603: dim3x3 mul
    gl64_t s1_603_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_603_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_603_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA603 = (tmp3_0 + tmp3_1) * (s1_603_0 + s1_603_1);
    gl64_t kB603 = (tmp3_0 + tmp3_2) * (s1_603_0 + s1_603_2);
    gl64_t kC603 = (tmp3_1 + tmp3_2) * (s1_603_1 + s1_603_2);
    gl64_t kD603 = tmp3_0 * s1_603_0;
    gl64_t kE603 = tmp3_1 * s1_603_1;
    gl64_t kF603 = tmp3_2 * s1_603_2;
    gl64_t kG603 = kD603 - kE603;
    tmp3_0 = (kC603 + kG603) - kF603;
    tmp3_1 = ((((kA603 + kC603) - kE603) - kE603) - kD603);
    tmp3_2 = kB603 - kG603;
    // Op 604: dim1x1 mul
    gl64_t s0_604 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_604 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 31, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 31, domainSize, nCols_2))];
    tmp1_0 = s0_604 * s1_604;
    // Op 605: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 606: dim3x3 mul
    gl64_t s1_606_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_606_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_606_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA606 = (tmp3_0 + tmp3_1) * (s1_606_0 + s1_606_1);
    gl64_t kB606 = (tmp3_0 + tmp3_2) * (s1_606_0 + s1_606_2);
    gl64_t kC606 = (tmp3_1 + tmp3_2) * (s1_606_1 + s1_606_2);
    gl64_t kD606 = tmp3_0 * s1_606_0;
    gl64_t kE606 = tmp3_1 * s1_606_1;
    gl64_t kF606 = tmp3_2 * s1_606_2;
    gl64_t kG606 = kD606 - kE606;
    tmp3_12 = (kC606 + kG606) - kF606;
    tmp3_13 = ((((kA606 + kC606) - kE606) - kE606) - kD606);
    tmp3_14 = kB606 - kG606;
    // Op 607: dim3x1 mul
    gl64_t s0_607_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_607_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_607_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_607 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    tmp3_0 = s0_607_0 * s1_607; tmp3_1 = s0_607_1 * s1_607; tmp3_2 = s0_607_2 * s1_607;
    // Op 608: dim3x1 add
    gl64_t s1_608 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_608; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 609: dim3x3 mul
    gl64_t s1_609_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_609_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_609_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA609 = (tmp3_0 + tmp3_1) * (s1_609_0 + s1_609_1);
    gl64_t kB609 = (tmp3_0 + tmp3_2) * (s1_609_0 + s1_609_2);
    gl64_t kC609 = (tmp3_1 + tmp3_2) * (s1_609_1 + s1_609_2);
    gl64_t kD609 = tmp3_0 * s1_609_0;
    gl64_t kE609 = tmp3_1 * s1_609_1;
    gl64_t kF609 = tmp3_2 * s1_609_2;
    gl64_t kG609 = kD609 - kE609;
    tmp3_0 = (kC609 + kG609) - kF609;
    tmp3_1 = ((((kA609 + kC609) - kE609) - kE609) - kD609);
    tmp3_2 = kB609 - kG609;
    // Op 610: dim3x1 add
    gl64_t s1_610 = *(gl64_t*)&expressions_params[9][7];
    tmp3_9 = tmp3_0 + s1_610; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 611: dim3x3 add
    gl64_t s1_611_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_611_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_611_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_611_0; tmp3_4 = tmp3_10 + s1_611_1; tmp3_5 = tmp3_11 + s1_611_2;
    // Op 612: dim3x1 mul
    gl64_t s0_612_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_612_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_612_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_612 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 27, domainSize, nCols_1))];
    tmp3_0 = s0_612_0 * s1_612; tmp3_1 = s0_612_1 * s1_612; tmp3_2 = s0_612_2 * s1_612;
    // Op 613: dim3x1 add
    gl64_t s1_613 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_613; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 614: dim3x3 mul
    gl64_t s1_614_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_614_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_614_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA614 = (tmp3_0 + tmp3_1) * (s1_614_0 + s1_614_1);
    gl64_t kB614 = (tmp3_0 + tmp3_2) * (s1_614_0 + s1_614_2);
    gl64_t kC614 = (tmp3_1 + tmp3_2) * (s1_614_1 + s1_614_2);
    gl64_t kD614 = tmp3_0 * s1_614_0;
    gl64_t kE614 = tmp3_1 * s1_614_1;
    gl64_t kF614 = tmp3_2 * s1_614_2;
    gl64_t kG614 = kD614 - kE614;
    tmp3_0 = (kC614 + kG614) - kF614;
    tmp3_1 = ((((kA614 + kC614) - kE614) - kE614) - kD614);
    tmp3_2 = kB614 - kG614;
    // Op 615: dim3x1 add
    gl64_t s1_615 = *(gl64_t*)&expressions_params[9][7];
    tmp3_6 = tmp3_0 + s1_615; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 616: dim3x3 add
    gl64_t s1_616_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_616_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_616_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_616_0; tmp3_1 = tmp3_7 + s1_616_1; tmp3_2 = tmp3_8 + s1_616_2;
    // Op 617: dim3x3 mul
    gl64_t kA617 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB617 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC617 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD617 = tmp3_3 * tmp3_0;
    gl64_t kE617 = tmp3_4 * tmp3_1;
    gl64_t kF617 = tmp3_5 * tmp3_2;
    gl64_t kG617 = kD617 - kE617;
    tmp3_0 = (kC617 + kG617) - kF617;
    tmp3_1 = ((((kA617 + kC617) - kE617) - kE617) - kD617);
    tmp3_2 = kB617 - kG617;
    // Op 618: dim3x3 mul
    gl64_t s0_618_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+0, domainSize, nCols_2))];
    gl64_t s0_618_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+1, domainSize, nCols_2))];
    gl64_t s0_618_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+2, domainSize, nCols_2))];
    gl64_t kA618 = (s0_618_0 + s0_618_1) * (tmp3_0 + tmp3_1);
    gl64_t kB618 = (s0_618_0 + s0_618_2) * (tmp3_0 + tmp3_2);
    gl64_t kC618 = (s0_618_1 + s0_618_2) * (tmp3_1 + tmp3_2);
    gl64_t kD618 = s0_618_0 * tmp3_0;
    gl64_t kE618 = s0_618_1 * tmp3_1;
    gl64_t kF618 = s0_618_2 * tmp3_2;
    gl64_t kG618 = kD618 - kE618;
    tmp3_0 = (kC618 + kG618) - kF618;
    tmp3_1 = ((((kA618 + kC618) - kE618) - kE618) - kD618);
    tmp3_2 = kB618 - kG618;
    // Op 619: dim1x1 add
    gl64_t s0_619 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_619 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    tmp1_0 = s0_619 + s1_619;
    // Op 620: dim1x1 add
    gl64_t s0_620 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    tmp1_6 = s0_620 + tmp1_0;
    // Op 621: dim1x1 sub_swap
    gl64_t s1_621 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s1_621 - tmp1_6;
    // Op 622: dim3x3 add
    gl64_t s1_622_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_622_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_622_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_622_0; tmp3_7 = tmp3_7 + s1_622_1; tmp3_8 = tmp3_8 + s1_622_2;
    // Op 623: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 624: dim1x1 sub_swap
    gl64_t s1_624 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s1_624 - tmp1_6;
    // Op 625: dim3x3 add
    gl64_t s1_625_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_625_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_625_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_625_0; tmp3_10 = tmp3_10 + s1_625_1; tmp3_11 = tmp3_11 + s1_625_2;
    // Op 626: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 627: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 628: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 629: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 630: dim3x3 mul
    gl64_t s1_630_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_630_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_630_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA630 = (tmp3_0 + tmp3_1) * (s1_630_0 + s1_630_1);
    gl64_t kB630 = (tmp3_0 + tmp3_2) * (s1_630_0 + s1_630_2);
    gl64_t kC630 = (tmp3_1 + tmp3_2) * (s1_630_1 + s1_630_2);
    gl64_t kD630 = tmp3_0 * s1_630_0;
    gl64_t kE630 = tmp3_1 * s1_630_1;
    gl64_t kF630 = tmp3_2 * s1_630_2;
    gl64_t kG630 = kD630 - kE630;
    tmp3_3 = (kC630 + kG630) - kF630;
    tmp3_4 = ((((kA630 + kC630) - kE630) - kE630) - kD630);
    tmp3_5 = kB630 - kG630;
    // Op 631: dim3x1 mul
    gl64_t s0_631_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_631_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_631_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_631 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    tmp3_0 = s0_631_0 * s1_631; tmp3_1 = s0_631_1 * s1_631; tmp3_2 = s0_631_2 * s1_631;
    // Op 632: dim3x1 add
    gl64_t s1_632 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_632; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    gl64_t s1_634 = *(gl64_t*)&expressions_params[9][7];
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
    gl64_t s1_636 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 31, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 31, domainSize, nCols_1))];
    tmp3_0 = s0_636_0 * s1_636; tmp3_1 = s0_636_1 * s1_636; tmp3_2 = s0_636_2 * s1_636;
    // Op 637: dim3x1 add
    gl64_t s1_637 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 32, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 32, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_637; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 638: dim3x3 mul
    gl64_t s1_638_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_638_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_638_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA638 = (tmp3_0 + tmp3_1) * (s1_638_0 + s1_638_1);
    gl64_t kB638 = (tmp3_0 + tmp3_2) * (s1_638_0 + s1_638_2);
    gl64_t kC638 = (tmp3_1 + tmp3_2) * (s1_638_1 + s1_638_2);
    gl64_t kD638 = tmp3_0 * s1_638_0;
    gl64_t kE638 = tmp3_1 * s1_638_1;
    gl64_t kF638 = tmp3_2 * s1_638_2;
    gl64_t kG638 = kD638 - kE638;
    tmp3_0 = (kC638 + kG638) - kF638;
    tmp3_1 = ((((kA638 + kC638) - kE638) - kE638) - kD638);
    tmp3_2 = kB638 - kG638;
    // Op 639: dim3x1 add
    gl64_t s1_639 = *(gl64_t*)&expressions_params[9][7];
    tmp3_6 = tmp3_0 + s1_639; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 640: dim3x3 add
    gl64_t s1_640_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_640_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_640_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_640_0; tmp3_1 = tmp3_7 + s1_640_1; tmp3_2 = tmp3_8 + s1_640_2;
    // Op 641: dim3x3 mul
    gl64_t kA641 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB641 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC641 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD641 = tmp3_12 * tmp3_0;
    gl64_t kE641 = tmp3_13 * tmp3_1;
    gl64_t kF641 = tmp3_14 * tmp3_2;
    gl64_t kG641 = kD641 - kE641;
    tmp3_0 = (kC641 + kG641) - kF641;
    tmp3_1 = ((((kA641 + kC641) - kE641) - kE641) - kD641);
    tmp3_2 = kB641 - kG641;
    // Op 642: dim3x3 mul
    gl64_t s0_642_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+0, domainSize, nCols_2))];
    gl64_t s0_642_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+1, domainSize, nCols_2))];
    gl64_t s0_642_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+2, domainSize, nCols_2))];
    gl64_t kA642 = (s0_642_0 + s0_642_1) * (tmp3_0 + tmp3_1);
    gl64_t kB642 = (s0_642_0 + s0_642_2) * (tmp3_0 + tmp3_2);
    gl64_t kC642 = (s0_642_1 + s0_642_2) * (tmp3_1 + tmp3_2);
    gl64_t kD642 = s0_642_0 * tmp3_0;
    gl64_t kE642 = s0_642_1 * tmp3_1;
    gl64_t kF642 = s0_642_2 * tmp3_2;
    gl64_t kG642 = kD642 - kE642;
    tmp3_0 = (kC642 + kG642) - kF642;
    tmp3_1 = ((((kA642 + kC642) - kE642) - kE642) - kD642);
    tmp3_2 = kB642 - kG642;
    // Op 643: dim1x1 sub_swap
    gl64_t s1_643 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s1_643 - tmp1_6;
    // Op 644: dim3x3 add
    gl64_t s1_644_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_644_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_644_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_644_0; tmp3_7 = tmp3_7 + s1_644_1; tmp3_8 = tmp3_8 + s1_644_2;
    // Op 645: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 646: dim1x1 sub_swap
    gl64_t s1_646 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s1_646 - tmp1_6;
    // Op 647: dim3x3 add
    gl64_t s1_647_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_647_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_647_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_647_0; tmp3_10 = tmp3_10 + s1_647_1; tmp3_11 = tmp3_11 + s1_647_2;
    // Op 648: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 649: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 650: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 651: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 652: dim3x3 mul
    gl64_t s1_652_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_652_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_652_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA652 = (tmp3_0 + tmp3_1) * (s1_652_0 + s1_652_1);
    gl64_t kB652 = (tmp3_0 + tmp3_2) * (s1_652_0 + s1_652_2);
    gl64_t kC652 = (tmp3_1 + tmp3_2) * (s1_652_1 + s1_652_2);
    gl64_t kD652 = tmp3_0 * s1_652_0;
    gl64_t kE652 = tmp3_1 * s1_652_1;
    gl64_t kF652 = tmp3_2 * s1_652_2;
    gl64_t kG652 = kD652 - kE652;
    tmp3_12 = (kC652 + kG652) - kF652;
    tmp3_13 = ((((kA652 + kC652) - kE652) - kE652) - kD652);
    tmp3_14 = kB652 - kG652;
    // Op 653: dim3x1 mul
    gl64_t s0_653_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_653_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_653_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_653 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 33, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 33, domainSize, nCols_1))];
    tmp3_0 = s0_653_0 * s1_653; tmp3_1 = s0_653_1 * s1_653; tmp3_2 = s0_653_2 * s1_653;
    // Op 654: dim3x1 add
    gl64_t s1_654 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 34, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 34, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_654; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    gl64_t s1_656 = *(gl64_t*)&expressions_params[9][7];
    tmp3_9 = tmp3_0 + s1_656; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 657: dim3x3 add
    gl64_t s1_657_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_657_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_657_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_657_0; tmp3_4 = tmp3_10 + s1_657_1; tmp3_5 = tmp3_11 + s1_657_2;
    // Op 658: dim3x1 mul
    gl64_t s0_658_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_658_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_658_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_658 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 35, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 35, domainSize, nCols_1))];
    tmp3_0 = s0_658_0 * s1_658; tmp3_1 = s0_658_1 * s1_658; tmp3_2 = s0_658_2 * s1_658;
    // Op 659: dim3x1 add
    gl64_t s1_659 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_659; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 660: dim3x3 mul
    gl64_t s1_660_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_660_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_660_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA660 = (tmp3_0 + tmp3_1) * (s1_660_0 + s1_660_1);
    gl64_t kB660 = (tmp3_0 + tmp3_2) * (s1_660_0 + s1_660_2);
    gl64_t kC660 = (tmp3_1 + tmp3_2) * (s1_660_1 + s1_660_2);
    gl64_t kD660 = tmp3_0 * s1_660_0;
    gl64_t kE660 = tmp3_1 * s1_660_1;
    gl64_t kF660 = tmp3_2 * s1_660_2;
    gl64_t kG660 = kD660 - kE660;
    tmp3_0 = (kC660 + kG660) - kF660;
    tmp3_1 = ((((kA660 + kC660) - kE660) - kE660) - kD660);
    tmp3_2 = kB660 - kG660;
    // Op 661: dim3x1 add
    gl64_t s1_661 = *(gl64_t*)&expressions_params[9][7];
    tmp3_6 = tmp3_0 + s1_661; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 662: dim3x3 add
    gl64_t s1_662_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_662_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_662_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_662_0; tmp3_1 = tmp3_7 + s1_662_1; tmp3_2 = tmp3_8 + s1_662_2;
    // Op 663: dim3x3 mul
    gl64_t kA663 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB663 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC663 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD663 = tmp3_3 * tmp3_0;
    gl64_t kE663 = tmp3_4 * tmp3_1;
    gl64_t kF663 = tmp3_5 * tmp3_2;
    gl64_t kG663 = kD663 - kE663;
    tmp3_0 = (kC663 + kG663) - kF663;
    tmp3_1 = ((((kA663 + kC663) - kE663) - kE663) - kD663);
    tmp3_2 = kB663 - kG663;
    // Op 664: dim3x3 mul
    uint64_t s0_664_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_2));
    gl64_t s0_664_0 = *(gl64_t*)&dParams->aux_trace[s0_664_pos];
    gl64_t s0_664_1 = *(gl64_t*)&dParams->aux_trace[s0_664_pos + TILE_HEIGHT];
    gl64_t s0_664_2 = *(gl64_t*)&dParams->aux_trace[s0_664_pos + 2*TILE_HEIGHT];
    gl64_t kA664 = (s0_664_0 + s0_664_1) * (tmp3_0 + tmp3_1);
    gl64_t kB664 = (s0_664_0 + s0_664_2) * (tmp3_0 + tmp3_2);
    gl64_t kC664 = (s0_664_1 + s0_664_2) * (tmp3_1 + tmp3_2);
    gl64_t kD664 = s0_664_0 * tmp3_0;
    gl64_t kE664 = s0_664_1 * tmp3_1;
    gl64_t kF664 = s0_664_2 * tmp3_2;
    gl64_t kG664 = kD664 - kE664;
    tmp3_0 = (kC664 + kG664) - kF664;
    tmp3_1 = ((((kA664 + kC664) - kE664) - kE664) - kD664);
    tmp3_2 = kB664 - kG664;
    // Op 665: dim1x1 sub_swap
    gl64_t s1_665 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s1_665 - tmp1_6;
    // Op 666: dim3x3 add
    gl64_t s1_666_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_666_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_666_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_666_0; tmp3_7 = tmp3_7 + s1_666_1; tmp3_8 = tmp3_8 + s1_666_2;
    // Op 667: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 668: dim1x1 sub_swap
    gl64_t s1_668 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s1_668 - tmp1_6;
    // Op 669: dim3x3 add
    gl64_t s1_669_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_669_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_669_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_669_0; tmp3_10 = tmp3_10 + s1_669_1; tmp3_11 = tmp3_11 + s1_669_2;
    // Op 670: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 671: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 672: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 673: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 674: dim3x3 mul
    gl64_t s1_674_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_674_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_674_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA674 = (tmp3_0 + tmp3_1) * (s1_674_0 + s1_674_1);
    gl64_t kB674 = (tmp3_0 + tmp3_2) * (s1_674_0 + s1_674_2);
    gl64_t kC674 = (tmp3_1 + tmp3_2) * (s1_674_1 + s1_674_2);
    gl64_t kD674 = tmp3_0 * s1_674_0;
    gl64_t kE674 = tmp3_1 * s1_674_1;
    gl64_t kF674 = tmp3_2 * s1_674_2;
    gl64_t kG674 = kD674 - kE674;
    tmp3_3 = (kC674 + kG674) - kF674;
    tmp3_4 = ((((kA674 + kC674) - kE674) - kE674) - kD674);
    tmp3_5 = kB674 - kG674;
    // Op 675: dim3x1 mul
    gl64_t s0_675_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_675_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_675_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_675 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 37, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 37, domainSize, nCols_1))];
    tmp3_0 = s0_675_0 * s1_675; tmp3_1 = s0_675_1 * s1_675; tmp3_2 = s0_675_2 * s1_675;
    // Op 676: dim3x1 add
    gl64_t s1_676 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 38, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 38, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_676; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 677: dim3x3 mul
    gl64_t s1_677_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_677_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_677_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA677 = (tmp3_0 + tmp3_1) * (s1_677_0 + s1_677_1);
    gl64_t kB677 = (tmp3_0 + tmp3_2) * (s1_677_0 + s1_677_2);
    gl64_t kC677 = (tmp3_1 + tmp3_2) * (s1_677_1 + s1_677_2);
    gl64_t kD677 = tmp3_0 * s1_677_0;
    gl64_t kE677 = tmp3_1 * s1_677_1;
    gl64_t kF677 = tmp3_2 * s1_677_2;
    gl64_t kG677 = kD677 - kE677;
    tmp3_0 = (kC677 + kG677) - kF677;
    tmp3_1 = ((((kA677 + kC677) - kE677) - kE677) - kD677);
    tmp3_2 = kB677 - kG677;
    // Op 678: dim3x1 add
    gl64_t s1_678 = *(gl64_t*)&expressions_params[9][7];
    tmp3_9 = tmp3_0 + s1_678; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 679: dim3x3 add
    gl64_t s1_679_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_679_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_679_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_12 = tmp3_9 + s1_679_0; tmp3_13 = tmp3_10 + s1_679_1; tmp3_14 = tmp3_11 + s1_679_2;
    // Op 680: dim3x1 mul
    gl64_t s0_680_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_680_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_680_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_680 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 39, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 39, domainSize, nCols_1))];
    tmp3_0 = s0_680_0 * s1_680; tmp3_1 = s0_680_1 * s1_680; tmp3_2 = s0_680_2 * s1_680;
    // Op 681: dim3x1 add
    gl64_t s1_681 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 40, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 40, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_681; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 682: dim3x3 mul
    gl64_t s1_682_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_682_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_682_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA682 = (tmp3_0 + tmp3_1) * (s1_682_0 + s1_682_1);
    gl64_t kB682 = (tmp3_0 + tmp3_2) * (s1_682_0 + s1_682_2);
    gl64_t kC682 = (tmp3_1 + tmp3_2) * (s1_682_1 + s1_682_2);
    gl64_t kD682 = tmp3_0 * s1_682_0;
    gl64_t kE682 = tmp3_1 * s1_682_1;
    gl64_t kF682 = tmp3_2 * s1_682_2;
    gl64_t kG682 = kD682 - kE682;
    tmp3_0 = (kC682 + kG682) - kF682;
    tmp3_1 = ((((kA682 + kC682) - kE682) - kE682) - kD682);
    tmp3_2 = kB682 - kG682;
    // Op 683: dim3x1 add
    gl64_t s1_683 = *(gl64_t*)&expressions_params[9][7];
    tmp3_6 = tmp3_0 + s1_683; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 684: dim3x3 add
    gl64_t s1_684_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_684_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_684_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_684_0; tmp3_1 = tmp3_7 + s1_684_1; tmp3_2 = tmp3_8 + s1_684_2;
    // Op 685: dim3x3 mul
    gl64_t kA685 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB685 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC685 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD685 = tmp3_12 * tmp3_0;
    gl64_t kE685 = tmp3_13 * tmp3_1;
    gl64_t kF685 = tmp3_14 * tmp3_2;
    gl64_t kG685 = kD685 - kE685;
    tmp3_0 = (kC685 + kG685) - kF685;
    tmp3_1 = ((((kA685 + kC685) - kE685) - kE685) - kD685);
    tmp3_2 = kB685 - kG685;
    // Op 686: dim3x3 mul
    uint64_t s0_686_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_2));
    gl64_t s0_686_0 = *(gl64_t*)&dParams->aux_trace[s0_686_pos];
    gl64_t s0_686_1 = *(gl64_t*)&dParams->aux_trace[s0_686_pos + TILE_HEIGHT];
    gl64_t s0_686_2 = *(gl64_t*)&dParams->aux_trace[s0_686_pos + 2*TILE_HEIGHT];
    gl64_t kA686 = (s0_686_0 + s0_686_1) * (tmp3_0 + tmp3_1);
    gl64_t kB686 = (s0_686_0 + s0_686_2) * (tmp3_0 + tmp3_2);
    gl64_t kC686 = (s0_686_1 + s0_686_2) * (tmp3_1 + tmp3_2);
    gl64_t kD686 = s0_686_0 * tmp3_0;
    gl64_t kE686 = s0_686_1 * tmp3_1;
    gl64_t kF686 = s0_686_2 * tmp3_2;
    gl64_t kG686 = kD686 - kE686;
    tmp3_0 = (kC686 + kG686) - kF686;
    tmp3_1 = ((((kA686 + kC686) - kE686) - kE686) - kD686);
    tmp3_2 = kB686 - kG686;
    // Op 687: dim1x1 sub_swap
    gl64_t s1_687 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s1_687 - tmp1_6;
    // Op 688: dim3x3 add
    gl64_t s1_688_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_688_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_688_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_688_0; tmp3_7 = tmp3_7 + s1_688_1; tmp3_8 = tmp3_8 + s1_688_2;
    // Op 689: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 690: dim1x1 sub_swap
    gl64_t s1_690 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s1_690 - tmp1_5;
    // Op 691: dim3x3 add
    gl64_t s1_691_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_691_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_691_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_691_0; tmp3_10 = tmp3_10 + s1_691_1; tmp3_11 = tmp3_11 + s1_691_2;
    // Op 692: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 693: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 694: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 695: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 696: dim3x3 mul
    gl64_t s1_696_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_696_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_696_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA696 = (tmp3_0 + tmp3_1) * (s1_696_0 + s1_696_1);
    gl64_t kB696 = (tmp3_0 + tmp3_2) * (s1_696_0 + s1_696_2);
    gl64_t kC696 = (tmp3_1 + tmp3_2) * (s1_696_1 + s1_696_2);
    gl64_t kD696 = tmp3_0 * s1_696_0;
    gl64_t kE696 = tmp3_1 * s1_696_1;
    gl64_t kF696 = tmp3_2 * s1_696_2;
    gl64_t kG696 = kD696 - kE696;
    tmp3_12 = (kC696 + kG696) - kF696;
    tmp3_13 = ((((kA696 + kC696) - kE696) - kE696) - kD696);
    tmp3_14 = kB696 - kG696;
    // Op 697: dim3x1 mul
    gl64_t s0_697_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_697_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_697_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_697 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 41, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 41, domainSize, nCols_1))];
    tmp3_0 = s0_697_0 * s1_697; tmp3_1 = s0_697_1 * s1_697; tmp3_2 = s0_697_2 * s1_697;
    // Op 698: dim3x1 add
    gl64_t s1_698 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 42, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 42, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_698; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 700: dim3x1 add
    gl64_t s1_700 = *(gl64_t*)&expressions_params[9][7];
    tmp3_9 = tmp3_0 + s1_700; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 701: dim3x3 add
    gl64_t s1_701_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_701_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_701_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_701_0; tmp3_4 = tmp3_10 + s1_701_1; tmp3_5 = tmp3_11 + s1_701_2;
    // Op 702: dim3x1 mul
    gl64_t s0_702_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_702_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_702_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_702 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 43, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 43, domainSize, nCols_1))];
    tmp3_0 = s0_702_0 * s1_702; tmp3_1 = s0_702_1 * s1_702; tmp3_2 = s0_702_2 * s1_702;
    // Op 703: dim3x1 add
    gl64_t s1_703 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 44, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 44, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_703; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 704: dim3x3 mul
    gl64_t s1_704_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_704_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_704_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA704 = (tmp3_0 + tmp3_1) * (s1_704_0 + s1_704_1);
    gl64_t kB704 = (tmp3_0 + tmp3_2) * (s1_704_0 + s1_704_2);
    gl64_t kC704 = (tmp3_1 + tmp3_2) * (s1_704_1 + s1_704_2);
    gl64_t kD704 = tmp3_0 * s1_704_0;
    gl64_t kE704 = tmp3_1 * s1_704_1;
    gl64_t kF704 = tmp3_2 * s1_704_2;
    gl64_t kG704 = kD704 - kE704;
    tmp3_0 = (kC704 + kG704) - kF704;
    tmp3_1 = ((((kA704 + kC704) - kE704) - kE704) - kD704);
    tmp3_2 = kB704 - kG704;
    // Op 705: dim3x1 add
    gl64_t s1_705 = *(gl64_t*)&expressions_params[9][7];
    tmp3_6 = tmp3_0 + s1_705; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 706: dim3x3 add
    gl64_t s1_706_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_706_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_706_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_706_0; tmp3_1 = tmp3_7 + s1_706_1; tmp3_2 = tmp3_8 + s1_706_2;
    // Op 707: dim3x3 mul
    gl64_t kA707 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB707 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC707 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD707 = tmp3_3 * tmp3_0;
    gl64_t kE707 = tmp3_4 * tmp3_1;
    gl64_t kF707 = tmp3_5 * tmp3_2;
    gl64_t kG707 = kD707 - kE707;
    tmp3_0 = (kC707 + kG707) - kF707;
    tmp3_1 = ((((kA707 + kC707) - kE707) - kE707) - kD707);
    tmp3_2 = kB707 - kG707;
    // Op 708: dim3x3 mul
    gl64_t s0_708_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+0, domainSize, nCols_2))];
    gl64_t s0_708_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+1, domainSize, nCols_2))];
    gl64_t s0_708_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+2, domainSize, nCols_2))];
    gl64_t kA708 = (s0_708_0 + s0_708_1) * (tmp3_0 + tmp3_1);
    gl64_t kB708 = (s0_708_0 + s0_708_2) * (tmp3_0 + tmp3_2);
    gl64_t kC708 = (s0_708_1 + s0_708_2) * (tmp3_1 + tmp3_2);
    gl64_t kD708 = s0_708_0 * tmp3_0;
    gl64_t kE708 = s0_708_1 * tmp3_1;
    gl64_t kF708 = s0_708_2 * tmp3_2;
    gl64_t kG708 = kD708 - kE708;
    tmp3_0 = (kC708 + kG708) - kF708;
    tmp3_1 = ((((kA708 + kC708) - kE708) - kE708) - kD708);
    tmp3_2 = kB708 - kG708;
    // Op 709: dim1x1 sub_swap
    gl64_t s1_709 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s1_709 - tmp1_5;
    // Op 710: dim3x3 add
    gl64_t s1_710_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_710_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_710_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_710_0; tmp3_7 = tmp3_7 + s1_710_1; tmp3_8 = tmp3_8 + s1_710_2;
    // Op 711: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 712: dim1x1 sub_swap
    gl64_t s1_712 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s1_712 - tmp1_5;
    // Op 713: dim3x3 add
    gl64_t s1_713_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_713_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_713_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_713_0; tmp3_10 = tmp3_10 + s1_713_1; tmp3_11 = tmp3_11 + s1_713_2;
    // Op 714: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 715: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 716: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 717: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 718: dim3x3 mul
    gl64_t s1_718_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_718_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_718_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA718 = (tmp3_0 + tmp3_1) * (s1_718_0 + s1_718_1);
    gl64_t kB718 = (tmp3_0 + tmp3_2) * (s1_718_0 + s1_718_2);
    gl64_t kC718 = (tmp3_1 + tmp3_2) * (s1_718_1 + s1_718_2);
    gl64_t kD718 = tmp3_0 * s1_718_0;
    gl64_t kE718 = tmp3_1 * s1_718_1;
    gl64_t kF718 = tmp3_2 * s1_718_2;
    gl64_t kG718 = kD718 - kE718;
    tmp3_3 = (kC718 + kG718) - kF718;
    tmp3_4 = ((((kA718 + kC718) - kE718) - kE718) - kD718);
    tmp3_5 = kB718 - kG718;
    // Op 719: dim3x1 mul
    gl64_t s0_719_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_719_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_719_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_719 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 45, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 45, domainSize, nCols_1))];
    tmp3_0 = s0_719_0 * s1_719; tmp3_1 = s0_719_1 * s1_719; tmp3_2 = s0_719_2 * s1_719;
    // Op 720: dim3x1 add
    gl64_t s1_720 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 46, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 46, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_720; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 721: dim3x3 mul
    gl64_t s1_721_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_721_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_721_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA721 = (tmp3_0 + tmp3_1) * (s1_721_0 + s1_721_1);
    gl64_t kB721 = (tmp3_0 + tmp3_2) * (s1_721_0 + s1_721_2);
    gl64_t kC721 = (tmp3_1 + tmp3_2) * (s1_721_1 + s1_721_2);
    gl64_t kD721 = tmp3_0 * s1_721_0;
    gl64_t kE721 = tmp3_1 * s1_721_1;
    gl64_t kF721 = tmp3_2 * s1_721_2;
    gl64_t kG721 = kD721 - kE721;
    tmp3_0 = (kC721 + kG721) - kF721;
    tmp3_1 = ((((kA721 + kC721) - kE721) - kE721) - kD721);
    tmp3_2 = kB721 - kG721;
    // Op 722: dim3x1 add
    gl64_t s1_722 = *(gl64_t*)&expressions_params[9][7];
    tmp3_9 = tmp3_0 + s1_722; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 723: dim3x3 add
    gl64_t s1_723_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_723_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_723_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_12 = tmp3_9 + s1_723_0; tmp3_13 = tmp3_10 + s1_723_1; tmp3_14 = tmp3_11 + s1_723_2;
    // Op 724: dim3x1 mul
    gl64_t s0_724_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_724_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_724_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_724 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 56, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 56, domainSize, nCols_1))];
    tmp3_0 = s0_724_0 * s1_724; tmp3_1 = s0_724_1 * s1_724; tmp3_2 = s0_724_2 * s1_724;
    // Op 725: dim3x1 add
    gl64_t s1_725 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 57, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 57, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_725; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 726: dim3x3 mul
    gl64_t s1_726_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_726_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_726_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA726 = (tmp3_0 + tmp3_1) * (s1_726_0 + s1_726_1);
    gl64_t kB726 = (tmp3_0 + tmp3_2) * (s1_726_0 + s1_726_2);
    gl64_t kC726 = (tmp3_1 + tmp3_2) * (s1_726_1 + s1_726_2);
    gl64_t kD726 = tmp3_0 * s1_726_0;
    gl64_t kE726 = tmp3_1 * s1_726_1;
    gl64_t kF726 = tmp3_2 * s1_726_2;
    gl64_t kG726 = kD726 - kE726;
    tmp3_0 = (kC726 + kG726) - kF726;
    tmp3_1 = ((((kA726 + kC726) - kE726) - kE726) - kD726);
    tmp3_2 = kB726 - kG726;
    // Op 727: dim3x1 add
    gl64_t s1_727 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 55, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 55, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_727; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 728: dim3x3 mul
    gl64_t s1_728_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_728_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_728_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA728 = (tmp3_0 + tmp3_1) * (s1_728_0 + s1_728_1);
    gl64_t kB728 = (tmp3_0 + tmp3_2) * (s1_728_0 + s1_728_2);
    gl64_t kC728 = (tmp3_1 + tmp3_2) * (s1_728_1 + s1_728_2);
    gl64_t kD728 = tmp3_0 * s1_728_0;
    gl64_t kE728 = tmp3_1 * s1_728_1;
    gl64_t kF728 = tmp3_2 * s1_728_2;
    gl64_t kG728 = kD728 - kE728;
    tmp3_0 = (kC728 + kG728) - kF728;
    tmp3_1 = ((((kA728 + kC728) - kE728) - kE728) - kD728);
    tmp3_2 = kB728 - kG728;
    // Op 729: dim3x1 add
    gl64_t s1_729 = *(gl64_t*)&expressions_params[9][8];
    tmp3_6 = tmp3_0 + s1_729; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 730: dim3x3 add
    gl64_t s1_730_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_730_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_730_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_730_0; tmp3_1 = tmp3_7 + s1_730_1; tmp3_2 = tmp3_8 + s1_730_2;
    // Op 731: dim3x3 mul
    gl64_t kA731 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB731 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC731 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD731 = tmp3_12 * tmp3_0;
    gl64_t kE731 = tmp3_13 * tmp3_1;
    gl64_t kF731 = tmp3_14 * tmp3_2;
    gl64_t kG731 = kD731 - kE731;
    tmp3_0 = (kC731 + kG731) - kF731;
    tmp3_1 = ((((kA731 + kC731) - kE731) - kE731) - kD731);
    tmp3_2 = kB731 - kG731;
    // Op 732: dim3x3 mul
    gl64_t s0_732_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+0, domainSize, nCols_2))];
    gl64_t s0_732_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+1, domainSize, nCols_2))];
    gl64_t s0_732_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+2, domainSize, nCols_2))];
    gl64_t kA732 = (s0_732_0 + s0_732_1) * (tmp3_0 + tmp3_1);
    gl64_t kB732 = (s0_732_0 + s0_732_2) * (tmp3_0 + tmp3_2);
    gl64_t kC732 = (s0_732_1 + s0_732_2) * (tmp3_1 + tmp3_2);
    gl64_t kD732 = s0_732_0 * tmp3_0;
    gl64_t kE732 = s0_732_1 * tmp3_1;
    gl64_t kF732 = s0_732_2 * tmp3_2;
    gl64_t kG732 = kD732 - kE732;
    tmp3_0 = (kC732 + kG732) - kF732;
    tmp3_1 = ((((kA732 + kC732) - kE732) - kE732) - kD732);
    tmp3_2 = kB732 - kG732;
    // Op 733: dim1x1 sub_swap
    gl64_t s1_733 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s1_733 - tmp1_5;
    // Op 734: dim3x3 add
    gl64_t s1_734_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_734_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_734_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_734_0; tmp3_7 = tmp3_7 + s1_734_1; tmp3_8 = tmp3_8 + s1_734_2;
    // Op 735: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 736: dim1x1 sub_swap
    gl64_t s0_736 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_736 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s1_736 - s0_736;
    // Op 737: dim3x3 add
    gl64_t s1_737_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_737_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_737_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_737_0; tmp3_10 = tmp3_10 + s1_737_1; tmp3_11 = tmp3_11 + s1_737_2;
    // Op 738: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 739: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 740: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 741: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 742: dim3x3 mul
    gl64_t s1_742_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_742_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_742_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA742 = (tmp3_0 + tmp3_1) * (s1_742_0 + s1_742_1);
    gl64_t kB742 = (tmp3_0 + tmp3_2) * (s1_742_0 + s1_742_2);
    gl64_t kC742 = (tmp3_1 + tmp3_2) * (s1_742_1 + s1_742_2);
    gl64_t kD742 = tmp3_0 * s1_742_0;
    gl64_t kE742 = tmp3_1 * s1_742_1;
    gl64_t kF742 = tmp3_2 * s1_742_2;
    gl64_t kG742 = kD742 - kE742;
    tmp3_12 = (kC742 + kG742) - kF742;
    tmp3_13 = ((((kA742 + kC742) - kE742) - kE742) - kD742);
    tmp3_14 = kB742 - kG742;
    // Op 743: dim1x1 mul
    gl64_t s0_743 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    gl64_t s1_743 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_743 * s1_743;
    // Op 744: dim1x1 add
    gl64_t s0_744 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 27, domainSize, nCols_1))];
    tmp1_0 = s0_744 + tmp1_0;
    // Op 745: dim1x1 mul
    gl64_t s0_745 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
    gl64_t s1_745 = *(gl64_t*)&expressions_params[9][4];
    tmp1_3 = s0_745 * s1_745;
    // Op 746: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 747: dim1x1 mul
    gl64_t s0_747 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    gl64_t s1_747 = *(gl64_t*)&expressions_params[9][5];
    tmp1_3 = s0_747 * s1_747;
    // Op 748: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 749: dim3x1 mul
    gl64_t s0_749_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_749_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_749_2 = *(gl64_t*)&expressions_params[13][0+2];
    tmp3_0 = s0_749_0 * tmp1_0; tmp3_1 = s0_749_1 * tmp1_0; tmp3_2 = s0_749_2 * tmp1_0;
    // Op 750: dim1x1 mul
    gl64_t s0_750 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    gl64_t s1_750 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_750 * s1_750;
    // Op 751: dim1x1 add
    gl64_t s0_751 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    tmp1_0 = s0_751 + tmp1_0;
    // Op 752: dim1x1 mul
    gl64_t s0_752 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    gl64_t s1_752 = *(gl64_t*)&expressions_params[9][4];
    tmp1_3 = s0_752 * s1_752;
    // Op 753: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 754: dim1x1 mul
    gl64_t s0_754 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    gl64_t s1_754 = *(gl64_t*)&expressions_params[9][5];
    tmp1_3 = s0_754 * s1_754;
    // Op 755: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 756: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 757: dim3x3 mul
    gl64_t s1_757_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_757_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_757_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA757 = (tmp3_0 + tmp3_1) * (s1_757_0 + s1_757_1);
    gl64_t kB757 = (tmp3_0 + tmp3_2) * (s1_757_0 + s1_757_2);
    gl64_t kC757 = (tmp3_1 + tmp3_2) * (s1_757_1 + s1_757_2);
    gl64_t kD757 = tmp3_0 * s1_757_0;
    gl64_t kE757 = tmp3_1 * s1_757_1;
    gl64_t kF757 = tmp3_2 * s1_757_2;
    gl64_t kG757 = kD757 - kE757;
    tmp3_0 = (kC757 + kG757) - kF757;
    tmp3_1 = ((((kA757 + kC757) - kE757) - kE757) - kD757);
    tmp3_2 = kB757 - kG757;
    // Op 758: dim3x1 add
    gl64_t s1_758 = *(gl64_t*)&expressions_params[9][9];
    tmp3_0 = tmp3_0 + s1_758; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 760: dim1x1 mul
    gl64_t s0_760 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_760 = *(gl64_t*)&expressions_params[9][10];
    tmp1_0 = s0_760 * s1_760;
    // Op 761: dim1x1 add
    gl64_t s1_761 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_761;
    // Op 762: dim1x1 add
    gl64_t s1_762 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = tmp1_0 + s1_762;
    // Op 763: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 764: dim3x3 mul
    gl64_t s1_764_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_764_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_764_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA764 = (tmp3_0 + tmp3_1) * (s1_764_0 + s1_764_1);
    gl64_t kB764 = (tmp3_0 + tmp3_2) * (s1_764_0 + s1_764_2);
    gl64_t kC764 = (tmp3_1 + tmp3_2) * (s1_764_1 + s1_764_2);
    gl64_t kD764 = tmp3_0 * s1_764_0;
    gl64_t kE764 = tmp3_1 * s1_764_1;
    gl64_t kF764 = tmp3_2 * s1_764_2;
    gl64_t kG764 = kD764 - kE764;
    tmp3_0 = (kC764 + kG764) - kF764;
    tmp3_1 = ((((kA764 + kC764) - kE764) - kE764) - kD764);
    tmp3_2 = kB764 - kG764;
    // Op 765: dim1x1 mul
    gl64_t s0_765 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    gl64_t s1_765 = *(gl64_t*)&expressions_params[9][9];
    tmp1_0 = s0_765 * s1_765;
    // Op 766: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 767: dim3x3 mul
    gl64_t s1_767_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_767_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_767_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA767 = (tmp3_0 + tmp3_1) * (s1_767_0 + s1_767_1);
    gl64_t kB767 = (tmp3_0 + tmp3_2) * (s1_767_0 + s1_767_2);
    gl64_t kC767 = (tmp3_1 + tmp3_2) * (s1_767_1 + s1_767_2);
    gl64_t kD767 = tmp3_0 * s1_767_0;
    gl64_t kE767 = tmp3_1 * s1_767_1;
    gl64_t kF767 = tmp3_2 * s1_767_2;
    gl64_t kG767 = kD767 - kE767;
    tmp3_0 = (kC767 + kG767) - kF767;
    tmp3_1 = ((((kA767 + kC767) - kE767) - kE767) - kD767);
    tmp3_2 = kB767 - kG767;
    // Op 768: dim3x1 add
    gl64_t s1_768 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_768; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 769: dim3x3 mul
    gl64_t s1_769_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_769_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_769_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA769 = (tmp3_0 + tmp3_1) * (s1_769_0 + s1_769_1);
    gl64_t kB769 = (tmp3_0 + tmp3_2) * (s1_769_0 + s1_769_2);
    gl64_t kC769 = (tmp3_1 + tmp3_2) * (s1_769_1 + s1_769_2);
    gl64_t kD769 = tmp3_0 * s1_769_0;
    gl64_t kE769 = tmp3_1 * s1_769_1;
    gl64_t kF769 = tmp3_2 * s1_769_2;
    gl64_t kG769 = kD769 - kE769;
    tmp3_0 = (kC769 + kG769) - kF769;
    tmp3_1 = ((((kA769 + kC769) - kE769) - kE769) - kD769);
    tmp3_2 = kB769 - kG769;
    // Op 770: dim3x1 add
    gl64_t s1_770 = *(gl64_t*)&expressions_params[9][11];
    tmp3_9 = tmp3_0 + s1_770; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 771: dim3x3 add
    gl64_t s1_771_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_771_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_771_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_771_0; tmp3_4 = tmp3_10 + s1_771_1; tmp3_5 = tmp3_11 + s1_771_2;
    // Op 772: dim1x1 mul
    gl64_t s0_772 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 36, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 36, domainSize, nCols_1))];
    gl64_t s1_772 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_772 * s1_772;
    // Op 773: dim1x1 add
    gl64_t s0_773 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 35, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 35, domainSize, nCols_1))];
    tmp1_0 = s0_773 + tmp1_0;
    // Op 774: dim1x1 mul
    gl64_t s0_774 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 37, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 37, domainSize, nCols_1))];
    gl64_t s1_774 = *(gl64_t*)&expressions_params[9][4];
    tmp1_3 = s0_774 * s1_774;
    // Op 775: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 776: dim1x1 mul
    gl64_t s0_776 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 38, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 38, domainSize, nCols_1))];
    gl64_t s1_776 = *(gl64_t*)&expressions_params[9][5];
    tmp1_3 = s0_776 * s1_776;
    // Op 777: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 778: dim3x1 mul
    gl64_t s0_778_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_778_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_778_2 = *(gl64_t*)&expressions_params[13][0+2];
    tmp3_0 = s0_778_0 * tmp1_0; tmp3_1 = s0_778_1 * tmp1_0; tmp3_2 = s0_778_2 * tmp1_0;
    // Op 779: dim1x1 mul
    gl64_t s0_779 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 32, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 32, domainSize, nCols_1))];
    gl64_t s1_779 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_779 * s1_779;
    // Op 780: dim1x1 add
    gl64_t s0_780 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 31, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 31, domainSize, nCols_1))];
    tmp1_0 = s0_780 + tmp1_0;
    // Op 781: dim1x1 mul
    gl64_t s0_781 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 33, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 33, domainSize, nCols_1))];
    gl64_t s1_781 = *(gl64_t*)&expressions_params[9][4];
    tmp1_3 = s0_781 * s1_781;
    // Op 782: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 783: dim1x1 mul
    gl64_t s0_783 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 34, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 34, domainSize, nCols_1))];
    gl64_t s1_783 = *(gl64_t*)&expressions_params[9][5];
    tmp1_3 = s0_783 * s1_783;
    // Op 784: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 785: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 786: dim3x3 mul
    gl64_t s1_786_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_786_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_786_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA786 = (tmp3_0 + tmp3_1) * (s1_786_0 + s1_786_1);
    gl64_t kB786 = (tmp3_0 + tmp3_2) * (s1_786_0 + s1_786_2);
    gl64_t kC786 = (tmp3_1 + tmp3_2) * (s1_786_1 + s1_786_2);
    gl64_t kD786 = tmp3_0 * s1_786_0;
    gl64_t kE786 = tmp3_1 * s1_786_1;
    gl64_t kF786 = tmp3_2 * s1_786_2;
    gl64_t kG786 = kD786 - kE786;
    tmp3_0 = (kC786 + kG786) - kF786;
    tmp3_1 = ((((kA786 + kC786) - kE786) - kE786) - kD786);
    tmp3_2 = kB786 - kG786;
    // Op 787: dim3x1 add
    gl64_t s1_787 = *(gl64_t*)&expressions_params[9][9];
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
    // Op 789: dim1x1 mul
    gl64_t s0_789 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_789 = *(gl64_t*)&expressions_params[9][10];
    tmp1_0 = s0_789 * s1_789;
    // Op 790: dim1x1 add
    gl64_t s1_790 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_790;
    // Op 791: dim1x1 add
    gl64_t s1_791 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = tmp1_0 + s1_791;
    // Op 792: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 793: dim3x3 mul
    gl64_t s1_793_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_793_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_793_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA793 = (tmp3_0 + tmp3_1) * (s1_793_0 + s1_793_1);
    gl64_t kB793 = (tmp3_0 + tmp3_2) * (s1_793_0 + s1_793_2);
    gl64_t kC793 = (tmp3_1 + tmp3_2) * (s1_793_1 + s1_793_2);
    gl64_t kD793 = tmp3_0 * s1_793_0;
    gl64_t kE793 = tmp3_1 * s1_793_1;
    gl64_t kF793 = tmp3_2 * s1_793_2;
    gl64_t kG793 = kD793 - kE793;
    tmp3_0 = (kC793 + kG793) - kF793;
    tmp3_1 = ((((kA793 + kC793) - kE793) - kE793) - kD793);
    tmp3_2 = kB793 - kG793;
    // Op 794: dim1x1 mul
    gl64_t s0_794 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    gl64_t s1_794 = *(gl64_t*)&expressions_params[9][9];
    tmp1_0 = s0_794 * s1_794;
    // Op 795: dim1x1 add
    gl64_t s1_795 = *(gl64_t*)&expressions_params[9][9];
    tmp1_0 = tmp1_0 + s1_795;
    // Op 796: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 797: dim3x3 mul
    gl64_t s1_797_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_797_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_797_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA797 = (tmp3_0 + tmp3_1) * (s1_797_0 + s1_797_1);
    gl64_t kB797 = (tmp3_0 + tmp3_2) * (s1_797_0 + s1_797_2);
    gl64_t kC797 = (tmp3_1 + tmp3_2) * (s1_797_1 + s1_797_2);
    gl64_t kD797 = tmp3_0 * s1_797_0;
    gl64_t kE797 = tmp3_1 * s1_797_1;
    gl64_t kF797 = tmp3_2 * s1_797_2;
    gl64_t kG797 = kD797 - kE797;
    tmp3_0 = (kC797 + kG797) - kF797;
    tmp3_1 = ((((kA797 + kC797) - kE797) - kE797) - kD797);
    tmp3_2 = kB797 - kG797;
    // Op 798: dim3x1 add
    gl64_t s1_798 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_798; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 799: dim3x3 mul
    gl64_t s1_799_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_799_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_799_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA799 = (tmp3_0 + tmp3_1) * (s1_799_0 + s1_799_1);
    gl64_t kB799 = (tmp3_0 + tmp3_2) * (s1_799_0 + s1_799_2);
    gl64_t kC799 = (tmp3_1 + tmp3_2) * (s1_799_1 + s1_799_2);
    gl64_t kD799 = tmp3_0 * s1_799_0;
    gl64_t kE799 = tmp3_1 * s1_799_1;
    gl64_t kF799 = tmp3_2 * s1_799_2;
    gl64_t kG799 = kD799 - kE799;
    tmp3_0 = (kC799 + kG799) - kF799;
    tmp3_1 = ((((kA799 + kC799) - kE799) - kE799) - kD799);
    tmp3_2 = kB799 - kG799;
    // Op 800: dim3x1 add
    gl64_t s1_800 = *(gl64_t*)&expressions_params[9][11];
    tmp3_6 = tmp3_0 + s1_800; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 801: dim3x3 add
    gl64_t s1_801_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_801_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_801_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_801_0; tmp3_1 = tmp3_7 + s1_801_1; tmp3_2 = tmp3_8 + s1_801_2;
    // Op 802: dim3x3 mul
    gl64_t kA802 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB802 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC802 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD802 = tmp3_3 * tmp3_0;
    gl64_t kE802 = tmp3_4 * tmp3_1;
    gl64_t kF802 = tmp3_5 * tmp3_2;
    gl64_t kG802 = kD802 - kE802;
    tmp3_0 = (kC802 + kG802) - kF802;
    tmp3_1 = ((((kA802 + kC802) - kE802) - kE802) - kD802);
    tmp3_2 = kB802 - kG802;
    // Op 803: dim3x3 mul
    uint64_t s0_803_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_2));
    gl64_t s0_803_0 = *(gl64_t*)&dParams->aux_trace[s0_803_pos];
    gl64_t s0_803_1 = *(gl64_t*)&dParams->aux_trace[s0_803_pos + TILE_HEIGHT];
    gl64_t s0_803_2 = *(gl64_t*)&dParams->aux_trace[s0_803_pos + 2*TILE_HEIGHT];
    gl64_t kA803 = (s0_803_0 + s0_803_1) * (tmp3_0 + tmp3_1);
    gl64_t kB803 = (s0_803_0 + s0_803_2) * (tmp3_0 + tmp3_2);
    gl64_t kC803 = (s0_803_1 + s0_803_2) * (tmp3_1 + tmp3_2);
    gl64_t kD803 = s0_803_0 * tmp3_0;
    gl64_t kE803 = s0_803_1 * tmp3_1;
    gl64_t kF803 = s0_803_2 * tmp3_2;
    gl64_t kG803 = kD803 - kE803;
    tmp3_0 = (kC803 + kG803) - kF803;
    tmp3_1 = ((((kA803 + kC803) - kE803) - kE803) - kD803);
    tmp3_2 = kB803 - kG803;
    // Op 804: dim1x1 add
    gl64_t s0_804 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_804 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    tmp1_4 = s0_804 + s1_804;
    // Op 805: dim1x1 sub_swap
    gl64_t s1_805 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s1_805 - tmp1_4;
    // Op 806: dim3x3 add
    gl64_t s1_806_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_806_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_806_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_806_0; tmp3_7 = tmp3_7 + s1_806_1; tmp3_8 = tmp3_8 + s1_806_2;
    // Op 807: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 808: dim1x1 sub_swap
    gl64_t s0_808 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    gl64_t s1_808 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s1_808 - s0_808;
    // Op 809: dim3x3 add
    gl64_t s1_809_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_809_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_809_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_809_0; tmp3_10 = tmp3_10 + s1_809_1; tmp3_11 = tmp3_11 + s1_809_2;
    // Op 810: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 811: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 812: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 813: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 814: dim3x3 mul
    gl64_t s1_814_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_814_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_814_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA814 = (tmp3_0 + tmp3_1) * (s1_814_0 + s1_814_1);
    gl64_t kB814 = (tmp3_0 + tmp3_2) * (s1_814_0 + s1_814_2);
    gl64_t kC814 = (tmp3_1 + tmp3_2) * (s1_814_1 + s1_814_2);
    gl64_t kD814 = tmp3_0 * s1_814_0;
    gl64_t kE814 = tmp3_1 * s1_814_1;
    gl64_t kF814 = tmp3_2 * s1_814_2;
    gl64_t kG814 = kD814 - kE814;
    tmp3_3 = (kC814 + kG814) - kF814;
    tmp3_4 = ((((kA814 + kC814) - kE814) - kE814) - kD814);
    tmp3_5 = kB814 - kG814;
    // Op 815: dim1x1 mul
    gl64_t s0_815 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 44, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 44, domainSize, nCols_1))];
    gl64_t s1_815 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_815 * s1_815;
    // Op 816: dim1x1 add
    gl64_t s0_816 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 43, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 43, domainSize, nCols_1))];
    tmp1_0 = s0_816 + tmp1_0;
    // Op 817: dim1x1 mul
    gl64_t s0_817 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 45, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 45, domainSize, nCols_1))];
    gl64_t s1_817 = *(gl64_t*)&expressions_params[9][4];
    tmp1_3 = s0_817 * s1_817;
    // Op 818: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 819: dim1x1 mul
    gl64_t s0_819 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 46, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 46, domainSize, nCols_1))];
    gl64_t s1_819 = *(gl64_t*)&expressions_params[9][5];
    tmp1_3 = s0_819 * s1_819;
    // Op 820: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 821: dim3x1 mul
    gl64_t s0_821_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_821_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_821_2 = *(gl64_t*)&expressions_params[13][0+2];
    tmp3_0 = s0_821_0 * tmp1_0; tmp3_1 = s0_821_1 * tmp1_0; tmp3_2 = s0_821_2 * tmp1_0;
    // Op 822: dim1x1 mul
    gl64_t s0_822 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 40, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 40, domainSize, nCols_1))];
    gl64_t s1_822 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_822 * s1_822;
    // Op 823: dim1x1 add
    gl64_t s0_823 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 39, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 39, domainSize, nCols_1))];
    tmp1_0 = s0_823 + tmp1_0;
    // Op 824: dim1x1 mul
    gl64_t s0_824 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 41, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 41, domainSize, nCols_1))];
    gl64_t s1_824 = *(gl64_t*)&expressions_params[9][4];
    tmp1_3 = s0_824 * s1_824;
    // Op 825: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 826: dim1x1 mul
    gl64_t s0_826 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 42, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 42, domainSize, nCols_1))];
    gl64_t s1_826 = *(gl64_t*)&expressions_params[9][5];
    tmp1_3 = s0_826 * s1_826;
    // Op 827: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 828: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 829: dim3x3 mul
    gl64_t s1_829_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_829_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_829_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA829 = (tmp3_0 + tmp3_1) * (s1_829_0 + s1_829_1);
    gl64_t kB829 = (tmp3_0 + tmp3_2) * (s1_829_0 + s1_829_2);
    gl64_t kC829 = (tmp3_1 + tmp3_2) * (s1_829_1 + s1_829_2);
    gl64_t kD829 = tmp3_0 * s1_829_0;
    gl64_t kE829 = tmp3_1 * s1_829_1;
    gl64_t kF829 = tmp3_2 * s1_829_2;
    gl64_t kG829 = kD829 - kE829;
    tmp3_0 = (kC829 + kG829) - kF829;
    tmp3_1 = ((((kA829 + kC829) - kE829) - kE829) - kD829);
    tmp3_2 = kB829 - kG829;
    // Op 830: dim3x1 add
    gl64_t s1_830 = *(gl64_t*)&expressions_params[9][9];
    tmp3_0 = tmp3_0 + s1_830; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 831: dim3x3 mul
    gl64_t s1_831_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_831_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_831_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA831 = (tmp3_0 + tmp3_1) * (s1_831_0 + s1_831_1);
    gl64_t kB831 = (tmp3_0 + tmp3_2) * (s1_831_0 + s1_831_2);
    gl64_t kC831 = (tmp3_1 + tmp3_2) * (s1_831_1 + s1_831_2);
    gl64_t kD831 = tmp3_0 * s1_831_0;
    gl64_t kE831 = tmp3_1 * s1_831_1;
    gl64_t kF831 = tmp3_2 * s1_831_2;
    gl64_t kG831 = kD831 - kE831;
    tmp3_0 = (kC831 + kG831) - kF831;
    tmp3_1 = ((((kA831 + kC831) - kE831) - kE831) - kD831);
    tmp3_2 = kB831 - kG831;
    // Op 832: dim1x1 mul
    gl64_t s0_832 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_832 = *(gl64_t*)&expressions_params[9][10];
    tmp1_0 = s0_832 * s1_832;
    // Op 833: dim1x1 add
    gl64_t s1_833 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_833;
    // Op 834: dim1x1 add
    gl64_t s1_834 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = tmp1_0 + s1_834;
    // Op 835: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 836: dim3x3 mul
    gl64_t s1_836_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_836_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_836_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA836 = (tmp3_0 + tmp3_1) * (s1_836_0 + s1_836_1);
    gl64_t kB836 = (tmp3_0 + tmp3_2) * (s1_836_0 + s1_836_2);
    gl64_t kC836 = (tmp3_1 + tmp3_2) * (s1_836_1 + s1_836_2);
    gl64_t kD836 = tmp3_0 * s1_836_0;
    gl64_t kE836 = tmp3_1 * s1_836_1;
    gl64_t kF836 = tmp3_2 * s1_836_2;
    gl64_t kG836 = kD836 - kE836;
    tmp3_0 = (kC836 + kG836) - kF836;
    tmp3_1 = ((((kA836 + kC836) - kE836) - kE836) - kD836);
    tmp3_2 = kB836 - kG836;
    // Op 837: dim1x1 mul
    gl64_t s0_837 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    gl64_t s1_837 = *(gl64_t*)&expressions_params[9][9];
    tmp1_0 = s0_837 * s1_837;
    // Op 838: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 839: dim3x3 mul
    gl64_t s1_839_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_839_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_839_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA839 = (tmp3_0 + tmp3_1) * (s1_839_0 + s1_839_1);
    gl64_t kB839 = (tmp3_0 + tmp3_2) * (s1_839_0 + s1_839_2);
    gl64_t kC839 = (tmp3_1 + tmp3_2) * (s1_839_1 + s1_839_2);
    gl64_t kD839 = tmp3_0 * s1_839_0;
    gl64_t kE839 = tmp3_1 * s1_839_1;
    gl64_t kF839 = tmp3_2 * s1_839_2;
    gl64_t kG839 = kD839 - kE839;
    tmp3_0 = (kC839 + kG839) - kF839;
    tmp3_1 = ((((kA839 + kC839) - kE839) - kE839) - kD839);
    tmp3_2 = kB839 - kG839;
    // Op 840: dim3x1 add
    gl64_t s1_840 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_840; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 841: dim3x3 mul
    gl64_t s1_841_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_841_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_841_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA841 = (tmp3_0 + tmp3_1) * (s1_841_0 + s1_841_1);
    gl64_t kB841 = (tmp3_0 + tmp3_2) * (s1_841_0 + s1_841_2);
    gl64_t kC841 = (tmp3_1 + tmp3_2) * (s1_841_1 + s1_841_2);
    gl64_t kD841 = tmp3_0 * s1_841_0;
    gl64_t kE841 = tmp3_1 * s1_841_1;
    gl64_t kF841 = tmp3_2 * s1_841_2;
    gl64_t kG841 = kD841 - kE841;
    tmp3_0 = (kC841 + kG841) - kF841;
    tmp3_1 = ((((kA841 + kC841) - kE841) - kE841) - kD841);
    tmp3_2 = kB841 - kG841;
    // Op 842: dim3x1 add
    gl64_t s1_842 = *(gl64_t*)&expressions_params[9][11];
    tmp3_9 = tmp3_0 + s1_842; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 843: dim3x3 add
    gl64_t s1_843_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_843_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_843_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_12 = tmp3_9 + s1_843_0; tmp3_13 = tmp3_10 + s1_843_1; tmp3_14 = tmp3_11 + s1_843_2;
    // Op 844: dim3x1 mul
    gl64_t s0_844_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_844_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_844_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_844 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 61, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 61, domainSize, nCols_1))];
    tmp3_0 = s0_844_0 * s1_844; tmp3_1 = s0_844_1 * s1_844; tmp3_2 = s0_844_2 * s1_844;
    // Op 845: dim3x1 add
    gl64_t s1_845 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 60, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 60, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_845; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 846: dim3x3 mul
    gl64_t s1_846_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_846_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_846_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA846 = (tmp3_0 + tmp3_1) * (s1_846_0 + s1_846_1);
    gl64_t kB846 = (tmp3_0 + tmp3_2) * (s1_846_0 + s1_846_2);
    gl64_t kC846 = (tmp3_1 + tmp3_2) * (s1_846_1 + s1_846_2);
    gl64_t kD846 = tmp3_0 * s1_846_0;
    gl64_t kE846 = tmp3_1 * s1_846_1;
    gl64_t kF846 = tmp3_2 * s1_846_2;
    gl64_t kG846 = kD846 - kE846;
    tmp3_0 = (kC846 + kG846) - kF846;
    tmp3_1 = ((((kA846 + kC846) - kE846) - kE846) - kD846);
    tmp3_2 = kB846 - kG846;
    // Op 847: dim3x1 add
    gl64_t s1_847 = *(gl64_t*)&expressions_params[9][9];
    tmp3_0 = tmp3_0 + s1_847; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 848: dim3x3 mul
    gl64_t s1_848_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_848_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_848_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA848 = (tmp3_0 + tmp3_1) * (s1_848_0 + s1_848_1);
    gl64_t kB848 = (tmp3_0 + tmp3_2) * (s1_848_0 + s1_848_2);
    gl64_t kC848 = (tmp3_1 + tmp3_2) * (s1_848_1 + s1_848_2);
    gl64_t kD848 = tmp3_0 * s1_848_0;
    gl64_t kE848 = tmp3_1 * s1_848_1;
    gl64_t kF848 = tmp3_2 * s1_848_2;
    gl64_t kG848 = kD848 - kE848;
    tmp3_0 = (kC848 + kG848) - kF848;
    tmp3_1 = ((((kA848 + kC848) - kE848) - kE848) - kD848);
    tmp3_2 = kB848 - kG848;
    // Op 849: dim1x1 mul
    gl64_t s0_849 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_849 = *(gl64_t*)&expressions_params[9][10];
    tmp1_0 = s0_849 * s1_849;
    // Op 850: dim1x1 add
    gl64_t s1_850 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_850;
    // Op 851: dim1x1 add
    gl64_t s1_851 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_851;
    // Op 852: dim1x1 add
    gl64_t s1_852 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = tmp1_0 + s1_852;
    // Op 853: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 854: dim3x3 mul
    gl64_t s1_854_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_854_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_854_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA854 = (tmp3_0 + tmp3_1) * (s1_854_0 + s1_854_1);
    gl64_t kB854 = (tmp3_0 + tmp3_2) * (s1_854_0 + s1_854_2);
    gl64_t kC854 = (tmp3_1 + tmp3_2) * (s1_854_1 + s1_854_2);
    gl64_t kD854 = tmp3_0 * s1_854_0;
    gl64_t kE854 = tmp3_1 * s1_854_1;
    gl64_t kF854 = tmp3_2 * s1_854_2;
    gl64_t kG854 = kD854 - kE854;
    tmp3_0 = (kC854 + kG854) - kF854;
    tmp3_1 = ((((kA854 + kC854) - kE854) - kE854) - kD854);
    tmp3_2 = kB854 - kG854;
    // Op 855: dim1x1 mul
    gl64_t s0_855 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    gl64_t s1_855 = *(gl64_t*)&expressions_params[9][9];
    tmp1_0 = s0_855 * s1_855;
    // Op 856: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 857: dim3x3 mul
    gl64_t s1_857_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_857_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_857_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA857 = (tmp3_0 + tmp3_1) * (s1_857_0 + s1_857_1);
    gl64_t kB857 = (tmp3_0 + tmp3_2) * (s1_857_0 + s1_857_2);
    gl64_t kC857 = (tmp3_1 + tmp3_2) * (s1_857_1 + s1_857_2);
    gl64_t kD857 = tmp3_0 * s1_857_0;
    gl64_t kE857 = tmp3_1 * s1_857_1;
    gl64_t kF857 = tmp3_2 * s1_857_2;
    gl64_t kG857 = kD857 - kE857;
    tmp3_0 = (kC857 + kG857) - kF857;
    tmp3_1 = ((((kA857 + kC857) - kE857) - kE857) - kD857);
    tmp3_2 = kB857 - kG857;
    // Op 858: dim3x1 add
    gl64_t s1_858 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_858; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 859: dim3x3 mul
    gl64_t s1_859_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_859_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_859_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA859 = (tmp3_0 + tmp3_1) * (s1_859_0 + s1_859_1);
    gl64_t kB859 = (tmp3_0 + tmp3_2) * (s1_859_0 + s1_859_2);
    gl64_t kC859 = (tmp3_1 + tmp3_2) * (s1_859_1 + s1_859_2);
    gl64_t kD859 = tmp3_0 * s1_859_0;
    gl64_t kE859 = tmp3_1 * s1_859_1;
    gl64_t kF859 = tmp3_2 * s1_859_2;
    gl64_t kG859 = kD859 - kE859;
    tmp3_0 = (kC859 + kG859) - kF859;
    tmp3_1 = ((((kA859 + kC859) - kE859) - kE859) - kD859);
    tmp3_2 = kB859 - kG859;
    // Op 860: dim3x1 add
    gl64_t s1_860 = *(gl64_t*)&expressions_params[9][11];
    tmp3_6 = tmp3_0 + s1_860; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 861: dim3x3 add
    gl64_t s1_861_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_861_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_861_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_861_0; tmp3_1 = tmp3_7 + s1_861_1; tmp3_2 = tmp3_8 + s1_861_2;
    // Op 862: dim3x3 mul
    gl64_t kA862 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB862 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC862 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD862 = tmp3_12 * tmp3_0;
    gl64_t kE862 = tmp3_13 * tmp3_1;
    gl64_t kF862 = tmp3_14 * tmp3_2;
    gl64_t kG862 = kD862 - kE862;
    tmp3_0 = (kC862 + kG862) - kF862;
    tmp3_1 = ((((kA862 + kC862) - kE862) - kE862) - kD862);
    tmp3_2 = kB862 - kG862;
    // Op 863: dim3x3 mul
    uint64_t s0_863_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_2));
    gl64_t s0_863_0 = *(gl64_t*)&dParams->aux_trace[s0_863_pos];
    gl64_t s0_863_1 = *(gl64_t*)&dParams->aux_trace[s0_863_pos + TILE_HEIGHT];
    gl64_t s0_863_2 = *(gl64_t*)&dParams->aux_trace[s0_863_pos + 2*TILE_HEIGHT];
    gl64_t kA863 = (s0_863_0 + s0_863_1) * (tmp3_0 + tmp3_1);
    gl64_t kB863 = (s0_863_0 + s0_863_2) * (tmp3_0 + tmp3_2);
    gl64_t kC863 = (s0_863_1 + s0_863_2) * (tmp3_1 + tmp3_2);
    gl64_t kD863 = s0_863_0 * tmp3_0;
    gl64_t kE863 = s0_863_1 * tmp3_1;
    gl64_t kF863 = s0_863_2 * tmp3_2;
    gl64_t kG863 = kD863 - kE863;
    tmp3_0 = (kC863 + kG863) - kF863;
    tmp3_1 = ((((kA863 + kC863) - kE863) - kE863) - kD863);
    tmp3_2 = kB863 - kG863;
    // Op 864: dim1x1 sub_swap
    gl64_t s1_864 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s1_864 - tmp1_5;
    // Op 865: dim3x3 add
    gl64_t s1_865_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_865_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_865_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_865_0; tmp3_7 = tmp3_7 + s1_865_1; tmp3_8 = tmp3_8 + s1_865_2;
    // Op 866: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 867: dim1x1 add
    gl64_t s0_867 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_867 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    tmp1_0 = s0_867 + s1_867;
    // Op 868: dim1x1 add
    gl64_t s0_868 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_868 + tmp1_0;
    // Op 869: dim1x1 sub_swap
    gl64_t s1_869 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s1_869 - tmp1_0;
    // Op 870: dim3x3 add
    gl64_t s1_870_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_870_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_870_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_870_0; tmp3_10 = tmp3_10 + s1_870_1; tmp3_11 = tmp3_11 + s1_870_2;
    // Op 871: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 872: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 873: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 874: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 875: dim3x3 mul
    gl64_t s1_875_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_875_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_875_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA875 = (tmp3_0 + tmp3_1) * (s1_875_0 + s1_875_1);
    gl64_t kB875 = (tmp3_0 + tmp3_2) * (s1_875_0 + s1_875_2);
    gl64_t kC875 = (tmp3_1 + tmp3_2) * (s1_875_1 + s1_875_2);
    gl64_t kD875 = tmp3_0 * s1_875_0;
    gl64_t kE875 = tmp3_1 * s1_875_1;
    gl64_t kF875 = tmp3_2 * s1_875_2;
    gl64_t kG875 = kD875 - kE875;
    tmp3_12 = (kC875 + kG875) - kF875;
    tmp3_13 = ((((kA875 + kC875) - kE875) - kE875) - kD875);
    tmp3_14 = kB875 - kG875;
    // Op 876: dim1x1 mul
    gl64_t s0_876 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 57, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 57, domainSize, nCols_1))];
    gl64_t s1_876 = *(gl64_t*)&expressions_params[9][26];
    tmp1_0 = s0_876 * s1_876;
    // Op 877: dim3x1 mul
    gl64_t s0_877_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_877_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_877_2 = *(gl64_t*)&expressions_params[13][0+2];
    tmp3_0 = s0_877_0 * tmp1_0; tmp3_1 = s0_877_1 * tmp1_0; tmp3_2 = s0_877_2 * tmp1_0;
    // Op 878: dim3x1 add
    gl64_t s1_878 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_878; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 879: dim3x3 mul
    gl64_t s1_879_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_879_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_879_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA879 = (tmp3_0 + tmp3_1) * (s1_879_0 + s1_879_1);
    gl64_t kB879 = (tmp3_0 + tmp3_2) * (s1_879_0 + s1_879_2);
    gl64_t kC879 = (tmp3_1 + tmp3_2) * (s1_879_1 + s1_879_2);
    gl64_t kD879 = tmp3_0 * s1_879_0;
    gl64_t kE879 = tmp3_1 * s1_879_1;
    gl64_t kF879 = tmp3_2 * s1_879_2;
    gl64_t kG879 = kD879 - kE879;
    tmp3_0 = (kC879 + kG879) - kF879;
    tmp3_1 = ((((kA879 + kC879) - kE879) - kE879) - kD879);
    tmp3_2 = kB879 - kG879;
    // Op 880: dim3x1 add
    gl64_t s1_880 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_880; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 881: dim3x3 mul
    gl64_t s1_881_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_881_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_881_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA881 = (tmp3_0 + tmp3_1) * (s1_881_0 + s1_881_1);
    gl64_t kB881 = (tmp3_0 + tmp3_2) * (s1_881_0 + s1_881_2);
    gl64_t kC881 = (tmp3_1 + tmp3_2) * (s1_881_1 + s1_881_2);
    gl64_t kD881 = tmp3_0 * s1_881_0;
    gl64_t kE881 = tmp3_1 * s1_881_1;
    gl64_t kF881 = tmp3_2 * s1_881_2;
    gl64_t kG881 = kD881 - kE881;
    tmp3_0 = (kC881 + kG881) - kF881;
    tmp3_1 = ((((kA881 + kC881) - kE881) - kE881) - kD881);
    tmp3_2 = kB881 - kG881;
    // Op 882: dim3x1 add
    gl64_t s1_882 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_882; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 883: dim3x3 mul
    gl64_t s1_883_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_883_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_883_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA883 = (tmp3_0 + tmp3_1) * (s1_883_0 + s1_883_1);
    gl64_t kB883 = (tmp3_0 + tmp3_2) * (s1_883_0 + s1_883_2);
    gl64_t kC883 = (tmp3_1 + tmp3_2) * (s1_883_1 + s1_883_2);
    gl64_t kD883 = tmp3_0 * s1_883_0;
    gl64_t kE883 = tmp3_1 * s1_883_1;
    gl64_t kF883 = tmp3_2 * s1_883_2;
    gl64_t kG883 = kD883 - kE883;
    tmp3_0 = (kC883 + kG883) - kF883;
    tmp3_1 = ((((kA883 + kC883) - kE883) - kE883) - kD883);
    tmp3_2 = kB883 - kG883;
    // Op 884: dim3x1 add
    gl64_t s1_884 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_884; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 885: dim3x3 mul
    gl64_t s1_885_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_885_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_885_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA885 = (tmp3_0 + tmp3_1) * (s1_885_0 + s1_885_1);
    gl64_t kB885 = (tmp3_0 + tmp3_2) * (s1_885_0 + s1_885_2);
    gl64_t kC885 = (tmp3_1 + tmp3_2) * (s1_885_1 + s1_885_2);
    gl64_t kD885 = tmp3_0 * s1_885_0;
    gl64_t kE885 = tmp3_1 * s1_885_1;
    gl64_t kF885 = tmp3_2 * s1_885_2;
    gl64_t kG885 = kD885 - kE885;
    tmp3_0 = (kC885 + kG885) - kF885;
    tmp3_1 = ((((kA885 + kC885) - kE885) - kE885) - kD885);
    tmp3_2 = kB885 - kG885;
    // Op 886: dim3x1 add
    gl64_t s1_886 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_886; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 887: dim3x3 mul
    gl64_t s1_887_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_887_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_887_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA887 = (tmp3_0 + tmp3_1) * (s1_887_0 + s1_887_1);
    gl64_t kB887 = (tmp3_0 + tmp3_2) * (s1_887_0 + s1_887_2);
    gl64_t kC887 = (tmp3_1 + tmp3_2) * (s1_887_1 + s1_887_2);
    gl64_t kD887 = tmp3_0 * s1_887_0;
    gl64_t kE887 = tmp3_1 * s1_887_1;
    gl64_t kF887 = tmp3_2 * s1_887_2;
    gl64_t kG887 = kD887 - kE887;
    tmp3_0 = (kC887 + kG887) - kF887;
    tmp3_1 = ((((kA887 + kC887) - kE887) - kE887) - kD887);
    tmp3_2 = kB887 - kG887;
    // Op 888: dim3x1 add
    gl64_t s1_888 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_888; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 889: dim3x3 mul
    gl64_t s1_889_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_889_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_889_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA889 = (tmp3_0 + tmp3_1) * (s1_889_0 + s1_889_1);
    gl64_t kB889 = (tmp3_0 + tmp3_2) * (s1_889_0 + s1_889_2);
    gl64_t kC889 = (tmp3_1 + tmp3_2) * (s1_889_1 + s1_889_2);
    gl64_t kD889 = tmp3_0 * s1_889_0;
    gl64_t kE889 = tmp3_1 * s1_889_1;
    gl64_t kF889 = tmp3_2 * s1_889_2;
    gl64_t kG889 = kD889 - kE889;
    tmp3_0 = (kC889 + kG889) - kF889;
    tmp3_1 = ((((kA889 + kC889) - kE889) - kE889) - kD889);
    tmp3_2 = kB889 - kG889;
    // Op 890: dim3x1 add
    gl64_t s1_890 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_890; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 891: dim3x3 mul
    gl64_t s1_891_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_891_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_891_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA891 = (tmp3_0 + tmp3_1) * (s1_891_0 + s1_891_1);
    gl64_t kB891 = (tmp3_0 + tmp3_2) * (s1_891_0 + s1_891_2);
    gl64_t kC891 = (tmp3_1 + tmp3_2) * (s1_891_1 + s1_891_2);
    gl64_t kD891 = tmp3_0 * s1_891_0;
    gl64_t kE891 = tmp3_1 * s1_891_1;
    gl64_t kF891 = tmp3_2 * s1_891_2;
    gl64_t kG891 = kD891 - kE891;
    tmp3_0 = (kC891 + kG891) - kF891;
    tmp3_1 = ((((kA891 + kC891) - kE891) - kE891) - kD891);
    tmp3_2 = kB891 - kG891;
    // Op 892: dim1x1 mul
    gl64_t s0_892 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    gl64_t s1_892 = *(gl64_t*)&expressions_params[9][9];
    tmp1_0 = s0_892 * s1_892;
    // Op 893: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 894: dim3x3 mul
    gl64_t s1_894_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_894_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_894_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA894 = (tmp3_0 + tmp3_1) * (s1_894_0 + s1_894_1);
    gl64_t kB894 = (tmp3_0 + tmp3_2) * (s1_894_0 + s1_894_2);
    gl64_t kC894 = (tmp3_1 + tmp3_2) * (s1_894_1 + s1_894_2);
    gl64_t kD894 = tmp3_0 * s1_894_0;
    gl64_t kE894 = tmp3_1 * s1_894_1;
    gl64_t kF894 = tmp3_2 * s1_894_2;
    gl64_t kG894 = kD894 - kE894;
    tmp3_0 = (kC894 + kG894) - kF894;
    tmp3_1 = ((((kA894 + kC894) - kE894) - kE894) - kD894);
    tmp3_2 = kB894 - kG894;
    // Op 895: dim1x1 mul
    gl64_t s0_895 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    gl64_t s1_895 = *(gl64_t*)&expressions_params[9][9];
    tmp1_0 = s0_895 * s1_895;
    // Op 896: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 897: dim3x3 mul
    gl64_t s1_897_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_897_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_897_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA897 = (tmp3_0 + tmp3_1) * (s1_897_0 + s1_897_1);
    gl64_t kB897 = (tmp3_0 + tmp3_2) * (s1_897_0 + s1_897_2);
    gl64_t kC897 = (tmp3_1 + tmp3_2) * (s1_897_1 + s1_897_2);
    gl64_t kD897 = tmp3_0 * s1_897_0;
    gl64_t kE897 = tmp3_1 * s1_897_1;
    gl64_t kF897 = tmp3_2 * s1_897_2;
    gl64_t kG897 = kD897 - kE897;
    tmp3_0 = (kC897 + kG897) - kF897;
    tmp3_1 = ((((kA897 + kC897) - kE897) - kE897) - kD897);
    tmp3_2 = kB897 - kG897;
    // Op 898: dim1x1 mul
    gl64_t s0_898 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_898 = *(gl64_t*)&expressions_params[9][10];
    tmp1_0 = s0_898 * s1_898;
    // Op 899: dim1x1 add
    gl64_t s0_899 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_0 = s0_899 + tmp1_0;
    // Op 900: dim1x1 mul
    gl64_t s0_900 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    gl64_t s1_900 = *(gl64_t*)&expressions_params[9][2];
    tmp1_3 = s0_900 * s1_900;
    // Op 901: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 902: dim1x1 mul
    gl64_t s0_902 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    gl64_t s1_902 = *(gl64_t*)&expressions_params[9][14];
    tmp1_3 = s0_902 * s1_902;
    // Op 903: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 904: dim1x1 mul
    gl64_t s0_904 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_904 = *(gl64_t*)&expressions_params[9][11];
    tmp1_3 = s0_904 * s1_904;
    // Op 905: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 906: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 907: dim3x3 mul
    gl64_t s1_907_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_907_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_907_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA907 = (tmp3_0 + tmp3_1) * (s1_907_0 + s1_907_1);
    gl64_t kB907 = (tmp3_0 + tmp3_2) * (s1_907_0 + s1_907_2);
    gl64_t kC907 = (tmp3_1 + tmp3_2) * (s1_907_1 + s1_907_2);
    gl64_t kD907 = tmp3_0 * s1_907_0;
    gl64_t kE907 = tmp3_1 * s1_907_1;
    gl64_t kF907 = tmp3_2 * s1_907_2;
    gl64_t kG907 = kD907 - kE907;
    tmp3_0 = (kC907 + kG907) - kF907;
    tmp3_1 = ((((kA907 + kC907) - kE907) - kE907) - kD907);
    tmp3_2 = kB907 - kG907;
    // Op 908: dim3x1 add
    gl64_t s1_908 = *(gl64_t*)&expressions_params[9][27];
    tmp3_9 = tmp3_0 + s1_908; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 909: dim3x3 add
    gl64_t s1_909_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_909_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_909_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_909_0; tmp3_4 = tmp3_10 + s1_909_1; tmp3_5 = tmp3_11 + s1_909_2;
    // Op 910: dim3x1 mul
    gl64_t s0_910_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_910_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_910_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_910 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 59, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 59, domainSize, nCols_1))];
    tmp3_0 = s0_910_0 * s1_910; tmp3_1 = s0_910_1 * s1_910; tmp3_2 = s0_910_2 * s1_910;
    // Op 911: dim3x1 add
    gl64_t s1_911 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 58, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 58, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_911; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 912: dim3x3 mul
    gl64_t s1_912_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_912_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_912_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA912 = (tmp3_0 + tmp3_1) * (s1_912_0 + s1_912_1);
    gl64_t kB912 = (tmp3_0 + tmp3_2) * (s1_912_0 + s1_912_2);
    gl64_t kC912 = (tmp3_1 + tmp3_2) * (s1_912_1 + s1_912_2);
    gl64_t kD912 = tmp3_0 * s1_912_0;
    gl64_t kE912 = tmp3_1 * s1_912_1;
    gl64_t kF912 = tmp3_2 * s1_912_2;
    gl64_t kG912 = kD912 - kE912;
    tmp3_0 = (kC912 + kG912) - kF912;
    tmp3_1 = ((((kA912 + kC912) - kE912) - kE912) - kD912);
    tmp3_2 = kB912 - kG912;
    // Op 913: dim3x1 add
    gl64_t s1_913 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_913; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 914: dim3x3 mul
    gl64_t s1_914_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_914_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_914_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA914 = (tmp3_0 + tmp3_1) * (s1_914_0 + s1_914_1);
    gl64_t kB914 = (tmp3_0 + tmp3_2) * (s1_914_0 + s1_914_2);
    gl64_t kC914 = (tmp3_1 + tmp3_2) * (s1_914_1 + s1_914_2);
    gl64_t kD914 = tmp3_0 * s1_914_0;
    gl64_t kE914 = tmp3_1 * s1_914_1;
    gl64_t kF914 = tmp3_2 * s1_914_2;
    gl64_t kG914 = kD914 - kE914;
    tmp3_0 = (kC914 + kG914) - kF914;
    tmp3_1 = ((((kA914 + kC914) - kE914) - kE914) - kD914);
    tmp3_2 = kB914 - kG914;
    // Op 915: dim3x1 add
    gl64_t s1_915 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_915; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 916: dim3x3 mul
    gl64_t s1_916_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_916_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_916_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA916 = (tmp3_0 + tmp3_1) * (s1_916_0 + s1_916_1);
    gl64_t kB916 = (tmp3_0 + tmp3_2) * (s1_916_0 + s1_916_2);
    gl64_t kC916 = (tmp3_1 + tmp3_2) * (s1_916_1 + s1_916_2);
    gl64_t kD916 = tmp3_0 * s1_916_0;
    gl64_t kE916 = tmp3_1 * s1_916_1;
    gl64_t kF916 = tmp3_2 * s1_916_2;
    gl64_t kG916 = kD916 - kE916;
    tmp3_0 = (kC916 + kG916) - kF916;
    tmp3_1 = ((((kA916 + kC916) - kE916) - kE916) - kD916);
    tmp3_2 = kB916 - kG916;
    // Op 917: dim3x1 add
    gl64_t s1_917 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_917; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 918: dim3x3 mul
    gl64_t s1_918_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_918_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_918_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA918 = (tmp3_0 + tmp3_1) * (s1_918_0 + s1_918_1);
    gl64_t kB918 = (tmp3_0 + tmp3_2) * (s1_918_0 + s1_918_2);
    gl64_t kC918 = (tmp3_1 + tmp3_2) * (s1_918_1 + s1_918_2);
    gl64_t kD918 = tmp3_0 * s1_918_0;
    gl64_t kE918 = tmp3_1 * s1_918_1;
    gl64_t kF918 = tmp3_2 * s1_918_2;
    gl64_t kG918 = kD918 - kE918;
    tmp3_0 = (kC918 + kG918) - kF918;
    tmp3_1 = ((((kA918 + kC918) - kE918) - kE918) - kD918);
    tmp3_2 = kB918 - kG918;
    // Op 919: dim1x1 mul
    gl64_t s0_919 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    gl64_t s1_919 = *(gl64_t*)&expressions_params[9][12];
    tmp1_0 = s0_919 * s1_919;
    // Op 920: dim1x1 mul
    gl64_t s0_920 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    gl64_t s1_920 = *(gl64_t*)&expressions_params[9][3];
    tmp1_3 = s0_920 * s1_920;
    // Op 921: dim1x1 add
    tmp1_1 = tmp1_0 + tmp1_3;
    // Op 922: dim1x1 mul
    gl64_t s0_922 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    gl64_t s1_922 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_922 * s1_922;
    // Op 923: dim1x1 add
    gl64_t s0_923 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_923 + tmp1_0;
    // Op 924: dim1x1 mul
    gl64_t s0_924 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    gl64_t s1_924 = *(gl64_t*)&expressions_params[9][13];
    tmp1_3 = s0_924 * s1_924;
    // Op 925: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 926: dim1x1 mul
    gl64_t s0_926 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    gl64_t s1_926 = *(gl64_t*)&expressions_params[9][10];
    tmp1_3 = s0_926 * s1_926;
    // Op 927: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 928: dim1x1 mul
    gl64_t s0_928 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    gl64_t s1_928 = *(gl64_t*)&expressions_params[9][14];
    tmp1_3 = s0_928 * s1_928;
    // Op 929: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 930: dim1x1 mul
    gl64_t s0_930 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    gl64_t s1_930 = *(gl64_t*)&expressions_params[9][15];
    tmp1_3 = s0_930 * s1_930;
    // Op 931: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 932: dim1x1 mul
    gl64_t s1_932 = *(gl64_t*)&expressions_params[9][16];
    tmp1_2 = tmp1_2 * s1_932;
    // Op 933: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_2;
    // Op 934: dim1x1 mul
    gl64_t s1_934 = *(gl64_t*)&expressions_params[9][17];
    tmp1_0 = tmp1_0 * s1_934;
    // Op 935: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 936: dim1x1 mul
    gl64_t s0_936 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_936 = *(gl64_t*)&expressions_params[9][18];
    tmp1_1 = s0_936 * s1_936;
    // Op 937: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_1;
    // Op 938: dim1x1 mul
    gl64_t s1_938 = *(gl64_t*)&expressions_params[9][4];
    tmp1_4 = tmp1_4 * s1_938;
    // Op 939: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_4;
    // Op 940: dim1x1 mul
    gl64_t s0_940 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 47, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 47, domainSize, nCols_1))];
    gl64_t s1_940 = *(gl64_t*)&expressions_params[9][19];
    tmp1_4 = s0_940 * s1_940;
    // Op 941: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_4;
    // Op 942: dim1x1 mul
    gl64_t s0_942 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 48, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 48, domainSize, nCols_1))];
    gl64_t s1_942 = *(gl64_t*)&expressions_params[9][20];
    tmp1_4 = s0_942 * s1_942;
    // Op 943: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_4;
    // Op 944: dim1x1 mul
    gl64_t s0_944 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 49, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 49, domainSize, nCols_1))];
    gl64_t s1_944 = *(gl64_t*)&expressions_params[9][21];
    tmp1_4 = s0_944 * s1_944;
    // Op 945: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_4;
    // Op 946: dim1x1 mul
    gl64_t s0_946 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 50, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 50, domainSize, nCols_1))];
    gl64_t s1_946 = *(gl64_t*)&expressions_params[9][22];
    tmp1_4 = s0_946 * s1_946;
    // Op 947: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_4;
    // Op 948: dim1x1 mul
    gl64_t s0_948 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 51, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 51, domainSize, nCols_1))];
    gl64_t s1_948 = *(gl64_t*)&expressions_params[9][9];
    tmp1_4 = s0_948 * s1_948;
    // Op 949: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_4;
    // Op 950: dim1x1 mul
    gl64_t s0_950 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 52, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 52, domainSize, nCols_1))];
    gl64_t s1_950 = *(gl64_t*)&expressions_params[9][10];
    tmp1_4 = s0_950 * s1_950;
    // Op 951: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_4;
    // Op 952: dim1x1 mul
    gl64_t s0_952 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 53, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 53, domainSize, nCols_1))];
    gl64_t s1_952 = *(gl64_t*)&expressions_params[9][2];
    tmp1_4 = s0_952 * s1_952;
    // Op 953: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_4;
    // Op 954: dim1x1 add
    gl64_t s0_954 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 54, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 54, domainSize, nCols_1))];
    tmp1_1 = s0_954 + tmp1_0;
    // Op 955: dim1x1 mul
    gl64_t s0_955 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 57, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 57, domainSize, nCols_1))];
    gl64_t s1_955 = *(gl64_t*)&expressions_params[9][23];
    tmp1_0 = s0_955 * s1_955;
    // Op 956: dim1x1 mul
    gl64_t s0_956 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_956 = *(gl64_t*)&expressions_params[9][24];
    tmp1_4 = s0_956 * s1_956;
    // Op 957: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_4;
    // Op 958: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 959: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 960: dim3x3 mul
    gl64_t s1_960_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_960_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_960_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA960 = (tmp3_0 + tmp3_1) * (s1_960_0 + s1_960_1);
    gl64_t kB960 = (tmp3_0 + tmp3_2) * (s1_960_0 + s1_960_2);
    gl64_t kC960 = (tmp3_1 + tmp3_2) * (s1_960_1 + s1_960_2);
    gl64_t kD960 = tmp3_0 * s1_960_0;
    gl64_t kE960 = tmp3_1 * s1_960_1;
    gl64_t kF960 = tmp3_2 * s1_960_2;
    gl64_t kG960 = kD960 - kE960;
    tmp3_0 = (kC960 + kG960) - kF960;
    tmp3_1 = ((((kA960 + kC960) - kE960) - kE960) - kD960);
    tmp3_2 = kB960 - kG960;
    // Op 961: dim3x1 add
    gl64_t s1_961 = *(gl64_t*)&expressions_params[9][25];
    tmp3_6 = tmp3_0 + s1_961; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 962: dim3x3 add
    gl64_t s1_962_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_962_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_962_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_962_0; tmp3_1 = tmp3_7 + s1_962_1; tmp3_2 = tmp3_8 + s1_962_2;
    // Op 963: dim3x3 mul
    gl64_t kA963 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB963 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC963 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD963 = tmp3_3 * tmp3_0;
    gl64_t kE963 = tmp3_4 * tmp3_1;
    gl64_t kF963 = tmp3_5 * tmp3_2;
    gl64_t kG963 = kD963 - kE963;
    tmp3_0 = (kC963 + kG963) - kF963;
    tmp3_1 = ((((kA963 + kC963) - kE963) - kE963) - kD963);
    tmp3_2 = kB963 - kG963;
    // Op 964: dim3x3 mul
    gl64_t s0_964_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 27+0, domainSize, nCols_2))];
    gl64_t s0_964_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 27+1, domainSize, nCols_2))];
    gl64_t s0_964_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 27+2, domainSize, nCols_2))];
    gl64_t kA964 = (s0_964_0 + s0_964_1) * (tmp3_0 + tmp3_1);
    gl64_t kB964 = (s0_964_0 + s0_964_2) * (tmp3_0 + tmp3_2);
    gl64_t kC964 = (s0_964_1 + s0_964_2) * (tmp3_1 + tmp3_2);
    gl64_t kD964 = s0_964_0 * tmp3_0;
    gl64_t kE964 = s0_964_1 * tmp3_1;
    gl64_t kF964 = s0_964_2 * tmp3_2;
    gl64_t kG964 = kD964 - kE964;
    tmp3_0 = (kC964 + kG964) - kF964;
    tmp3_1 = ((((kA964 + kC964) - kE964) - kE964) - kD964);
    tmp3_2 = kB964 - kG964;
    // Op 965: dim3x3 add
    gl64_t s1_965_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_965_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_965_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_965_0; tmp3_7 = tmp3_7 + s1_965_1; tmp3_8 = tmp3_8 + s1_965_2;
    // Op 966: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_5; tmp3_7 = tmp3_7 * tmp1_5; tmp3_8 = tmp3_8 * tmp1_5;
    // Op 967: dim1x1 sub_swap
    gl64_t s1_967 = *(gl64_t*)&expressions_params[9][6];
    tmp1_5 = s1_967 - tmp1_5;
    // Op 968: dim3x3 add
    gl64_t s1_968_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_968_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_968_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_968_0; tmp3_10 = tmp3_10 + s1_968_1; tmp3_11 = tmp3_11 + s1_968_2;
    // Op 969: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_5; tmp3_10 = tmp3_10 * tmp1_5; tmp3_11 = tmp3_11 * tmp1_5;
    // Op 970: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 971: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 972: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 973: dim3x3 mul
    gl64_t s1_973_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_973_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_973_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA973 = (tmp3_0 + tmp3_1) * (s1_973_0 + s1_973_1);
    gl64_t kB973 = (tmp3_0 + tmp3_2) * (s1_973_0 + s1_973_2);
    gl64_t kC973 = (tmp3_1 + tmp3_2) * (s1_973_1 + s1_973_2);
    gl64_t kD973 = tmp3_0 * s1_973_0;
    gl64_t kE973 = tmp3_1 * s1_973_1;
    gl64_t kF973 = tmp3_2 * s1_973_2;
    gl64_t kG973 = kD973 - kE973;
    tmp3_6 = (kC973 + kG973) - kF973;
    tmp3_7 = ((((kA973 + kC973) - kE973) - kE973) - kD973);
    tmp3_8 = kB973 - kG973;
    // Op 974: dim1x1 sub_swap
    gl64_t s0_974 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    gl64_t s1_974 = *(gl64_t*)&expressions_params[9][0];
    tmp1_5 = s1_974 - s0_974;
    // Op 975: dim3x1 mul
    uint64_t s0_975_pos = dExpsArgs->mapOffsetsExps[2] + (false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_2) : getBufferOffset(logicalRow_0, 0, domainSize, nCols_2));
    gl64_t s0_975_0 = *(gl64_t*)&dParams->aux_trace[s0_975_pos];
    gl64_t s0_975_1 = *(gl64_t*)&dParams->aux_trace[s0_975_pos + TILE_HEIGHT];
    gl64_t s0_975_2 = *(gl64_t*)&dParams->aux_trace[s0_975_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_975_0 * tmp1_5; tmp3_1 = s0_975_1 * tmp1_5; tmp3_2 = s0_975_2 * tmp1_5;
    // Op 976: dim3x3 sub
    uint64_t s0_976_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_2));
    gl64_t s0_976_0 = *(gl64_t*)&dParams->aux_trace[s0_976_pos];
    gl64_t s0_976_1 = *(gl64_t*)&dParams->aux_trace[s0_976_pos + TILE_HEIGHT];
    gl64_t s0_976_2 = *(gl64_t*)&dParams->aux_trace[s0_976_pos + 2*TILE_HEIGHT];
    tmp3_12 = s0_976_0 - tmp3_0; tmp3_13 = s0_976_1 - tmp3_1; tmp3_14 = s0_976_2 - tmp3_2;
    // Op 977: dim3x3 add
    gl64_t s0_977_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+0, domainSize, nCols_2))];
    gl64_t s0_977_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+1, domainSize, nCols_2))];
    gl64_t s0_977_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+2, domainSize, nCols_2))];
    gl64_t s1_977_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+0, domainSize, nCols_2))];
    gl64_t s1_977_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+1, domainSize, nCols_2))];
    gl64_t s1_977_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+2, domainSize, nCols_2))];
    tmp3_0 = s0_977_0 + s1_977_0; tmp3_1 = s0_977_1 + s1_977_1; tmp3_2 = s0_977_2 + s1_977_2;
    // Op 978: dim3x3 add
    uint64_t s0_978_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_2));
    gl64_t s0_978_0 = *(gl64_t*)&dParams->aux_trace[s0_978_pos];
    gl64_t s0_978_1 = *(gl64_t*)&dParams->aux_trace[s0_978_pos + TILE_HEIGHT];
    gl64_t s0_978_2 = *(gl64_t*)&dParams->aux_trace[s0_978_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_978_0 + tmp3_0; tmp3_1 = s0_978_1 + tmp3_1; tmp3_2 = s0_978_2 + tmp3_2;
    // Op 979: dim3x3 add
    uint64_t s0_979_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_2));
    gl64_t s0_979_0 = *(gl64_t*)&dParams->aux_trace[s0_979_pos];
    gl64_t s0_979_1 = *(gl64_t*)&dParams->aux_trace[s0_979_pos + TILE_HEIGHT];
    gl64_t s0_979_2 = *(gl64_t*)&dParams->aux_trace[s0_979_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_979_0 + tmp3_0; tmp3_1 = s0_979_1 + tmp3_1; tmp3_2 = s0_979_2 + tmp3_2;
    // Op 980: dim3x3 add
    gl64_t s0_980_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+0, domainSize, nCols_2))];
    gl64_t s0_980_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+1, domainSize, nCols_2))];
    gl64_t s0_980_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+2, domainSize, nCols_2))];
    tmp3_0 = s0_980_0 + tmp3_0; tmp3_1 = s0_980_1 + tmp3_1; tmp3_2 = s0_980_2 + tmp3_2;
    // Op 981: dim3x3 add
    gl64_t s0_981_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+0, domainSize, nCols_2))];
    gl64_t s0_981_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+1, domainSize, nCols_2))];
    gl64_t s0_981_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+2, domainSize, nCols_2))];
    tmp3_0 = s0_981_0 + tmp3_0; tmp3_1 = s0_981_1 + tmp3_1; tmp3_2 = s0_981_2 + tmp3_2;
    // Op 982: dim3x3 add
    uint64_t s0_982_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_2));
    gl64_t s0_982_0 = *(gl64_t*)&dParams->aux_trace[s0_982_pos];
    gl64_t s0_982_1 = *(gl64_t*)&dParams->aux_trace[s0_982_pos + TILE_HEIGHT];
    gl64_t s0_982_2 = *(gl64_t*)&dParams->aux_trace[s0_982_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_982_0 + tmp3_0; tmp3_1 = s0_982_1 + tmp3_1; tmp3_2 = s0_982_2 + tmp3_2;
    // Op 983: dim3x3 add
    uint64_t s0_983_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_2));
    gl64_t s0_983_0 = *(gl64_t*)&dParams->aux_trace[s0_983_pos];
    gl64_t s0_983_1 = *(gl64_t*)&dParams->aux_trace[s0_983_pos + TILE_HEIGHT];
    gl64_t s0_983_2 = *(gl64_t*)&dParams->aux_trace[s0_983_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_983_0 + tmp3_0; tmp3_1 = s0_983_1 + tmp3_1; tmp3_2 = s0_983_2 + tmp3_2;
    // Op 984: dim3x3 add
    gl64_t s0_984_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 27+0, domainSize, nCols_2))];
    gl64_t s0_984_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 27+1, domainSize, nCols_2))];
    gl64_t s0_984_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 27+2, domainSize, nCols_2))];
    tmp3_0 = s0_984_0 + tmp3_0; tmp3_1 = s0_984_1 + tmp3_1; tmp3_2 = s0_984_2 + tmp3_2;
    // Op 985: dim3x3 sub
    tmp3_12 = tmp3_12 - tmp3_0; tmp3_13 = tmp3_13 - tmp3_1; tmp3_14 = tmp3_14 - tmp3_2;
    // Op 986: dim3x1 mul
    gl64_t s0_986_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_986_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_986_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_986 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    tmp3_0 = s0_986_0 * s1_986; tmp3_1 = s0_986_1 * s1_986; tmp3_2 = s0_986_2 * s1_986;
    // Op 987: dim3x1 add
    gl64_t s1_987 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_987; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 988: dim3x3 mul
    gl64_t s1_988_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_988_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_988_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA988 = (tmp3_0 + tmp3_1) * (s1_988_0 + s1_988_1);
    gl64_t kB988 = (tmp3_0 + tmp3_2) * (s1_988_0 + s1_988_2);
    gl64_t kC988 = (tmp3_1 + tmp3_2) * (s1_988_1 + s1_988_2);
    gl64_t kD988 = tmp3_0 * s1_988_0;
    gl64_t kE988 = tmp3_1 * s1_988_1;
    gl64_t kF988 = tmp3_2 * s1_988_2;
    gl64_t kG988 = kD988 - kE988;
    tmp3_0 = (kC988 + kG988) - kF988;
    tmp3_1 = ((((kA988 + kC988) - kE988) - kE988) - kD988);
    tmp3_2 = kB988 - kG988;
    // Op 989: dim3x1 add
    gl64_t s1_989 = *(gl64_t*)&expressions_params[9][7];
    tmp3_0 = tmp3_0 + s1_989; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 990: dim3x3 add
    gl64_t s1_990_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_990_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_990_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_990_0; tmp3_1 = tmp3_1 + s1_990_1; tmp3_2 = tmp3_2 + s1_990_2;
    // Op 991: dim3x3 mul
    gl64_t kA991 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB991 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC991 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD991 = tmp3_12 * tmp3_0;
    gl64_t kE991 = tmp3_13 * tmp3_1;
    gl64_t kF991 = tmp3_14 * tmp3_2;
    gl64_t kG991 = kD991 - kE991;
    tmp3_0 = (kC991 + kG991) - kF991;
    tmp3_1 = ((((kA991 + kC991) - kE991) - kE991) - kD991);
    tmp3_2 = kB991 - kG991;
    // Op 992: dim1x1 sub_swap
    gl64_t s1_992 = *(gl64_t*)&expressions_params[9][6];
    tmp1_6 = s1_992 - tmp1_6;
    // Op 993: dim3x1 sub
    tmp3_0 = tmp3_0 - tmp1_6; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 994: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 995: dim3x3 mul
    gl64_t s1_995_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_995_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_995_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA995 = (tmp3_0 + tmp3_1) * (s1_995_0 + s1_995_1);
    gl64_t kB995 = (tmp3_0 + tmp3_2) * (s1_995_0 + s1_995_2);
    gl64_t kC995 = (tmp3_1 + tmp3_2) * (s1_995_1 + s1_995_2);
    gl64_t kD995 = tmp3_0 * s1_995_0;
    gl64_t kE995 = tmp3_1 * s1_995_1;
    gl64_t kF995 = tmp3_2 * s1_995_2;
    gl64_t kG995 = kD995 - kE995;
    tmp3_6 = (kC995 + kG995) - kF995;
    tmp3_7 = ((((kA995 + kC995) - kE995) - kE995) - kD995);
    tmp3_8 = kB995 - kG995;
    // Op 996: dim3x3 sub_swap
    uint64_t s0_996_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_2));
    gl64_t s0_996_0 = *(gl64_t*)&dParams->aux_trace[s0_996_pos];
    gl64_t s0_996_1 = *(gl64_t*)&dParams->aux_trace[s0_996_pos + TILE_HEIGHT];
    gl64_t s0_996_2 = *(gl64_t*)&dParams->aux_trace[s0_996_pos + 2*TILE_HEIGHT];
    gl64_t s1_996_0 = *(gl64_t*)&expressions_params[12][0];
    gl64_t s1_996_1 = *(gl64_t*)&expressions_params[12][0+1];
    gl64_t s1_996_2 = *(gl64_t*)&expressions_params[12][0+2];
    tmp3_0 = s1_996_0 - s0_996_0; tmp3_1 = s1_996_1 - s0_996_1; tmp3_2 = s1_996_2 - s0_996_2;
    // Op 997: dim3x1 mul
    gl64_t s1_997 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp3_0 = tmp3_0 * s1_997; tmp3_1 = tmp3_1 * s1_997; tmp3_2 = tmp3_2 * s1_997;
    // Op 998: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 999: dim3x3 mul
    gl64_t s1_999_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_999_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_999_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA999 = (tmp3_0 + tmp3_1) * (s1_999_0 + s1_999_1);
    gl64_t kB999 = (tmp3_0 + tmp3_2) * (s1_999_0 + s1_999_2);
    gl64_t kC999 = (tmp3_1 + tmp3_2) * (s1_999_1 + s1_999_2);
    gl64_t kD999 = tmp3_0 * s1_999_0;
    gl64_t kE999 = tmp3_1 * s1_999_1;
    gl64_t kF999 = tmp3_2 * s1_999_2;
    gl64_t kG999 = kD999 - kE999;
    tmp3_0 = (kC999 + kG999) - kF999;
    tmp3_1 = ((((kA999 + kC999) - kE999) - kE999) - kD999);
    tmp3_2 = kB999 - kG999;
    // Op 1000: dim1x1 mul
    gl64_t s0_1000 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 40, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 40, domainSize, nCols_1))];
    gl64_t s1_1000 = *(gl64_t*)&expressions_params[9][3];
    tmp1_6 = s0_1000 * s1_1000;
    // Op 1001: dim1x1 add
    gl64_t s0_1001 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 39, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 39, domainSize, nCols_1))];
    tmp1_6 = s0_1001 + tmp1_6;
    // Op 1002: dim1x1 mul
    gl64_t s0_1002 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 41, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 41, domainSize, nCols_1))];
    gl64_t s1_1002 = *(gl64_t*)&expressions_params[9][4];
    tmp1_5 = s0_1002 * s1_1002;
    // Op 1003: dim1x1 add
    tmp1_5 = tmp1_6 + tmp1_5;
    // Op 1004: dim1x1 mul
    gl64_t s0_1004 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 42, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 42, domainSize, nCols_1))];
    gl64_t s1_1004 = *(gl64_t*)&expressions_params[9][5];
    tmp1_6 = s0_1004 * s1_1004;
    // Op 1005: dim1x1 add
    tmp1_5 = tmp1_5 + tmp1_6;
    // Op 1006: dim1x1 sub_swap
    gl64_t s0_1006 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 60, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 60, domainSize, nCols_1))];
    tmp1_6 = tmp1_5 - s0_1006;
    // Op 1007: dim1x1 mul
    gl64_t s0_1007 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 58, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 58, domainSize, nCols_1))];
    gl64_t s1_1007 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 56, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 56, domainSize, nCols_1))];
    tmp1_5 = s0_1007 * s1_1007;
    // Op 1008: dim1x1 mul
    gl64_t s0_1008 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp1_5 = s0_1008 * tmp1_5;
    // Op 1009: dim1x1 sub
    tmp1_5 = tmp1_6 - tmp1_5;
    // Op 1010: dim1x1 sub
    gl64_t s0_1010 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_2))];
    tmp1_5 = s0_1010 - tmp1_5;
    // Op 1011: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_5; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 1012: dim3x3 mul
    gl64_t s1_1012_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_1012_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_1012_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA1012 = (tmp3_0 + tmp3_1) * (s1_1012_0 + s1_1012_1);
    gl64_t kB1012 = (tmp3_0 + tmp3_2) * (s1_1012_0 + s1_1012_2);
    gl64_t kC1012 = (tmp3_1 + tmp3_2) * (s1_1012_1 + s1_1012_2);
    gl64_t kD1012 = tmp3_0 * s1_1012_0;
    gl64_t kE1012 = tmp3_1 * s1_1012_1;
    gl64_t kF1012 = tmp3_2 * s1_1012_2;
    gl64_t kG1012 = kD1012 - kE1012;
    tmp3_0 = (kC1012 + kG1012) - kF1012;
    tmp3_1 = ((((kA1012 + kC1012) - kE1012) - kE1012) - kD1012);
    tmp3_2 = kB1012 - kG1012;
    // Op 1013: dim1x1 mul
    gl64_t s0_1013 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 44, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 44, domainSize, nCols_1))];
    gl64_t s1_1013 = *(gl64_t*)&expressions_params[9][3];
    tmp1_5 = s0_1013 * s1_1013;
    // Op 1014: dim1x1 add
    gl64_t s0_1014 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 43, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 43, domainSize, nCols_1))];
    tmp1_5 = s0_1014 + tmp1_5;
    // Op 1015: dim1x1 mul
    gl64_t s0_1015 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 45, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 45, domainSize, nCols_1))];
    gl64_t s1_1015 = *(gl64_t*)&expressions_params[9][4];
    tmp1_6 = s0_1015 * s1_1015;
    // Op 1016: dim1x1 add
    tmp1_5 = tmp1_5 + tmp1_6;
    // Op 1017: dim1x1 mul
    gl64_t s0_1017 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 46, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 46, domainSize, nCols_1))];
    gl64_t s1_1017 = *(gl64_t*)&expressions_params[9][5];
    tmp1_6 = s0_1017 * s1_1017;
    // Op 1018: dim1x1 add
    tmp1_5 = tmp1_5 + tmp1_6;
    // Op 1019: dim1x1 sub_swap
    gl64_t s0_1019 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 61, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 61, domainSize, nCols_1))];
    tmp1_6 = tmp1_5 - s0_1019;
    // Op 1020: dim1x1 mul
    gl64_t s0_1020 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 59, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 59, domainSize, nCols_1))];
    gl64_t s1_1020 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 56, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 56, domainSize, nCols_1))];
    tmp1_5 = s0_1020 * s1_1020;
    // Op 1021: dim1x1 mul
    gl64_t s0_1021 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp1_5 = s0_1021 * tmp1_5;
    // Op 1022: dim1x1 sub
    tmp1_5 = tmp1_6 - tmp1_5;
    // Op 1023: dim1x1 sub
    gl64_t s0_1023 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 31, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 31, domainSize, nCols_2))];
    tmp1_5 = s0_1023 - tmp1_5;
    // Op 1024: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_5; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 1025: dim3x1 mul
    gl64_t s1_1025 = *(gl64_t*)&dParams->aux_trace[dArgs->zi_offset + (1 - 1) * domainSize + row + threadIdx.x];
    tmp3_0 = tmp3_0 * s1_1025; tmp3_1 = tmp3_1 * s1_1025; tmp3_2 = tmp3_2 * s1_1025;

    // Write final result to shared memory and store to output
    *(gl64_t*)&expressions_params[bufferCommitsSize + 1][0 * blockDim.x + threadIdx.x] = tmp3_0;
    *(gl64_t*)&expressions_params[bufferCommitsSize + 1][1 * blockDim.x + threadIdx.x] = tmp3_1;
    *(gl64_t*)&expressions_params[bufferCommitsSize + 1][2 * blockDim.x + threadIdx.x] = tmp3_2;
    storePolynomial__((ExpsArguments*)dExpsArgs, (Goldilocks::Element*)&expressions_params[bufferCommitsSize + 1][0 * blockDim.x], row);
}
