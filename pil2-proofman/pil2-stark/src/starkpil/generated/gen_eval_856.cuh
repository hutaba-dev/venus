// Auto-generated expression evaluator - matches load__() semantics exactly
// Q expressions: domainExtended=true always, type 1 goes through aux_trace

// Fingerprint: 9575516e  nOps=673 nTemp1=6 nTemp3=5
#define GENERATED_EVAL_NOPS_9575516e 673
#define GENERATED_EVAL_NTEMP1_9575516e 6
#define GENERATED_EVAL_NTEMP3_9575516e 5

template<bool IsCyclic>
__device__ __forceinline__ void eval_expr_9575516e(
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

    // Register-resident temporaries: 6 tmp1 + 15 tmp3 slots
    gl64_t tmp1_0 = gl64_t(uint64_t(0));
    gl64_t tmp1_1 = gl64_t(uint64_t(0));
    gl64_t tmp1_2 = gl64_t(uint64_t(0));
    gl64_t tmp1_3 = gl64_t(uint64_t(0));
    gl64_t tmp1_4 = gl64_t(uint64_t(0));
    gl64_t tmp1_5 = gl64_t(uint64_t(0));
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
    gl64_t s0_0 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_0 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_0 - s1_0;
    // Op 1: dim1x1 mul
    gl64_t s1_1 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = tmp1_0 * s1_1;
    // Op 2: dim3x1 mul
    gl64_t s0_2_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s0_2_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s0_2_2 = *(gl64_t*)&expressions_params[13][6+2];
    tmp3_0 = s0_2_0 * tmp1_0; tmp3_1 = s0_2_1 * tmp1_0; tmp3_2 = s0_2_2 * tmp1_0;
    // Op 3: dim1x1 sub
    gl64_t s0_3 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_3 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_3 - s1_3;
    // Op 4: dim1x1 mul
    gl64_t s1_4 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = tmp1_0 * s1_4;
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
    // Op 7: dim1x1 sub
    gl64_t s0_7 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_7 = *(gl64_t*)&expressions_params[10][11];
    tmp1_0 = s0_7 - s1_7;
    // Op 8: dim1x1 mul
    gl64_t s1_8 = *(gl64_t*)&expressions_params[10][11];
    tmp1_0 = tmp1_0 * s1_8;
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
    gl64_t s0_11 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    gl64_t s1_11 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_11 - s0_11;
    // Op 12: dim1x1 mul
    gl64_t s0_12 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
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
    gl64_t s0_15 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 1, domainSize, nCols_1))];
    gl64_t s1_15 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s1_15 - s0_15;
    // Op 16: dim1x1 mul
    gl64_t s0_16 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    tmp1_0 = s0_16 * tmp1_0;
    // Op 17: dim1x1 add
    gl64_t s0_17 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 1, domainSize, nCols_1))];
    tmp1_0 = s0_17 + tmp1_0;
    // Op 18: dim1x1 sub
    gl64_t s0_18 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    tmp1_0 = s0_18 - tmp1_0;
    // Op 19: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 20: dim3x3 mul
    gl64_t s1_20_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_20_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_20_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA20 = (tmp3_0 + tmp3_1) * (s1_20_0 + s1_20_1);
    gl64_t kB20 = (tmp3_0 + tmp3_2) * (s1_20_0 + s1_20_2);
    gl64_t kC20 = (tmp3_1 + tmp3_2) * (s1_20_1 + s1_20_2);
    gl64_t kD20 = tmp3_0 * s1_20_0;
    gl64_t kE20 = tmp3_1 * s1_20_1;
    gl64_t kF20 = tmp3_2 * s1_20_2;
    gl64_t kG20 = kD20 - kE20;
    tmp3_0 = (kC20 + kG20) - kF20;
    tmp3_1 = ((((kA20 + kC20) - kE20) - kE20) - kD20);
    tmp3_2 = kB20 - kG20;
    // Op 21: dim1x1 sub_swap
    gl64_t s0_21 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_21 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_21 - s0_21;
    // Op 22: dim1x1 mul
    gl64_t s0_22 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    tmp1_0 = s0_22 * tmp1_0;
    // Op 23: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 24: dim3x3 mul
    gl64_t s1_24_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_24_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_24_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA24 = (tmp3_0 + tmp3_1) * (s1_24_0 + s1_24_1);
    gl64_t kB24 = (tmp3_0 + tmp3_2) * (s1_24_0 + s1_24_2);
    gl64_t kC24 = (tmp3_1 + tmp3_2) * (s1_24_1 + s1_24_2);
    gl64_t kD24 = tmp3_0 * s1_24_0;
    gl64_t kE24 = tmp3_1 * s1_24_1;
    gl64_t kF24 = tmp3_2 * s1_24_2;
    gl64_t kG24 = kD24 - kE24;
    tmp3_0 = (kC24 + kG24) - kF24;
    tmp3_1 = ((((kA24 + kC24) - kE24) - kE24) - kD24);
    tmp3_2 = kB24 - kG24;
    // Op 25: dim1x1 sub_swap
    gl64_t s0_25 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_25 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_25 - s0_25;
    // Op 26: dim1x1 mul
    gl64_t s0_26 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    tmp1_0 = s0_26 * tmp1_0;
    // Op 27: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 28: dim3x3 mul
    gl64_t s1_28_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_28_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_28_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA28 = (tmp3_0 + tmp3_1) * (s1_28_0 + s1_28_1);
    gl64_t kB28 = (tmp3_0 + tmp3_2) * (s1_28_0 + s1_28_2);
    gl64_t kC28 = (tmp3_1 + tmp3_2) * (s1_28_1 + s1_28_2);
    gl64_t kD28 = tmp3_0 * s1_28_0;
    gl64_t kE28 = tmp3_1 * s1_28_1;
    gl64_t kF28 = tmp3_2 * s1_28_2;
    gl64_t kG28 = kD28 - kE28;
    tmp3_0 = (kC28 + kG28) - kF28;
    tmp3_1 = ((((kA28 + kC28) - kE28) - kE28) - kD28);
    tmp3_2 = kB28 - kG28;
    // Op 29: dim1x1 sub_swap
    gl64_t s0_29 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_29 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_29 - s0_29;
    // Op 30: dim1x1 mul
    gl64_t s0_30 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_0 = s0_30 * tmp1_0;
    // Op 31: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 32: dim3x3 mul
    gl64_t s1_32_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_32_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_32_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA32 = (tmp3_0 + tmp3_1) * (s1_32_0 + s1_32_1);
    gl64_t kB32 = (tmp3_0 + tmp3_2) * (s1_32_0 + s1_32_2);
    gl64_t kC32 = (tmp3_1 + tmp3_2) * (s1_32_1 + s1_32_2);
    gl64_t kD32 = tmp3_0 * s1_32_0;
    gl64_t kE32 = tmp3_1 * s1_32_1;
    gl64_t kF32 = tmp3_2 * s1_32_2;
    gl64_t kG32 = kD32 - kE32;
    tmp3_0 = (kC32 + kG32) - kF32;
    tmp3_1 = ((((kA32 + kC32) - kE32) - kE32) - kD32);
    tmp3_2 = kB32 - kG32;
    // Op 33: dim1x1 sub_swap
    gl64_t s0_33 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    gl64_t s1_33 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_33 - s0_33;
    // Op 34: dim1x1 mul
    gl64_t s0_34 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_34 * tmp1_0;
    // Op 35: dim1x1 sub
    gl64_t s0_35 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_35 = *(gl64_t*)&expressions_params[10][15];
    tmp1_1 = s0_35 - s1_35;
    // Op 36: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 37: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 38: dim3x3 mul
    gl64_t s1_38_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_38_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_38_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA38 = (tmp3_0 + tmp3_1) * (s1_38_0 + s1_38_1);
    gl64_t kB38 = (tmp3_0 + tmp3_2) * (s1_38_0 + s1_38_2);
    gl64_t kC38 = (tmp3_1 + tmp3_2) * (s1_38_1 + s1_38_2);
    gl64_t kD38 = tmp3_0 * s1_38_0;
    gl64_t kE38 = tmp3_1 * s1_38_1;
    gl64_t kF38 = tmp3_2 * s1_38_2;
    gl64_t kG38 = kD38 - kE38;
    tmp3_0 = (kC38 + kG38) - kF38;
    tmp3_1 = ((((kA38 + kC38) - kE38) - kE38) - kD38);
    tmp3_2 = kB38 - kG38;
    // Op 39: dim1x1 sub_swap
    gl64_t s0_39 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_39 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_39 - s0_39;
    // Op 40: dim1x1 mul
    gl64_t s0_40 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    tmp1_0 = s0_40 * tmp1_0;
    // Op 41: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 42: dim3x3 mul
    gl64_t s1_42_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_42_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_42_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA42 = (tmp3_0 + tmp3_1) * (s1_42_0 + s1_42_1);
    gl64_t kB42 = (tmp3_0 + tmp3_2) * (s1_42_0 + s1_42_2);
    gl64_t kC42 = (tmp3_1 + tmp3_2) * (s1_42_1 + s1_42_2);
    gl64_t kD42 = tmp3_0 * s1_42_0;
    gl64_t kE42 = tmp3_1 * s1_42_1;
    gl64_t kF42 = tmp3_2 * s1_42_2;
    gl64_t kG42 = kD42 - kE42;
    tmp3_0 = (kC42 + kG42) - kF42;
    tmp3_1 = ((((kA42 + kC42) - kE42) - kE42) - kD42);
    tmp3_2 = kB42 - kG42;
    // Op 43: dim1x1 mul
    gl64_t s0_43 = *(gl64_t*)&expressions_params[10][15];
    gl64_t s1_43 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_43 * s1_43;
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
    // Op 46: dim1x1 mul
    gl64_t s0_46 = *(gl64_t*)&expressions_params[10][14];
    gl64_t s1_46 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_46 * s1_46;
    // Op 47: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 48: dim3x3 mul
    gl64_t s1_48_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_48_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_48_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA48 = (tmp3_0 + tmp3_1) * (s1_48_0 + s1_48_1);
    gl64_t kB48 = (tmp3_0 + tmp3_2) * (s1_48_0 + s1_48_2);
    gl64_t kC48 = (tmp3_1 + tmp3_2) * (s1_48_1 + s1_48_2);
    gl64_t kD48 = tmp3_0 * s1_48_0;
    gl64_t kE48 = tmp3_1 * s1_48_1;
    gl64_t kF48 = tmp3_2 * s1_48_2;
    gl64_t kG48 = kD48 - kE48;
    tmp3_0 = (kC48 + kG48) - kF48;
    tmp3_1 = ((((kA48 + kC48) - kE48) - kE48) - kD48);
    tmp3_2 = kB48 - kG48;
    // Op 49: dim1x1 sub_swap
    gl64_t s0_49 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_49 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_49 - s0_49;
    // Op 50: dim1x1 mul
    gl64_t s0_50 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp1_0 = s0_50 * tmp1_0;
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
    // Op 53: dim1x1 sub_swap
    gl64_t s0_53 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_53 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_53 - s0_53;
    // Op 54: dim1x1 mul
    gl64_t s0_54 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp1_0 = s0_54 * tmp1_0;
    // Op 55: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 56: dim3x3 mul
    gl64_t s1_56_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_56_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_56_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA56 = (tmp3_0 + tmp3_1) * (s1_56_0 + s1_56_1);
    gl64_t kB56 = (tmp3_0 + tmp3_2) * (s1_56_0 + s1_56_2);
    gl64_t kC56 = (tmp3_1 + tmp3_2) * (s1_56_1 + s1_56_2);
    gl64_t kD56 = tmp3_0 * s1_56_0;
    gl64_t kE56 = tmp3_1 * s1_56_1;
    gl64_t kF56 = tmp3_2 * s1_56_2;
    gl64_t kG56 = kD56 - kE56;
    tmp3_0 = (kC56 + kG56) - kF56;
    tmp3_1 = ((((kA56 + kC56) - kE56) - kE56) - kD56);
    tmp3_2 = kB56 - kG56;
    // Op 57: dim1x1 sub_swap
    gl64_t s0_57 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_57 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_57 - s0_57;
    // Op 58: dim1x1 mul
    gl64_t s0_58 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp1_0 = s0_58 * tmp1_0;
    // Op 59: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 60: dim3x3 mul
    gl64_t s1_60_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_60_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_60_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA60 = (tmp3_0 + tmp3_1) * (s1_60_0 + s1_60_1);
    gl64_t kB60 = (tmp3_0 + tmp3_2) * (s1_60_0 + s1_60_2);
    gl64_t kC60 = (tmp3_1 + tmp3_2) * (s1_60_1 + s1_60_2);
    gl64_t kD60 = tmp3_0 * s1_60_0;
    gl64_t kE60 = tmp3_1 * s1_60_1;
    gl64_t kF60 = tmp3_2 * s1_60_2;
    gl64_t kG60 = kD60 - kE60;
    tmp3_0 = (kC60 + kG60) - kF60;
    tmp3_1 = ((((kA60 + kC60) - kE60) - kE60) - kD60);
    tmp3_2 = kB60 - kG60;
    // Op 61: dim1x1 add
    gl64_t s0_61 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_61 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    tmp1_0 = s0_61 + s1_61;
    // Op 62: dim1x1 add
    gl64_t s0_62 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_5 = s0_62 + tmp1_0;
    // Op 63: dim1x1 sub_swap
    gl64_t s1_63 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_63 - tmp1_5;
    // Op 64: dim1x1 mul
    tmp1_0 = tmp1_5 * tmp1_0;
    // Op 65: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 66: dim3x3 mul
    gl64_t s1_66_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_66_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_66_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA66 = (tmp3_0 + tmp3_1) * (s1_66_0 + s1_66_1);
    gl64_t kB66 = (tmp3_0 + tmp3_2) * (s1_66_0 + s1_66_2);
    gl64_t kC66 = (tmp3_1 + tmp3_2) * (s1_66_1 + s1_66_2);
    gl64_t kD66 = tmp3_0 * s1_66_0;
    gl64_t kE66 = tmp3_1 * s1_66_1;
    gl64_t kF66 = tmp3_2 * s1_66_2;
    gl64_t kG66 = kD66 - kE66;
    tmp3_0 = (kC66 + kG66) - kF66;
    tmp3_1 = ((((kA66 + kC66) - kE66) - kE66) - kD66);
    tmp3_2 = kB66 - kG66;
    // Op 67: dim1x1 sub_swap
    gl64_t s0_67 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    gl64_t s1_67 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_67 - s0_67;
    // Op 68: dim1x1 mul
    gl64_t s0_68 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_0 = s0_68 * tmp1_0;
    // Op 69: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 70: dim3x3 mul
    gl64_t s1_70_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_70_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_70_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA70 = (tmp3_0 + tmp3_1) * (s1_70_0 + s1_70_1);
    gl64_t kB70 = (tmp3_0 + tmp3_2) * (s1_70_0 + s1_70_2);
    gl64_t kC70 = (tmp3_1 + tmp3_2) * (s1_70_1 + s1_70_2);
    gl64_t kD70 = tmp3_0 * s1_70_0;
    gl64_t kE70 = tmp3_1 * s1_70_1;
    gl64_t kF70 = tmp3_2 * s1_70_2;
    gl64_t kG70 = kD70 - kE70;
    tmp3_0 = (kC70 + kG70) - kF70;
    tmp3_1 = ((((kA70 + kC70) - kE70) - kE70) - kD70);
    tmp3_2 = kB70 - kG70;
    // Op 71: dim1x1 sub_swap
    gl64_t s1_71 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_71 - tmp1_5;
    // Op 72: dim1x1 mul
    gl64_t s0_72 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_0 = s0_72 * tmp1_0;
    // Op 73: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 74: dim3x3 mul
    gl64_t s1_74_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_74_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_74_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA74 = (tmp3_0 + tmp3_1) * (s1_74_0 + s1_74_1);
    gl64_t kB74 = (tmp3_0 + tmp3_2) * (s1_74_0 + s1_74_2);
    gl64_t kC74 = (tmp3_1 + tmp3_2) * (s1_74_1 + s1_74_2);
    gl64_t kD74 = tmp3_0 * s1_74_0;
    gl64_t kE74 = tmp3_1 * s1_74_1;
    gl64_t kF74 = tmp3_2 * s1_74_2;
    gl64_t kG74 = kD74 - kE74;
    tmp3_0 = (kC74 + kG74) - kF74;
    tmp3_1 = ((((kA74 + kC74) - kE74) - kE74) - kD74);
    tmp3_2 = kB74 - kG74;
    // Op 75: dim1x1 sub_swap
    gl64_t s0_75 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    gl64_t s1_75 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_75 - s0_75;
    // Op 76: dim1x1 mul
    gl64_t s0_76 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_76 * tmp1_0;
    // Op 77: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 78: dim3x3 mul
    gl64_t s1_78_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_78_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_78_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA78 = (tmp3_0 + tmp3_1) * (s1_78_0 + s1_78_1);
    gl64_t kB78 = (tmp3_0 + tmp3_2) * (s1_78_0 + s1_78_2);
    gl64_t kC78 = (tmp3_1 + tmp3_2) * (s1_78_1 + s1_78_2);
    gl64_t kD78 = tmp3_0 * s1_78_0;
    gl64_t kE78 = tmp3_1 * s1_78_1;
    gl64_t kF78 = tmp3_2 * s1_78_2;
    gl64_t kG78 = kD78 - kE78;
    tmp3_0 = (kC78 + kG78) - kF78;
    tmp3_1 = ((((kA78 + kC78) - kE78) - kE78) - kD78);
    tmp3_2 = kB78 - kG78;
    // Op 79: dim1x1 sub_swap
    gl64_t s0_79 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    gl64_t s1_79 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_79 - s0_79;
    // Op 80: dim1x1 mul
    gl64_t s0_80 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_80 * tmp1_0;
    // Op 81: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 82: dim3x3 mul
    gl64_t s1_82_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_82_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_82_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA82 = (tmp3_0 + tmp3_1) * (s1_82_0 + s1_82_1);
    gl64_t kB82 = (tmp3_0 + tmp3_2) * (s1_82_0 + s1_82_2);
    gl64_t kC82 = (tmp3_1 + tmp3_2) * (s1_82_1 + s1_82_2);
    gl64_t kD82 = tmp3_0 * s1_82_0;
    gl64_t kE82 = tmp3_1 * s1_82_1;
    gl64_t kF82 = tmp3_2 * s1_82_2;
    gl64_t kG82 = kD82 - kE82;
    tmp3_0 = (kC82 + kG82) - kF82;
    tmp3_1 = ((((kA82 + kC82) - kE82) - kE82) - kD82);
    tmp3_2 = kB82 - kG82;
    // Op 83: dim1x1 sub_swap
    gl64_t s0_83 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    gl64_t s1_83 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_83 - s0_83;
    // Op 84: dim1x1 mul
    gl64_t s0_84 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_0 = s0_84 * tmp1_0;
    // Op 85: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 86: dim3x3 mul
    gl64_t s1_86_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_86_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_86_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA86 = (tmp3_0 + tmp3_1) * (s1_86_0 + s1_86_1);
    gl64_t kB86 = (tmp3_0 + tmp3_2) * (s1_86_0 + s1_86_2);
    gl64_t kC86 = (tmp3_1 + tmp3_2) * (s1_86_1 + s1_86_2);
    gl64_t kD86 = tmp3_0 * s1_86_0;
    gl64_t kE86 = tmp3_1 * s1_86_1;
    gl64_t kF86 = tmp3_2 * s1_86_2;
    gl64_t kG86 = kD86 - kE86;
    tmp3_0 = (kC86 + kG86) - kF86;
    tmp3_1 = ((((kA86 + kC86) - kE86) - kE86) - kD86);
    tmp3_2 = kB86 - kG86;
    // Op 87: dim1x1 sub_swap
    gl64_t s0_87 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    gl64_t s1_87 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_87 - s0_87;
    // Op 88: dim1x1 mul
    gl64_t s0_88 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_0 = s0_88 * tmp1_0;
    // Op 89: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 90: dim3x3 mul
    gl64_t s1_90_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_90_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_90_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA90 = (tmp3_0 + tmp3_1) * (s1_90_0 + s1_90_1);
    gl64_t kB90 = (tmp3_0 + tmp3_2) * (s1_90_0 + s1_90_2);
    gl64_t kC90 = (tmp3_1 + tmp3_2) * (s1_90_1 + s1_90_2);
    gl64_t kD90 = tmp3_0 * s1_90_0;
    gl64_t kE90 = tmp3_1 * s1_90_1;
    gl64_t kF90 = tmp3_2 * s1_90_2;
    gl64_t kG90 = kD90 - kE90;
    tmp3_0 = (kC90 + kG90) - kF90;
    tmp3_1 = ((((kA90 + kC90) - kE90) - kE90) - kD90);
    tmp3_2 = kB90 - kG90;
    // Op 91: dim1x1 sub
    gl64_t s0_91 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    gl64_t s1_91 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_91 - s1_91;
    // Op 92: dim1x1 mul
    gl64_t s0_92 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_92 * tmp1_0;
    // Op 93: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 94: dim3x3 mul
    gl64_t s1_94_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_94_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_94_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA94 = (tmp3_0 + tmp3_1) * (s1_94_0 + s1_94_1);
    gl64_t kB94 = (tmp3_0 + tmp3_2) * (s1_94_0 + s1_94_2);
    gl64_t kC94 = (tmp3_1 + tmp3_2) * (s1_94_1 + s1_94_2);
    gl64_t kD94 = tmp3_0 * s1_94_0;
    gl64_t kE94 = tmp3_1 * s1_94_1;
    gl64_t kF94 = tmp3_2 * s1_94_2;
    gl64_t kG94 = kD94 - kE94;
    tmp3_0 = (kC94 + kG94) - kF94;
    tmp3_1 = ((((kA94 + kC94) - kE94) - kE94) - kD94);
    tmp3_2 = kB94 - kG94;
    // Op 95: dim1x1 sub_swap
    gl64_t s0_95 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    gl64_t s1_95 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_95 - s0_95;
    // Op 96: dim1x1 mul
    gl64_t s0_96 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_96 * tmp1_0;
    // Op 97: dim1x1 sub
    gl64_t s0_97 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    gl64_t s1_97 = *(gl64_t*)&expressions_params[10][7];
    tmp1_1 = s0_97 - s1_97;
    // Op 98: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 99: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 100: dim3x3 mul
    gl64_t s1_100_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_100_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_100_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA100 = (tmp3_0 + tmp3_1) * (s1_100_0 + s1_100_1);
    gl64_t kB100 = (tmp3_0 + tmp3_2) * (s1_100_0 + s1_100_2);
    gl64_t kC100 = (tmp3_1 + tmp3_2) * (s1_100_1 + s1_100_2);
    gl64_t kD100 = tmp3_0 * s1_100_0;
    gl64_t kE100 = tmp3_1 * s1_100_1;
    gl64_t kF100 = tmp3_2 * s1_100_2;
    gl64_t kG100 = kD100 - kE100;
    tmp3_0 = (kC100 + kG100) - kF100;
    tmp3_1 = ((((kA100 + kC100) - kE100) - kE100) - kD100);
    tmp3_2 = kB100 - kG100;
    // Op 101: dim1x1 sub_swap
    gl64_t s0_101 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    gl64_t s1_101 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_101 - s0_101;
    // Op 102: dim1x1 mul
    gl64_t s0_102 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_102 * tmp1_0;
    // Op 103: dim1x1 sub
    gl64_t s0_103 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_103 = *(gl64_t*)&expressions_params[10][8];
    tmp1_1 = s0_103 - s1_103;
    // Op 104: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
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
    gl64_t s0_107 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    gl64_t s1_107 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_107 - s0_107;
    // Op 108: dim1x1 mul
    gl64_t s0_108 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_108 * tmp1_0;
    // Op 109: dim1x1 sub
    gl64_t s0_109 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    gl64_t s1_109 = *(gl64_t*)&expressions_params[10][9];
    tmp1_1 = s0_109 - s1_109;
    // Op 110: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
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
    // Op 113: dim1x1 sub_swap
    gl64_t s0_113 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    gl64_t s1_113 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_113 - s0_113;
    // Op 114: dim1x1 mul
    gl64_t s0_114 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_2 = s0_114 * tmp1_0;
    // Op 115: dim1x1 mul
    gl64_t s0_115 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_115 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_115 * s1_115;
    // Op 116: dim1x1 add
    gl64_t s0_116 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    tmp1_0 = s0_116 + tmp1_0;
    // Op 117: dim1x1 mul
    gl64_t s0_117 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_117 = *(gl64_t*)&expressions_params[9][2];
    tmp1_1 = s0_117 * s1_117;
    // Op 118: dim1x1 add
    tmp1_4 = tmp1_0 + tmp1_1;
    // Op 119: dim1x1 sub
    gl64_t s1_119 = *(gl64_t*)&expressions_params[10][10];
    tmp1_0 = tmp1_4 - s1_119;
    // Op 120: dim1x1 mul
    tmp1_0 = tmp1_2 * tmp1_0;
    // Op 121: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 122: dim3x3 mul
    gl64_t s1_122_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_122_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_122_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA122 = (tmp3_0 + tmp3_1) * (s1_122_0 + s1_122_1);
    gl64_t kB122 = (tmp3_0 + tmp3_2) * (s1_122_0 + s1_122_2);
    gl64_t kC122 = (tmp3_1 + tmp3_2) * (s1_122_1 + s1_122_2);
    gl64_t kD122 = tmp3_0 * s1_122_0;
    gl64_t kE122 = tmp3_1 * s1_122_1;
    gl64_t kF122 = tmp3_2 * s1_122_2;
    gl64_t kG122 = kD122 - kE122;
    tmp3_0 = (kC122 + kG122) - kF122;
    tmp3_1 = ((((kA122 + kC122) - kE122) - kE122) - kD122);
    tmp3_2 = kB122 - kG122;
    // Op 123: dim1x1 mul
    gl64_t s0_123 = *(gl64_t*)&expressions_params[10][7];
    gl64_t s1_123 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_123 * s1_123;
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
    // Op 126: dim1x1 mul
    gl64_t s0_126 = *(gl64_t*)&expressions_params[10][9];
    gl64_t s1_126 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_126 * s1_126;
    // Op 127: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 128: dim3x3 mul
    gl64_t s1_128_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_128_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_128_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA128 = (tmp3_0 + tmp3_1) * (s1_128_0 + s1_128_1);
    gl64_t kB128 = (tmp3_0 + tmp3_2) * (s1_128_0 + s1_128_2);
    gl64_t kC128 = (tmp3_1 + tmp3_2) * (s1_128_1 + s1_128_2);
    gl64_t kD128 = tmp3_0 * s1_128_0;
    gl64_t kE128 = tmp3_1 * s1_128_1;
    gl64_t kF128 = tmp3_2 * s1_128_2;
    gl64_t kG128 = kD128 - kE128;
    tmp3_0 = (kC128 + kG128) - kF128;
    tmp3_1 = ((((kA128 + kC128) - kE128) - kE128) - kD128);
    tmp3_2 = kB128 - kG128;
    // Op 129: dim1x1 mul
    gl64_t s0_129 = *(gl64_t*)&expressions_params[10][8];
    gl64_t s1_129 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_129 * s1_129;
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
    // Op 132: dim1x1 mul
    gl64_t s0_132 = *(gl64_t*)&expressions_params[10][10];
    gl64_t s1_132 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_132 * s1_132;
    // Op 133: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 134: dim3x3 mul
    gl64_t s1_134_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_134_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_134_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA134 = (tmp3_0 + tmp3_1) * (s1_134_0 + s1_134_1);
    gl64_t kB134 = (tmp3_0 + tmp3_2) * (s1_134_0 + s1_134_2);
    gl64_t kC134 = (tmp3_1 + tmp3_2) * (s1_134_1 + s1_134_2);
    gl64_t kD134 = tmp3_0 * s1_134_0;
    gl64_t kE134 = tmp3_1 * s1_134_1;
    gl64_t kF134 = tmp3_2 * s1_134_2;
    gl64_t kG134 = kD134 - kE134;
    tmp3_0 = (kC134 + kG134) - kF134;
    tmp3_1 = ((((kA134 + kC134) - kE134) - kE134) - kD134);
    tmp3_2 = kB134 - kG134;
    // Op 135: dim1x1 mul
    gl64_t s0_135 = *(gl64_t*)&expressions_params[10][2];
    gl64_t s1_135 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_135 * s1_135;
    // Op 136: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 137: dim3x3 mul
    gl64_t s1_137_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_137_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_137_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA137 = (tmp3_0 + tmp3_1) * (s1_137_0 + s1_137_1);
    gl64_t kB137 = (tmp3_0 + tmp3_2) * (s1_137_0 + s1_137_2);
    gl64_t kC137 = (tmp3_1 + tmp3_2) * (s1_137_1 + s1_137_2);
    gl64_t kD137 = tmp3_0 * s1_137_0;
    gl64_t kE137 = tmp3_1 * s1_137_1;
    gl64_t kF137 = tmp3_2 * s1_137_2;
    gl64_t kG137 = kD137 - kE137;
    tmp3_0 = (kC137 + kG137) - kF137;
    tmp3_1 = ((((kA137 + kC137) - kE137) - kE137) - kD137);
    tmp3_2 = kB137 - kG137;
    // Op 138: dim1x1 mul
    gl64_t s0_138 = *(gl64_t*)&expressions_params[10][4];
    gl64_t s1_138 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_138 * s1_138;
    // Op 139: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 140: dim3x3 mul
    gl64_t s1_140_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_140_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_140_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA140 = (tmp3_0 + tmp3_1) * (s1_140_0 + s1_140_1);
    gl64_t kB140 = (tmp3_0 + tmp3_2) * (s1_140_0 + s1_140_2);
    gl64_t kC140 = (tmp3_1 + tmp3_2) * (s1_140_1 + s1_140_2);
    gl64_t kD140 = tmp3_0 * s1_140_0;
    gl64_t kE140 = tmp3_1 * s1_140_1;
    gl64_t kF140 = tmp3_2 * s1_140_2;
    gl64_t kG140 = kD140 - kE140;
    tmp3_0 = (kC140 + kG140) - kF140;
    tmp3_1 = ((((kA140 + kC140) - kE140) - kE140) - kD140);
    tmp3_2 = kB140 - kG140;
    // Op 141: dim1x1 mul
    gl64_t s0_141 = *(gl64_t*)&expressions_params[10][3];
    gl64_t s1_141 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_141 * s1_141;
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
    // Op 144: dim1x1 mul
    gl64_t s0_144 = *(gl64_t*)&expressions_params[10][5];
    gl64_t s1_144 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_144 * s1_144;
    // Op 145: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 146: dim3x3 mul
    gl64_t s1_146_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_146_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_146_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA146 = (tmp3_0 + tmp3_1) * (s1_146_0 + s1_146_1);
    gl64_t kB146 = (tmp3_0 + tmp3_2) * (s1_146_0 + s1_146_2);
    gl64_t kC146 = (tmp3_1 + tmp3_2) * (s1_146_1 + s1_146_2);
    gl64_t kD146 = tmp3_0 * s1_146_0;
    gl64_t kE146 = tmp3_1 * s1_146_1;
    gl64_t kF146 = tmp3_2 * s1_146_2;
    gl64_t kG146 = kD146 - kE146;
    tmp3_0 = (kC146 + kG146) - kF146;
    tmp3_1 = ((((kA146 + kC146) - kE146) - kE146) - kD146);
    tmp3_2 = kB146 - kG146;
    // Op 147: dim1x1 sub_swap
    gl64_t s0_147 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    gl64_t s1_147 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_147 - s0_147;
    // Op 148: dim1x1 mul
    gl64_t s0_148 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_148 * tmp1_0;
    // Op 149: dim1x1 sub
    gl64_t s0_149 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_149 = *(gl64_t*)&expressions_params[10][13];
    tmp1_2 = s0_149 - s1_149;
    // Op 150: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_2;
    // Op 151: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 152: dim3x3 mul
    gl64_t s1_152_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_152_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_152_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA152 = (tmp3_0 + tmp3_1) * (s1_152_0 + s1_152_1);
    gl64_t kB152 = (tmp3_0 + tmp3_2) * (s1_152_0 + s1_152_2);
    gl64_t kC152 = (tmp3_1 + tmp3_2) * (s1_152_1 + s1_152_2);
    gl64_t kD152 = tmp3_0 * s1_152_0;
    gl64_t kE152 = tmp3_1 * s1_152_1;
    gl64_t kF152 = tmp3_2 * s1_152_2;
    gl64_t kG152 = kD152 - kE152;
    tmp3_0 = (kC152 + kG152) - kF152;
    tmp3_1 = ((((kA152 + kC152) - kE152) - kE152) - kD152);
    tmp3_2 = kB152 - kG152;
    // Op 153: dim1x1 mul
    gl64_t s0_153 = *(gl64_t*)&expressions_params[10][12];
    gl64_t s1_153 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_153 * s1_153;
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
    // Op 156: dim1x1 mul
    gl64_t s0_156 = *(gl64_t*)&expressions_params[10][13];
    gl64_t s1_156 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_156 * s1_156;
    // Op 157: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 158: dim3x3 mul
    gl64_t s1_158_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_158_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_158_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA158 = (tmp3_0 + tmp3_1) * (s1_158_0 + s1_158_1);
    gl64_t kB158 = (tmp3_0 + tmp3_2) * (s1_158_0 + s1_158_2);
    gl64_t kC158 = (tmp3_1 + tmp3_2) * (s1_158_1 + s1_158_2);
    gl64_t kD158 = tmp3_0 * s1_158_0;
    gl64_t kE158 = tmp3_1 * s1_158_1;
    gl64_t kF158 = tmp3_2 * s1_158_2;
    gl64_t kG158 = kD158 - kE158;
    tmp3_0 = (kC158 + kG158) - kF158;
    tmp3_1 = ((((kA158 + kC158) - kE158) - kE158) - kD158);
    tmp3_2 = kB158 - kG158;
    // Op 159: dim1x1 sub_swap
    gl64_t s0_159 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    gl64_t s1_159 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_159 - s0_159;
    // Op 160: dim1x1 mul
    gl64_t s0_160 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_0 = s0_160 * tmp1_0;
    // Op 161: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 162: dim3x3 mul
    gl64_t s1_162_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_162_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_162_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA162 = (tmp3_0 + tmp3_1) * (s1_162_0 + s1_162_1);
    gl64_t kB162 = (tmp3_0 + tmp3_2) * (s1_162_0 + s1_162_2);
    gl64_t kC162 = (tmp3_1 + tmp3_2) * (s1_162_1 + s1_162_2);
    gl64_t kD162 = tmp3_0 * s1_162_0;
    gl64_t kE162 = tmp3_1 * s1_162_1;
    gl64_t kF162 = tmp3_2 * s1_162_2;
    gl64_t kG162 = kD162 - kE162;
    tmp3_0 = (kC162 + kG162) - kF162;
    tmp3_1 = ((((kA162 + kC162) - kE162) - kE162) - kD162);
    tmp3_2 = kB162 - kG162;
    // Op 163: dim1x1 add
    gl64_t s0_163 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_163 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    tmp1_3 = s0_163 + s1_163;
    // Op 164: dim1x1 mul
    tmp1_0 = tmp1_5 * tmp1_3;
    // Op 165: dim1x1 sub
    gl64_t s0_165 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_0 = s0_165 - tmp1_0;
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
    // Op 168: dim1x1 mul
    gl64_t s0_168 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_1 = s0_168 * tmp1_5;
    // Op 169: dim1x1 mul
    gl64_t s0_169 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_169 = *(gl64_t*)&expressions_params[9][16];
    tmp1_0 = s0_169 * s1_169;
    // Op 170: dim1x1 add
    gl64_t s0_170 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    tmp1_0 = s0_170 + tmp1_0;
    // Op 171: dim1x1 mul
    gl64_t s0_171 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_171 = *(gl64_t*)&expressions_params[9][17];
    tmp1_2 = s0_171 * s1_171;
    // Op 172: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_2;
    // Op 173: dim1x1 mul
    gl64_t s0_173 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_173 = *(gl64_t*)&expressions_params[9][18];
    tmp1_2 = s0_173 * s1_173;
    // Op 174: dim1x1 add
    tmp1_2 = tmp1_0 + tmp1_2;
    // Op 175: dim1x1 sub
    gl64_t s0_175 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp1_0 = s0_175 - tmp1_2;
    // Op 176: dim1x1 mul
    tmp1_0 = tmp1_1 * tmp1_0;
    // Op 177: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 178: dim3x3 mul
    gl64_t s1_178_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_178_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_178_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA178 = (tmp3_0 + tmp3_1) * (s1_178_0 + s1_178_1);
    gl64_t kB178 = (tmp3_0 + tmp3_2) * (s1_178_0 + s1_178_2);
    gl64_t kC178 = (tmp3_1 + tmp3_2) * (s1_178_1 + s1_178_2);
    gl64_t kD178 = tmp3_0 * s1_178_0;
    gl64_t kE178 = tmp3_1 * s1_178_1;
    gl64_t kF178 = tmp3_2 * s1_178_2;
    gl64_t kG178 = kD178 - kE178;
    tmp3_0 = (kC178 + kG178) - kF178;
    tmp3_1 = ((((kA178 + kC178) - kE178) - kE178) - kD178);
    tmp3_2 = kB178 - kG178;
    // Op 179: dim1x1 mul
    gl64_t s0_179 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_0 = s0_179 * tmp1_5;
    // Op 180: dim1x1 sub
    gl64_t s0_180 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    tmp1_1 = s0_180 - tmp1_2;
    // Op 181: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
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
    gl64_t s0_184 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    gl64_t s1_184 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_184 - s0_184;
    // Op 185: dim1x1 mul
    gl64_t s0_185 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
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
    // Op 188: dim1x1 mul
    gl64_t s0_188 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_0 = s0_188 * tmp1_3;
    // Op 189: dim1x1 sub
    gl64_t s0_189 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    tmp1_0 = s0_189 - tmp1_0;
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
    // Op 192: dim1x1 mul
    gl64_t s0_192 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    gl64_t s1_192 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_0 = s0_192 * s1_192;
    // Op 193: dim1x1 sub
    gl64_t s0_193 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    tmp1_1 = s0_193 - tmp1_2;
    // Op 194: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 195: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 196: dim3x3 mul
    gl64_t s1_196_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_196_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_196_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA196 = (tmp3_0 + tmp3_1) * (s1_196_0 + s1_196_1);
    gl64_t kB196 = (tmp3_0 + tmp3_2) * (s1_196_0 + s1_196_2);
    gl64_t kC196 = (tmp3_1 + tmp3_2) * (s1_196_1 + s1_196_2);
    gl64_t kD196 = tmp3_0 * s1_196_0;
    gl64_t kE196 = tmp3_1 * s1_196_1;
    gl64_t kF196 = tmp3_2 * s1_196_2;
    gl64_t kG196 = kD196 - kE196;
    tmp3_0 = (kC196 + kG196) - kF196;
    tmp3_1 = ((((kA196 + kC196) - kE196) - kE196) - kD196);
    tmp3_2 = kB196 - kG196;
    // Op 197: dim1x1 mul
    gl64_t s0_197 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    gl64_t s1_197 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_0 = s0_197 * s1_197;
    // Op 198: dim1x1 sub
    gl64_t s0_198 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    tmp1_1 = s0_198 - tmp1_2;
    // Op 199: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 200: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 201: dim3x3 mul
    gl64_t s1_201_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_201_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_201_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA201 = (tmp3_0 + tmp3_1) * (s1_201_0 + s1_201_1);
    gl64_t kB201 = (tmp3_0 + tmp3_2) * (s1_201_0 + s1_201_2);
    gl64_t kC201 = (tmp3_1 + tmp3_2) * (s1_201_1 + s1_201_2);
    gl64_t kD201 = tmp3_0 * s1_201_0;
    gl64_t kE201 = tmp3_1 * s1_201_1;
    gl64_t kF201 = tmp3_2 * s1_201_2;
    gl64_t kG201 = kD201 - kE201;
    tmp3_0 = (kC201 + kG201) - kF201;
    tmp3_1 = ((((kA201 + kC201) - kE201) - kE201) - kD201);
    tmp3_2 = kB201 - kG201;
    // Op 202: dim1x1 sub_swap
    gl64_t s0_202 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    gl64_t s1_202 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_202 - s0_202;
    // Op 203: dim1x1 mul
    gl64_t s0_203 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    tmp1_0 = s0_203 * tmp1_0;
    // Op 204: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 205: dim3x3 mul
    gl64_t s1_205_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_205_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_205_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA205 = (tmp3_0 + tmp3_1) * (s1_205_0 + s1_205_1);
    gl64_t kB205 = (tmp3_0 + tmp3_2) * (s1_205_0 + s1_205_2);
    gl64_t kC205 = (tmp3_1 + tmp3_2) * (s1_205_1 + s1_205_2);
    gl64_t kD205 = tmp3_0 * s1_205_0;
    gl64_t kE205 = tmp3_1 * s1_205_1;
    gl64_t kF205 = tmp3_2 * s1_205_2;
    gl64_t kG205 = kD205 - kE205;
    tmp3_0 = (kC205 + kG205) - kF205;
    tmp3_1 = ((((kA205 + kC205) - kE205) - kE205) - kD205);
    tmp3_2 = kB205 - kG205;
    // Op 206: dim1x1 mul
    gl64_t s0_206 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_206 * tmp1_3;
    // Op 207: dim1x1 sub
    gl64_t s0_207 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    tmp1_0 = s0_207 - tmp1_0;
    // Op 208: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 209: dim3x3 mul
    gl64_t s1_209_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_209_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_209_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA209 = (tmp3_0 + tmp3_1) * (s1_209_0 + s1_209_1);
    gl64_t kB209 = (tmp3_0 + tmp3_2) * (s1_209_0 + s1_209_2);
    gl64_t kC209 = (tmp3_1 + tmp3_2) * (s1_209_1 + s1_209_2);
    gl64_t kD209 = tmp3_0 * s1_209_0;
    gl64_t kE209 = tmp3_1 * s1_209_1;
    gl64_t kF209 = tmp3_2 * s1_209_2;
    gl64_t kG209 = kD209 - kE209;
    tmp3_0 = (kC209 + kG209) - kF209;
    tmp3_1 = ((((kA209 + kC209) - kE209) - kE209) - kD209);
    tmp3_2 = kB209 - kG209;
    // Op 210: dim1x1 mul
    gl64_t s0_210 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    gl64_t s1_210 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_0 = s0_210 * s1_210;
    // Op 211: dim1x1 sub
    gl64_t s0_211 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    tmp1_1 = s0_211 - tmp1_2;
    // Op 212: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 213: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 214: dim3x3 mul
    gl64_t s1_214_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_214_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_214_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA214 = (tmp3_0 + tmp3_1) * (s1_214_0 + s1_214_1);
    gl64_t kB214 = (tmp3_0 + tmp3_2) * (s1_214_0 + s1_214_2);
    gl64_t kC214 = (tmp3_1 + tmp3_2) * (s1_214_1 + s1_214_2);
    gl64_t kD214 = tmp3_0 * s1_214_0;
    gl64_t kE214 = tmp3_1 * s1_214_1;
    gl64_t kF214 = tmp3_2 * s1_214_2;
    gl64_t kG214 = kD214 - kE214;
    tmp3_0 = (kC214 + kG214) - kF214;
    tmp3_1 = ((((kA214 + kC214) - kE214) - kE214) - kD214);
    tmp3_2 = kB214 - kG214;
    // Op 215: dim1x1 mul
    gl64_t s0_215 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    gl64_t s1_215 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_0 = s0_215 * s1_215;
    // Op 216: dim1x1 sub
    gl64_t s0_216 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    tmp1_1 = s0_216 - tmp1_2;
    // Op 217: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 218: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 219: dim3x3 mul
    gl64_t s1_219_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_219_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_219_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA219 = (tmp3_0 + tmp3_1) * (s1_219_0 + s1_219_1);
    gl64_t kB219 = (tmp3_0 + tmp3_2) * (s1_219_0 + s1_219_2);
    gl64_t kC219 = (tmp3_1 + tmp3_2) * (s1_219_1 + s1_219_2);
    gl64_t kD219 = tmp3_0 * s1_219_0;
    gl64_t kE219 = tmp3_1 * s1_219_1;
    gl64_t kF219 = tmp3_2 * s1_219_2;
    gl64_t kG219 = kD219 - kE219;
    tmp3_0 = (kC219 + kG219) - kF219;
    tmp3_1 = ((((kA219 + kC219) - kE219) - kE219) - kD219);
    tmp3_2 = kB219 - kG219;
    // Op 220: dim1x1 sub_swap
    gl64_t s0_220 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    gl64_t s1_220 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_220 - s0_220;
    // Op 221: dim1x1 mul
    gl64_t s0_221 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    tmp1_0 = s0_221 * tmp1_0;
    // Op 222: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 223: dim3x3 mul
    gl64_t s1_223_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_223_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_223_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA223 = (tmp3_0 + tmp3_1) * (s1_223_0 + s1_223_1);
    gl64_t kB223 = (tmp3_0 + tmp3_2) * (s1_223_0 + s1_223_2);
    gl64_t kC223 = (tmp3_1 + tmp3_2) * (s1_223_1 + s1_223_2);
    gl64_t kD223 = tmp3_0 * s1_223_0;
    gl64_t kE223 = tmp3_1 * s1_223_1;
    gl64_t kF223 = tmp3_2 * s1_223_2;
    gl64_t kG223 = kD223 - kE223;
    tmp3_0 = (kC223 + kG223) - kF223;
    tmp3_1 = ((((kA223 + kC223) - kE223) - kE223) - kD223);
    tmp3_2 = kB223 - kG223;
    // Op 224: dim1x1 mul
    gl64_t s0_224 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_3 = s0_224 * tmp1_3;
    // Op 225: dim1x1 sub
    gl64_t s0_225 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    tmp1_3 = s0_225 - tmp1_3;
    // Op 226: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_3; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 227: dim3x3 mul
    gl64_t s1_227_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_227_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_227_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA227 = (tmp3_0 + tmp3_1) * (s1_227_0 + s1_227_1);
    gl64_t kB227 = (tmp3_0 + tmp3_2) * (s1_227_0 + s1_227_2);
    gl64_t kC227 = (tmp3_1 + tmp3_2) * (s1_227_1 + s1_227_2);
    gl64_t kD227 = tmp3_0 * s1_227_0;
    gl64_t kE227 = tmp3_1 * s1_227_1;
    gl64_t kF227 = tmp3_2 * s1_227_2;
    gl64_t kG227 = kD227 - kE227;
    tmp3_0 = (kC227 + kG227) - kF227;
    tmp3_1 = ((((kA227 + kC227) - kE227) - kE227) - kD227);
    tmp3_2 = kB227 - kG227;
    // Op 228: dim1x1 mul
    gl64_t s0_228 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    gl64_t s1_228 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_3 = s0_228 * s1_228;
    // Op 229: dim1x1 sub
    gl64_t s0_229 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    tmp1_0 = s0_229 - tmp1_2;
    // Op 230: dim1x1 mul
    tmp1_0 = tmp1_3 * tmp1_0;
    // Op 231: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 232: dim3x3 mul
    gl64_t s1_232_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_232_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_232_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA232 = (tmp3_0 + tmp3_1) * (s1_232_0 + s1_232_1);
    gl64_t kB232 = (tmp3_0 + tmp3_2) * (s1_232_0 + s1_232_2);
    gl64_t kC232 = (tmp3_1 + tmp3_2) * (s1_232_1 + s1_232_2);
    gl64_t kD232 = tmp3_0 * s1_232_0;
    gl64_t kE232 = tmp3_1 * s1_232_1;
    gl64_t kF232 = tmp3_2 * s1_232_2;
    gl64_t kG232 = kD232 - kE232;
    tmp3_0 = (kC232 + kG232) - kF232;
    tmp3_1 = ((((kA232 + kC232) - kE232) - kE232) - kD232);
    tmp3_2 = kB232 - kG232;
    // Op 233: dim1x1 mul
    gl64_t s0_233 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    gl64_t s1_233 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_0 = s0_233 * s1_233;
    // Op 234: dim1x1 sub
    gl64_t s0_234 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    tmp1_2 = s0_234 - tmp1_2;
    // Op 235: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_2;
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
    // Op 238: dim1x1 sub
    gl64_t s0_238 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_238 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_238 - s1_238;
    // Op 239: dim1x1 mul
    gl64_t s0_239 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    tmp1_3 = s0_239 * tmp1_0;
    // Op 240: dim1x1 sub_swap
    gl64_t s0_240 = *(gl64_t*)&expressions_params[9][3];
    gl64_t s1_240 = *(gl64_t*)&expressions_params[10][4];
    tmp1_0 = s1_240 - s0_240;
    // Op 241: dim1x1 sub
    gl64_t s0_241 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_241 - tmp1_0;
    // Op 242: dim1x1 mul
    tmp1_0 = tmp1_3 * tmp1_0;
    // Op 243: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 244: dim3x3 mul
    gl64_t s1_244_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_244_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_244_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA244 = (tmp3_0 + tmp3_1) * (s1_244_0 + s1_244_1);
    gl64_t kB244 = (tmp3_0 + tmp3_2) * (s1_244_0 + s1_244_2);
    gl64_t kC244 = (tmp3_1 + tmp3_2) * (s1_244_1 + s1_244_2);
    gl64_t kD244 = tmp3_0 * s1_244_0;
    gl64_t kE244 = tmp3_1 * s1_244_1;
    gl64_t kF244 = tmp3_2 * s1_244_2;
    gl64_t kG244 = kD244 - kE244;
    tmp3_0 = (kC244 + kG244) - kF244;
    tmp3_1 = ((((kA244 + kC244) - kE244) - kE244) - kD244);
    tmp3_2 = kB244 - kG244;
    // Op 245: dim1x1 sub_swap
    gl64_t s0_245 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    gl64_t s1_245 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_245 - s0_245;
    // Op 246: dim1x1 sub_swap
    gl64_t s0_246 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 1, domainSize, nCols_1))];
    gl64_t s1_246 = *(gl64_t*)&expressions_params[9][0];
    tmp1_2 = s1_246 - s0_246;
    // Op 247: dim1x1 mul
    tmp1_1 = tmp1_0 * tmp1_2;
    // Op 248: dim1x1 sub
    gl64_t s0_248 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 10, domainSize, nCols_1))];
    gl64_t s1_248 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_248 - s1_248;
    // Op 249: dim1x1 sub
    gl64_t s0_249 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_249 - tmp1_0;
    // Op 250: dim1x1 mul
    tmp1_0 = tmp1_1 * tmp1_0;
    // Op 251: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 252: dim3x3 mul
    gl64_t s1_252_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_252_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_252_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA252 = (tmp3_0 + tmp3_1) * (s1_252_0 + s1_252_1);
    gl64_t kB252 = (tmp3_0 + tmp3_2) * (s1_252_0 + s1_252_2);
    gl64_t kC252 = (tmp3_1 + tmp3_2) * (s1_252_1 + s1_252_2);
    gl64_t kD252 = tmp3_0 * s1_252_0;
    gl64_t kE252 = tmp3_1 * s1_252_1;
    gl64_t kF252 = tmp3_2 * s1_252_2;
    gl64_t kG252 = kD252 - kE252;
    tmp3_0 = (kC252 + kG252) - kF252;
    tmp3_1 = ((((kA252 + kC252) - kE252) - kE252) - kD252);
    tmp3_2 = kB252 - kG252;
    // Op 253: dim1x1 add
    gl64_t s0_253 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_0 = s0_253 + tmp1_5;
    // Op 254: dim1x1 add
    gl64_t s0_254 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_254 + tmp1_0;
    // Op 255: dim1x1 add
    gl64_t s0_255 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_2 = s0_255 + tmp1_0;
    // Op 256: dim1x1 sub
    gl64_t s0_256 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_256 - tmp1_2;
    // Op 257: dim1x1 mul
    gl64_t s0_257 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    tmp1_0 = s0_257 * tmp1_0;
    // Op 258: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 259: dim3x3 mul
    gl64_t s1_259_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_259_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_259_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA259 = (tmp3_0 + tmp3_1) * (s1_259_0 + s1_259_1);
    gl64_t kB259 = (tmp3_0 + tmp3_2) * (s1_259_0 + s1_259_2);
    gl64_t kC259 = (tmp3_1 + tmp3_2) * (s1_259_1 + s1_259_2);
    gl64_t kD259 = tmp3_0 * s1_259_0;
    gl64_t kE259 = tmp3_1 * s1_259_1;
    gl64_t kF259 = tmp3_2 * s1_259_2;
    gl64_t kG259 = kD259 - kE259;
    tmp3_0 = (kC259 + kG259) - kF259;
    tmp3_1 = ((((kA259 + kC259) - kE259) - kE259) - kD259);
    tmp3_2 = kB259 - kG259;
    // Op 260: dim1x1 sub_swap
    gl64_t s0_260 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    gl64_t s1_260 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_260 - s0_260;
    // Op 261: dim1x1 sub
    gl64_t s1_261 = *(gl64_t*)&expressions_params[9][3];
    tmp1_2 = tmp1_2 - s1_261;
    // Op 262: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_2;
    // Op 263: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 264: dim3x3 mul
    gl64_t s1_264_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_264_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_264_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA264 = (tmp3_0 + tmp3_1) * (s1_264_0 + s1_264_1);
    gl64_t kB264 = (tmp3_0 + tmp3_2) * (s1_264_0 + s1_264_2);
    gl64_t kC264 = (tmp3_1 + tmp3_2) * (s1_264_1 + s1_264_2);
    gl64_t kD264 = tmp3_0 * s1_264_0;
    gl64_t kE264 = tmp3_1 * s1_264_1;
    gl64_t kF264 = tmp3_2 * s1_264_2;
    gl64_t kG264 = kD264 - kE264;
    tmp3_0 = (kC264 + kG264) - kF264;
    tmp3_1 = ((((kA264 + kC264) - kE264) - kE264) - kD264);
    tmp3_2 = kB264 - kG264;
    // Op 265: dim1x1 add
    gl64_t s0_265 = *(gl64_t*)&expressions_params[9][3];
    gl64_t s1_265 = *(gl64_t*)&expressions_params[10][2];
    tmp1_0 = s0_265 + s1_265;
    // Op 266: dim1x1 sub
    gl64_t s0_266 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    tmp1_0 = s0_266 - tmp1_0;
    // Op 267: dim1x1 mul
    tmp1_0 = tmp1_3 * tmp1_0;
    // Op 268: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 269: dim3x3 mul
    gl64_t s1_269_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_269_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_269_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA269 = (tmp3_0 + tmp3_1) * (s1_269_0 + s1_269_1);
    gl64_t kB269 = (tmp3_0 + tmp3_2) * (s1_269_0 + s1_269_2);
    gl64_t kC269 = (tmp3_1 + tmp3_2) * (s1_269_1 + s1_269_2);
    gl64_t kD269 = tmp3_0 * s1_269_0;
    gl64_t kE269 = tmp3_1 * s1_269_1;
    gl64_t kF269 = tmp3_2 * s1_269_2;
    gl64_t kG269 = kD269 - kE269;
    tmp3_0 = (kC269 + kG269) - kF269;
    tmp3_1 = ((((kA269 + kC269) - kE269) - kE269) - kD269);
    tmp3_2 = kB269 - kG269;
    // Op 270: dim1x1 add
    gl64_t s0_270 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 9, domainSize, nCols_1))];
    gl64_t s1_270 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_270 + s1_270;
    // Op 271: dim1x1 sub
    gl64_t s0_271 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    tmp1_0 = s0_271 - tmp1_0;
    // Op 272: dim1x1 mul
    tmp1_0 = tmp1_1 * tmp1_0;
    // Op 273: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 274: dim3x3 mul
    gl64_t s1_274_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_274_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_274_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA274 = (tmp3_0 + tmp3_1) * (s1_274_0 + s1_274_1);
    gl64_t kB274 = (tmp3_0 + tmp3_2) * (s1_274_0 + s1_274_2);
    gl64_t kC274 = (tmp3_1 + tmp3_2) * (s1_274_1 + s1_274_2);
    gl64_t kD274 = tmp3_0 * s1_274_0;
    gl64_t kE274 = tmp3_1 * s1_274_1;
    gl64_t kF274 = tmp3_2 * s1_274_2;
    gl64_t kG274 = kD274 - kE274;
    tmp3_0 = (kC274 + kG274) - kF274;
    tmp3_1 = ((((kA274 + kC274) - kE274) - kE274) - kD274);
    tmp3_2 = kB274 - kG274;
    // Op 275: dim1x1 add
    gl64_t s0_275 = *(gl64_t*)&expressions_params[9][3];
    gl64_t s1_275 = *(gl64_t*)&expressions_params[10][12];
    tmp1_0 = s0_275 + s1_275;
    // Op 276: dim1x1 sub
    gl64_t s0_276 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    tmp1_0 = s0_276 - tmp1_0;
    // Op 277: dim1x1 mul
    tmp1_0 = tmp1_3 * tmp1_0;
    // Op 278: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 279: dim3x3 mul
    gl64_t s1_279_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_279_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_279_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA279 = (tmp3_0 + tmp3_1) * (s1_279_0 + s1_279_1);
    gl64_t kB279 = (tmp3_0 + tmp3_2) * (s1_279_0 + s1_279_2);
    gl64_t kC279 = (tmp3_1 + tmp3_2) * (s1_279_1 + s1_279_2);
    gl64_t kD279 = tmp3_0 * s1_279_0;
    gl64_t kE279 = tmp3_1 * s1_279_1;
    gl64_t kF279 = tmp3_2 * s1_279_2;
    gl64_t kG279 = kD279 - kE279;
    tmp3_0 = (kC279 + kG279) - kF279;
    tmp3_1 = ((((kA279 + kC279) - kE279) - kE279) - kD279);
    tmp3_2 = kB279 - kG279;
    // Op 280: dim1x1 add
    gl64_t s0_280 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 0, domainSize, nCols_1))];
    gl64_t s1_280 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_280 + s1_280;
    // Op 281: dim1x1 sub
    gl64_t s0_281 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    tmp1_0 = s0_281 - tmp1_0;
    // Op 282: dim1x1 mul
    tmp1_0 = tmp1_1 * tmp1_0;
    // Op 283: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 284: dim3x3 mul
    gl64_t s1_284_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_284_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_284_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA284 = (tmp3_0 + tmp3_1) * (s1_284_0 + s1_284_1);
    gl64_t kB284 = (tmp3_0 + tmp3_2) * (s1_284_0 + s1_284_2);
    gl64_t kC284 = (tmp3_1 + tmp3_2) * (s1_284_1 + s1_284_2);
    gl64_t kD284 = tmp3_0 * s1_284_0;
    gl64_t kE284 = tmp3_1 * s1_284_1;
    gl64_t kF284 = tmp3_2 * s1_284_2;
    gl64_t kG284 = kD284 - kE284;
    tmp3_0 = (kC284 + kG284) - kF284;
    tmp3_1 = ((((kA284 + kC284) - kE284) - kE284) - kD284);
    tmp3_2 = kB284 - kG284;
    // Op 285: dim1x1 sub
    gl64_t s1_285 = *(gl64_t*)&expressions_params[10][5];
    tmp1_0 = tmp1_4 - s1_285;
    // Op 286: dim1x1 mul
    tmp1_0 = tmp1_3 * tmp1_0;
    // Op 287: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 288: dim3x3 mul
    gl64_t s1_288_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_288_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_288_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA288 = (tmp3_0 + tmp3_1) * (s1_288_0 + s1_288_1);
    gl64_t kB288 = (tmp3_0 + tmp3_2) * (s1_288_0 + s1_288_2);
    gl64_t kC288 = (tmp3_1 + tmp3_2) * (s1_288_1 + s1_288_2);
    gl64_t kD288 = tmp3_0 * s1_288_0;
    gl64_t kE288 = tmp3_1 * s1_288_1;
    gl64_t kF288 = tmp3_2 * s1_288_2;
    gl64_t kG288 = kD288 - kE288;
    tmp3_0 = (kC288 + kG288) - kF288;
    tmp3_1 = ((((kA288 + kC288) - kE288) - kE288) - kD288);
    tmp3_2 = kB288 - kG288;
    // Op 289: dim1x1 mul
    gl64_t s0_289 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 4, domainSize, nCols_1))];
    gl64_t s1_289 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_289 * s1_289;
    // Op 290: dim1x1 add
    gl64_t s0_290 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 3, domainSize, nCols_1))];
    tmp1_0 = s0_290 + tmp1_0;
    // Op 291: dim1x1 mul
    gl64_t s0_291 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 5, domainSize, nCols_1))];
    gl64_t s1_291 = *(gl64_t*)&expressions_params[9][2];
    tmp1_2 = s0_291 * s1_291;
    // Op 292: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_2;
    // Op 293: dim1x1 sub
    tmp1_0 = tmp1_4 - tmp1_0;
    // Op 294: dim1x1 mul
    tmp1_0 = tmp1_1 * tmp1_0;
    // Op 295: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 296: dim3x3 mul
    gl64_t s1_296_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_296_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_296_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA296 = (tmp3_0 + tmp3_1) * (s1_296_0 + s1_296_1);
    gl64_t kB296 = (tmp3_0 + tmp3_2) * (s1_296_0 + s1_296_2);
    gl64_t kC296 = (tmp3_1 + tmp3_2) * (s1_296_1 + s1_296_2);
    gl64_t kD296 = tmp3_0 * s1_296_0;
    gl64_t kE296 = tmp3_1 * s1_296_1;
    gl64_t kF296 = tmp3_2 * s1_296_2;
    gl64_t kG296 = kD296 - kE296;
    tmp3_0 = (kC296 + kG296) - kF296;
    tmp3_1 = ((((kA296 + kC296) - kE296) - kE296) - kD296);
    tmp3_2 = kB296 - kG296;
    // Op 297: dim1x1 sub
    gl64_t s0_297 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_297 = *(gl64_t*)&expressions_params[10][3];
    tmp1_0 = s0_297 - s1_297;
    // Op 298: dim1x1 mul
    tmp1_0 = tmp1_3 * tmp1_0;
    // Op 299: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 300: dim3x3 mul
    gl64_t s1_300_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_300_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_300_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA300 = (tmp3_0 + tmp3_1) * (s1_300_0 + s1_300_1);
    gl64_t kB300 = (tmp3_0 + tmp3_2) * (s1_300_0 + s1_300_2);
    gl64_t kC300 = (tmp3_1 + tmp3_2) * (s1_300_1 + s1_300_2);
    gl64_t kD300 = tmp3_0 * s1_300_0;
    gl64_t kE300 = tmp3_1 * s1_300_1;
    gl64_t kF300 = tmp3_2 * s1_300_2;
    gl64_t kG300 = kD300 - kE300;
    tmp3_0 = (kC300 + kG300) - kF300;
    tmp3_1 = ((((kA300 + kC300) - kE300) - kE300) - kD300);
    tmp3_2 = kB300 - kG300;
    // Op 301: dim1x1 sub
    gl64_t s0_301 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_301 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 8, domainSize, nCols_1))];
    tmp1_0 = s0_301 - s1_301;
    // Op 302: dim1x1 mul
    tmp1_0 = tmp1_1 * tmp1_0;
    // Op 303: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 304: dim3x3 mul
    gl64_t s1_304_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_304_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_304_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA304 = (tmp3_0 + tmp3_1) * (s1_304_0 + s1_304_1);
    gl64_t kB304 = (tmp3_0 + tmp3_2) * (s1_304_0 + s1_304_2);
    gl64_t kC304 = (tmp3_1 + tmp3_2) * (s1_304_1 + s1_304_2);
    gl64_t kD304 = tmp3_0 * s1_304_0;
    gl64_t kE304 = tmp3_1 * s1_304_1;
    gl64_t kF304 = tmp3_2 * s1_304_2;
    gl64_t kG304 = kD304 - kE304;
    tmp3_0 = (kC304 + kG304) - kF304;
    tmp3_1 = ((((kA304 + kC304) - kE304) - kE304) - kD304);
    tmp3_2 = kB304 - kG304;
    // Op 305: dim1x1 sub
    gl64_t s0_305 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_305 = *(gl64_t*)&expressions_params[10][14];
    tmp1_0 = s0_305 - s1_305;
    // Op 306: dim1x1 mul
    tmp1_0 = tmp1_3 * tmp1_0;
    // Op 307: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 308: dim3x3 mul
    gl64_t s1_308_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_308_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_308_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA308 = (tmp3_0 + tmp3_1) * (s1_308_0 + s1_308_1);
    gl64_t kB308 = (tmp3_0 + tmp3_2) * (s1_308_0 + s1_308_2);
    gl64_t kC308 = (tmp3_1 + tmp3_2) * (s1_308_1 + s1_308_2);
    gl64_t kD308 = tmp3_0 * s1_308_0;
    gl64_t kE308 = tmp3_1 * s1_308_1;
    gl64_t kF308 = tmp3_2 * s1_308_2;
    gl64_t kG308 = kD308 - kE308;
    tmp3_0 = (kC308 + kG308) - kF308;
    tmp3_1 = ((((kA308 + kC308) - kE308) - kE308) - kD308);
    tmp3_2 = kB308 - kG308;
    // Op 309: dim1x1 sub
    gl64_t s0_309 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_309 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 6, domainSize, nCols_1))];
    tmp1_0 = s0_309 - s1_309;
    // Op 310: dim1x1 mul
    tmp1_0 = tmp1_1 * tmp1_0;
    // Op 311: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 312: dim3x3 mul
    gl64_t s1_312_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_312_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_312_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA312 = (tmp3_0 + tmp3_1) * (s1_312_0 + s1_312_1);
    gl64_t kB312 = (tmp3_0 + tmp3_2) * (s1_312_0 + s1_312_2);
    gl64_t kC312 = (tmp3_1 + tmp3_2) * (s1_312_1 + s1_312_2);
    gl64_t kD312 = tmp3_0 * s1_312_0;
    gl64_t kE312 = tmp3_1 * s1_312_1;
    gl64_t kF312 = tmp3_2 * s1_312_2;
    gl64_t kG312 = kD312 - kE312;
    tmp3_0 = (kC312 + kG312) - kF312;
    tmp3_1 = ((((kA312 + kC312) - kE312) - kE312) - kD312);
    tmp3_2 = kB312 - kG312;
    // Op 313: dim1x1 mul
    gl64_t s0_313 = *(gl64_t*)&expressions_params[9][17];
    gl64_t s1_313 = *(gl64_t*)&expressions_params[10][17];
    tmp1_0 = s0_313 * s1_313;
    // Op 314: dim1x1 add
    gl64_t s1_314 = *(gl64_t*)&expressions_params[10][16];
    tmp1_0 = tmp1_0 + s1_314;
    // Op 315: dim1x1 sub
    gl64_t s1_315 = *(gl64_t*)&expressions_params[10][9];
    tmp1_0 = tmp1_0 - s1_315;
    // Op 316: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 317: dim3x3 mul
    gl64_t s1_317_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_317_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_317_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA317 = (tmp3_0 + tmp3_1) * (s1_317_0 + s1_317_1);
    gl64_t kB317 = (tmp3_0 + tmp3_2) * (s1_317_0 + s1_317_2);
    gl64_t kC317 = (tmp3_1 + tmp3_2) * (s1_317_1 + s1_317_2);
    gl64_t kD317 = tmp3_0 * s1_317_0;
    gl64_t kE317 = tmp3_1 * s1_317_1;
    gl64_t kF317 = tmp3_2 * s1_317_2;
    gl64_t kG317 = kD317 - kE317;
    tmp3_12 = (kC317 + kG317) - kF317;
    tmp3_13 = ((((kA317 + kC317) - kE317) - kE317) - kD317);
    tmp3_14 = kB317 - kG317;
    // Op 318: dim3x1 mul
    gl64_t s0_318_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_318_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_318_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_318 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    tmp3_0 = s0_318_0 * s1_318; tmp3_1 = s0_318_1 * s1_318; tmp3_2 = s0_318_2 * s1_318;
    // Op 319: dim3x1 add
    gl64_t s1_319 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_319; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 320: dim3x3 mul
    gl64_t s1_320_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_320_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_320_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA320 = (tmp3_0 + tmp3_1) * (s1_320_0 + s1_320_1);
    gl64_t kB320 = (tmp3_0 + tmp3_2) * (s1_320_0 + s1_320_2);
    gl64_t kC320 = (tmp3_1 + tmp3_2) * (s1_320_1 + s1_320_2);
    gl64_t kD320 = tmp3_0 * s1_320_0;
    gl64_t kE320 = tmp3_1 * s1_320_1;
    gl64_t kF320 = tmp3_2 * s1_320_2;
    gl64_t kG320 = kD320 - kE320;
    tmp3_0 = (kC320 + kG320) - kF320;
    tmp3_1 = ((((kA320 + kC320) - kE320) - kE320) - kD320);
    tmp3_2 = kB320 - kG320;
    // Op 321: dim3x1 add
    gl64_t s1_321 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_321; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 322: dim3x3 mul
    gl64_t s1_322_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_322_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_322_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA322 = (tmp3_0 + tmp3_1) * (s1_322_0 + s1_322_1);
    gl64_t kB322 = (tmp3_0 + tmp3_2) * (s1_322_0 + s1_322_2);
    gl64_t kC322 = (tmp3_1 + tmp3_2) * (s1_322_1 + s1_322_2);
    gl64_t kD322 = tmp3_0 * s1_322_0;
    gl64_t kE322 = tmp3_1 * s1_322_1;
    gl64_t kF322 = tmp3_2 * s1_322_2;
    gl64_t kG322 = kD322 - kE322;
    tmp3_0 = (kC322 + kG322) - kF322;
    tmp3_1 = ((((kA322 + kC322) - kE322) - kE322) - kD322);
    tmp3_2 = kB322 - kG322;
    // Op 323: dim1x1 mul
    gl64_t s0_323 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_323 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_323 * s1_323;
    // Op 324: dim1x1 add
    gl64_t s1_324 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_324;
    // Op 325: dim1x1 add
    gl64_t s1_325 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_325;
    // Op 326: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 327: dim3x3 mul
    gl64_t s1_327_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_327_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_327_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA327 = (tmp3_0 + tmp3_1) * (s1_327_0 + s1_327_1);
    gl64_t kB327 = (tmp3_0 + tmp3_2) * (s1_327_0 + s1_327_2);
    gl64_t kC327 = (tmp3_1 + tmp3_2) * (s1_327_1 + s1_327_2);
    gl64_t kD327 = tmp3_0 * s1_327_0;
    gl64_t kE327 = tmp3_1 * s1_327_1;
    gl64_t kF327 = tmp3_2 * s1_327_2;
    gl64_t kG327 = kD327 - kE327;
    tmp3_0 = (kC327 + kG327) - kF327;
    tmp3_1 = ((((kA327 + kC327) - kE327) - kE327) - kD327);
    tmp3_2 = kB327 - kG327;
    // Op 328: dim1x1 mul
    gl64_t s0_328 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_328 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_328 * s1_328;
    // Op 329: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 330: dim3x3 mul
    gl64_t s1_330_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_330_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_330_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA330 = (tmp3_0 + tmp3_1) * (s1_330_0 + s1_330_1);
    gl64_t kB330 = (tmp3_0 + tmp3_2) * (s1_330_0 + s1_330_2);
    gl64_t kC330 = (tmp3_1 + tmp3_2) * (s1_330_1 + s1_330_2);
    gl64_t kD330 = tmp3_0 * s1_330_0;
    gl64_t kE330 = tmp3_1 * s1_330_1;
    gl64_t kF330 = tmp3_2 * s1_330_2;
    gl64_t kG330 = kD330 - kE330;
    tmp3_0 = (kC330 + kG330) - kF330;
    tmp3_1 = ((((kA330 + kC330) - kE330) - kE330) - kD330);
    tmp3_2 = kB330 - kG330;
    // Op 331: dim3x1 add
    gl64_t s1_331 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_331; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 332: dim3x3 mul
    gl64_t s1_332_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_332_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_332_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA332 = (tmp3_0 + tmp3_1) * (s1_332_0 + s1_332_1);
    gl64_t kB332 = (tmp3_0 + tmp3_2) * (s1_332_0 + s1_332_2);
    gl64_t kC332 = (tmp3_1 + tmp3_2) * (s1_332_1 + s1_332_2);
    gl64_t kD332 = tmp3_0 * s1_332_0;
    gl64_t kE332 = tmp3_1 * s1_332_1;
    gl64_t kF332 = tmp3_2 * s1_332_2;
    gl64_t kG332 = kD332 - kE332;
    tmp3_0 = (kC332 + kG332) - kF332;
    tmp3_1 = ((((kA332 + kC332) - kE332) - kE332) - kD332);
    tmp3_2 = kB332 - kG332;
    // Op 333: dim3x1 add
    gl64_t s1_333 = *(gl64_t*)&expressions_params[9][5];
    tmp3_9 = tmp3_0 + s1_333; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 334: dim3x3 add
    gl64_t s1_334_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_334_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_334_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_334_0; tmp3_4 = tmp3_10 + s1_334_1; tmp3_5 = tmp3_11 + s1_334_2;
    // Op 335: dim3x1 mul
    gl64_t s0_335_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_335_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_335_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_335 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    tmp3_0 = s0_335_0 * s1_335; tmp3_1 = s0_335_1 * s1_335; tmp3_2 = s0_335_2 * s1_335;
    // Op 336: dim3x1 add
    gl64_t s1_336 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_336; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 337: dim3x3 mul
    gl64_t s1_337_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_337_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_337_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA337 = (tmp3_0 + tmp3_1) * (s1_337_0 + s1_337_1);
    gl64_t kB337 = (tmp3_0 + tmp3_2) * (s1_337_0 + s1_337_2);
    gl64_t kC337 = (tmp3_1 + tmp3_2) * (s1_337_1 + s1_337_2);
    gl64_t kD337 = tmp3_0 * s1_337_0;
    gl64_t kE337 = tmp3_1 * s1_337_1;
    gl64_t kF337 = tmp3_2 * s1_337_2;
    gl64_t kG337 = kD337 - kE337;
    tmp3_0 = (kC337 + kG337) - kF337;
    tmp3_1 = ((((kA337 + kC337) - kE337) - kE337) - kD337);
    tmp3_2 = kB337 - kG337;
    // Op 338: dim3x1 add
    gl64_t s1_338 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_338; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 339: dim3x3 mul
    gl64_t s1_339_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_339_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_339_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA339 = (tmp3_0 + tmp3_1) * (s1_339_0 + s1_339_1);
    gl64_t kB339 = (tmp3_0 + tmp3_2) * (s1_339_0 + s1_339_2);
    gl64_t kC339 = (tmp3_1 + tmp3_2) * (s1_339_1 + s1_339_2);
    gl64_t kD339 = tmp3_0 * s1_339_0;
    gl64_t kE339 = tmp3_1 * s1_339_1;
    gl64_t kF339 = tmp3_2 * s1_339_2;
    gl64_t kG339 = kD339 - kE339;
    tmp3_0 = (kC339 + kG339) - kF339;
    tmp3_1 = ((((kA339 + kC339) - kE339) - kE339) - kD339);
    tmp3_2 = kB339 - kG339;
    // Op 340: dim1x1 mul
    gl64_t s0_340 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_340 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_340 * s1_340;
    // Op 341: dim1x1 add
    gl64_t s1_341 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_341;
    // Op 342: dim1x1 add
    gl64_t s0_342 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_342 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_1 = s0_342 + s1_342;
    // Op 343: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_1;
    // Op 344: dim1x1 add
    gl64_t s1_344 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_344;
    // Op 345: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 346: dim3x3 mul
    gl64_t s1_346_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_346_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_346_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA346 = (tmp3_0 + tmp3_1) * (s1_346_0 + s1_346_1);
    gl64_t kB346 = (tmp3_0 + tmp3_2) * (s1_346_0 + s1_346_2);
    gl64_t kC346 = (tmp3_1 + tmp3_2) * (s1_346_1 + s1_346_2);
    gl64_t kD346 = tmp3_0 * s1_346_0;
    gl64_t kE346 = tmp3_1 * s1_346_1;
    gl64_t kF346 = tmp3_2 * s1_346_2;
    gl64_t kG346 = kD346 - kE346;
    tmp3_0 = (kC346 + kG346) - kF346;
    tmp3_1 = ((((kA346 + kC346) - kE346) - kE346) - kD346);
    tmp3_2 = kB346 - kG346;
    // Op 347: dim1x1 mul
    gl64_t s0_347 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    gl64_t s1_347 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_347 * s1_347;
    // Op 348: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 349: dim3x3 mul
    gl64_t s1_349_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_349_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_349_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA349 = (tmp3_0 + tmp3_1) * (s1_349_0 + s1_349_1);
    gl64_t kB349 = (tmp3_0 + tmp3_2) * (s1_349_0 + s1_349_2);
    gl64_t kC349 = (tmp3_1 + tmp3_2) * (s1_349_1 + s1_349_2);
    gl64_t kD349 = tmp3_0 * s1_349_0;
    gl64_t kE349 = tmp3_1 * s1_349_1;
    gl64_t kF349 = tmp3_2 * s1_349_2;
    gl64_t kG349 = kD349 - kE349;
    tmp3_0 = (kC349 + kG349) - kF349;
    tmp3_1 = ((((kA349 + kC349) - kE349) - kE349) - kD349);
    tmp3_2 = kB349 - kG349;
    // Op 350: dim1x1 add
    gl64_t s0_350 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_350 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_0 = s0_350 + s1_350;
    // Op 351: dim1x1 add
    gl64_t s1_351 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_351;
    // Op 352: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 353: dim3x3 mul
    gl64_t s1_353_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_353_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_353_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA353 = (tmp3_0 + tmp3_1) * (s1_353_0 + s1_353_1);
    gl64_t kB353 = (tmp3_0 + tmp3_2) * (s1_353_0 + s1_353_2);
    gl64_t kC353 = (tmp3_1 + tmp3_2) * (s1_353_1 + s1_353_2);
    gl64_t kD353 = tmp3_0 * s1_353_0;
    gl64_t kE353 = tmp3_1 * s1_353_1;
    gl64_t kF353 = tmp3_2 * s1_353_2;
    gl64_t kG353 = kD353 - kE353;
    tmp3_0 = (kC353 + kG353) - kF353;
    tmp3_1 = ((((kA353 + kC353) - kE353) - kE353) - kD353);
    tmp3_2 = kB353 - kG353;
    // Op 354: dim3x1 add
    gl64_t s1_354 = *(gl64_t*)&expressions_params[9][5];
    tmp3_6 = tmp3_0 + s1_354; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 355: dim3x3 add
    gl64_t s1_355_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_355_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_355_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_355_0; tmp3_1 = tmp3_7 + s1_355_1; tmp3_2 = tmp3_8 + s1_355_2;
    // Op 356: dim3x3 mul
    gl64_t kA356 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB356 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC356 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD356 = tmp3_3 * tmp3_0;
    gl64_t kE356 = tmp3_4 * tmp3_1;
    gl64_t kF356 = tmp3_5 * tmp3_2;
    gl64_t kG356 = kD356 - kE356;
    tmp3_0 = (kC356 + kG356) - kF356;
    tmp3_1 = ((((kA356 + kC356) - kE356) - kE356) - kD356);
    tmp3_2 = kB356 - kG356;
    // Op 357: dim3x3 mul
    gl64_t s0_357_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+0, domainSize, nCols_2))];
    gl64_t s0_357_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+1, domainSize, nCols_2))];
    gl64_t s0_357_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+2, domainSize, nCols_2))];
    gl64_t kA357 = (s0_357_0 + s0_357_1) * (tmp3_0 + tmp3_1);
    gl64_t kB357 = (s0_357_0 + s0_357_2) * (tmp3_0 + tmp3_2);
    gl64_t kC357 = (s0_357_1 + s0_357_2) * (tmp3_1 + tmp3_2);
    gl64_t kD357 = s0_357_0 * tmp3_0;
    gl64_t kE357 = s0_357_1 * tmp3_1;
    gl64_t kF357 = s0_357_2 * tmp3_2;
    gl64_t kG357 = kD357 - kE357;
    tmp3_0 = (kC357 + kG357) - kF357;
    tmp3_1 = ((((kA357 + kC357) - kE357) - kE357) - kD357);
    tmp3_2 = kB357 - kG357;
    // Op 358: dim1x1 sub_swap
    gl64_t s0_358 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    gl64_t s1_358 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_358 - s0_358;
    // Op 359: dim3x3 add
    gl64_t s1_359_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_359_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_359_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_359_0; tmp3_7 = tmp3_7 + s1_359_1; tmp3_8 = tmp3_8 + s1_359_2;
    // Op 360: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 361: dim1x1 sub_swap
    gl64_t s1_361 = *(gl64_t*)&expressions_params[9][1];
    tmp1_5 = s1_361 - tmp1_5;
    // Op 362: dim3x3 add
    gl64_t s1_362_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_362_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_362_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_362_0; tmp3_10 = tmp3_10 + s1_362_1; tmp3_11 = tmp3_11 + s1_362_2;
    // Op 363: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_5; tmp3_10 = tmp3_10 * tmp1_5; tmp3_11 = tmp3_11 * tmp1_5;
    // Op 364: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 365: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 366: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 367: dim3x3 mul
    gl64_t s1_367_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_367_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_367_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA367 = (tmp3_0 + tmp3_1) * (s1_367_0 + s1_367_1);
    gl64_t kB367 = (tmp3_0 + tmp3_2) * (s1_367_0 + s1_367_2);
    gl64_t kC367 = (tmp3_1 + tmp3_2) * (s1_367_1 + s1_367_2);
    gl64_t kD367 = tmp3_0 * s1_367_0;
    gl64_t kE367 = tmp3_1 * s1_367_1;
    gl64_t kF367 = tmp3_2 * s1_367_2;
    gl64_t kG367 = kD367 - kE367;
    tmp3_3 = (kC367 + kG367) - kF367;
    tmp3_4 = ((((kA367 + kC367) - kE367) - kE367) - kD367);
    tmp3_5 = kB367 - kG367;
    // Op 368: dim3x1 mul
    gl64_t s0_368_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_368_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_368_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_368 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    tmp3_0 = s0_368_0 * s1_368; tmp3_1 = s0_368_1 * s1_368; tmp3_2 = s0_368_2 * s1_368;
    // Op 369: dim3x1 add
    gl64_t s1_369 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_369; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 370: dim3x3 mul
    gl64_t s1_370_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_370_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_370_2 = *(gl64_t*)&expressions_params[13][0+2];
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
    // Op 371: dim3x1 add
    gl64_t s1_371 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_371; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 372: dim3x3 mul
    gl64_t s1_372_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_372_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_372_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA372 = (tmp3_0 + tmp3_1) * (s1_372_0 + s1_372_1);
    gl64_t kB372 = (tmp3_0 + tmp3_2) * (s1_372_0 + s1_372_2);
    gl64_t kC372 = (tmp3_1 + tmp3_2) * (s1_372_1 + s1_372_2);
    gl64_t kD372 = tmp3_0 * s1_372_0;
    gl64_t kE372 = tmp3_1 * s1_372_1;
    gl64_t kF372 = tmp3_2 * s1_372_2;
    gl64_t kG372 = kD372 - kE372;
    tmp3_0 = (kC372 + kG372) - kF372;
    tmp3_1 = ((((kA372 + kC372) - kE372) - kE372) - kD372);
    tmp3_2 = kB372 - kG372;
    // Op 373: dim1x1 mul
    gl64_t s0_373 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_373 = *(gl64_t*)&expressions_params[9][3];
    tmp1_5 = s0_373 * s1_373;
    // Op 374: dim1x1 add
    gl64_t s1_374 = *(gl64_t*)&expressions_params[9][0];
    tmp1_5 = tmp1_5 + s1_374;
    // Op 375: dim1x1 add
    gl64_t s1_375 = *(gl64_t*)&expressions_params[9][4];
    tmp1_5 = tmp1_5 + s1_375;
    // Op 376: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_5; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 377: dim3x3 mul
    gl64_t s1_377_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_377_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_377_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA377 = (tmp3_0 + tmp3_1) * (s1_377_0 + s1_377_1);
    gl64_t kB377 = (tmp3_0 + tmp3_2) * (s1_377_0 + s1_377_2);
    gl64_t kC377 = (tmp3_1 + tmp3_2) * (s1_377_1 + s1_377_2);
    gl64_t kD377 = tmp3_0 * s1_377_0;
    gl64_t kE377 = tmp3_1 * s1_377_1;
    gl64_t kF377 = tmp3_2 * s1_377_2;
    gl64_t kG377 = kD377 - kE377;
    tmp3_0 = (kC377 + kG377) - kF377;
    tmp3_1 = ((((kA377 + kC377) - kE377) - kE377) - kD377);
    tmp3_2 = kB377 - kG377;
    // Op 378: dim1x1 mul
    gl64_t s0_378 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_378 = *(gl64_t*)&expressions_params[9][2];
    tmp1_5 = s0_378 * s1_378;
    // Op 379: dim1x1 add
    gl64_t s1_379 = *(gl64_t*)&expressions_params[9][2];
    tmp1_5 = tmp1_5 + s1_379;
    // Op 380: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_5; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 381: dim3x3 mul
    gl64_t s1_381_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_381_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_381_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA381 = (tmp3_0 + tmp3_1) * (s1_381_0 + s1_381_1);
    gl64_t kB381 = (tmp3_0 + tmp3_2) * (s1_381_0 + s1_381_2);
    gl64_t kC381 = (tmp3_1 + tmp3_2) * (s1_381_1 + s1_381_2);
    gl64_t kD381 = tmp3_0 * s1_381_0;
    gl64_t kE381 = tmp3_1 * s1_381_1;
    gl64_t kF381 = tmp3_2 * s1_381_2;
    gl64_t kG381 = kD381 - kE381;
    tmp3_0 = (kC381 + kG381) - kF381;
    tmp3_1 = ((((kA381 + kC381) - kE381) - kE381) - kD381);
    tmp3_2 = kB381 - kG381;
    // Op 382: dim3x1 add
    gl64_t s1_382 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_382; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 383: dim3x3 mul
    gl64_t s1_383_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_383_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_383_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA383 = (tmp3_0 + tmp3_1) * (s1_383_0 + s1_383_1);
    gl64_t kB383 = (tmp3_0 + tmp3_2) * (s1_383_0 + s1_383_2);
    gl64_t kC383 = (tmp3_1 + tmp3_2) * (s1_383_1 + s1_383_2);
    gl64_t kD383 = tmp3_0 * s1_383_0;
    gl64_t kE383 = tmp3_1 * s1_383_1;
    gl64_t kF383 = tmp3_2 * s1_383_2;
    gl64_t kG383 = kD383 - kE383;
    tmp3_0 = (kC383 + kG383) - kF383;
    tmp3_1 = ((((kA383 + kC383) - kE383) - kE383) - kD383);
    tmp3_2 = kB383 - kG383;
    // Op 384: dim3x1 add
    gl64_t s1_384 = *(gl64_t*)&expressions_params[9][5];
    tmp3_9 = tmp3_0 + s1_384; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 385: dim3x3 add
    gl64_t s1_385_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_385_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_385_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_12 = tmp3_9 + s1_385_0; tmp3_13 = tmp3_10 + s1_385_1; tmp3_14 = tmp3_11 + s1_385_2;
    // Op 386: dim3x1 mul
    gl64_t s0_386_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_386_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_386_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_386 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    tmp3_0 = s0_386_0 * s1_386; tmp3_1 = s0_386_1 * s1_386; tmp3_2 = s0_386_2 * s1_386;
    // Op 387: dim3x1 add
    gl64_t s1_387 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_387; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 388: dim3x3 mul
    gl64_t s1_388_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_388_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_388_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA388 = (tmp3_0 + tmp3_1) * (s1_388_0 + s1_388_1);
    gl64_t kB388 = (tmp3_0 + tmp3_2) * (s1_388_0 + s1_388_2);
    gl64_t kC388 = (tmp3_1 + tmp3_2) * (s1_388_1 + s1_388_2);
    gl64_t kD388 = tmp3_0 * s1_388_0;
    gl64_t kE388 = tmp3_1 * s1_388_1;
    gl64_t kF388 = tmp3_2 * s1_388_2;
    gl64_t kG388 = kD388 - kE388;
    tmp3_0 = (kC388 + kG388) - kF388;
    tmp3_1 = ((((kA388 + kC388) - kE388) - kE388) - kD388);
    tmp3_2 = kB388 - kG388;
    // Op 389: dim3x1 add
    gl64_t s1_389 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_389; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 390: dim3x3 mul
    gl64_t s1_390_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_390_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_390_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA390 = (tmp3_0 + tmp3_1) * (s1_390_0 + s1_390_1);
    gl64_t kB390 = (tmp3_0 + tmp3_2) * (s1_390_0 + s1_390_2);
    gl64_t kC390 = (tmp3_1 + tmp3_2) * (s1_390_1 + s1_390_2);
    gl64_t kD390 = tmp3_0 * s1_390_0;
    gl64_t kE390 = tmp3_1 * s1_390_1;
    gl64_t kF390 = tmp3_2 * s1_390_2;
    gl64_t kG390 = kD390 - kE390;
    tmp3_0 = (kC390 + kG390) - kF390;
    tmp3_1 = ((((kA390 + kC390) - kE390) - kE390) - kD390);
    tmp3_2 = kB390 - kG390;
    // Op 391: dim1x1 mul
    gl64_t s0_391 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_391 = *(gl64_t*)&expressions_params[9][3];
    tmp1_5 = s0_391 * s1_391;
    // Op 392: dim1x1 add
    gl64_t s1_392 = *(gl64_t*)&expressions_params[9][0];
    tmp1_5 = tmp1_5 + s1_392;
    // Op 393: dim1x1 add
    gl64_t s0_393 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_393 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_0 = s0_393 + s1_393;
    // Op 394: dim1x1 add
    tmp1_0 = tmp1_5 + tmp1_0;
    // Op 395: dim1x1 add
    gl64_t s1_395 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_395;
    // Op 396: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 397: dim3x3 mul
    gl64_t s1_397_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_397_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_397_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA397 = (tmp3_0 + tmp3_1) * (s1_397_0 + s1_397_1);
    gl64_t kB397 = (tmp3_0 + tmp3_2) * (s1_397_0 + s1_397_2);
    gl64_t kC397 = (tmp3_1 + tmp3_2) * (s1_397_1 + s1_397_2);
    gl64_t kD397 = tmp3_0 * s1_397_0;
    gl64_t kE397 = tmp3_1 * s1_397_1;
    gl64_t kF397 = tmp3_2 * s1_397_2;
    gl64_t kG397 = kD397 - kE397;
    tmp3_0 = (kC397 + kG397) - kF397;
    tmp3_1 = ((((kA397 + kC397) - kE397) - kE397) - kD397);
    tmp3_2 = kB397 - kG397;
    // Op 398: dim1x1 mul
    gl64_t s0_398 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    gl64_t s1_398 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_398 * s1_398;
    // Op 399: dim1x1 add
    gl64_t s1_399 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = tmp1_0 + s1_399;
    // Op 400: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 401: dim3x3 mul
    gl64_t s1_401_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_401_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_401_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA401 = (tmp3_0 + tmp3_1) * (s1_401_0 + s1_401_1);
    gl64_t kB401 = (tmp3_0 + tmp3_2) * (s1_401_0 + s1_401_2);
    gl64_t kC401 = (tmp3_1 + tmp3_2) * (s1_401_1 + s1_401_2);
    gl64_t kD401 = tmp3_0 * s1_401_0;
    gl64_t kE401 = tmp3_1 * s1_401_1;
    gl64_t kF401 = tmp3_2 * s1_401_2;
    gl64_t kG401 = kD401 - kE401;
    tmp3_0 = (kC401 + kG401) - kF401;
    tmp3_1 = ((((kA401 + kC401) - kE401) - kE401) - kD401);
    tmp3_2 = kB401 - kG401;
    // Op 402: dim1x1 add
    gl64_t s0_402 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_402 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_0 = s0_402 + s1_402;
    // Op 403: dim1x1 add
    gl64_t s1_403 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_403;
    // Op 404: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 405: dim3x3 mul
    gl64_t s1_405_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_405_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_405_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA405 = (tmp3_0 + tmp3_1) * (s1_405_0 + s1_405_1);
    gl64_t kB405 = (tmp3_0 + tmp3_2) * (s1_405_0 + s1_405_2);
    gl64_t kC405 = (tmp3_1 + tmp3_2) * (s1_405_1 + s1_405_2);
    gl64_t kD405 = tmp3_0 * s1_405_0;
    gl64_t kE405 = tmp3_1 * s1_405_1;
    gl64_t kF405 = tmp3_2 * s1_405_2;
    gl64_t kG405 = kD405 - kE405;
    tmp3_0 = (kC405 + kG405) - kF405;
    tmp3_1 = ((((kA405 + kC405) - kE405) - kE405) - kD405);
    tmp3_2 = kB405 - kG405;
    // Op 406: dim3x1 add
    gl64_t s1_406 = *(gl64_t*)&expressions_params[9][5];
    tmp3_6 = tmp3_0 + s1_406; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 407: dim3x3 add
    gl64_t s1_407_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_407_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_407_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_407_0; tmp3_1 = tmp3_7 + s1_407_1; tmp3_2 = tmp3_8 + s1_407_2;
    // Op 408: dim3x3 mul
    gl64_t kA408 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB408 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC408 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD408 = tmp3_12 * tmp3_0;
    gl64_t kE408 = tmp3_13 * tmp3_1;
    gl64_t kF408 = tmp3_14 * tmp3_2;
    gl64_t kG408 = kD408 - kE408;
    tmp3_0 = (kC408 + kG408) - kF408;
    tmp3_1 = ((((kA408 + kC408) - kE408) - kE408) - kD408);
    tmp3_2 = kB408 - kG408;
    // Op 409: dim3x3 mul
    gl64_t s0_409_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+0, domainSize, nCols_2))];
    gl64_t s0_409_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+1, domainSize, nCols_2))];
    gl64_t s0_409_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+2, domainSize, nCols_2))];
    gl64_t kA409 = (s0_409_0 + s0_409_1) * (tmp3_0 + tmp3_1);
    gl64_t kB409 = (s0_409_0 + s0_409_2) * (tmp3_0 + tmp3_2);
    gl64_t kC409 = (s0_409_1 + s0_409_2) * (tmp3_1 + tmp3_2);
    gl64_t kD409 = s0_409_0 * tmp3_0;
    gl64_t kE409 = s0_409_1 * tmp3_1;
    gl64_t kF409 = s0_409_2 * tmp3_2;
    gl64_t kG409 = kD409 - kE409;
    tmp3_0 = (kC409 + kG409) - kF409;
    tmp3_1 = ((((kA409 + kC409) - kE409) - kE409) - kD409);
    tmp3_2 = kB409 - kG409;
    // Op 410: dim1x1 sub_swap
    gl64_t s0_410 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    gl64_t s1_410 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_410 - s0_410;
    // Op 411: dim3x3 add
    gl64_t s1_411_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_411_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_411_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_411_0; tmp3_7 = tmp3_7 + s1_411_1; tmp3_8 = tmp3_8 + s1_411_2;
    // Op 412: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 413: dim1x1 sub_swap
    gl64_t s0_413 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    gl64_t s1_413 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_413 - s0_413;
    // Op 414: dim3x3 add
    gl64_t s1_414_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_414_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_414_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_414_0; tmp3_10 = tmp3_10 + s1_414_1; tmp3_11 = tmp3_11 + s1_414_2;
    // Op 415: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 416: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 417: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 418: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 419: dim3x3 mul
    gl64_t s1_419_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_419_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_419_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA419 = (tmp3_0 + tmp3_1) * (s1_419_0 + s1_419_1);
    gl64_t kB419 = (tmp3_0 + tmp3_2) * (s1_419_0 + s1_419_2);
    gl64_t kC419 = (tmp3_1 + tmp3_2) * (s1_419_1 + s1_419_2);
    gl64_t kD419 = tmp3_0 * s1_419_0;
    gl64_t kE419 = tmp3_1 * s1_419_1;
    gl64_t kF419 = tmp3_2 * s1_419_2;
    gl64_t kG419 = kD419 - kE419;
    tmp3_12 = (kC419 + kG419) - kF419;
    tmp3_13 = ((((kA419 + kC419) - kE419) - kE419) - kD419);
    tmp3_14 = kB419 - kG419;
    // Op 420: dim3x1 mul
    gl64_t s0_420_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_420_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_420_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_420 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    tmp3_0 = s0_420_0 * s1_420; tmp3_1 = s0_420_1 * s1_420; tmp3_2 = s0_420_2 * s1_420;
    // Op 421: dim3x1 add
    gl64_t s1_421 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_421; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 422: dim3x3 mul
    gl64_t s1_422_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_422_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_422_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA422 = (tmp3_0 + tmp3_1) * (s1_422_0 + s1_422_1);
    gl64_t kB422 = (tmp3_0 + tmp3_2) * (s1_422_0 + s1_422_2);
    gl64_t kC422 = (tmp3_1 + tmp3_2) * (s1_422_1 + s1_422_2);
    gl64_t kD422 = tmp3_0 * s1_422_0;
    gl64_t kE422 = tmp3_1 * s1_422_1;
    gl64_t kF422 = tmp3_2 * s1_422_2;
    gl64_t kG422 = kD422 - kE422;
    tmp3_0 = (kC422 + kG422) - kF422;
    tmp3_1 = ((((kA422 + kC422) - kE422) - kE422) - kD422);
    tmp3_2 = kB422 - kG422;
    // Op 423: dim3x1 add
    gl64_t s1_423 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_423; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 424: dim3x3 mul
    gl64_t s1_424_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_424_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_424_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA424 = (tmp3_0 + tmp3_1) * (s1_424_0 + s1_424_1);
    gl64_t kB424 = (tmp3_0 + tmp3_2) * (s1_424_0 + s1_424_2);
    gl64_t kC424 = (tmp3_1 + tmp3_2) * (s1_424_1 + s1_424_2);
    gl64_t kD424 = tmp3_0 * s1_424_0;
    gl64_t kE424 = tmp3_1 * s1_424_1;
    gl64_t kF424 = tmp3_2 * s1_424_2;
    gl64_t kG424 = kD424 - kE424;
    tmp3_0 = (kC424 + kG424) - kF424;
    tmp3_1 = ((((kA424 + kC424) - kE424) - kE424) - kD424);
    tmp3_2 = kB424 - kG424;
    // Op 425: dim1x1 mul
    gl64_t s0_425 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_425 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_425 * s1_425;
    // Op 426: dim1x1 add
    gl64_t s1_426 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_426;
    // Op 427: dim1x1 add
    gl64_t s1_427 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_427;
    // Op 428: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 429: dim3x3 mul
    gl64_t s1_429_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_429_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_429_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA429 = (tmp3_0 + tmp3_1) * (s1_429_0 + s1_429_1);
    gl64_t kB429 = (tmp3_0 + tmp3_2) * (s1_429_0 + s1_429_2);
    gl64_t kC429 = (tmp3_1 + tmp3_2) * (s1_429_1 + s1_429_2);
    gl64_t kD429 = tmp3_0 * s1_429_0;
    gl64_t kE429 = tmp3_1 * s1_429_1;
    gl64_t kF429 = tmp3_2 * s1_429_2;
    gl64_t kG429 = kD429 - kE429;
    tmp3_0 = (kC429 + kG429) - kF429;
    tmp3_1 = ((((kA429 + kC429) - kE429) - kE429) - kD429);
    tmp3_2 = kB429 - kG429;
    // Op 430: dim1x1 mul
    gl64_t s0_430 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_430 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_430 * s1_430;
    // Op 431: dim1x1 add
    gl64_t s1_431 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = tmp1_0 + s1_431;
    // Op 432: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 433: dim3x3 mul
    gl64_t s1_433_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_433_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_433_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA433 = (tmp3_0 + tmp3_1) * (s1_433_0 + s1_433_1);
    gl64_t kB433 = (tmp3_0 + tmp3_2) * (s1_433_0 + s1_433_2);
    gl64_t kC433 = (tmp3_1 + tmp3_2) * (s1_433_1 + s1_433_2);
    gl64_t kD433 = tmp3_0 * s1_433_0;
    gl64_t kE433 = tmp3_1 * s1_433_1;
    gl64_t kF433 = tmp3_2 * s1_433_2;
    gl64_t kG433 = kD433 - kE433;
    tmp3_0 = (kC433 + kG433) - kF433;
    tmp3_1 = ((((kA433 + kC433) - kE433) - kE433) - kD433);
    tmp3_2 = kB433 - kG433;
    // Op 434: dim3x1 add
    gl64_t s1_434 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_434; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 435: dim3x3 mul
    gl64_t s1_435_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_435_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_435_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA435 = (tmp3_0 + tmp3_1) * (s1_435_0 + s1_435_1);
    gl64_t kB435 = (tmp3_0 + tmp3_2) * (s1_435_0 + s1_435_2);
    gl64_t kC435 = (tmp3_1 + tmp3_2) * (s1_435_1 + s1_435_2);
    gl64_t kD435 = tmp3_0 * s1_435_0;
    gl64_t kE435 = tmp3_1 * s1_435_1;
    gl64_t kF435 = tmp3_2 * s1_435_2;
    gl64_t kG435 = kD435 - kE435;
    tmp3_0 = (kC435 + kG435) - kF435;
    tmp3_1 = ((((kA435 + kC435) - kE435) - kE435) - kD435);
    tmp3_2 = kB435 - kG435;
    // Op 436: dim3x1 add
    gl64_t s1_436 = *(gl64_t*)&expressions_params[9][5];
    tmp3_9 = tmp3_0 + s1_436; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 437: dim3x3 add
    gl64_t s1_437_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_437_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_437_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_437_0; tmp3_4 = tmp3_10 + s1_437_1; tmp3_5 = tmp3_11 + s1_437_2;
    // Op 438: dim3x1 mul
    gl64_t s0_438_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_438_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_438_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_438 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    tmp3_0 = s0_438_0 * s1_438; tmp3_1 = s0_438_1 * s1_438; tmp3_2 = s0_438_2 * s1_438;
    // Op 439: dim3x1 add
    gl64_t s1_439 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_439; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 440: dim3x3 mul
    gl64_t s1_440_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_440_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_440_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA440 = (tmp3_0 + tmp3_1) * (s1_440_0 + s1_440_1);
    gl64_t kB440 = (tmp3_0 + tmp3_2) * (s1_440_0 + s1_440_2);
    gl64_t kC440 = (tmp3_1 + tmp3_2) * (s1_440_1 + s1_440_2);
    gl64_t kD440 = tmp3_0 * s1_440_0;
    gl64_t kE440 = tmp3_1 * s1_440_1;
    gl64_t kF440 = tmp3_2 * s1_440_2;
    gl64_t kG440 = kD440 - kE440;
    tmp3_0 = (kC440 + kG440) - kF440;
    tmp3_1 = ((((kA440 + kC440) - kE440) - kE440) - kD440);
    tmp3_2 = kB440 - kG440;
    // Op 441: dim3x1 add
    gl64_t s1_441 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_441; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 442: dim3x3 mul
    gl64_t s1_442_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_442_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_442_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA442 = (tmp3_0 + tmp3_1) * (s1_442_0 + s1_442_1);
    gl64_t kB442 = (tmp3_0 + tmp3_2) * (s1_442_0 + s1_442_2);
    gl64_t kC442 = (tmp3_1 + tmp3_2) * (s1_442_1 + s1_442_2);
    gl64_t kD442 = tmp3_0 * s1_442_0;
    gl64_t kE442 = tmp3_1 * s1_442_1;
    gl64_t kF442 = tmp3_2 * s1_442_2;
    gl64_t kG442 = kD442 - kE442;
    tmp3_0 = (kC442 + kG442) - kF442;
    tmp3_1 = ((((kA442 + kC442) - kE442) - kE442) - kD442);
    tmp3_2 = kB442 - kG442;
    // Op 443: dim1x1 mul
    gl64_t s0_443 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_443 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_443 * s1_443;
    // Op 444: dim1x1 add
    gl64_t s1_444 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_444;
    // Op 445: dim1x1 add
    gl64_t s0_445 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_445 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_5 = s0_445 + s1_445;
    // Op 446: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_5;
    // Op 447: dim1x1 add
    gl64_t s1_447 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_447;
    // Op 448: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 449: dim3x3 mul
    gl64_t s1_449_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_449_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_449_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA449 = (tmp3_0 + tmp3_1) * (s1_449_0 + s1_449_1);
    gl64_t kB449 = (tmp3_0 + tmp3_2) * (s1_449_0 + s1_449_2);
    gl64_t kC449 = (tmp3_1 + tmp3_2) * (s1_449_1 + s1_449_2);
    gl64_t kD449 = tmp3_0 * s1_449_0;
    gl64_t kE449 = tmp3_1 * s1_449_1;
    gl64_t kF449 = tmp3_2 * s1_449_2;
    gl64_t kG449 = kD449 - kE449;
    tmp3_0 = (kC449 + kG449) - kF449;
    tmp3_1 = ((((kA449 + kC449) - kE449) - kE449) - kD449);
    tmp3_2 = kB449 - kG449;
    // Op 450: dim1x1 mul
    gl64_t s0_450 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    gl64_t s1_450 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_450 * s1_450;
    // Op 451: dim1x1 add
    gl64_t s1_451 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = tmp1_0 + s1_451;
    // Op 452: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 453: dim3x3 mul
    gl64_t s1_453_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_453_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_453_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA453 = (tmp3_0 + tmp3_1) * (s1_453_0 + s1_453_1);
    gl64_t kB453 = (tmp3_0 + tmp3_2) * (s1_453_0 + s1_453_2);
    gl64_t kC453 = (tmp3_1 + tmp3_2) * (s1_453_1 + s1_453_2);
    gl64_t kD453 = tmp3_0 * s1_453_0;
    gl64_t kE453 = tmp3_1 * s1_453_1;
    gl64_t kF453 = tmp3_2 * s1_453_2;
    gl64_t kG453 = kD453 - kE453;
    tmp3_0 = (kC453 + kG453) - kF453;
    tmp3_1 = ((((kA453 + kC453) - kE453) - kE453) - kD453);
    tmp3_2 = kB453 - kG453;
    // Op 454: dim1x1 add
    gl64_t s0_454 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_454 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_0 = s0_454 + s1_454;
    // Op 455: dim1x1 add
    gl64_t s1_455 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_455;
    // Op 456: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 457: dim3x3 mul
    gl64_t s1_457_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_457_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_457_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA457 = (tmp3_0 + tmp3_1) * (s1_457_0 + s1_457_1);
    gl64_t kB457 = (tmp3_0 + tmp3_2) * (s1_457_0 + s1_457_2);
    gl64_t kC457 = (tmp3_1 + tmp3_2) * (s1_457_1 + s1_457_2);
    gl64_t kD457 = tmp3_0 * s1_457_0;
    gl64_t kE457 = tmp3_1 * s1_457_1;
    gl64_t kF457 = tmp3_2 * s1_457_2;
    gl64_t kG457 = kD457 - kE457;
    tmp3_0 = (kC457 + kG457) - kF457;
    tmp3_1 = ((((kA457 + kC457) - kE457) - kE457) - kD457);
    tmp3_2 = kB457 - kG457;
    // Op 458: dim3x1 add
    gl64_t s1_458 = *(gl64_t*)&expressions_params[9][5];
    tmp3_6 = tmp3_0 + s1_458; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 459: dim3x3 add
    gl64_t s1_459_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_459_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_459_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_459_0; tmp3_1 = tmp3_7 + s1_459_1; tmp3_2 = tmp3_8 + s1_459_2;
    // Op 460: dim3x3 mul
    gl64_t kA460 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB460 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC460 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD460 = tmp3_3 * tmp3_0;
    gl64_t kE460 = tmp3_4 * tmp3_1;
    gl64_t kF460 = tmp3_5 * tmp3_2;
    gl64_t kG460 = kD460 - kE460;
    tmp3_0 = (kC460 + kG460) - kF460;
    tmp3_1 = ((((kA460 + kC460) - kE460) - kE460) - kD460);
    tmp3_2 = kB460 - kG460;
    // Op 461: dim3x3 mul
    uint64_t s0_461_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_2));
    gl64_t s0_461_0 = *(gl64_t*)&dParams->aux_trace[s0_461_pos];
    gl64_t s0_461_1 = *(gl64_t*)&dParams->aux_trace[s0_461_pos + TILE_HEIGHT];
    gl64_t s0_461_2 = *(gl64_t*)&dParams->aux_trace[s0_461_pos + 2*TILE_HEIGHT];
    gl64_t kA461 = (s0_461_0 + s0_461_1) * (tmp3_0 + tmp3_1);
    gl64_t kB461 = (s0_461_0 + s0_461_2) * (tmp3_0 + tmp3_2);
    gl64_t kC461 = (s0_461_1 + s0_461_2) * (tmp3_1 + tmp3_2);
    gl64_t kD461 = s0_461_0 * tmp3_0;
    gl64_t kE461 = s0_461_1 * tmp3_1;
    gl64_t kF461 = s0_461_2 * tmp3_2;
    gl64_t kG461 = kD461 - kE461;
    tmp3_0 = (kC461 + kG461) - kF461;
    tmp3_1 = ((((kA461 + kC461) - kE461) - kE461) - kD461);
    tmp3_2 = kB461 - kG461;
    // Op 462: dim1x1 sub_swap
    gl64_t s0_462 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    gl64_t s1_462 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_462 - s0_462;
    // Op 463: dim3x3 add
    gl64_t s1_463_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_463_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_463_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_463_0; tmp3_7 = tmp3_7 + s1_463_1; tmp3_8 = tmp3_8 + s1_463_2;
    // Op 464: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 465: dim1x1 sub_swap
    gl64_t s0_465 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    gl64_t s1_465 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_465 - s0_465;
    // Op 466: dim3x3 add
    gl64_t s1_466_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_466_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_466_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_466_0; tmp3_10 = tmp3_10 + s1_466_1; tmp3_11 = tmp3_11 + s1_466_2;
    // Op 467: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 468: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 469: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 470: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 471: dim3x3 mul
    gl64_t s1_471_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_471_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_471_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA471 = (tmp3_0 + tmp3_1) * (s1_471_0 + s1_471_1);
    gl64_t kB471 = (tmp3_0 + tmp3_2) * (s1_471_0 + s1_471_2);
    gl64_t kC471 = (tmp3_1 + tmp3_2) * (s1_471_1 + s1_471_2);
    gl64_t kD471 = tmp3_0 * s1_471_0;
    gl64_t kE471 = tmp3_1 * s1_471_1;
    gl64_t kF471 = tmp3_2 * s1_471_2;
    gl64_t kG471 = kD471 - kE471;
    tmp3_3 = (kC471 + kG471) - kF471;
    tmp3_4 = ((((kA471 + kC471) - kE471) - kE471) - kD471);
    tmp3_5 = kB471 - kG471;
    // Op 472: dim3x1 mul
    gl64_t s0_472_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_472_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_472_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_472 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    tmp3_0 = s0_472_0 * s1_472; tmp3_1 = s0_472_1 * s1_472; tmp3_2 = s0_472_2 * s1_472;
    // Op 473: dim3x1 add
    gl64_t s1_473 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_473; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 474: dim3x3 mul
    gl64_t s1_474_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_474_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_474_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA474 = (tmp3_0 + tmp3_1) * (s1_474_0 + s1_474_1);
    gl64_t kB474 = (tmp3_0 + tmp3_2) * (s1_474_0 + s1_474_2);
    gl64_t kC474 = (tmp3_1 + tmp3_2) * (s1_474_1 + s1_474_2);
    gl64_t kD474 = tmp3_0 * s1_474_0;
    gl64_t kE474 = tmp3_1 * s1_474_1;
    gl64_t kF474 = tmp3_2 * s1_474_2;
    gl64_t kG474 = kD474 - kE474;
    tmp3_0 = (kC474 + kG474) - kF474;
    tmp3_1 = ((((kA474 + kC474) - kE474) - kE474) - kD474);
    tmp3_2 = kB474 - kG474;
    // Op 475: dim3x1 add
    gl64_t s1_475 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_475; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 476: dim3x3 mul
    gl64_t s1_476_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_476_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_476_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA476 = (tmp3_0 + tmp3_1) * (s1_476_0 + s1_476_1);
    gl64_t kB476 = (tmp3_0 + tmp3_2) * (s1_476_0 + s1_476_2);
    gl64_t kC476 = (tmp3_1 + tmp3_2) * (s1_476_1 + s1_476_2);
    gl64_t kD476 = tmp3_0 * s1_476_0;
    gl64_t kE476 = tmp3_1 * s1_476_1;
    gl64_t kF476 = tmp3_2 * s1_476_2;
    gl64_t kG476 = kD476 - kE476;
    tmp3_0 = (kC476 + kG476) - kF476;
    tmp3_1 = ((((kA476 + kC476) - kE476) - kE476) - kD476);
    tmp3_2 = kB476 - kG476;
    // Op 477: dim1x1 mul
    gl64_t s0_477 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_477 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_477 * s1_477;
    // Op 478: dim1x1 add
    gl64_t s1_478 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_478;
    // Op 479: dim1x1 add
    gl64_t s1_479 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_479;
    // Op 480: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 481: dim3x3 mul
    gl64_t s1_481_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_481_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_481_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA481 = (tmp3_0 + tmp3_1) * (s1_481_0 + s1_481_1);
    gl64_t kB481 = (tmp3_0 + tmp3_2) * (s1_481_0 + s1_481_2);
    gl64_t kC481 = (tmp3_1 + tmp3_2) * (s1_481_1 + s1_481_2);
    gl64_t kD481 = tmp3_0 * s1_481_0;
    gl64_t kE481 = tmp3_1 * s1_481_1;
    gl64_t kF481 = tmp3_2 * s1_481_2;
    gl64_t kG481 = kD481 - kE481;
    tmp3_0 = (kC481 + kG481) - kF481;
    tmp3_1 = ((((kA481 + kC481) - kE481) - kE481) - kD481);
    tmp3_2 = kB481 - kG481;
    // Op 482: dim1x1 mul
    gl64_t s0_482 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_482 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_482 * s1_482;
    // Op 483: dim1x1 add
    gl64_t s1_483 = *(gl64_t*)&expressions_params[9][7];
    tmp1_0 = tmp1_0 + s1_483;
    // Op 484: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 486: dim3x1 add
    gl64_t s1_486 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_486; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 487: dim3x3 mul
    gl64_t s1_487_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_487_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_487_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA487 = (tmp3_0 + tmp3_1) * (s1_487_0 + s1_487_1);
    gl64_t kB487 = (tmp3_0 + tmp3_2) * (s1_487_0 + s1_487_2);
    gl64_t kC487 = (tmp3_1 + tmp3_2) * (s1_487_1 + s1_487_2);
    gl64_t kD487 = tmp3_0 * s1_487_0;
    gl64_t kE487 = tmp3_1 * s1_487_1;
    gl64_t kF487 = tmp3_2 * s1_487_2;
    gl64_t kG487 = kD487 - kE487;
    tmp3_0 = (kC487 + kG487) - kF487;
    tmp3_1 = ((((kA487 + kC487) - kE487) - kE487) - kD487);
    tmp3_2 = kB487 - kG487;
    // Op 488: dim3x1 add
    gl64_t s1_488 = *(gl64_t*)&expressions_params[9][5];
    tmp3_9 = tmp3_0 + s1_488; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 489: dim3x3 add
    gl64_t s1_489_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_489_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_489_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_12 = tmp3_9 + s1_489_0; tmp3_13 = tmp3_10 + s1_489_1; tmp3_14 = tmp3_11 + s1_489_2;
    // Op 490: dim3x1 mul
    gl64_t s0_490_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_490_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_490_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_490 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    tmp3_0 = s0_490_0 * s1_490; tmp3_1 = s0_490_1 * s1_490; tmp3_2 = s0_490_2 * s1_490;
    // Op 491: dim3x1 add
    gl64_t s1_491 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_491; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 492: dim3x3 mul
    gl64_t s1_492_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_492_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_492_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA492 = (tmp3_0 + tmp3_1) * (s1_492_0 + s1_492_1);
    gl64_t kB492 = (tmp3_0 + tmp3_2) * (s1_492_0 + s1_492_2);
    gl64_t kC492 = (tmp3_1 + tmp3_2) * (s1_492_1 + s1_492_2);
    gl64_t kD492 = tmp3_0 * s1_492_0;
    gl64_t kE492 = tmp3_1 * s1_492_1;
    gl64_t kF492 = tmp3_2 * s1_492_2;
    gl64_t kG492 = kD492 - kE492;
    tmp3_0 = (kC492 + kG492) - kF492;
    tmp3_1 = ((((kA492 + kC492) - kE492) - kE492) - kD492);
    tmp3_2 = kB492 - kG492;
    // Op 493: dim3x1 add
    gl64_t s1_493 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_493; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 494: dim3x3 mul
    gl64_t s1_494_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_494_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_494_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA494 = (tmp3_0 + tmp3_1) * (s1_494_0 + s1_494_1);
    gl64_t kB494 = (tmp3_0 + tmp3_2) * (s1_494_0 + s1_494_2);
    gl64_t kC494 = (tmp3_1 + tmp3_2) * (s1_494_1 + s1_494_2);
    gl64_t kD494 = tmp3_0 * s1_494_0;
    gl64_t kE494 = tmp3_1 * s1_494_1;
    gl64_t kF494 = tmp3_2 * s1_494_2;
    gl64_t kG494 = kD494 - kE494;
    tmp3_0 = (kC494 + kG494) - kF494;
    tmp3_1 = ((((kA494 + kC494) - kE494) - kE494) - kD494);
    tmp3_2 = kB494 - kG494;
    // Op 495: dim1x1 mul
    gl64_t s0_495 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_495 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_495 * s1_495;
    // Op 496: dim1x1 add
    gl64_t s1_496 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_496;
    // Op 497: dim1x1 add
    gl64_t s0_497 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_497 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_5 = s0_497 + s1_497;
    // Op 498: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_5;
    // Op 499: dim1x1 add
    gl64_t s1_499 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_499;
    // Op 500: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 501: dim3x3 mul
    gl64_t s1_501_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_501_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_501_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA501 = (tmp3_0 + tmp3_1) * (s1_501_0 + s1_501_1);
    gl64_t kB501 = (tmp3_0 + tmp3_2) * (s1_501_0 + s1_501_2);
    gl64_t kC501 = (tmp3_1 + tmp3_2) * (s1_501_1 + s1_501_2);
    gl64_t kD501 = tmp3_0 * s1_501_0;
    gl64_t kE501 = tmp3_1 * s1_501_1;
    gl64_t kF501 = tmp3_2 * s1_501_2;
    gl64_t kG501 = kD501 - kE501;
    tmp3_0 = (kC501 + kG501) - kF501;
    tmp3_1 = ((((kA501 + kC501) - kE501) - kE501) - kD501);
    tmp3_2 = kB501 - kG501;
    // Op 502: dim1x1 mul
    gl64_t s0_502 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    gl64_t s1_502 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_502 * s1_502;
    // Op 503: dim1x1 add
    gl64_t s1_503 = *(gl64_t*)&expressions_params[9][7];
    tmp1_0 = tmp1_0 + s1_503;
    // Op 504: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 505: dim3x3 mul
    gl64_t s1_505_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_505_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_505_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA505 = (tmp3_0 + tmp3_1) * (s1_505_0 + s1_505_1);
    gl64_t kB505 = (tmp3_0 + tmp3_2) * (s1_505_0 + s1_505_2);
    gl64_t kC505 = (tmp3_1 + tmp3_2) * (s1_505_1 + s1_505_2);
    gl64_t kD505 = tmp3_0 * s1_505_0;
    gl64_t kE505 = tmp3_1 * s1_505_1;
    gl64_t kF505 = tmp3_2 * s1_505_2;
    gl64_t kG505 = kD505 - kE505;
    tmp3_0 = (kC505 + kG505) - kF505;
    tmp3_1 = ((((kA505 + kC505) - kE505) - kE505) - kD505);
    tmp3_2 = kB505 - kG505;
    // Op 506: dim1x1 add
    gl64_t s0_506 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_506 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_0 = s0_506 + s1_506;
    // Op 507: dim1x1 add
    gl64_t s1_507 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_507;
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
    gl64_t s1_510 = *(gl64_t*)&expressions_params[9][5];
    tmp3_6 = tmp3_0 + s1_510; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 511: dim3x3 add
    gl64_t s1_511_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_511_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_511_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_511_0; tmp3_1 = tmp3_7 + s1_511_1; tmp3_2 = tmp3_8 + s1_511_2;
    // Op 512: dim3x3 mul
    gl64_t kA512 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB512 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC512 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD512 = tmp3_12 * tmp3_0;
    gl64_t kE512 = tmp3_13 * tmp3_1;
    gl64_t kF512 = tmp3_14 * tmp3_2;
    gl64_t kG512 = kD512 - kE512;
    tmp3_0 = (kC512 + kG512) - kF512;
    tmp3_1 = ((((kA512 + kC512) - kE512) - kE512) - kD512);
    tmp3_2 = kB512 - kG512;
    // Op 513: dim3x3 mul
    uint64_t s0_513_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_2));
    gl64_t s0_513_0 = *(gl64_t*)&dParams->aux_trace[s0_513_pos];
    gl64_t s0_513_1 = *(gl64_t*)&dParams->aux_trace[s0_513_pos + TILE_HEIGHT];
    gl64_t s0_513_2 = *(gl64_t*)&dParams->aux_trace[s0_513_pos + 2*TILE_HEIGHT];
    gl64_t kA513 = (s0_513_0 + s0_513_1) * (tmp3_0 + tmp3_1);
    gl64_t kB513 = (s0_513_0 + s0_513_2) * (tmp3_0 + tmp3_2);
    gl64_t kC513 = (s0_513_1 + s0_513_2) * (tmp3_1 + tmp3_2);
    gl64_t kD513 = s0_513_0 * tmp3_0;
    gl64_t kE513 = s0_513_1 * tmp3_1;
    gl64_t kF513 = s0_513_2 * tmp3_2;
    gl64_t kG513 = kD513 - kE513;
    tmp3_0 = (kC513 + kG513) - kF513;
    tmp3_1 = ((((kA513 + kC513) - kE513) - kE513) - kD513);
    tmp3_2 = kB513 - kG513;
    // Op 514: dim1x1 sub_swap
    gl64_t s0_514 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    gl64_t s1_514 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_514 - s0_514;
    // Op 515: dim3x3 add
    gl64_t s1_515_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_515_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_515_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_515_0; tmp3_7 = tmp3_7 + s1_515_1; tmp3_8 = tmp3_8 + s1_515_2;
    // Op 516: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 517: dim1x1 sub_swap
    gl64_t s0_517 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    gl64_t s1_517 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_517 - s0_517;
    // Op 518: dim3x3 add
    gl64_t s1_518_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_518_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_518_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_518_0; tmp3_10 = tmp3_10 + s1_518_1; tmp3_11 = tmp3_11 + s1_518_2;
    // Op 519: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 520: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 521: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 522: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 523: dim3x3 mul
    gl64_t s1_523_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_523_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_523_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA523 = (tmp3_0 + tmp3_1) * (s1_523_0 + s1_523_1);
    gl64_t kB523 = (tmp3_0 + tmp3_2) * (s1_523_0 + s1_523_2);
    gl64_t kC523 = (tmp3_1 + tmp3_2) * (s1_523_1 + s1_523_2);
    gl64_t kD523 = tmp3_0 * s1_523_0;
    gl64_t kE523 = tmp3_1 * s1_523_1;
    gl64_t kF523 = tmp3_2 * s1_523_2;
    gl64_t kG523 = kD523 - kE523;
    tmp3_3 = (kC523 + kG523) - kF523;
    tmp3_4 = ((((kA523 + kC523) - kE523) - kE523) - kD523);
    tmp3_5 = kB523 - kG523;
    // Op 524: dim1x1 mul
    gl64_t s0_524 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    gl64_t s1_524 = *(gl64_t*)&expressions_params[9][2];
    tmp1_5 = s0_524 * s1_524;
    // Op 525: dim1x1 sub
    gl64_t s0_525 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_525 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp1_0 = s0_525 - s1_525;
    // Op 526: dim1x1 add
    gl64_t s0_526 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    tmp1_0 = s0_526 + tmp1_0;
    // Op 527: dim1x1 mul
    tmp1_0 = tmp1_5 * tmp1_0;
    // Op 528: dim1x1 add
    gl64_t s0_528 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    tmp1_0 = s0_528 + tmp1_0;
    // Op 529: dim3x1 mul
    gl64_t s0_529_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_529_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_529_2 = *(gl64_t*)&expressions_params[13][0+2];
    tmp3_0 = s0_529_0 * tmp1_0; tmp3_1 = s0_529_1 * tmp1_0; tmp3_2 = s0_529_2 * tmp1_0;
    // Op 530: dim3x1 add
    gl64_t s1_530 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_530; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 531: dim3x3 mul
    gl64_t s1_531_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_531_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_531_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA531 = (tmp3_0 + tmp3_1) * (s1_531_0 + s1_531_1);
    gl64_t kB531 = (tmp3_0 + tmp3_2) * (s1_531_0 + s1_531_2);
    gl64_t kC531 = (tmp3_1 + tmp3_2) * (s1_531_1 + s1_531_2);
    gl64_t kD531 = tmp3_0 * s1_531_0;
    gl64_t kE531 = tmp3_1 * s1_531_1;
    gl64_t kF531 = tmp3_2 * s1_531_2;
    gl64_t kG531 = kD531 - kE531;
    tmp3_0 = (kC531 + kG531) - kF531;
    tmp3_1 = ((((kA531 + kC531) - kE531) - kE531) - kD531);
    tmp3_2 = kB531 - kG531;
    // Op 532: dim3x3 mul
    gl64_t s1_532_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_532_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_532_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA532 = (tmp3_0 + tmp3_1) * (s1_532_0 + s1_532_1);
    gl64_t kB532 = (tmp3_0 + tmp3_2) * (s1_532_0 + s1_532_2);
    gl64_t kC532 = (tmp3_1 + tmp3_2) * (s1_532_1 + s1_532_2);
    gl64_t kD532 = tmp3_0 * s1_532_0;
    gl64_t kE532 = tmp3_1 * s1_532_1;
    gl64_t kF532 = tmp3_2 * s1_532_2;
    gl64_t kG532 = kD532 - kE532;
    tmp3_0 = (kC532 + kG532) - kF532;
    tmp3_1 = ((((kA532 + kC532) - kE532) - kE532) - kD532);
    tmp3_2 = kB532 - kG532;
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
    // Op 534: dim1x1 mul
    gl64_t s0_534 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    gl64_t s1_534 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_534 * s1_534;
    // Op 535: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 536: dim3x3 mul
    gl64_t s1_536_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_536_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_536_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA536 = (tmp3_0 + tmp3_1) * (s1_536_0 + s1_536_1);
    gl64_t kB536 = (tmp3_0 + tmp3_2) * (s1_536_0 + s1_536_2);
    gl64_t kC536 = (tmp3_1 + tmp3_2) * (s1_536_1 + s1_536_2);
    gl64_t kD536 = tmp3_0 * s1_536_0;
    gl64_t kE536 = tmp3_1 * s1_536_1;
    gl64_t kF536 = tmp3_2 * s1_536_2;
    gl64_t kG536 = kD536 - kE536;
    tmp3_0 = (kC536 + kG536) - kF536;
    tmp3_1 = ((((kA536 + kC536) - kE536) - kE536) - kD536);
    tmp3_2 = kB536 - kG536;
    // Op 537: dim3x3 mul
    gl64_t s1_537_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_537_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_537_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA537 = (tmp3_0 + tmp3_1) * (s1_537_0 + s1_537_1);
    gl64_t kB537 = (tmp3_0 + tmp3_2) * (s1_537_0 + s1_537_2);
    gl64_t kC537 = (tmp3_1 + tmp3_2) * (s1_537_1 + s1_537_2);
    gl64_t kD537 = tmp3_0 * s1_537_0;
    gl64_t kE537 = tmp3_1 * s1_537_1;
    gl64_t kF537 = tmp3_2 * s1_537_2;
    gl64_t kG537 = kD537 - kE537;
    tmp3_0 = (kC537 + kG537) - kF537;
    tmp3_1 = ((((kA537 + kC537) - kE537) - kE537) - kD537);
    tmp3_2 = kB537 - kG537;
    // Op 538: dim1x1 mul
    gl64_t s0_538 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    gl64_t s1_538 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_538 * s1_538;
    // Op 539: dim1x1 mul
    gl64_t s0_539 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_1 = s0_539 * tmp1_0;
    // Op 540: dim1x1 mul
    gl64_t s0_540 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_540 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_540 * s1_540;
    // Op 541: dim1x1 add
    gl64_t s0_541 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_541 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    tmp1_5 = s0_541 + s1_541;
    // Op 542: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_5;
    // Op 543: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 544: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 545: dim3x3 mul
    gl64_t s1_545_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_545_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_545_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA545 = (tmp3_0 + tmp3_1) * (s1_545_0 + s1_545_1);
    gl64_t kB545 = (tmp3_0 + tmp3_2) * (s1_545_0 + s1_545_2);
    gl64_t kC545 = (tmp3_1 + tmp3_2) * (s1_545_1 + s1_545_2);
    gl64_t kD545 = tmp3_0 * s1_545_0;
    gl64_t kE545 = tmp3_1 * s1_545_1;
    gl64_t kF545 = tmp3_2 * s1_545_2;
    gl64_t kG545 = kD545 - kE545;
    tmp3_0 = (kC545 + kG545) - kF545;
    tmp3_1 = ((((kA545 + kC545) - kE545) - kE545) - kD545);
    tmp3_2 = kB545 - kG545;
    // Op 546: dim3x3 mul
    gl64_t s1_546_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_546_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_546_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA546 = (tmp3_0 + tmp3_1) * (s1_546_0 + s1_546_1);
    gl64_t kB546 = (tmp3_0 + tmp3_2) * (s1_546_0 + s1_546_2);
    gl64_t kC546 = (tmp3_1 + tmp3_2) * (s1_546_1 + s1_546_2);
    gl64_t kD546 = tmp3_0 * s1_546_0;
    gl64_t kE546 = tmp3_1 * s1_546_1;
    gl64_t kF546 = tmp3_2 * s1_546_2;
    gl64_t kG546 = kD546 - kE546;
    tmp3_0 = (kC546 + kG546) - kF546;
    tmp3_1 = ((((kA546 + kC546) - kE546) - kE546) - kD546);
    tmp3_2 = kB546 - kG546;
    // Op 547: dim1x1 mul
    gl64_t s0_547 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    gl64_t s1_547 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_547 * s1_547;
    // Op 548: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 549: dim3x3 mul
    gl64_t s1_549_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_549_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_549_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA549 = (tmp3_0 + tmp3_1) * (s1_549_0 + s1_549_1);
    gl64_t kB549 = (tmp3_0 + tmp3_2) * (s1_549_0 + s1_549_2);
    gl64_t kC549 = (tmp3_1 + tmp3_2) * (s1_549_1 + s1_549_2);
    gl64_t kD549 = tmp3_0 * s1_549_0;
    gl64_t kE549 = tmp3_1 * s1_549_1;
    gl64_t kF549 = tmp3_2 * s1_549_2;
    gl64_t kG549 = kD549 - kE549;
    tmp3_0 = (kC549 + kG549) - kF549;
    tmp3_1 = ((((kA549 + kC549) - kE549) - kE549) - kD549);
    tmp3_2 = kB549 - kG549;
    // Op 550: dim1x1 mul
    gl64_t s0_550 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_550 = *(gl64_t*)&expressions_params[9][8];
    tmp1_0 = s0_550 * s1_550;
    // Op 551: dim1x1 mul
    gl64_t s0_551 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_551 = *(gl64_t*)&expressions_params[9][9];
    tmp1_1 = s0_551 * s1_551;
    // Op 552: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_1;
    // Op 553: dim1x1 mul
    gl64_t s0_553 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_553 = *(gl64_t*)&expressions_params[9][10];
    tmp1_1 = s0_553 * s1_553;
    // Op 554: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_1;
    // Op 555: dim1x1 mul
    gl64_t s0_555 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_555 = *(gl64_t*)&expressions_params[9][11];
    tmp1_1 = s0_555 * s1_555;
    // Op 556: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_1;
    // Op 557: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 558: dim3x3 mul
    gl64_t s1_558_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_558_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_558_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA558 = (tmp3_0 + tmp3_1) * (s1_558_0 + s1_558_1);
    gl64_t kB558 = (tmp3_0 + tmp3_2) * (s1_558_0 + s1_558_2);
    gl64_t kC558 = (tmp3_1 + tmp3_2) * (s1_558_1 + s1_558_2);
    gl64_t kD558 = tmp3_0 * s1_558_0;
    gl64_t kE558 = tmp3_1 * s1_558_1;
    gl64_t kF558 = tmp3_2 * s1_558_2;
    gl64_t kG558 = kD558 - kE558;
    tmp3_0 = (kC558 + kG558) - kF558;
    tmp3_1 = ((((kA558 + kC558) - kE558) - kE558) - kD558);
    tmp3_2 = kB558 - kG558;
    // Op 559: dim3x1 add
    gl64_t s1_559 = *(gl64_t*)&expressions_params[9][12];
    tmp3_0 = tmp3_0 + s1_559; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 560: dim3x3 add
    gl64_t s1_560_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_560_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_560_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_560_0; tmp3_1 = tmp3_1 + s1_560_1; tmp3_2 = tmp3_2 + s1_560_2;
    // Op 561: dim3x3 mul
    gl64_t s0_561_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+0, domainSize, nCols_2))];
    gl64_t s0_561_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+1, domainSize, nCols_2))];
    gl64_t s0_561_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+2, domainSize, nCols_2))];
    gl64_t kA561 = (s0_561_0 + s0_561_1) * (tmp3_0 + tmp3_1);
    gl64_t kB561 = (s0_561_0 + s0_561_2) * (tmp3_0 + tmp3_2);
    gl64_t kC561 = (s0_561_1 + s0_561_2) * (tmp3_1 + tmp3_2);
    gl64_t kD561 = s0_561_0 * tmp3_0;
    gl64_t kE561 = s0_561_1 * tmp3_1;
    gl64_t kF561 = s0_561_2 * tmp3_2;
    gl64_t kG561 = kD561 - kE561;
    tmp3_0 = (kC561 + kG561) - kF561;
    tmp3_1 = ((((kA561 + kC561) - kE561) - kE561) - kD561);
    tmp3_2 = kB561 - kG561;
    // Op 562: dim3x1 sub
    gl64_t s1_562 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 - s1_562; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 563: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 564: dim3x3 mul
    gl64_t s1_564_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_564_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_564_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA564 = (tmp3_0 + tmp3_1) * (s1_564_0 + s1_564_1);
    gl64_t kB564 = (tmp3_0 + tmp3_2) * (s1_564_0 + s1_564_2);
    gl64_t kC564 = (tmp3_1 + tmp3_2) * (s1_564_1 + s1_564_2);
    gl64_t kD564 = tmp3_0 * s1_564_0;
    gl64_t kE564 = tmp3_1 * s1_564_1;
    gl64_t kF564 = tmp3_2 * s1_564_2;
    gl64_t kG564 = kD564 - kE564;
    tmp3_6 = (kC564 + kG564) - kF564;
    tmp3_7 = ((((kA564 + kC564) - kE564) - kE564) - kD564);
    tmp3_8 = kB564 - kG564;
    // Op 565: dim1x1 sub_swap
    gl64_t s0_565 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    gl64_t s1_565 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_565 - s0_565;
    // Op 566: dim3x1 mul
    uint64_t s0_566_pos = dExpsArgs->mapOffsetsExps[2] + (false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_2) : getBufferOffset(logicalRow_0, 0, domainSize, nCols_2));
    gl64_t s0_566_0 = *(gl64_t*)&dParams->aux_trace[s0_566_pos];
    gl64_t s0_566_1 = *(gl64_t*)&dParams->aux_trace[s0_566_pos + TILE_HEIGHT];
    gl64_t s0_566_2 = *(gl64_t*)&dParams->aux_trace[s0_566_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_566_0 * tmp1_0; tmp3_1 = s0_566_1 * tmp1_0; tmp3_2 = s0_566_2 * tmp1_0;
    // Op 567: dim3x3 sub
    uint64_t s0_567_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_2));
    gl64_t s0_567_0 = *(gl64_t*)&dParams->aux_trace[s0_567_pos];
    gl64_t s0_567_1 = *(gl64_t*)&dParams->aux_trace[s0_567_pos + TILE_HEIGHT];
    gl64_t s0_567_2 = *(gl64_t*)&dParams->aux_trace[s0_567_pos + 2*TILE_HEIGHT];
    tmp3_3 = s0_567_0 - tmp3_0; tmp3_4 = s0_567_1 - tmp3_1; tmp3_5 = s0_567_2 - tmp3_2;
    // Op 568: dim3x3 add
    gl64_t s0_568_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+0, domainSize, nCols_2))];
    gl64_t s0_568_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+1, domainSize, nCols_2))];
    gl64_t s0_568_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+2, domainSize, nCols_2))];
    gl64_t s1_568_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+0, domainSize, nCols_2))];
    gl64_t s1_568_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+1, domainSize, nCols_2))];
    gl64_t s1_568_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+2, domainSize, nCols_2))];
    tmp3_0 = s0_568_0 + s1_568_0; tmp3_1 = s0_568_1 + s1_568_1; tmp3_2 = s0_568_2 + s1_568_2;
    // Op 569: dim3x3 add
    uint64_t s0_569_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_2));
    gl64_t s0_569_0 = *(gl64_t*)&dParams->aux_trace[s0_569_pos];
    gl64_t s0_569_1 = *(gl64_t*)&dParams->aux_trace[s0_569_pos + TILE_HEIGHT];
    gl64_t s0_569_2 = *(gl64_t*)&dParams->aux_trace[s0_569_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_569_0 + tmp3_0; tmp3_1 = s0_569_1 + tmp3_1; tmp3_2 = s0_569_2 + tmp3_2;
    // Op 570: dim3x3 add
    uint64_t s0_570_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_2));
    gl64_t s0_570_0 = *(gl64_t*)&dParams->aux_trace[s0_570_pos];
    gl64_t s0_570_1 = *(gl64_t*)&dParams->aux_trace[s0_570_pos + TILE_HEIGHT];
    gl64_t s0_570_2 = *(gl64_t*)&dParams->aux_trace[s0_570_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_570_0 + tmp3_0; tmp3_1 = s0_570_1 + tmp3_1; tmp3_2 = s0_570_2 + tmp3_2;
    // Op 571: dim3x3 add
    gl64_t s0_571_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+0, domainSize, nCols_2))];
    gl64_t s0_571_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+1, domainSize, nCols_2))];
    gl64_t s0_571_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+2, domainSize, nCols_2))];
    tmp3_0 = s0_571_0 + tmp3_0; tmp3_1 = s0_571_1 + tmp3_1; tmp3_2 = s0_571_2 + tmp3_2;
    // Op 572: dim3x3 sub
    tmp3_3 = tmp3_3 - tmp3_0; tmp3_4 = tmp3_4 - tmp3_1; tmp3_5 = tmp3_5 - tmp3_2;
    // Op 573: dim1x1 mul
    gl64_t s0_573 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    gl64_t s1_573 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_573 * s1_573;
    // Op 574: dim3x1 mul
    gl64_t s0_574_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_574_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_574_2 = *(gl64_t*)&expressions_params[13][0+2];
    tmp3_0 = s0_574_0 * tmp1_0; tmp3_1 = s0_574_1 * tmp1_0; tmp3_2 = s0_574_2 * tmp1_0;
    // Op 575: dim3x1 add
    gl64_t s1_575 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_575; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 577: dim1x1 mul
    gl64_t s0_577 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_577 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_577 * s1_577;
    // Op 578: dim1x1 add
    gl64_t s1_578 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_578;
    // Op 579: dim1x1 add
    gl64_t s1_579 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_579;
    // Op 580: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    gl64_t s1_582 = *(gl64_t*)&expressions_params[9][15];
    tmp3_0 = tmp3_0 + s1_582; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 583: dim3x3 mul
    gl64_t s1_583_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_583_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_583_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA583 = (tmp3_0 + tmp3_1) * (s1_583_0 + s1_583_1);
    gl64_t kB583 = (tmp3_0 + tmp3_2) * (s1_583_0 + s1_583_2);
    gl64_t kC583 = (tmp3_1 + tmp3_2) * (s1_583_1 + s1_583_2);
    gl64_t kD583 = tmp3_0 * s1_583_0;
    gl64_t kE583 = tmp3_1 * s1_583_1;
    gl64_t kF583 = tmp3_2 * s1_583_2;
    gl64_t kG583 = kD583 - kE583;
    tmp3_0 = (kC583 + kG583) - kF583;
    tmp3_1 = ((((kA583 + kC583) - kE583) - kE583) - kD583);
    tmp3_2 = kB583 - kG583;
    // Op 584: dim3x1 add
    gl64_t s1_584 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_584; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 585: dim3x3 mul
    gl64_t s1_585_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_585_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_585_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA585 = (tmp3_0 + tmp3_1) * (s1_585_0 + s1_585_1);
    gl64_t kB585 = (tmp3_0 + tmp3_2) * (s1_585_0 + s1_585_2);
    gl64_t kC585 = (tmp3_1 + tmp3_2) * (s1_585_1 + s1_585_2);
    gl64_t kD585 = tmp3_0 * s1_585_0;
    gl64_t kE585 = tmp3_1 * s1_585_1;
    gl64_t kF585 = tmp3_2 * s1_585_2;
    gl64_t kG585 = kD585 - kE585;
    tmp3_0 = (kC585 + kG585) - kF585;
    tmp3_1 = ((((kA585 + kC585) - kE585) - kE585) - kD585);
    tmp3_2 = kB585 - kG585;
    // Op 586: dim3x1 add
    gl64_t s1_586 = *(gl64_t*)&expressions_params[9][5];
    tmp3_0 = tmp3_0 + s1_586; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 587: dim3x3 add
    gl64_t s1_587_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_587_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_587_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_587_0; tmp3_1 = tmp3_1 + s1_587_1; tmp3_2 = tmp3_2 + s1_587_2;
    // Op 588: dim3x3 mul
    gl64_t kA588 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB588 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC588 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD588 = tmp3_3 * tmp3_0;
    gl64_t kE588 = tmp3_4 * tmp3_1;
    gl64_t kF588 = tmp3_5 * tmp3_2;
    gl64_t kG588 = kD588 - kE588;
    tmp3_0 = (kC588 + kG588) - kF588;
    tmp3_1 = ((((kA588 + kC588) - kE588) - kE588) - kD588);
    tmp3_2 = kB588 - kG588;
    // Op 589: dim1x1 sub_swap
    gl64_t s0_589 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_589 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_589 - s0_589;
    // Op 590: dim3x1 sub
    tmp3_0 = tmp3_0 - tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 591: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 592: dim3x3 mul
    gl64_t s1_592_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_592_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_592_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA592 = (tmp3_0 + tmp3_1) * (s1_592_0 + s1_592_1);
    gl64_t kB592 = (tmp3_0 + tmp3_2) * (s1_592_0 + s1_592_2);
    gl64_t kC592 = (tmp3_1 + tmp3_2) * (s1_592_1 + s1_592_2);
    gl64_t kD592 = tmp3_0 * s1_592_0;
    gl64_t kE592 = tmp3_1 * s1_592_1;
    gl64_t kF592 = tmp3_2 * s1_592_2;
    gl64_t kG592 = kD592 - kE592;
    tmp3_6 = (kC592 + kG592) - kF592;
    tmp3_7 = ((((kA592 + kC592) - kE592) - kE592) - kD592);
    tmp3_8 = kB592 - kG592;
    // Op 593: dim3x1 mul
    gl64_t s0_593_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_593_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_593_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_593 = *(gl64_t*)&expressions_params[10][5];
    tmp3_0 = s0_593_0 * s1_593; tmp3_1 = s0_593_1 * s1_593; tmp3_2 = s0_593_2 * s1_593;
    // Op 594: dim3x1 add
    gl64_t s1_594 = *(gl64_t*)&expressions_params[10][14];
    tmp3_0 = tmp3_0 + s1_594; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 595: dim3x3 mul
    gl64_t s1_595_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_595_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_595_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA595 = (tmp3_0 + tmp3_1) * (s1_595_0 + s1_595_1);
    gl64_t kB595 = (tmp3_0 + tmp3_2) * (s1_595_0 + s1_595_2);
    gl64_t kC595 = (tmp3_1 + tmp3_2) * (s1_595_1 + s1_595_2);
    gl64_t kD595 = tmp3_0 * s1_595_0;
    gl64_t kE595 = tmp3_1 * s1_595_1;
    gl64_t kF595 = tmp3_2 * s1_595_2;
    gl64_t kG595 = kD595 - kE595;
    tmp3_0 = (kC595 + kG595) - kF595;
    tmp3_1 = ((((kA595 + kC595) - kE595) - kE595) - kD595);
    tmp3_2 = kB595 - kG595;
    // Op 596: dim3x1 add
    gl64_t s1_596 = *(gl64_t*)&expressions_params[10][3];
    tmp3_0 = tmp3_0 + s1_596; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    gl64_t s1_598 = *(gl64_t*)&expressions_params[10][4];
    tmp3_0 = tmp3_0 + s1_598; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 599: dim3x3 mul
    gl64_t s1_599_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_599_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_599_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA599 = (tmp3_0 + tmp3_1) * (s1_599_0 + s1_599_1);
    gl64_t kB599 = (tmp3_0 + tmp3_2) * (s1_599_0 + s1_599_2);
    gl64_t kC599 = (tmp3_1 + tmp3_2) * (s1_599_1 + s1_599_2);
    gl64_t kD599 = tmp3_0 * s1_599_0;
    gl64_t kE599 = tmp3_1 * s1_599_1;
    gl64_t kF599 = tmp3_2 * s1_599_2;
    gl64_t kG599 = kD599 - kE599;
    tmp3_0 = (kC599 + kG599) - kF599;
    tmp3_1 = ((((kA599 + kC599) - kE599) - kE599) - kD599);
    tmp3_2 = kB599 - kG599;
    // Op 600: dim3x1 add
    gl64_t s1_600 = *(gl64_t*)&expressions_params[10][2];
    tmp3_0 = tmp3_0 + s1_600; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    gl64_t s1_602 = *(gl64_t*)&expressions_params[10][12];
    tmp3_0 = tmp3_0 + s1_602; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 603: dim3x3 mul
    gl64_t s1_603_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_603_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_603_2 = *(gl64_t*)&expressions_params[13][0+2];
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
    // Op 604: dim3x1 add
    gl64_t s1_604 = *(gl64_t*)&expressions_params[10][1];
    tmp3_0 = tmp3_0 + s1_604; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 605: dim3x3 mul
    gl64_t s1_605_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_605_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_605_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA605 = (tmp3_0 + tmp3_1) * (s1_605_0 + s1_605_1);
    gl64_t kB605 = (tmp3_0 + tmp3_2) * (s1_605_0 + s1_605_2);
    gl64_t kC605 = (tmp3_1 + tmp3_2) * (s1_605_1 + s1_605_2);
    gl64_t kD605 = tmp3_0 * s1_605_0;
    gl64_t kE605 = tmp3_1 * s1_605_1;
    gl64_t kF605 = tmp3_2 * s1_605_2;
    gl64_t kG605 = kD605 - kE605;
    tmp3_0 = (kC605 + kG605) - kF605;
    tmp3_1 = ((((kA605 + kC605) - kE605) - kE605) - kD605);
    tmp3_2 = kB605 - kG605;
    // Op 606: dim3x1 add
    gl64_t s1_606 = *(gl64_t*)&expressions_params[9][3];
    tmp3_0 = tmp3_0 + s1_606; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 607: dim3x3 mul
    gl64_t s1_607_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_607_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_607_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA607 = (tmp3_0 + tmp3_1) * (s1_607_0 + s1_607_1);
    gl64_t kB607 = (tmp3_0 + tmp3_2) * (s1_607_0 + s1_607_2);
    gl64_t kC607 = (tmp3_1 + tmp3_2) * (s1_607_1 + s1_607_2);
    gl64_t kD607 = tmp3_0 * s1_607_0;
    gl64_t kE607 = tmp3_1 * s1_607_1;
    gl64_t kF607 = tmp3_2 * s1_607_2;
    gl64_t kG607 = kD607 - kE607;
    tmp3_0 = (kC607 + kG607) - kF607;
    tmp3_1 = ((((kA607 + kC607) - kE607) - kE607) - kD607);
    tmp3_2 = kB607 - kG607;
    // Op 608: dim3x3 mul
    gl64_t s1_608_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_608_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_608_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA608 = (tmp3_0 + tmp3_1) * (s1_608_0 + s1_608_1);
    gl64_t kB608 = (tmp3_0 + tmp3_2) * (s1_608_0 + s1_608_2);
    gl64_t kC608 = (tmp3_1 + tmp3_2) * (s1_608_1 + s1_608_2);
    gl64_t kD608 = tmp3_0 * s1_608_0;
    gl64_t kE608 = tmp3_1 * s1_608_1;
    gl64_t kF608 = tmp3_2 * s1_608_2;
    gl64_t kG608 = kD608 - kE608;
    tmp3_0 = (kC608 + kG608) - kF608;
    tmp3_1 = ((((kA608 + kC608) - kE608) - kE608) - kD608);
    tmp3_2 = kB608 - kG608;
    // Op 609: dim3x1 add
    gl64_t s1_609 = *(gl64_t*)&expressions_params[10][0];
    tmp3_0 = tmp3_0 + s1_609; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 610: dim3x3 mul
    gl64_t s1_610_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_610_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_610_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA610 = (tmp3_0 + tmp3_1) * (s1_610_0 + s1_610_1);
    gl64_t kB610 = (tmp3_0 + tmp3_2) * (s1_610_0 + s1_610_2);
    gl64_t kC610 = (tmp3_1 + tmp3_2) * (s1_610_1 + s1_610_2);
    gl64_t kD610 = tmp3_0 * s1_610_0;
    gl64_t kE610 = tmp3_1 * s1_610_1;
    gl64_t kF610 = tmp3_2 * s1_610_2;
    gl64_t kG610 = kD610 - kE610;
    tmp3_0 = (kC610 + kG610) - kF610;
    tmp3_1 = ((((kA610 + kC610) - kE610) - kE610) - kD610);
    tmp3_2 = kB610 - kG610;
    // Op 611: dim3x1 add
    gl64_t s1_611 = *(gl64_t*)&expressions_params[9][13];
    tmp3_0 = tmp3_0 + s1_611; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 612: dim3x3 add
    gl64_t s1_612_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_612_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_612_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_612_0; tmp3_1 = tmp3_1 + s1_612_1; tmp3_2 = tmp3_2 + s1_612_2;
    // Op 613: dim3x3 mul
    gl64_t s1_613_0 = *(gl64_t*)&expressions_params[10][19];
    gl64_t s1_613_1 = *(gl64_t*)&expressions_params[10][19+1];
    gl64_t s1_613_2 = *(gl64_t*)&expressions_params[10][19+2];
    gl64_t kA613 = (tmp3_0 + tmp3_1) * (s1_613_0 + s1_613_1);
    gl64_t kB613 = (tmp3_0 + tmp3_2) * (s1_613_0 + s1_613_2);
    gl64_t kC613 = (tmp3_1 + tmp3_2) * (s1_613_1 + s1_613_2);
    gl64_t kD613 = tmp3_0 * s1_613_0;
    gl64_t kE613 = tmp3_1 * s1_613_1;
    gl64_t kF613 = tmp3_2 * s1_613_2;
    gl64_t kG613 = kD613 - kE613;
    tmp3_0 = (kC613 + kG613) - kF613;
    tmp3_1 = ((((kA613 + kC613) - kE613) - kE613) - kD613);
    tmp3_2 = kB613 - kG613;
    // Op 614: dim3x1 add
    gl64_t s1_614 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_614; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 615: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 616: dim3x3 mul
    gl64_t s1_616_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_616_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_616_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA616 = (tmp3_0 + tmp3_1) * (s1_616_0 + s1_616_1);
    gl64_t kB616 = (tmp3_0 + tmp3_2) * (s1_616_0 + s1_616_2);
    gl64_t kC616 = (tmp3_1 + tmp3_2) * (s1_616_1 + s1_616_2);
    gl64_t kD616 = tmp3_0 * s1_616_0;
    gl64_t kE616 = tmp3_1 * s1_616_1;
    gl64_t kF616 = tmp3_2 * s1_616_2;
    gl64_t kG616 = kD616 - kE616;
    tmp3_6 = (kC616 + kG616) - kF616;
    tmp3_7 = ((((kA616 + kC616) - kE616) - kE616) - kD616);
    tmp3_8 = kB616 - kG616;
    // Op 617: dim3x1 mul
    gl64_t s0_617_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_617_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_617_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_617 = *(gl64_t*)&expressions_params[10][10];
    tmp3_0 = s0_617_0 * s1_617; tmp3_1 = s0_617_1 * s1_617; tmp3_2 = s0_617_2 * s1_617;
    // Op 618: dim3x1 add
    gl64_t s1_618 = *(gl64_t*)&expressions_params[10][15];
    tmp3_0 = tmp3_0 + s1_618; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    gl64_t s1_620 = *(gl64_t*)&expressions_params[10][8];
    tmp3_0 = tmp3_0 + s1_620; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 621: dim3x3 mul
    gl64_t s1_621_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_621_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_621_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA621 = (tmp3_0 + tmp3_1) * (s1_621_0 + s1_621_1);
    gl64_t kB621 = (tmp3_0 + tmp3_2) * (s1_621_0 + s1_621_2);
    gl64_t kC621 = (tmp3_1 + tmp3_2) * (s1_621_1 + s1_621_2);
    gl64_t kD621 = tmp3_0 * s1_621_0;
    gl64_t kE621 = tmp3_1 * s1_621_1;
    gl64_t kF621 = tmp3_2 * s1_621_2;
    gl64_t kG621 = kD621 - kE621;
    tmp3_0 = (kC621 + kG621) - kF621;
    tmp3_1 = ((((kA621 + kC621) - kE621) - kE621) - kD621);
    tmp3_2 = kB621 - kG621;
    // Op 622: dim3x1 add
    gl64_t s1_622 = *(gl64_t*)&expressions_params[10][9];
    tmp3_0 = tmp3_0 + s1_622; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 623: dim3x3 mul
    gl64_t s1_623_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_623_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_623_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA623 = (tmp3_0 + tmp3_1) * (s1_623_0 + s1_623_1);
    gl64_t kB623 = (tmp3_0 + tmp3_2) * (s1_623_0 + s1_623_2);
    gl64_t kC623 = (tmp3_1 + tmp3_2) * (s1_623_1 + s1_623_2);
    gl64_t kD623 = tmp3_0 * s1_623_0;
    gl64_t kE623 = tmp3_1 * s1_623_1;
    gl64_t kF623 = tmp3_2 * s1_623_2;
    gl64_t kG623 = kD623 - kE623;
    tmp3_0 = (kC623 + kG623) - kF623;
    tmp3_1 = ((((kA623 + kC623) - kE623) - kE623) - kD623);
    tmp3_2 = kB623 - kG623;
    // Op 624: dim3x1 add
    gl64_t s1_624 = *(gl64_t*)&expressions_params[10][7];
    tmp3_0 = tmp3_0 + s1_624; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 625: dim3x3 mul
    gl64_t s1_625_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_625_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_625_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA625 = (tmp3_0 + tmp3_1) * (s1_625_0 + s1_625_1);
    gl64_t kB625 = (tmp3_0 + tmp3_2) * (s1_625_0 + s1_625_2);
    gl64_t kC625 = (tmp3_1 + tmp3_2) * (s1_625_1 + s1_625_2);
    gl64_t kD625 = tmp3_0 * s1_625_0;
    gl64_t kE625 = tmp3_1 * s1_625_1;
    gl64_t kF625 = tmp3_2 * s1_625_2;
    gl64_t kG625 = kD625 - kE625;
    tmp3_0 = (kC625 + kG625) - kF625;
    tmp3_1 = ((((kA625 + kC625) - kE625) - kE625) - kD625);
    tmp3_2 = kB625 - kG625;
    // Op 626: dim3x1 add
    gl64_t s1_626 = *(gl64_t*)&expressions_params[10][13];
    tmp3_0 = tmp3_0 + s1_626; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 627: dim3x3 mul
    gl64_t s1_627_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_627_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_627_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA627 = (tmp3_0 + tmp3_1) * (s1_627_0 + s1_627_1);
    gl64_t kB627 = (tmp3_0 + tmp3_2) * (s1_627_0 + s1_627_2);
    gl64_t kC627 = (tmp3_1 + tmp3_2) * (s1_627_1 + s1_627_2);
    gl64_t kD627 = tmp3_0 * s1_627_0;
    gl64_t kE627 = tmp3_1 * s1_627_1;
    gl64_t kF627 = tmp3_2 * s1_627_2;
    gl64_t kG627 = kD627 - kE627;
    tmp3_0 = (kC627 + kG627) - kF627;
    tmp3_1 = ((((kA627 + kC627) - kE627) - kE627) - kD627);
    tmp3_2 = kB627 - kG627;
    // Op 628: dim3x1 add
    gl64_t s1_628 = *(gl64_t*)&expressions_params[10][6];
    tmp3_0 = tmp3_0 + s1_628; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 629: dim3x3 mul
    gl64_t s1_629_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_629_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_629_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA629 = (tmp3_0 + tmp3_1) * (s1_629_0 + s1_629_1);
    gl64_t kB629 = (tmp3_0 + tmp3_2) * (s1_629_0 + s1_629_2);
    gl64_t kC629 = (tmp3_1 + tmp3_2) * (s1_629_1 + s1_629_2);
    gl64_t kD629 = tmp3_0 * s1_629_0;
    gl64_t kE629 = tmp3_1 * s1_629_1;
    gl64_t kF629 = tmp3_2 * s1_629_2;
    gl64_t kG629 = kD629 - kE629;
    tmp3_0 = (kC629 + kG629) - kF629;
    tmp3_1 = ((((kA629 + kC629) - kE629) - kE629) - kD629);
    tmp3_2 = kB629 - kG629;
    // Op 630: dim3x1 add
    gl64_t s1_630 = *(gl64_t*)&expressions_params[9][3];
    tmp3_0 = tmp3_0 + s1_630; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 631: dim3x3 mul
    gl64_t s1_631_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_631_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_631_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA631 = (tmp3_0 + tmp3_1) * (s1_631_0 + s1_631_1);
    gl64_t kB631 = (tmp3_0 + tmp3_2) * (s1_631_0 + s1_631_2);
    gl64_t kC631 = (tmp3_1 + tmp3_2) * (s1_631_1 + s1_631_2);
    gl64_t kD631 = tmp3_0 * s1_631_0;
    gl64_t kE631 = tmp3_1 * s1_631_1;
    gl64_t kF631 = tmp3_2 * s1_631_2;
    gl64_t kG631 = kD631 - kE631;
    tmp3_0 = (kC631 + kG631) - kF631;
    tmp3_1 = ((((kA631 + kC631) - kE631) - kE631) - kD631);
    tmp3_2 = kB631 - kG631;
    // Op 632: dim3x1 add
    gl64_t s1_632 = *(gl64_t*)&expressions_params[10][11];
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
    // Op 634: dim1x1 add
    gl64_t s0_634 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_634 = *(gl64_t*)&expressions_params[10][0];
    tmp1_0 = s0_634 + s1_634;
    // Op 635: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 636: dim3x3 mul
    gl64_t s1_636_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_636_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_636_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA636 = (tmp3_0 + tmp3_1) * (s1_636_0 + s1_636_1);
    gl64_t kB636 = (tmp3_0 + tmp3_2) * (s1_636_0 + s1_636_2);
    gl64_t kC636 = (tmp3_1 + tmp3_2) * (s1_636_1 + s1_636_2);
    gl64_t kD636 = tmp3_0 * s1_636_0;
    gl64_t kE636 = tmp3_1 * s1_636_1;
    gl64_t kF636 = tmp3_2 * s1_636_2;
    gl64_t kG636 = kD636 - kE636;
    tmp3_0 = (kC636 + kG636) - kF636;
    tmp3_1 = ((((kA636 + kC636) - kE636) - kE636) - kD636);
    tmp3_2 = kB636 - kG636;
    // Op 637: dim3x1 add
    gl64_t s1_637 = *(gl64_t*)&expressions_params[9][13];
    tmp3_0 = tmp3_0 + s1_637; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 638: dim3x3 add
    gl64_t s1_638_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_638_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_638_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_638_0; tmp3_1 = tmp3_1 + s1_638_1; tmp3_2 = tmp3_2 + s1_638_2;
    // Op 639: dim3x3 mul
    gl64_t s1_639_0 = *(gl64_t*)&expressions_params[10][22];
    gl64_t s1_639_1 = *(gl64_t*)&expressions_params[10][22+1];
    gl64_t s1_639_2 = *(gl64_t*)&expressions_params[10][22+2];
    gl64_t kA639 = (tmp3_0 + tmp3_1) * (s1_639_0 + s1_639_1);
    gl64_t kB639 = (tmp3_0 + tmp3_2) * (s1_639_0 + s1_639_2);
    gl64_t kC639 = (tmp3_1 + tmp3_2) * (s1_639_1 + s1_639_2);
    gl64_t kD639 = tmp3_0 * s1_639_0;
    gl64_t kE639 = tmp3_1 * s1_639_1;
    gl64_t kF639 = tmp3_2 * s1_639_2;
    gl64_t kG639 = kD639 - kE639;
    tmp3_0 = (kC639 + kG639) - kF639;
    tmp3_1 = ((((kA639 + kC639) - kE639) - kE639) - kD639);
    tmp3_2 = kB639 - kG639;
    // Op 640: dim1x1 sub
    gl64_t s0_640 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_640 = *(gl64_t*)&expressions_params[10][11];
    tmp1_0 = s0_640 - s1_640;
    // Op 641: dim3x1 sub
    tmp3_0 = tmp3_0 - tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 642: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 643: dim3x3 mul
    gl64_t s1_643_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_643_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_643_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA643 = (tmp3_0 + tmp3_1) * (s1_643_0 + s1_643_1);
    gl64_t kB643 = (tmp3_0 + tmp3_2) * (s1_643_0 + s1_643_2);
    gl64_t kC643 = (tmp3_1 + tmp3_2) * (s1_643_1 + s1_643_2);
    gl64_t kD643 = tmp3_0 * s1_643_0;
    gl64_t kE643 = tmp3_1 * s1_643_1;
    gl64_t kF643 = tmp3_2 * s1_643_2;
    gl64_t kG643 = kD643 - kE643;
    tmp3_6 = (kC643 + kG643) - kF643;
    tmp3_7 = ((((kA643 + kC643) - kE643) - kE643) - kD643);
    tmp3_8 = kB643 - kG643;
    // Op 644: dim3x1 add
    gl64_t s0_644_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s0_644_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s0_644_2 = *(gl64_t*)&expressions_params[13][3+2];
    gl64_t s1_644 = *(gl64_t*)&expressions_params[9][12];
    tmp3_0 = s0_644_0 + s1_644; tmp3_1 = s0_644_1; tmp3_2 = s0_644_2;
    // Op 645: dim3x3 mul
    gl64_t s1_645_0 = *(gl64_t*)&expressions_params[10][25];
    gl64_t s1_645_1 = *(gl64_t*)&expressions_params[10][25+1];
    gl64_t s1_645_2 = *(gl64_t*)&expressions_params[10][25+2];
    gl64_t kA645 = (tmp3_0 + tmp3_1) * (s1_645_0 + s1_645_1);
    gl64_t kB645 = (tmp3_0 + tmp3_2) * (s1_645_0 + s1_645_2);
    gl64_t kC645 = (tmp3_1 + tmp3_2) * (s1_645_1 + s1_645_2);
    gl64_t kD645 = tmp3_0 * s1_645_0;
    gl64_t kE645 = tmp3_1 * s1_645_1;
    gl64_t kF645 = tmp3_2 * s1_645_2;
    gl64_t kG645 = kD645 - kE645;
    tmp3_0 = (kC645 + kG645) - kF645;
    tmp3_1 = ((((kA645 + kC645) - kE645) - kE645) - kD645);
    tmp3_2 = kB645 - kG645;
    // Op 646: dim1x1 sub
    gl64_t s0_646 = *(gl64_t*)&expressions_params[9][1];
    gl64_t s1_646 = *(gl64_t*)&expressions_params[10][18];
    tmp1_0 = s0_646 - s1_646;
    // Op 647: dim3x1 sub
    tmp3_0 = tmp3_0 - tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 648: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
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
    tmp3_6 = (kC649 + kG649) - kF649;
    tmp3_7 = ((((kA649 + kC649) - kE649) - kE649) - kD649);
    tmp3_8 = kB649 - kG649;
    // Op 650: dim3x1 mul
    gl64_t s0_650_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_650_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_650_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_650 = *(gl64_t*)&expressions_params[10][16];
    tmp3_0 = s0_650_0 * s1_650; tmp3_1 = s0_650_1 * s1_650; tmp3_2 = s0_650_2 * s1_650;
    // Op 651: dim3x1 add
    gl64_t s1_651 = *(gl64_t*)&expressions_params[9][14];
    tmp3_0 = tmp3_0 + s1_651; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 652: dim3x3 add
    gl64_t s1_652_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_652_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_652_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_652_0; tmp3_1 = tmp3_1 + s1_652_1; tmp3_2 = tmp3_2 + s1_652_2;
    // Op 653: dim3x3 mul
    gl64_t s1_653_0 = *(gl64_t*)&expressions_params[10][28];
    gl64_t s1_653_1 = *(gl64_t*)&expressions_params[10][28+1];
    gl64_t s1_653_2 = *(gl64_t*)&expressions_params[10][28+2];
    gl64_t kA653 = (tmp3_0 + tmp3_1) * (s1_653_0 + s1_653_1);
    gl64_t kB653 = (tmp3_0 + tmp3_2) * (s1_653_0 + s1_653_2);
    gl64_t kC653 = (tmp3_1 + tmp3_2) * (s1_653_1 + s1_653_2);
    gl64_t kD653 = tmp3_0 * s1_653_0;
    gl64_t kE653 = tmp3_1 * s1_653_1;
    gl64_t kF653 = tmp3_2 * s1_653_2;
    gl64_t kG653 = kD653 - kE653;
    tmp3_0 = (kC653 + kG653) - kF653;
    tmp3_1 = ((((kA653 + kC653) - kE653) - kE653) - kD653);
    tmp3_2 = kB653 - kG653;
    // Op 654: dim3x1 add
    gl64_t s1_654 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_654; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 655: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 656: dim3x3 mul
    gl64_t s1_656_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_656_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_656_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA656 = (tmp3_0 + tmp3_1) * (s1_656_0 + s1_656_1);
    gl64_t kB656 = (tmp3_0 + tmp3_2) * (s1_656_0 + s1_656_2);
    gl64_t kC656 = (tmp3_1 + tmp3_2) * (s1_656_1 + s1_656_2);
    gl64_t kD656 = tmp3_0 * s1_656_0;
    gl64_t kE656 = tmp3_1 * s1_656_1;
    gl64_t kF656 = tmp3_2 * s1_656_2;
    gl64_t kG656 = kD656 - kE656;
    tmp3_6 = (kC656 + kG656) - kF656;
    tmp3_7 = ((((kA656 + kC656) - kE656) - kE656) - kD656);
    tmp3_8 = kB656 - kG656;
    // Op 657: dim3x1 mul
    gl64_t s0_657_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_657_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_657_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_657 = *(gl64_t*)&expressions_params[10][17];
    tmp3_0 = s0_657_0 * s1_657; tmp3_1 = s0_657_1 * s1_657; tmp3_2 = s0_657_2 * s1_657;
    // Op 658: dim3x1 add
    gl64_t s1_658 = *(gl64_t*)&expressions_params[9][14];
    tmp3_0 = tmp3_0 + s1_658; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 659: dim3x3 add
    gl64_t s1_659_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_659_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_659_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_659_0; tmp3_1 = tmp3_1 + s1_659_1; tmp3_2 = tmp3_2 + s1_659_2;
    // Op 660: dim3x3 mul
    gl64_t s1_660_0 = *(gl64_t*)&expressions_params[10][31];
    gl64_t s1_660_1 = *(gl64_t*)&expressions_params[10][31+1];
    gl64_t s1_660_2 = *(gl64_t*)&expressions_params[10][31+2];
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
    gl64_t s1_661 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_661; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 662: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 663: dim3x3 mul
    gl64_t s1_663_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_663_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_663_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA663 = (tmp3_0 + tmp3_1) * (s1_663_0 + s1_663_1);
    gl64_t kB663 = (tmp3_0 + tmp3_2) * (s1_663_0 + s1_663_2);
    gl64_t kC663 = (tmp3_1 + tmp3_2) * (s1_663_1 + s1_663_2);
    gl64_t kD663 = tmp3_0 * s1_663_0;
    gl64_t kE663 = tmp3_1 * s1_663_1;
    gl64_t kF663 = tmp3_2 * s1_663_2;
    gl64_t kG663 = kD663 - kE663;
    tmp3_3 = (kC663 + kG663) - kF663;
    tmp3_4 = ((((kA663 + kC663) - kE663) - kE663) - kD663);
    tmp3_5 = kB663 - kG663;
    // Op 664: dim3x3 sub_swap
    uint64_t s0_664_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_2));
    gl64_t s0_664_0 = *(gl64_t*)&dParams->aux_trace[s0_664_pos];
    gl64_t s0_664_1 = *(gl64_t*)&dParams->aux_trace[s0_664_pos + TILE_HEIGHT];
    gl64_t s0_664_2 = *(gl64_t*)&dParams->aux_trace[s0_664_pos + 2*TILE_HEIGHT];
    gl64_t s1_664_0 = *(gl64_t*)&expressions_params[12][0];
    gl64_t s1_664_1 = *(gl64_t*)&expressions_params[12][0+1];
    gl64_t s1_664_2 = *(gl64_t*)&expressions_params[12][0+2];
    tmp3_6 = s1_664_0 - s0_664_0; tmp3_7 = s1_664_1 - s0_664_1; tmp3_8 = s1_664_2 - s0_664_2;
    // Op 665: dim3x3 add
    gl64_t s0_665_0 = *(gl64_t*)&expressions_params[10][19];
    gl64_t s0_665_1 = *(gl64_t*)&expressions_params[10][19+1];
    gl64_t s0_665_2 = *(gl64_t*)&expressions_params[10][19+2];
    gl64_t s1_665_0 = *(gl64_t*)&expressions_params[10][22];
    gl64_t s1_665_1 = *(gl64_t*)&expressions_params[10][22+1];
    gl64_t s1_665_2 = *(gl64_t*)&expressions_params[10][22+2];
    tmp3_0 = s0_665_0 + s1_665_0; tmp3_1 = s0_665_1 + s1_665_1; tmp3_2 = s0_665_2 + s1_665_2;
    // Op 666: dim3x3 add
    gl64_t s1_666_0 = *(gl64_t*)&expressions_params[10][25];
    gl64_t s1_666_1 = *(gl64_t*)&expressions_params[10][25+1];
    gl64_t s1_666_2 = *(gl64_t*)&expressions_params[10][25+2];
    tmp3_0 = tmp3_0 + s1_666_0; tmp3_1 = tmp3_1 + s1_666_1; tmp3_2 = tmp3_2 + s1_666_2;
    // Op 667: dim3x3 add
    gl64_t s1_667_0 = *(gl64_t*)&expressions_params[10][28];
    gl64_t s1_667_1 = *(gl64_t*)&expressions_params[10][28+1];
    gl64_t s1_667_2 = *(gl64_t*)&expressions_params[10][28+2];
    tmp3_0 = tmp3_0 + s1_667_0; tmp3_1 = tmp3_1 + s1_667_1; tmp3_2 = tmp3_2 + s1_667_2;
    // Op 668: dim3x3 add
    gl64_t s1_668_0 = *(gl64_t*)&expressions_params[10][31];
    gl64_t s1_668_1 = *(gl64_t*)&expressions_params[10][31+1];
    gl64_t s1_668_2 = *(gl64_t*)&expressions_params[10][31+2];
    tmp3_0 = tmp3_0 + s1_668_0; tmp3_1 = tmp3_1 + s1_668_1; tmp3_2 = tmp3_2 + s1_668_2;
    // Op 669: dim3x3 sub
    tmp3_0 = tmp3_6 - tmp3_0; tmp3_1 = tmp3_7 - tmp3_1; tmp3_2 = tmp3_8 - tmp3_2;
    // Op 670: dim3x1 mul
    gl64_t s1_670 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp3_0 = tmp3_0 * s1_670; tmp3_1 = tmp3_1 * s1_670; tmp3_2 = tmp3_2 * s1_670;
    // Op 671: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 672: dim3x1 mul
    gl64_t s1_672 = *(gl64_t*)&dParams->aux_trace[dArgs->zi_offset + (1 - 1) * domainSize + row + threadIdx.x];
    tmp3_0 = tmp3_0 * s1_672; tmp3_1 = tmp3_1 * s1_672; tmp3_2 = tmp3_2 * s1_672;

    // Write final result to shared memory and store to output
    *(gl64_t*)&expressions_params[bufferCommitsSize + 1][0 * blockDim.x + threadIdx.x] = tmp3_0;
    *(gl64_t*)&expressions_params[bufferCommitsSize + 1][1 * blockDim.x + threadIdx.x] = tmp3_1;
    *(gl64_t*)&expressions_params[bufferCommitsSize + 1][2 * blockDim.x + threadIdx.x] = tmp3_2;
    storePolynomial__((ExpsArguments*)dExpsArgs, (Goldilocks::Element*)&expressions_params[bufferCommitsSize + 1][0 * blockDim.x], row);
}
