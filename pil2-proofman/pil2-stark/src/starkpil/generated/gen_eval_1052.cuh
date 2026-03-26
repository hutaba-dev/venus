// Auto-generated expression evaluator - matches load__() semantics exactly
// Q expressions: domainExtended=true always, type 1 goes through aux_trace

// Fingerprint: 9a44e4f6  nOps=771 nTemp1=4 nTemp3=5
#define GENERATED_EVAL_NOPS_9a44e4f6 771
#define GENERATED_EVAL_NTEMP1_9a44e4f6 4
#define GENERATED_EVAL_NTEMP3_9a44e4f6 5

template<bool IsCyclic>
__device__ __forceinline__ void eval_expr_9a44e4f6(
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

    // Register-resident temporaries: 4 tmp1 + 15 tmp3 slots
    gl64_t tmp1_0 = gl64_t(uint64_t(0));
    gl64_t tmp1_1 = gl64_t(uint64_t(0));
    gl64_t tmp1_2 = gl64_t(uint64_t(0));
    gl64_t tmp1_3 = gl64_t(uint64_t(0));
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
    gl64_t s0_29 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_29 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_29 - s0_29;
    // Op 30: dim1x1 mul
    gl64_t s0_30 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
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
    gl64_t s0_33 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_33 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_33 - s0_33;
    // Op 34: dim1x1 mul
    gl64_t s0_34 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    tmp1_0 = s0_34 * tmp1_0;
    // Op 35: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 36: dim3x3 mul
    gl64_t s1_36_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_36_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_36_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA36 = (tmp3_0 + tmp3_1) * (s1_36_0 + s1_36_1);
    gl64_t kB36 = (tmp3_0 + tmp3_2) * (s1_36_0 + s1_36_2);
    gl64_t kC36 = (tmp3_1 + tmp3_2) * (s1_36_1 + s1_36_2);
    gl64_t kD36 = tmp3_0 * s1_36_0;
    gl64_t kE36 = tmp3_1 * s1_36_1;
    gl64_t kF36 = tmp3_2 * s1_36_2;
    gl64_t kG36 = kD36 - kE36;
    tmp3_0 = (kC36 + kG36) - kF36;
    tmp3_1 = ((((kA36 + kC36) - kE36) - kE36) - kD36);
    tmp3_2 = kB36 - kG36;
    // Op 37: dim1x1 sub_swap
    gl64_t s0_37 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_37 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_37 - s0_37;
    // Op 38: dim1x1 mul
    gl64_t s0_38 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    tmp1_0 = s0_38 * tmp1_0;
    // Op 39: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 40: dim3x3 mul
    gl64_t s1_40_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_40_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_40_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA40 = (tmp3_0 + tmp3_1) * (s1_40_0 + s1_40_1);
    gl64_t kB40 = (tmp3_0 + tmp3_2) * (s1_40_0 + s1_40_2);
    gl64_t kC40 = (tmp3_1 + tmp3_2) * (s1_40_1 + s1_40_2);
    gl64_t kD40 = tmp3_0 * s1_40_0;
    gl64_t kE40 = tmp3_1 * s1_40_1;
    gl64_t kF40 = tmp3_2 * s1_40_2;
    gl64_t kG40 = kD40 - kE40;
    tmp3_0 = (kC40 + kG40) - kF40;
    tmp3_1 = ((((kA40 + kC40) - kE40) - kE40) - kD40);
    tmp3_2 = kB40 - kG40;
    // Op 41: dim1x1 sub_swap
    gl64_t s0_41 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_41 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_41 - s0_41;
    // Op 42: dim1x1 mul
    gl64_t s0_42 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    tmp1_0 = s0_42 * tmp1_0;
    // Op 43: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 44: dim3x3 mul
    gl64_t s1_44_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_44_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_44_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA44 = (tmp3_0 + tmp3_1) * (s1_44_0 + s1_44_1);
    gl64_t kB44 = (tmp3_0 + tmp3_2) * (s1_44_0 + s1_44_2);
    gl64_t kC44 = (tmp3_1 + tmp3_2) * (s1_44_1 + s1_44_2);
    gl64_t kD44 = tmp3_0 * s1_44_0;
    gl64_t kE44 = tmp3_1 * s1_44_1;
    gl64_t kF44 = tmp3_2 * s1_44_2;
    gl64_t kG44 = kD44 - kE44;
    tmp3_0 = (kC44 + kG44) - kF44;
    tmp3_1 = ((((kA44 + kC44) - kE44) - kE44) - kD44);
    tmp3_2 = kB44 - kG44;
    // Op 45: dim1x1 sub_swap
    gl64_t s0_45 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_45 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_45 - s0_45;
    // Op 46: dim1x1 mul
    gl64_t s0_46 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    tmp1_0 = s0_46 * tmp1_0;
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
    gl64_t s0_49 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    gl64_t s1_49 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_49 - s0_49;
    // Op 50: dim1x1 mul
    gl64_t s0_50 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
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
    gl64_t s0_53 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_53 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_53 - s0_53;
    // Op 54: dim1x1 mul
    gl64_t s0_54 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
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
    gl64_t s0_57 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    gl64_t s1_57 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_57 - s0_57;
    // Op 58: dim1x1 mul
    gl64_t s0_58 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
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
    // Op 61: dim1x1 sub_swap
    gl64_t s0_61 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    gl64_t s1_61 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_61 - s0_61;
    // Op 62: dim1x1 mul
    gl64_t s0_62 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_62 * tmp1_0;
    // Op 63: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 64: dim3x3 mul
    gl64_t s1_64_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_64_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_64_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA64 = (tmp3_0 + tmp3_1) * (s1_64_0 + s1_64_1);
    gl64_t kB64 = (tmp3_0 + tmp3_2) * (s1_64_0 + s1_64_2);
    gl64_t kC64 = (tmp3_1 + tmp3_2) * (s1_64_1 + s1_64_2);
    gl64_t kD64 = tmp3_0 * s1_64_0;
    gl64_t kE64 = tmp3_1 * s1_64_1;
    gl64_t kF64 = tmp3_2 * s1_64_2;
    gl64_t kG64 = kD64 - kE64;
    tmp3_0 = (kC64 + kG64) - kF64;
    tmp3_1 = ((((kA64 + kC64) - kE64) - kE64) - kD64);
    tmp3_2 = kB64 - kG64;
    // Op 65: dim1x1 sub_swap
    gl64_t s0_65 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    gl64_t s1_65 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_65 - s0_65;
    // Op 66: dim1x1 mul
    gl64_t s0_66 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_0 = s0_66 * tmp1_0;
    // Op 67: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 68: dim3x3 mul
    gl64_t s1_68_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_68_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_68_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA68 = (tmp3_0 + tmp3_1) * (s1_68_0 + s1_68_1);
    gl64_t kB68 = (tmp3_0 + tmp3_2) * (s1_68_0 + s1_68_2);
    gl64_t kC68 = (tmp3_1 + tmp3_2) * (s1_68_1 + s1_68_2);
    gl64_t kD68 = tmp3_0 * s1_68_0;
    gl64_t kE68 = tmp3_1 * s1_68_1;
    gl64_t kF68 = tmp3_2 * s1_68_2;
    gl64_t kG68 = kD68 - kE68;
    tmp3_0 = (kC68 + kG68) - kF68;
    tmp3_1 = ((((kA68 + kC68) - kE68) - kE68) - kD68);
    tmp3_2 = kB68 - kG68;
    // Op 69: dim1x1 sub_swap
    gl64_t s0_69 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    gl64_t s1_69 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_69 - s0_69;
    // Op 70: dim1x1 mul
    gl64_t s0_70 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_0 = s0_70 * tmp1_0;
    // Op 71: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 72: dim3x3 mul
    gl64_t s1_72_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_72_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_72_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA72 = (tmp3_0 + tmp3_1) * (s1_72_0 + s1_72_1);
    gl64_t kB72 = (tmp3_0 + tmp3_2) * (s1_72_0 + s1_72_2);
    gl64_t kC72 = (tmp3_1 + tmp3_2) * (s1_72_1 + s1_72_2);
    gl64_t kD72 = tmp3_0 * s1_72_0;
    gl64_t kE72 = tmp3_1 * s1_72_1;
    gl64_t kF72 = tmp3_2 * s1_72_2;
    gl64_t kG72 = kD72 - kE72;
    tmp3_0 = (kC72 + kG72) - kF72;
    tmp3_1 = ((((kA72 + kC72) - kE72) - kE72) - kD72);
    tmp3_2 = kB72 - kG72;
    // Op 73: dim1x1 sub_swap
    gl64_t s0_73 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    gl64_t s1_73 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_73 - s0_73;
    // Op 74: dim1x1 mul
    gl64_t s0_74 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_74 * tmp1_0;
    // Op 75: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 76: dim3x3 mul
    gl64_t s1_76_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_76_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_76_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA76 = (tmp3_0 + tmp3_1) * (s1_76_0 + s1_76_1);
    gl64_t kB76 = (tmp3_0 + tmp3_2) * (s1_76_0 + s1_76_2);
    gl64_t kC76 = (tmp3_1 + tmp3_2) * (s1_76_1 + s1_76_2);
    gl64_t kD76 = tmp3_0 * s1_76_0;
    gl64_t kE76 = tmp3_1 * s1_76_1;
    gl64_t kF76 = tmp3_2 * s1_76_2;
    gl64_t kG76 = kD76 - kE76;
    tmp3_0 = (kC76 + kG76) - kF76;
    tmp3_1 = ((((kA76 + kC76) - kE76) - kE76) - kD76);
    tmp3_2 = kB76 - kG76;
    // Op 77: dim1x1 sub_swap
    gl64_t s0_77 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    gl64_t s1_77 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_77 - s0_77;
    // Op 78: dim1x1 mul
    gl64_t s0_78 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_78 * tmp1_0;
    // Op 79: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 80: dim3x3 mul
    gl64_t s1_80_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_80_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_80_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA80 = (tmp3_0 + tmp3_1) * (s1_80_0 + s1_80_1);
    gl64_t kB80 = (tmp3_0 + tmp3_2) * (s1_80_0 + s1_80_2);
    gl64_t kC80 = (tmp3_1 + tmp3_2) * (s1_80_1 + s1_80_2);
    gl64_t kD80 = tmp3_0 * s1_80_0;
    gl64_t kE80 = tmp3_1 * s1_80_1;
    gl64_t kF80 = tmp3_2 * s1_80_2;
    gl64_t kG80 = kD80 - kE80;
    tmp3_0 = (kC80 + kG80) - kF80;
    tmp3_1 = ((((kA80 + kC80) - kE80) - kE80) - kD80);
    tmp3_2 = kB80 - kG80;
    // Op 81: dim1x1 sub_swap
    gl64_t s0_81 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    gl64_t s1_81 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_81 - s0_81;
    // Op 82: dim1x1 mul
    gl64_t s0_82 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_0 = s0_82 * tmp1_0;
    // Op 83: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 84: dim3x3 mul
    gl64_t s1_84_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_84_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_84_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA84 = (tmp3_0 + tmp3_1) * (s1_84_0 + s1_84_1);
    gl64_t kB84 = (tmp3_0 + tmp3_2) * (s1_84_0 + s1_84_2);
    gl64_t kC84 = (tmp3_1 + tmp3_2) * (s1_84_1 + s1_84_2);
    gl64_t kD84 = tmp3_0 * s1_84_0;
    gl64_t kE84 = tmp3_1 * s1_84_1;
    gl64_t kF84 = tmp3_2 * s1_84_2;
    gl64_t kG84 = kD84 - kE84;
    tmp3_0 = (kC84 + kG84) - kF84;
    tmp3_1 = ((((kA84 + kC84) - kE84) - kE84) - kD84);
    tmp3_2 = kB84 - kG84;
    // Op 85: dim1x1 sub_swap
    gl64_t s0_85 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    gl64_t s1_85 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_85 - s0_85;
    // Op 86: dim1x1 mul
    gl64_t s0_86 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_0 = s0_86 * tmp1_0;
    // Op 87: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 88: dim3x3 mul
    gl64_t s1_88_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_88_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_88_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA88 = (tmp3_0 + tmp3_1) * (s1_88_0 + s1_88_1);
    gl64_t kB88 = (tmp3_0 + tmp3_2) * (s1_88_0 + s1_88_2);
    gl64_t kC88 = (tmp3_1 + tmp3_2) * (s1_88_1 + s1_88_2);
    gl64_t kD88 = tmp3_0 * s1_88_0;
    gl64_t kE88 = tmp3_1 * s1_88_1;
    gl64_t kF88 = tmp3_2 * s1_88_2;
    gl64_t kG88 = kD88 - kE88;
    tmp3_0 = (kC88 + kG88) - kF88;
    tmp3_1 = ((((kA88 + kC88) - kE88) - kE88) - kD88);
    tmp3_2 = kB88 - kG88;
    // Op 89: dim1x1 sub_swap
    gl64_t s0_89 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    gl64_t s1_89 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_89 - s0_89;
    // Op 90: dim1x1 mul
    gl64_t s0_90 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp1_0 = s0_90 * tmp1_0;
    // Op 91: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 92: dim3x3 mul
    gl64_t s1_92_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_92_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_92_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA92 = (tmp3_0 + tmp3_1) * (s1_92_0 + s1_92_1);
    gl64_t kB92 = (tmp3_0 + tmp3_2) * (s1_92_0 + s1_92_2);
    gl64_t kC92 = (tmp3_1 + tmp3_2) * (s1_92_1 + s1_92_2);
    gl64_t kD92 = tmp3_0 * s1_92_0;
    gl64_t kE92 = tmp3_1 * s1_92_1;
    gl64_t kF92 = tmp3_2 * s1_92_2;
    gl64_t kG92 = kD92 - kE92;
    tmp3_0 = (kC92 + kG92) - kF92;
    tmp3_1 = ((((kA92 + kC92) - kE92) - kE92) - kD92);
    tmp3_2 = kB92 - kG92;
    // Op 93: dim1x1 sub_swap
    gl64_t s0_93 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    gl64_t s1_93 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_93 - s0_93;
    // Op 94: dim1x1 mul
    gl64_t s0_94 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp1_0 = s0_94 * tmp1_0;
    // Op 95: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 96: dim3x3 mul
    gl64_t s1_96_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_96_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_96_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA96 = (tmp3_0 + tmp3_1) * (s1_96_0 + s1_96_1);
    gl64_t kB96 = (tmp3_0 + tmp3_2) * (s1_96_0 + s1_96_2);
    gl64_t kC96 = (tmp3_1 + tmp3_2) * (s1_96_1 + s1_96_2);
    gl64_t kD96 = tmp3_0 * s1_96_0;
    gl64_t kE96 = tmp3_1 * s1_96_1;
    gl64_t kF96 = tmp3_2 * s1_96_2;
    gl64_t kG96 = kD96 - kE96;
    tmp3_0 = (kC96 + kG96) - kF96;
    tmp3_1 = ((((kA96 + kC96) - kE96) - kE96) - kD96);
    tmp3_2 = kB96 - kG96;
    // Op 97: dim1x1 sub
    gl64_t s0_97 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    gl64_t s1_97 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_97 - s1_97;
    // Op 98: dim1x1 mul
    gl64_t s0_98 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_98 * tmp1_0;
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
    gl64_t s0_103 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_103 = *(gl64_t*)&expressions_params[10][7];
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
    gl64_t s0_109 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_109 = *(gl64_t*)&expressions_params[10][8];
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
    tmp1_0 = s0_114 * tmp1_0;
    // Op 115: dim1x1 sub
    gl64_t s0_115 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_115 = *(gl64_t*)&expressions_params[10][9];
    tmp1_1 = s0_115 - s1_115;
    // Op 116: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 117: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 118: dim3x3 mul
    gl64_t s1_118_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_118_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_118_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA118 = (tmp3_0 + tmp3_1) * (s1_118_0 + s1_118_1);
    gl64_t kB118 = (tmp3_0 + tmp3_2) * (s1_118_0 + s1_118_2);
    gl64_t kC118 = (tmp3_1 + tmp3_2) * (s1_118_1 + s1_118_2);
    gl64_t kD118 = tmp3_0 * s1_118_0;
    gl64_t kE118 = tmp3_1 * s1_118_1;
    gl64_t kF118 = tmp3_2 * s1_118_2;
    gl64_t kG118 = kD118 - kE118;
    tmp3_0 = (kC118 + kG118) - kF118;
    tmp3_1 = ((((kA118 + kC118) - kE118) - kE118) - kD118);
    tmp3_2 = kB118 - kG118;
    // Op 119: dim1x1 sub_swap
    gl64_t s0_119 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    gl64_t s1_119 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_119 - s0_119;
    // Op 120: dim1x1 mul
    gl64_t s0_120 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_120 * tmp1_0;
    // Op 121: dim1x1 sub
    gl64_t s0_121 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_121 = *(gl64_t*)&expressions_params[10][10];
    tmp1_1 = s0_121 - s1_121;
    // Op 122: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 123: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 124: dim3x3 mul
    gl64_t s1_124_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_124_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_124_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA124 = (tmp3_0 + tmp3_1) * (s1_124_0 + s1_124_1);
    gl64_t kB124 = (tmp3_0 + tmp3_2) * (s1_124_0 + s1_124_2);
    gl64_t kC124 = (tmp3_1 + tmp3_2) * (s1_124_1 + s1_124_2);
    gl64_t kD124 = tmp3_0 * s1_124_0;
    gl64_t kE124 = tmp3_1 * s1_124_1;
    gl64_t kF124 = tmp3_2 * s1_124_2;
    gl64_t kG124 = kD124 - kE124;
    tmp3_0 = (kC124 + kG124) - kF124;
    tmp3_1 = ((((kA124 + kC124) - kE124) - kE124) - kD124);
    tmp3_2 = kB124 - kG124;
    // Op 125: dim1x1 mul
    gl64_t s0_125 = *(gl64_t*)&expressions_params[10][7];
    gl64_t s1_125 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_125 * s1_125;
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
    // Op 128: dim1x1 mul
    gl64_t s0_128 = *(gl64_t*)&expressions_params[10][9];
    gl64_t s1_128 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_128 * s1_128;
    // Op 129: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 130: dim3x3 mul
    gl64_t s1_130_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_130_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_130_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA130 = (tmp3_0 + tmp3_1) * (s1_130_0 + s1_130_1);
    gl64_t kB130 = (tmp3_0 + tmp3_2) * (s1_130_0 + s1_130_2);
    gl64_t kC130 = (tmp3_1 + tmp3_2) * (s1_130_1 + s1_130_2);
    gl64_t kD130 = tmp3_0 * s1_130_0;
    gl64_t kE130 = tmp3_1 * s1_130_1;
    gl64_t kF130 = tmp3_2 * s1_130_2;
    gl64_t kG130 = kD130 - kE130;
    tmp3_0 = (kC130 + kG130) - kF130;
    tmp3_1 = ((((kA130 + kC130) - kE130) - kE130) - kD130);
    tmp3_2 = kB130 - kG130;
    // Op 131: dim1x1 mul
    gl64_t s0_131 = *(gl64_t*)&expressions_params[10][8];
    gl64_t s1_131 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_131 * s1_131;
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
    gl64_t s0_134 = *(gl64_t*)&expressions_params[10][10];
    gl64_t s1_134 = *(gl64_t*)&expressions_params[10][6];
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
    gl64_t s0_137 = *(gl64_t*)&expressions_params[10][2];
    gl64_t s1_137 = *(gl64_t*)&expressions_params[10][1];
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
    gl64_t s0_140 = *(gl64_t*)&expressions_params[10][4];
    gl64_t s1_140 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_140 * s1_140;
    // Op 141: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 142: dim3x3 mul
    gl64_t s1_142_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_142_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_142_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA142 = (tmp3_0 + tmp3_1) * (s1_142_0 + s1_142_1);
    gl64_t kB142 = (tmp3_0 + tmp3_2) * (s1_142_0 + s1_142_2);
    gl64_t kC142 = (tmp3_1 + tmp3_2) * (s1_142_1 + s1_142_2);
    gl64_t kD142 = tmp3_0 * s1_142_0;
    gl64_t kE142 = tmp3_1 * s1_142_1;
    gl64_t kF142 = tmp3_2 * s1_142_2;
    gl64_t kG142 = kD142 - kE142;
    tmp3_0 = (kC142 + kG142) - kF142;
    tmp3_1 = ((((kA142 + kC142) - kE142) - kE142) - kD142);
    tmp3_2 = kB142 - kG142;
    // Op 143: dim1x1 mul
    gl64_t s0_143 = *(gl64_t*)&expressions_params[10][3];
    gl64_t s1_143 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_143 * s1_143;
    // Op 144: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 145: dim3x3 mul
    gl64_t s1_145_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_145_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_145_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA145 = (tmp3_0 + tmp3_1) * (s1_145_0 + s1_145_1);
    gl64_t kB145 = (tmp3_0 + tmp3_2) * (s1_145_0 + s1_145_2);
    gl64_t kC145 = (tmp3_1 + tmp3_2) * (s1_145_1 + s1_145_2);
    gl64_t kD145 = tmp3_0 * s1_145_0;
    gl64_t kE145 = tmp3_1 * s1_145_1;
    gl64_t kF145 = tmp3_2 * s1_145_2;
    gl64_t kG145 = kD145 - kE145;
    tmp3_0 = (kC145 + kG145) - kF145;
    tmp3_1 = ((((kA145 + kC145) - kE145) - kE145) - kD145);
    tmp3_2 = kB145 - kG145;
    // Op 146: dim1x1 mul
    gl64_t s0_146 = *(gl64_t*)&expressions_params[10][5];
    gl64_t s1_146 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_146 * s1_146;
    // Op 147: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 148: dim3x3 mul
    gl64_t s1_148_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_148_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_148_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA148 = (tmp3_0 + tmp3_1) * (s1_148_0 + s1_148_1);
    gl64_t kB148 = (tmp3_0 + tmp3_2) * (s1_148_0 + s1_148_2);
    gl64_t kC148 = (tmp3_1 + tmp3_2) * (s1_148_1 + s1_148_2);
    gl64_t kD148 = tmp3_0 * s1_148_0;
    gl64_t kE148 = tmp3_1 * s1_148_1;
    gl64_t kF148 = tmp3_2 * s1_148_2;
    gl64_t kG148 = kD148 - kE148;
    tmp3_0 = (kC148 + kG148) - kF148;
    tmp3_1 = ((((kA148 + kC148) - kE148) - kE148) - kD148);
    tmp3_2 = kB148 - kG148;
    // Op 149: dim1x1 sub_swap
    gl64_t s0_149 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    gl64_t s1_149 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_149 - s0_149;
    // Op 150: dim1x1 mul
    gl64_t s0_150 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_150 * tmp1_0;
    // Op 151: dim1x1 sub
    gl64_t s0_151 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_151 = *(gl64_t*)&expressions_params[10][13];
    tmp1_1 = s0_151 - s1_151;
    // Op 152: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
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
    gl64_t s0_155 = *(gl64_t*)&expressions_params[10][12];
    gl64_t s1_155 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_155 * s1_155;
    // Op 156: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 157: dim3x3 mul
    gl64_t s1_157_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_157_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_157_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA157 = (tmp3_0 + tmp3_1) * (s1_157_0 + s1_157_1);
    gl64_t kB157 = (tmp3_0 + tmp3_2) * (s1_157_0 + s1_157_2);
    gl64_t kC157 = (tmp3_1 + tmp3_2) * (s1_157_1 + s1_157_2);
    gl64_t kD157 = tmp3_0 * s1_157_0;
    gl64_t kE157 = tmp3_1 * s1_157_1;
    gl64_t kF157 = tmp3_2 * s1_157_2;
    gl64_t kG157 = kD157 - kE157;
    tmp3_0 = (kC157 + kG157) - kF157;
    tmp3_1 = ((((kA157 + kC157) - kE157) - kE157) - kD157);
    tmp3_2 = kB157 - kG157;
    // Op 158: dim1x1 mul
    gl64_t s0_158 = *(gl64_t*)&expressions_params[10][13];
    gl64_t s1_158 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_158 * s1_158;
    // Op 159: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 160: dim3x3 mul
    gl64_t s1_160_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_160_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_160_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA160 = (tmp3_0 + tmp3_1) * (s1_160_0 + s1_160_1);
    gl64_t kB160 = (tmp3_0 + tmp3_2) * (s1_160_0 + s1_160_2);
    gl64_t kC160 = (tmp3_1 + tmp3_2) * (s1_160_1 + s1_160_2);
    gl64_t kD160 = tmp3_0 * s1_160_0;
    gl64_t kE160 = tmp3_1 * s1_160_1;
    gl64_t kF160 = tmp3_2 * s1_160_2;
    gl64_t kG160 = kD160 - kE160;
    tmp3_0 = (kC160 + kG160) - kF160;
    tmp3_1 = ((((kA160 + kC160) - kE160) - kE160) - kD160);
    tmp3_2 = kB160 - kG160;
    // Op 161: dim1x1 sub
    gl64_t s0_161 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_161 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_161 - s1_161;
    // Op 162: dim1x1 mul
    gl64_t s0_162 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    tmp1_2 = s0_162 * tmp1_0;
    // Op 163: dim1x1 sub_swap
    gl64_t s0_163 = *(gl64_t*)&expressions_params[9][2];
    gl64_t s1_163 = *(gl64_t*)&expressions_params[10][4];
    tmp1_0 = s1_163 - s0_163;
    // Op 164: dim1x1 sub
    gl64_t s0_164 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp1_0 = s0_164 - tmp1_0;
    // Op 165: dim1x1 mul
    tmp1_0 = tmp1_2 * tmp1_0;
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
    gl64_t s0_168 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    gl64_t s1_168 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_168 - s0_168;
    // Op 169: dim1x1 sub_swap
    gl64_t s0_169 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 1, domainSize, nCols_1))];
    gl64_t s1_169 = *(gl64_t*)&expressions_params[9][0];
    tmp1_1 = s1_169 - s0_169;
    // Op 170: dim1x1 mul
    tmp1_3 = tmp1_0 * tmp1_1;
    // Op 171: dim1x1 sub
    gl64_t s0_171 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 7, domainSize, nCols_1))];
    gl64_t s1_171 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_171 - s1_171;
    // Op 172: dim1x1 sub
    gl64_t s0_172 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp1_0 = s0_172 - tmp1_0;
    // Op 173: dim1x1 mul
    tmp1_0 = tmp1_3 * tmp1_0;
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
    // Op 176: dim1x1 add
    gl64_t s0_176 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_176 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    tmp1_0 = s0_176 + s1_176;
    // Op 177: dim1x1 add
    gl64_t s0_177 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    tmp1_0 = s0_177 + tmp1_0;
    // Op 178: dim1x1 add
    gl64_t s0_178 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_178 + tmp1_0;
    // Op 179: dim1x1 add
    gl64_t s0_179 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_0 = s0_179 + tmp1_0;
    // Op 180: dim1x1 add
    gl64_t s0_180 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_180 + tmp1_0;
    // Op 181: dim1x1 add
    gl64_t s0_181 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_0 = s0_181 + tmp1_0;
    // Op 182: dim1x1 add
    gl64_t s0_182 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp1_1 = s0_182 + tmp1_0;
    // Op 183: dim1x1 sub
    gl64_t s0_183 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp1_0 = s0_183 - tmp1_1;
    // Op 184: dim1x1 mul
    gl64_t s0_184 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    tmp1_0 = s0_184 * tmp1_0;
    // Op 185: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 186: dim3x3 mul
    gl64_t s1_186_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_186_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_186_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA186 = (tmp3_0 + tmp3_1) * (s1_186_0 + s1_186_1);
    gl64_t kB186 = (tmp3_0 + tmp3_2) * (s1_186_0 + s1_186_2);
    gl64_t kC186 = (tmp3_1 + tmp3_2) * (s1_186_1 + s1_186_2);
    gl64_t kD186 = tmp3_0 * s1_186_0;
    gl64_t kE186 = tmp3_1 * s1_186_1;
    gl64_t kF186 = tmp3_2 * s1_186_2;
    gl64_t kG186 = kD186 - kE186;
    tmp3_0 = (kC186 + kG186) - kF186;
    tmp3_1 = ((((kA186 + kC186) - kE186) - kE186) - kD186);
    tmp3_2 = kB186 - kG186;
    // Op 187: dim1x1 sub_swap
    gl64_t s0_187 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    gl64_t s1_187 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_187 - s0_187;
    // Op 188: dim1x1 sub
    gl64_t s1_188 = *(gl64_t*)&expressions_params[9][2];
    tmp1_1 = tmp1_1 - s1_188;
    // Op 189: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
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
    // Op 192: dim1x1 add
    gl64_t s0_192 = *(gl64_t*)&expressions_params[9][2];
    gl64_t s1_192 = *(gl64_t*)&expressions_params[10][2];
    tmp1_0 = s0_192 + s1_192;
    // Op 193: dim1x1 sub
    gl64_t s0_193 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    tmp1_0 = s0_193 - tmp1_0;
    // Op 194: dim1x1 mul
    tmp1_0 = tmp1_2 * tmp1_0;
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
    // Op 197: dim1x1 add
    gl64_t s0_197 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 6, domainSize, nCols_1))];
    gl64_t s1_197 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_197 + s1_197;
    // Op 198: dim1x1 sub
    gl64_t s0_198 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    tmp1_0 = s0_198 - tmp1_0;
    // Op 199: dim1x1 mul
    tmp1_0 = tmp1_3 * tmp1_0;
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
    // Op 202: dim1x1 add
    gl64_t s0_202 = *(gl64_t*)&expressions_params[9][2];
    gl64_t s1_202 = *(gl64_t*)&expressions_params[10][12];
    tmp1_0 = s0_202 + s1_202;
    // Op 203: dim1x1 sub
    gl64_t s0_203 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    tmp1_0 = s0_203 - tmp1_0;
    // Op 204: dim1x1 mul
    tmp1_0 = tmp1_2 * tmp1_0;
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
    // Op 207: dim1x1 add
    gl64_t s0_207 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 0, domainSize, nCols_1))];
    gl64_t s1_207 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_207 + s1_207;
    // Op 208: dim1x1 sub
    gl64_t s0_208 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    tmp1_0 = s0_208 - tmp1_0;
    // Op 209: dim1x1 mul
    tmp1_0 = tmp1_3 * tmp1_0;
    // Op 210: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 211: dim3x3 mul
    gl64_t s1_211_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_211_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_211_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA211 = (tmp3_0 + tmp3_1) * (s1_211_0 + s1_211_1);
    gl64_t kB211 = (tmp3_0 + tmp3_2) * (s1_211_0 + s1_211_2);
    gl64_t kC211 = (tmp3_1 + tmp3_2) * (s1_211_1 + s1_211_2);
    gl64_t kD211 = tmp3_0 * s1_211_0;
    gl64_t kE211 = tmp3_1 * s1_211_1;
    gl64_t kF211 = tmp3_2 * s1_211_2;
    gl64_t kG211 = kD211 - kE211;
    tmp3_0 = (kC211 + kG211) - kF211;
    tmp3_1 = ((((kA211 + kC211) - kE211) - kE211) - kD211);
    tmp3_2 = kB211 - kG211;
    // Op 212: dim1x1 sub
    gl64_t s0_212 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_212 = *(gl64_t*)&expressions_params[10][5];
    tmp1_0 = s0_212 - s1_212;
    // Op 213: dim1x1 mul
    tmp1_0 = tmp1_2 * tmp1_0;
    // Op 214: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 215: dim3x3 mul
    gl64_t s1_215_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_215_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_215_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA215 = (tmp3_0 + tmp3_1) * (s1_215_0 + s1_215_1);
    gl64_t kB215 = (tmp3_0 + tmp3_2) * (s1_215_0 + s1_215_2);
    gl64_t kC215 = (tmp3_1 + tmp3_2) * (s1_215_1 + s1_215_2);
    gl64_t kD215 = tmp3_0 * s1_215_0;
    gl64_t kE215 = tmp3_1 * s1_215_1;
    gl64_t kF215 = tmp3_2 * s1_215_2;
    gl64_t kG215 = kD215 - kE215;
    tmp3_0 = (kC215 + kG215) - kF215;
    tmp3_1 = ((((kA215 + kC215) - kE215) - kE215) - kD215);
    tmp3_2 = kB215 - kG215;
    // Op 216: dim1x1 sub
    gl64_t s0_216 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_216 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 3, domainSize, nCols_1))];
    tmp1_0 = s0_216 - s1_216;
    // Op 217: dim1x1 mul
    tmp1_0 = tmp1_3 * tmp1_0;
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
    // Op 220: dim1x1 sub
    gl64_t s0_220 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_220 = *(gl64_t*)&expressions_params[10][3];
    tmp1_0 = s0_220 - s1_220;
    // Op 221: dim1x1 mul
    tmp1_0 = tmp1_2 * tmp1_0;
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
    // Op 224: dim1x1 sub
    gl64_t s0_224 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_224 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 5, domainSize, nCols_1))];
    tmp1_0 = s0_224 - s1_224;
    // Op 225: dim1x1 mul
    tmp1_0 = tmp1_3 * tmp1_0;
    // Op 226: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    gl64_t s0_228 = *(gl64_t*)&expressions_params[9][19];
    gl64_t s1_228 = *(gl64_t*)&expressions_params[10][15];
    tmp1_0 = s0_228 * s1_228;
    // Op 229: dim1x1 add
    gl64_t s1_229 = *(gl64_t*)&expressions_params[10][14];
    tmp1_0 = tmp1_0 + s1_229;
    // Op 230: dim1x1 sub
    gl64_t s1_230 = *(gl64_t*)&expressions_params[10][9];
    tmp1_0 = tmp1_0 - s1_230;
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
    tmp3_12 = (kC232 + kG232) - kF232;
    tmp3_13 = ((((kA232 + kC232) - kE232) - kE232) - kD232);
    tmp3_14 = kB232 - kG232;
    // Op 233: dim3x1 mul
    gl64_t s0_233_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_233_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_233_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_233 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    tmp3_0 = s0_233_0 * s1_233; tmp3_1 = s0_233_1 * s1_233; tmp3_2 = s0_233_2 * s1_233;
    // Op 234: dim3x1 add
    gl64_t s1_234 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_234; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 235: dim3x3 mul
    gl64_t s1_235_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_235_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_235_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA235 = (tmp3_0 + tmp3_1) * (s1_235_0 + s1_235_1);
    gl64_t kB235 = (tmp3_0 + tmp3_2) * (s1_235_0 + s1_235_2);
    gl64_t kC235 = (tmp3_1 + tmp3_2) * (s1_235_1 + s1_235_2);
    gl64_t kD235 = tmp3_0 * s1_235_0;
    gl64_t kE235 = tmp3_1 * s1_235_1;
    gl64_t kF235 = tmp3_2 * s1_235_2;
    gl64_t kG235 = kD235 - kE235;
    tmp3_0 = (kC235 + kG235) - kF235;
    tmp3_1 = ((((kA235 + kC235) - kE235) - kE235) - kD235);
    tmp3_2 = kB235 - kG235;
    // Op 236: dim3x1 add
    gl64_t s1_236 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_236; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 237: dim3x3 mul
    gl64_t s1_237_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_237_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_237_2 = *(gl64_t*)&expressions_params[13][0+2];
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
    gl64_t s0_238 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_238 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_238 * s1_238;
    // Op 239: dim1x1 add
    gl64_t s1_239 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_239;
    // Op 240: dim1x1 add
    gl64_t s1_240 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_240;
    // Op 241: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 242: dim3x3 mul
    gl64_t s1_242_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_242_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_242_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA242 = (tmp3_0 + tmp3_1) * (s1_242_0 + s1_242_1);
    gl64_t kB242 = (tmp3_0 + tmp3_2) * (s1_242_0 + s1_242_2);
    gl64_t kC242 = (tmp3_1 + tmp3_2) * (s1_242_1 + s1_242_2);
    gl64_t kD242 = tmp3_0 * s1_242_0;
    gl64_t kE242 = tmp3_1 * s1_242_1;
    gl64_t kF242 = tmp3_2 * s1_242_2;
    gl64_t kG242 = kD242 - kE242;
    tmp3_0 = (kC242 + kG242) - kF242;
    tmp3_1 = ((((kA242 + kC242) - kE242) - kE242) - kD242);
    tmp3_2 = kB242 - kG242;
    // Op 243: dim1x1 mul
    gl64_t s0_243 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_243 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_243 * s1_243;
    // Op 244: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 245: dim3x3 mul
    gl64_t s1_245_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_245_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_245_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA245 = (tmp3_0 + tmp3_1) * (s1_245_0 + s1_245_1);
    gl64_t kB245 = (tmp3_0 + tmp3_2) * (s1_245_0 + s1_245_2);
    gl64_t kC245 = (tmp3_1 + tmp3_2) * (s1_245_1 + s1_245_2);
    gl64_t kD245 = tmp3_0 * s1_245_0;
    gl64_t kE245 = tmp3_1 * s1_245_1;
    gl64_t kF245 = tmp3_2 * s1_245_2;
    gl64_t kG245 = kD245 - kE245;
    tmp3_0 = (kC245 + kG245) - kF245;
    tmp3_1 = ((((kA245 + kC245) - kE245) - kE245) - kD245);
    tmp3_2 = kB245 - kG245;
    // Op 246: dim3x1 add
    gl64_t s1_246 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_246; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 247: dim3x3 mul
    gl64_t s1_247_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_247_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_247_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA247 = (tmp3_0 + tmp3_1) * (s1_247_0 + s1_247_1);
    gl64_t kB247 = (tmp3_0 + tmp3_2) * (s1_247_0 + s1_247_2);
    gl64_t kC247 = (tmp3_1 + tmp3_2) * (s1_247_1 + s1_247_2);
    gl64_t kD247 = tmp3_0 * s1_247_0;
    gl64_t kE247 = tmp3_1 * s1_247_1;
    gl64_t kF247 = tmp3_2 * s1_247_2;
    gl64_t kG247 = kD247 - kE247;
    tmp3_0 = (kC247 + kG247) - kF247;
    tmp3_1 = ((((kA247 + kC247) - kE247) - kE247) - kD247);
    tmp3_2 = kB247 - kG247;
    // Op 248: dim3x1 add
    gl64_t s1_248 = *(gl64_t*)&expressions_params[9][5];
    tmp3_9 = tmp3_0 + s1_248; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 249: dim3x3 add
    gl64_t s1_249_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_249_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_249_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_249_0; tmp3_4 = tmp3_10 + s1_249_1; tmp3_5 = tmp3_11 + s1_249_2;
    // Op 250: dim3x1 mul
    gl64_t s0_250_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_250_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_250_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_250 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    tmp3_0 = s0_250_0 * s1_250; tmp3_1 = s0_250_1 * s1_250; tmp3_2 = s0_250_2 * s1_250;
    // Op 251: dim3x1 add
    gl64_t s1_251 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_251; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 252: dim3x3 mul
    gl64_t s1_252_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_252_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_252_2 = *(gl64_t*)&expressions_params[13][0+2];
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
    // Op 253: dim3x1 add
    gl64_t s1_253 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_253; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 254: dim3x3 mul
    gl64_t s1_254_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_254_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_254_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA254 = (tmp3_0 + tmp3_1) * (s1_254_0 + s1_254_1);
    gl64_t kB254 = (tmp3_0 + tmp3_2) * (s1_254_0 + s1_254_2);
    gl64_t kC254 = (tmp3_1 + tmp3_2) * (s1_254_1 + s1_254_2);
    gl64_t kD254 = tmp3_0 * s1_254_0;
    gl64_t kE254 = tmp3_1 * s1_254_1;
    gl64_t kF254 = tmp3_2 * s1_254_2;
    gl64_t kG254 = kD254 - kE254;
    tmp3_0 = (kC254 + kG254) - kF254;
    tmp3_1 = ((((kA254 + kC254) - kE254) - kE254) - kD254);
    tmp3_2 = kB254 - kG254;
    // Op 255: dim1x1 mul
    gl64_t s0_255 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_255 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_255 * s1_255;
    // Op 256: dim1x1 add
    gl64_t s1_256 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_256;
    // Op 257: dim1x1 add
    gl64_t s0_257 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    tmp1_0 = s0_257 + tmp1_0;
    // Op 258: dim1x1 add
    gl64_t s1_258 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_258;
    // Op 259: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 260: dim3x3 mul
    gl64_t s1_260_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_260_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_260_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA260 = (tmp3_0 + tmp3_1) * (s1_260_0 + s1_260_1);
    gl64_t kB260 = (tmp3_0 + tmp3_2) * (s1_260_0 + s1_260_2);
    gl64_t kC260 = (tmp3_1 + tmp3_2) * (s1_260_1 + s1_260_2);
    gl64_t kD260 = tmp3_0 * s1_260_0;
    gl64_t kE260 = tmp3_1 * s1_260_1;
    gl64_t kF260 = tmp3_2 * s1_260_2;
    gl64_t kG260 = kD260 - kE260;
    tmp3_0 = (kC260 + kG260) - kF260;
    tmp3_1 = ((((kA260 + kC260) - kE260) - kE260) - kD260);
    tmp3_2 = kB260 - kG260;
    // Op 261: dim1x1 mul
    gl64_t s0_261 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_261 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_261 * s1_261;
    // Op 262: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 263: dim3x3 mul
    gl64_t s1_263_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_263_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_263_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA263 = (tmp3_0 + tmp3_1) * (s1_263_0 + s1_263_1);
    gl64_t kB263 = (tmp3_0 + tmp3_2) * (s1_263_0 + s1_263_2);
    gl64_t kC263 = (tmp3_1 + tmp3_2) * (s1_263_1 + s1_263_2);
    gl64_t kD263 = tmp3_0 * s1_263_0;
    gl64_t kE263 = tmp3_1 * s1_263_1;
    gl64_t kF263 = tmp3_2 * s1_263_2;
    gl64_t kG263 = kD263 - kE263;
    tmp3_0 = (kC263 + kG263) - kF263;
    tmp3_1 = ((((kA263 + kC263) - kE263) - kE263) - kD263);
    tmp3_2 = kB263 - kG263;
    // Op 264: dim1x1 add
    gl64_t s0_264 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_264 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_264 + s1_264;
    // Op 265: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 266: dim3x3 mul
    gl64_t s1_266_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_266_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_266_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA266 = (tmp3_0 + tmp3_1) * (s1_266_0 + s1_266_1);
    gl64_t kB266 = (tmp3_0 + tmp3_2) * (s1_266_0 + s1_266_2);
    gl64_t kC266 = (tmp3_1 + tmp3_2) * (s1_266_1 + s1_266_2);
    gl64_t kD266 = tmp3_0 * s1_266_0;
    gl64_t kE266 = tmp3_1 * s1_266_1;
    gl64_t kF266 = tmp3_2 * s1_266_2;
    gl64_t kG266 = kD266 - kE266;
    tmp3_0 = (kC266 + kG266) - kF266;
    tmp3_1 = ((((kA266 + kC266) - kE266) - kE266) - kD266);
    tmp3_2 = kB266 - kG266;
    // Op 267: dim3x1 add
    gl64_t s1_267 = *(gl64_t*)&expressions_params[9][5];
    tmp3_6 = tmp3_0 + s1_267; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 268: dim3x3 add
    gl64_t s1_268_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_268_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_268_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_268_0; tmp3_1 = tmp3_7 + s1_268_1; tmp3_2 = tmp3_8 + s1_268_2;
    // Op 269: dim3x3 mul
    gl64_t kA269 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB269 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC269 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD269 = tmp3_3 * tmp3_0;
    gl64_t kE269 = tmp3_4 * tmp3_1;
    gl64_t kF269 = tmp3_5 * tmp3_2;
    gl64_t kG269 = kD269 - kE269;
    tmp3_0 = (kC269 + kG269) - kF269;
    tmp3_1 = ((((kA269 + kC269) - kE269) - kE269) - kD269);
    tmp3_2 = kB269 - kG269;
    // Op 270: dim3x3 mul
    gl64_t s0_270_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+0, domainSize, nCols_2))];
    gl64_t s0_270_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+1, domainSize, nCols_2))];
    gl64_t s0_270_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+2, domainSize, nCols_2))];
    gl64_t kA270 = (s0_270_0 + s0_270_1) * (tmp3_0 + tmp3_1);
    gl64_t kB270 = (s0_270_0 + s0_270_2) * (tmp3_0 + tmp3_2);
    gl64_t kC270 = (s0_270_1 + s0_270_2) * (tmp3_1 + tmp3_2);
    gl64_t kD270 = s0_270_0 * tmp3_0;
    gl64_t kE270 = s0_270_1 * tmp3_1;
    gl64_t kF270 = s0_270_2 * tmp3_2;
    gl64_t kG270 = kD270 - kE270;
    tmp3_0 = (kC270 + kG270) - kF270;
    tmp3_1 = ((((kA270 + kC270) - kE270) - kE270) - kD270);
    tmp3_2 = kB270 - kG270;
    // Op 271: dim1x1 sub_swap
    gl64_t s0_271 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_271 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_271 - s0_271;
    // Op 272: dim3x3 add
    gl64_t s1_272_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_272_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_272_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_272_0; tmp3_7 = tmp3_7 + s1_272_1; tmp3_8 = tmp3_8 + s1_272_2;
    // Op 273: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 274: dim1x1 sub_swap
    gl64_t s0_274 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_274 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_274 - s0_274;
    // Op 275: dim3x3 add
    gl64_t s1_275_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_275_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_275_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_275_0; tmp3_10 = tmp3_10 + s1_275_1; tmp3_11 = tmp3_11 + s1_275_2;
    // Op 276: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 277: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 278: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 279: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
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
    tmp3_3 = (kC280 + kG280) - kF280;
    tmp3_4 = ((((kA280 + kC280) - kE280) - kE280) - kD280);
    tmp3_5 = kB280 - kG280;
    // Op 281: dim3x1 mul
    gl64_t s0_281_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_281_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_281_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_281 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    tmp3_0 = s0_281_0 * s1_281; tmp3_1 = s0_281_1 * s1_281; tmp3_2 = s0_281_2 * s1_281;
    // Op 282: dim3x1 add
    gl64_t s1_282 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_282; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 283: dim3x3 mul
    gl64_t s1_283_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_283_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_283_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA283 = (tmp3_0 + tmp3_1) * (s1_283_0 + s1_283_1);
    gl64_t kB283 = (tmp3_0 + tmp3_2) * (s1_283_0 + s1_283_2);
    gl64_t kC283 = (tmp3_1 + tmp3_2) * (s1_283_1 + s1_283_2);
    gl64_t kD283 = tmp3_0 * s1_283_0;
    gl64_t kE283 = tmp3_1 * s1_283_1;
    gl64_t kF283 = tmp3_2 * s1_283_2;
    gl64_t kG283 = kD283 - kE283;
    tmp3_0 = (kC283 + kG283) - kF283;
    tmp3_1 = ((((kA283 + kC283) - kE283) - kE283) - kD283);
    tmp3_2 = kB283 - kG283;
    // Op 284: dim3x1 add
    gl64_t s1_284 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_284; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 285: dim3x3 mul
    gl64_t s1_285_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_285_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_285_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA285 = (tmp3_0 + tmp3_1) * (s1_285_0 + s1_285_1);
    gl64_t kB285 = (tmp3_0 + tmp3_2) * (s1_285_0 + s1_285_2);
    gl64_t kC285 = (tmp3_1 + tmp3_2) * (s1_285_1 + s1_285_2);
    gl64_t kD285 = tmp3_0 * s1_285_0;
    gl64_t kE285 = tmp3_1 * s1_285_1;
    gl64_t kF285 = tmp3_2 * s1_285_2;
    gl64_t kG285 = kD285 - kE285;
    tmp3_0 = (kC285 + kG285) - kF285;
    tmp3_1 = ((((kA285 + kC285) - kE285) - kE285) - kD285);
    tmp3_2 = kB285 - kG285;
    // Op 286: dim1x1 mul
    gl64_t s0_286 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_286 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_286 * s1_286;
    // Op 287: dim1x1 add
    gl64_t s1_287 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_287;
    // Op 288: dim1x1 add
    gl64_t s1_288 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_288;
    // Op 289: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 290: dim3x3 mul
    gl64_t s1_290_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_290_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_290_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA290 = (tmp3_0 + tmp3_1) * (s1_290_0 + s1_290_1);
    gl64_t kB290 = (tmp3_0 + tmp3_2) * (s1_290_0 + s1_290_2);
    gl64_t kC290 = (tmp3_1 + tmp3_2) * (s1_290_1 + s1_290_2);
    gl64_t kD290 = tmp3_0 * s1_290_0;
    gl64_t kE290 = tmp3_1 * s1_290_1;
    gl64_t kF290 = tmp3_2 * s1_290_2;
    gl64_t kG290 = kD290 - kE290;
    tmp3_0 = (kC290 + kG290) - kF290;
    tmp3_1 = ((((kA290 + kC290) - kE290) - kE290) - kD290);
    tmp3_2 = kB290 - kG290;
    // Op 291: dim1x1 mul
    gl64_t s0_291 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_291 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_291 * s1_291;
    // Op 292: dim1x1 add
    gl64_t s1_292 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = tmp1_0 + s1_292;
    // Op 293: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 294: dim3x3 mul
    gl64_t s1_294_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_294_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_294_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA294 = (tmp3_0 + tmp3_1) * (s1_294_0 + s1_294_1);
    gl64_t kB294 = (tmp3_0 + tmp3_2) * (s1_294_0 + s1_294_2);
    gl64_t kC294 = (tmp3_1 + tmp3_2) * (s1_294_1 + s1_294_2);
    gl64_t kD294 = tmp3_0 * s1_294_0;
    gl64_t kE294 = tmp3_1 * s1_294_1;
    gl64_t kF294 = tmp3_2 * s1_294_2;
    gl64_t kG294 = kD294 - kE294;
    tmp3_0 = (kC294 + kG294) - kF294;
    tmp3_1 = ((((kA294 + kC294) - kE294) - kE294) - kD294);
    tmp3_2 = kB294 - kG294;
    // Op 295: dim3x1 add
    gl64_t s1_295 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_295; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 296: dim3x3 mul
    gl64_t s1_296_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_296_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_296_2 = *(gl64_t*)&expressions_params[13][0+2];
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
    // Op 297: dim3x1 add
    gl64_t s1_297 = *(gl64_t*)&expressions_params[9][5];
    tmp3_9 = tmp3_0 + s1_297; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 298: dim3x3 add
    gl64_t s1_298_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_298_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_298_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_12 = tmp3_9 + s1_298_0; tmp3_13 = tmp3_10 + s1_298_1; tmp3_14 = tmp3_11 + s1_298_2;
    // Op 299: dim3x1 mul
    gl64_t s0_299_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_299_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_299_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_299 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    tmp3_0 = s0_299_0 * s1_299; tmp3_1 = s0_299_1 * s1_299; tmp3_2 = s0_299_2 * s1_299;
    // Op 300: dim3x1 add
    gl64_t s1_300 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_300; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 301: dim3x3 mul
    gl64_t s1_301_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_301_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_301_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA301 = (tmp3_0 + tmp3_1) * (s1_301_0 + s1_301_1);
    gl64_t kB301 = (tmp3_0 + tmp3_2) * (s1_301_0 + s1_301_2);
    gl64_t kC301 = (tmp3_1 + tmp3_2) * (s1_301_1 + s1_301_2);
    gl64_t kD301 = tmp3_0 * s1_301_0;
    gl64_t kE301 = tmp3_1 * s1_301_1;
    gl64_t kF301 = tmp3_2 * s1_301_2;
    gl64_t kG301 = kD301 - kE301;
    tmp3_0 = (kC301 + kG301) - kF301;
    tmp3_1 = ((((kA301 + kC301) - kE301) - kE301) - kD301);
    tmp3_2 = kB301 - kG301;
    // Op 302: dim3x1 add
    gl64_t s1_302 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_302; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 303: dim3x3 mul
    gl64_t s1_303_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_303_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_303_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA303 = (tmp3_0 + tmp3_1) * (s1_303_0 + s1_303_1);
    gl64_t kB303 = (tmp3_0 + tmp3_2) * (s1_303_0 + s1_303_2);
    gl64_t kC303 = (tmp3_1 + tmp3_2) * (s1_303_1 + s1_303_2);
    gl64_t kD303 = tmp3_0 * s1_303_0;
    gl64_t kE303 = tmp3_1 * s1_303_1;
    gl64_t kF303 = tmp3_2 * s1_303_2;
    gl64_t kG303 = kD303 - kE303;
    tmp3_0 = (kC303 + kG303) - kF303;
    tmp3_1 = ((((kA303 + kC303) - kE303) - kE303) - kD303);
    tmp3_2 = kB303 - kG303;
    // Op 304: dim1x1 mul
    gl64_t s0_304 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_304 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_304 * s1_304;
    // Op 305: dim1x1 add
    gl64_t s1_305 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_305;
    // Op 306: dim1x1 add
    gl64_t s0_306 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    tmp1_0 = s0_306 + tmp1_0;
    // Op 307: dim1x1 add
    gl64_t s1_307 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_307;
    // Op 308: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 309: dim3x3 mul
    gl64_t s1_309_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_309_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_309_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA309 = (tmp3_0 + tmp3_1) * (s1_309_0 + s1_309_1);
    gl64_t kB309 = (tmp3_0 + tmp3_2) * (s1_309_0 + s1_309_2);
    gl64_t kC309 = (tmp3_1 + tmp3_2) * (s1_309_1 + s1_309_2);
    gl64_t kD309 = tmp3_0 * s1_309_0;
    gl64_t kE309 = tmp3_1 * s1_309_1;
    gl64_t kF309 = tmp3_2 * s1_309_2;
    gl64_t kG309 = kD309 - kE309;
    tmp3_0 = (kC309 + kG309) - kF309;
    tmp3_1 = ((((kA309 + kC309) - kE309) - kE309) - kD309);
    tmp3_2 = kB309 - kG309;
    // Op 310: dim1x1 mul
    gl64_t s0_310 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_310 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_310 * s1_310;
    // Op 311: dim1x1 add
    gl64_t s1_311 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = tmp1_0 + s1_311;
    // Op 312: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 313: dim3x3 mul
    gl64_t s1_313_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_313_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_313_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA313 = (tmp3_0 + tmp3_1) * (s1_313_0 + s1_313_1);
    gl64_t kB313 = (tmp3_0 + tmp3_2) * (s1_313_0 + s1_313_2);
    gl64_t kC313 = (tmp3_1 + tmp3_2) * (s1_313_1 + s1_313_2);
    gl64_t kD313 = tmp3_0 * s1_313_0;
    gl64_t kE313 = tmp3_1 * s1_313_1;
    gl64_t kF313 = tmp3_2 * s1_313_2;
    gl64_t kG313 = kD313 - kE313;
    tmp3_0 = (kC313 + kG313) - kF313;
    tmp3_1 = ((((kA313 + kC313) - kE313) - kE313) - kD313);
    tmp3_2 = kB313 - kG313;
    // Op 314: dim1x1 add
    gl64_t s0_314 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_314 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_314 + s1_314;
    // Op 315: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 316: dim3x3 mul
    gl64_t s1_316_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_316_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_316_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA316 = (tmp3_0 + tmp3_1) * (s1_316_0 + s1_316_1);
    gl64_t kB316 = (tmp3_0 + tmp3_2) * (s1_316_0 + s1_316_2);
    gl64_t kC316 = (tmp3_1 + tmp3_2) * (s1_316_1 + s1_316_2);
    gl64_t kD316 = tmp3_0 * s1_316_0;
    gl64_t kE316 = tmp3_1 * s1_316_1;
    gl64_t kF316 = tmp3_2 * s1_316_2;
    gl64_t kG316 = kD316 - kE316;
    tmp3_0 = (kC316 + kG316) - kF316;
    tmp3_1 = ((((kA316 + kC316) - kE316) - kE316) - kD316);
    tmp3_2 = kB316 - kG316;
    // Op 317: dim3x1 add
    gl64_t s1_317 = *(gl64_t*)&expressions_params[9][5];
    tmp3_6 = tmp3_0 + s1_317; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 318: dim3x3 add
    gl64_t s1_318_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_318_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_318_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_318_0; tmp3_1 = tmp3_7 + s1_318_1; tmp3_2 = tmp3_8 + s1_318_2;
    // Op 319: dim3x3 mul
    gl64_t kA319 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB319 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC319 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD319 = tmp3_12 * tmp3_0;
    gl64_t kE319 = tmp3_13 * tmp3_1;
    gl64_t kF319 = tmp3_14 * tmp3_2;
    gl64_t kG319 = kD319 - kE319;
    tmp3_0 = (kC319 + kG319) - kF319;
    tmp3_1 = ((((kA319 + kC319) - kE319) - kE319) - kD319);
    tmp3_2 = kB319 - kG319;
    // Op 320: dim3x3 mul
    gl64_t s0_320_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+0, domainSize, nCols_2))];
    gl64_t s0_320_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+1, domainSize, nCols_2))];
    gl64_t s0_320_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+2, domainSize, nCols_2))];
    gl64_t kA320 = (s0_320_0 + s0_320_1) * (tmp3_0 + tmp3_1);
    gl64_t kB320 = (s0_320_0 + s0_320_2) * (tmp3_0 + tmp3_2);
    gl64_t kC320 = (s0_320_1 + s0_320_2) * (tmp3_1 + tmp3_2);
    gl64_t kD320 = s0_320_0 * tmp3_0;
    gl64_t kE320 = s0_320_1 * tmp3_1;
    gl64_t kF320 = s0_320_2 * tmp3_2;
    gl64_t kG320 = kD320 - kE320;
    tmp3_0 = (kC320 + kG320) - kF320;
    tmp3_1 = ((((kA320 + kC320) - kE320) - kE320) - kD320);
    tmp3_2 = kB320 - kG320;
    // Op 321: dim1x1 sub_swap
    gl64_t s0_321 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_321 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_321 - s0_321;
    // Op 322: dim3x3 add
    gl64_t s1_322_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_322_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_322_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_322_0; tmp3_7 = tmp3_7 + s1_322_1; tmp3_8 = tmp3_8 + s1_322_2;
    // Op 323: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 324: dim1x1 sub_swap
    gl64_t s0_324 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_324 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_324 - s0_324;
    // Op 325: dim3x3 add
    gl64_t s1_325_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_325_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_325_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_325_0; tmp3_10 = tmp3_10 + s1_325_1; tmp3_11 = tmp3_11 + s1_325_2;
    // Op 326: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 327: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 328: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 329: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 330: dim3x3 mul
    gl64_t s1_330_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_330_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_330_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA330 = (tmp3_0 + tmp3_1) * (s1_330_0 + s1_330_1);
    gl64_t kB330 = (tmp3_0 + tmp3_2) * (s1_330_0 + s1_330_2);
    gl64_t kC330 = (tmp3_1 + tmp3_2) * (s1_330_1 + s1_330_2);
    gl64_t kD330 = tmp3_0 * s1_330_0;
    gl64_t kE330 = tmp3_1 * s1_330_1;
    gl64_t kF330 = tmp3_2 * s1_330_2;
    gl64_t kG330 = kD330 - kE330;
    tmp3_12 = (kC330 + kG330) - kF330;
    tmp3_13 = ((((kA330 + kC330) - kE330) - kE330) - kD330);
    tmp3_14 = kB330 - kG330;
    // Op 331: dim3x1 mul
    gl64_t s0_331_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_331_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_331_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_331 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    tmp3_0 = s0_331_0 * s1_331; tmp3_1 = s0_331_1 * s1_331; tmp3_2 = s0_331_2 * s1_331;
    // Op 332: dim3x1 add
    gl64_t s1_332 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_332; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 333: dim3x3 mul
    gl64_t s1_333_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_333_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_333_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA333 = (tmp3_0 + tmp3_1) * (s1_333_0 + s1_333_1);
    gl64_t kB333 = (tmp3_0 + tmp3_2) * (s1_333_0 + s1_333_2);
    gl64_t kC333 = (tmp3_1 + tmp3_2) * (s1_333_1 + s1_333_2);
    gl64_t kD333 = tmp3_0 * s1_333_0;
    gl64_t kE333 = tmp3_1 * s1_333_1;
    gl64_t kF333 = tmp3_2 * s1_333_2;
    gl64_t kG333 = kD333 - kE333;
    tmp3_0 = (kC333 + kG333) - kF333;
    tmp3_1 = ((((kA333 + kC333) - kE333) - kE333) - kD333);
    tmp3_2 = kB333 - kG333;
    // Op 334: dim3x1 add
    gl64_t s1_334 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_334; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 335: dim3x3 mul
    gl64_t s1_335_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_335_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_335_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA335 = (tmp3_0 + tmp3_1) * (s1_335_0 + s1_335_1);
    gl64_t kB335 = (tmp3_0 + tmp3_2) * (s1_335_0 + s1_335_2);
    gl64_t kC335 = (tmp3_1 + tmp3_2) * (s1_335_1 + s1_335_2);
    gl64_t kD335 = tmp3_0 * s1_335_0;
    gl64_t kE335 = tmp3_1 * s1_335_1;
    gl64_t kF335 = tmp3_2 * s1_335_2;
    gl64_t kG335 = kD335 - kE335;
    tmp3_0 = (kC335 + kG335) - kF335;
    tmp3_1 = ((((kA335 + kC335) - kE335) - kE335) - kD335);
    tmp3_2 = kB335 - kG335;
    // Op 336: dim1x1 mul
    gl64_t s0_336 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_336 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_336 * s1_336;
    // Op 337: dim1x1 add
    gl64_t s1_337 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_337;
    // Op 338: dim1x1 add
    gl64_t s1_338 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_338;
    // Op 339: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 340: dim3x3 mul
    gl64_t s1_340_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_340_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_340_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA340 = (tmp3_0 + tmp3_1) * (s1_340_0 + s1_340_1);
    gl64_t kB340 = (tmp3_0 + tmp3_2) * (s1_340_0 + s1_340_2);
    gl64_t kC340 = (tmp3_1 + tmp3_2) * (s1_340_1 + s1_340_2);
    gl64_t kD340 = tmp3_0 * s1_340_0;
    gl64_t kE340 = tmp3_1 * s1_340_1;
    gl64_t kF340 = tmp3_2 * s1_340_2;
    gl64_t kG340 = kD340 - kE340;
    tmp3_0 = (kC340 + kG340) - kF340;
    tmp3_1 = ((((kA340 + kC340) - kE340) - kE340) - kD340);
    tmp3_2 = kB340 - kG340;
    // Op 341: dim1x1 mul
    gl64_t s0_341 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_341 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_341 * s1_341;
    // Op 342: dim1x1 add
    gl64_t s1_342 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = tmp1_0 + s1_342;
    // Op 343: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 344: dim3x3 mul
    gl64_t s1_344_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_344_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_344_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA344 = (tmp3_0 + tmp3_1) * (s1_344_0 + s1_344_1);
    gl64_t kB344 = (tmp3_0 + tmp3_2) * (s1_344_0 + s1_344_2);
    gl64_t kC344 = (tmp3_1 + tmp3_2) * (s1_344_1 + s1_344_2);
    gl64_t kD344 = tmp3_0 * s1_344_0;
    gl64_t kE344 = tmp3_1 * s1_344_1;
    gl64_t kF344 = tmp3_2 * s1_344_2;
    gl64_t kG344 = kD344 - kE344;
    tmp3_0 = (kC344 + kG344) - kF344;
    tmp3_1 = ((((kA344 + kC344) - kE344) - kE344) - kD344);
    tmp3_2 = kB344 - kG344;
    // Op 345: dim3x1 add
    gl64_t s1_345 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_345; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 347: dim3x1 add
    gl64_t s1_347 = *(gl64_t*)&expressions_params[9][5];
    tmp3_9 = tmp3_0 + s1_347; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 348: dim3x3 add
    gl64_t s1_348_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_348_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_348_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_348_0; tmp3_4 = tmp3_10 + s1_348_1; tmp3_5 = tmp3_11 + s1_348_2;
    // Op 349: dim3x1 mul
    gl64_t s0_349_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_349_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_349_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_349 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    tmp3_0 = s0_349_0 * s1_349; tmp3_1 = s0_349_1 * s1_349; tmp3_2 = s0_349_2 * s1_349;
    // Op 350: dim3x1 add
    gl64_t s1_350 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_350; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 351: dim3x3 mul
    gl64_t s1_351_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_351_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_351_2 = *(gl64_t*)&expressions_params[13][0+2];
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
    // Op 352: dim3x1 add
    gl64_t s1_352 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_352; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 354: dim1x1 mul
    gl64_t s0_354 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_354 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_354 * s1_354;
    // Op 355: dim1x1 add
    gl64_t s1_355 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_355;
    // Op 356: dim1x1 add
    gl64_t s0_356 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    tmp1_0 = s0_356 + tmp1_0;
    // Op 357: dim1x1 add
    gl64_t s1_357 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_357;
    // Op 358: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 359: dim3x3 mul
    gl64_t s1_359_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_359_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_359_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA359 = (tmp3_0 + tmp3_1) * (s1_359_0 + s1_359_1);
    gl64_t kB359 = (tmp3_0 + tmp3_2) * (s1_359_0 + s1_359_2);
    gl64_t kC359 = (tmp3_1 + tmp3_2) * (s1_359_1 + s1_359_2);
    gl64_t kD359 = tmp3_0 * s1_359_0;
    gl64_t kE359 = tmp3_1 * s1_359_1;
    gl64_t kF359 = tmp3_2 * s1_359_2;
    gl64_t kG359 = kD359 - kE359;
    tmp3_0 = (kC359 + kG359) - kF359;
    tmp3_1 = ((((kA359 + kC359) - kE359) - kE359) - kD359);
    tmp3_2 = kB359 - kG359;
    // Op 360: dim1x1 mul
    gl64_t s0_360 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_360 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_360 * s1_360;
    // Op 361: dim1x1 add
    gl64_t s1_361 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = tmp1_0 + s1_361;
    // Op 362: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 363: dim3x3 mul
    gl64_t s1_363_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_363_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_363_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA363 = (tmp3_0 + tmp3_1) * (s1_363_0 + s1_363_1);
    gl64_t kB363 = (tmp3_0 + tmp3_2) * (s1_363_0 + s1_363_2);
    gl64_t kC363 = (tmp3_1 + tmp3_2) * (s1_363_1 + s1_363_2);
    gl64_t kD363 = tmp3_0 * s1_363_0;
    gl64_t kE363 = tmp3_1 * s1_363_1;
    gl64_t kF363 = tmp3_2 * s1_363_2;
    gl64_t kG363 = kD363 - kE363;
    tmp3_0 = (kC363 + kG363) - kF363;
    tmp3_1 = ((((kA363 + kC363) - kE363) - kE363) - kD363);
    tmp3_2 = kB363 - kG363;
    // Op 364: dim1x1 add
    gl64_t s0_364 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_364 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_364 + s1_364;
    // Op 365: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 366: dim3x3 mul
    gl64_t s1_366_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_366_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_366_2 = *(gl64_t*)&expressions_params[13][0+2];
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
    // Op 367: dim3x1 add
    gl64_t s1_367 = *(gl64_t*)&expressions_params[9][5];
    tmp3_6 = tmp3_0 + s1_367; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 368: dim3x3 add
    gl64_t s1_368_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_368_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_368_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_368_0; tmp3_1 = tmp3_7 + s1_368_1; tmp3_2 = tmp3_8 + s1_368_2;
    // Op 369: dim3x3 mul
    gl64_t kA369 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB369 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC369 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD369 = tmp3_3 * tmp3_0;
    gl64_t kE369 = tmp3_4 * tmp3_1;
    gl64_t kF369 = tmp3_5 * tmp3_2;
    gl64_t kG369 = kD369 - kE369;
    tmp3_0 = (kC369 + kG369) - kF369;
    tmp3_1 = ((((kA369 + kC369) - kE369) - kE369) - kD369);
    tmp3_2 = kB369 - kG369;
    // Op 370: dim3x3 mul
    uint64_t s0_370_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_2));
    gl64_t s0_370_0 = *(gl64_t*)&dParams->aux_trace[s0_370_pos];
    gl64_t s0_370_1 = *(gl64_t*)&dParams->aux_trace[s0_370_pos + TILE_HEIGHT];
    gl64_t s0_370_2 = *(gl64_t*)&dParams->aux_trace[s0_370_pos + 2*TILE_HEIGHT];
    gl64_t kA370 = (s0_370_0 + s0_370_1) * (tmp3_0 + tmp3_1);
    gl64_t kB370 = (s0_370_0 + s0_370_2) * (tmp3_0 + tmp3_2);
    gl64_t kC370 = (s0_370_1 + s0_370_2) * (tmp3_1 + tmp3_2);
    gl64_t kD370 = s0_370_0 * tmp3_0;
    gl64_t kE370 = s0_370_1 * tmp3_1;
    gl64_t kF370 = s0_370_2 * tmp3_2;
    gl64_t kG370 = kD370 - kE370;
    tmp3_0 = (kC370 + kG370) - kF370;
    tmp3_1 = ((((kA370 + kC370) - kE370) - kE370) - kD370);
    tmp3_2 = kB370 - kG370;
    // Op 371: dim1x1 sub_swap
    gl64_t s0_371 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    gl64_t s1_371 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_371 - s0_371;
    // Op 372: dim3x3 add
    gl64_t s1_372_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_372_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_372_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_372_0; tmp3_7 = tmp3_7 + s1_372_1; tmp3_8 = tmp3_8 + s1_372_2;
    // Op 373: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 374: dim1x1 sub_swap
    gl64_t s0_374 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    gl64_t s1_374 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_374 - s0_374;
    // Op 375: dim3x3 add
    gl64_t s1_375_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_375_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_375_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_375_0; tmp3_10 = tmp3_10 + s1_375_1; tmp3_11 = tmp3_11 + s1_375_2;
    // Op 376: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 377: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 378: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 379: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 380: dim3x3 mul
    gl64_t s1_380_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_380_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_380_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA380 = (tmp3_0 + tmp3_1) * (s1_380_0 + s1_380_1);
    gl64_t kB380 = (tmp3_0 + tmp3_2) * (s1_380_0 + s1_380_2);
    gl64_t kC380 = (tmp3_1 + tmp3_2) * (s1_380_1 + s1_380_2);
    gl64_t kD380 = tmp3_0 * s1_380_0;
    gl64_t kE380 = tmp3_1 * s1_380_1;
    gl64_t kF380 = tmp3_2 * s1_380_2;
    gl64_t kG380 = kD380 - kE380;
    tmp3_3 = (kC380 + kG380) - kF380;
    tmp3_4 = ((((kA380 + kC380) - kE380) - kE380) - kD380);
    tmp3_5 = kB380 - kG380;
    // Op 381: dim3x1 mul
    gl64_t s0_381_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_381_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_381_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_381 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp3_0 = s0_381_0 * s1_381; tmp3_1 = s0_381_1 * s1_381; tmp3_2 = s0_381_2 * s1_381;
    // Op 382: dim3x1 add
    gl64_t s1_382 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
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
    gl64_t s1_384 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_384; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 385: dim3x3 mul
    gl64_t s1_385_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_385_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_385_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA385 = (tmp3_0 + tmp3_1) * (s1_385_0 + s1_385_1);
    gl64_t kB385 = (tmp3_0 + tmp3_2) * (s1_385_0 + s1_385_2);
    gl64_t kC385 = (tmp3_1 + tmp3_2) * (s1_385_1 + s1_385_2);
    gl64_t kD385 = tmp3_0 * s1_385_0;
    gl64_t kE385 = tmp3_1 * s1_385_1;
    gl64_t kF385 = tmp3_2 * s1_385_2;
    gl64_t kG385 = kD385 - kE385;
    tmp3_0 = (kC385 + kG385) - kF385;
    tmp3_1 = ((((kA385 + kC385) - kE385) - kE385) - kD385);
    tmp3_2 = kB385 - kG385;
    // Op 386: dim1x1 mul
    gl64_t s0_386 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_386 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_386 * s1_386;
    // Op 387: dim1x1 add
    gl64_t s1_387 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_387;
    // Op 388: dim1x1 add
    gl64_t s1_388 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_388;
    // Op 389: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    gl64_t s0_391 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_391 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_391 * s1_391;
    // Op 392: dim1x1 add
    gl64_t s1_392 = *(gl64_t*)&expressions_params[9][7];
    tmp1_0 = tmp1_0 + s1_392;
    // Op 393: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 394: dim3x3 mul
    gl64_t s1_394_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_394_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_394_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA394 = (tmp3_0 + tmp3_1) * (s1_394_0 + s1_394_1);
    gl64_t kB394 = (tmp3_0 + tmp3_2) * (s1_394_0 + s1_394_2);
    gl64_t kC394 = (tmp3_1 + tmp3_2) * (s1_394_1 + s1_394_2);
    gl64_t kD394 = tmp3_0 * s1_394_0;
    gl64_t kE394 = tmp3_1 * s1_394_1;
    gl64_t kF394 = tmp3_2 * s1_394_2;
    gl64_t kG394 = kD394 - kE394;
    tmp3_0 = (kC394 + kG394) - kF394;
    tmp3_1 = ((((kA394 + kC394) - kE394) - kE394) - kD394);
    tmp3_2 = kB394 - kG394;
    // Op 395: dim3x1 add
    gl64_t s1_395 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_395; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 396: dim3x3 mul
    gl64_t s1_396_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_396_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_396_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA396 = (tmp3_0 + tmp3_1) * (s1_396_0 + s1_396_1);
    gl64_t kB396 = (tmp3_0 + tmp3_2) * (s1_396_0 + s1_396_2);
    gl64_t kC396 = (tmp3_1 + tmp3_2) * (s1_396_1 + s1_396_2);
    gl64_t kD396 = tmp3_0 * s1_396_0;
    gl64_t kE396 = tmp3_1 * s1_396_1;
    gl64_t kF396 = tmp3_2 * s1_396_2;
    gl64_t kG396 = kD396 - kE396;
    tmp3_0 = (kC396 + kG396) - kF396;
    tmp3_1 = ((((kA396 + kC396) - kE396) - kE396) - kD396);
    tmp3_2 = kB396 - kG396;
    // Op 397: dim3x1 add
    gl64_t s1_397 = *(gl64_t*)&expressions_params[9][5];
    tmp3_9 = tmp3_0 + s1_397; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 398: dim3x3 add
    gl64_t s1_398_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_398_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_398_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_12 = tmp3_9 + s1_398_0; tmp3_13 = tmp3_10 + s1_398_1; tmp3_14 = tmp3_11 + s1_398_2;
    // Op 399: dim3x1 mul
    gl64_t s0_399_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_399_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_399_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_399 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp3_0 = s0_399_0 * s1_399; tmp3_1 = s0_399_1 * s1_399; tmp3_2 = s0_399_2 * s1_399;
    // Op 400: dim3x1 add
    gl64_t s1_400 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_400; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 402: dim3x1 add
    gl64_t s1_402 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_402; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 403: dim3x3 mul
    gl64_t s1_403_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_403_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_403_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA403 = (tmp3_0 + tmp3_1) * (s1_403_0 + s1_403_1);
    gl64_t kB403 = (tmp3_0 + tmp3_2) * (s1_403_0 + s1_403_2);
    gl64_t kC403 = (tmp3_1 + tmp3_2) * (s1_403_1 + s1_403_2);
    gl64_t kD403 = tmp3_0 * s1_403_0;
    gl64_t kE403 = tmp3_1 * s1_403_1;
    gl64_t kF403 = tmp3_2 * s1_403_2;
    gl64_t kG403 = kD403 - kE403;
    tmp3_0 = (kC403 + kG403) - kF403;
    tmp3_1 = ((((kA403 + kC403) - kE403) - kE403) - kD403);
    tmp3_2 = kB403 - kG403;
    // Op 404: dim1x1 mul
    gl64_t s0_404 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_404 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_404 * s1_404;
    // Op 405: dim1x1 add
    gl64_t s1_405 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_405;
    // Op 406: dim1x1 add
    gl64_t s0_406 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    tmp1_0 = s0_406 + tmp1_0;
    // Op 407: dim1x1 add
    gl64_t s1_407 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_407;
    // Op 408: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 409: dim3x3 mul
    gl64_t s1_409_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_409_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_409_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA409 = (tmp3_0 + tmp3_1) * (s1_409_0 + s1_409_1);
    gl64_t kB409 = (tmp3_0 + tmp3_2) * (s1_409_0 + s1_409_2);
    gl64_t kC409 = (tmp3_1 + tmp3_2) * (s1_409_1 + s1_409_2);
    gl64_t kD409 = tmp3_0 * s1_409_0;
    gl64_t kE409 = tmp3_1 * s1_409_1;
    gl64_t kF409 = tmp3_2 * s1_409_2;
    gl64_t kG409 = kD409 - kE409;
    tmp3_0 = (kC409 + kG409) - kF409;
    tmp3_1 = ((((kA409 + kC409) - kE409) - kE409) - kD409);
    tmp3_2 = kB409 - kG409;
    // Op 410: dim1x1 mul
    gl64_t s0_410 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_410 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_410 * s1_410;
    // Op 411: dim1x1 add
    gl64_t s1_411 = *(gl64_t*)&expressions_params[9][7];
    tmp1_0 = tmp1_0 + s1_411;
    // Op 412: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 413: dim3x3 mul
    gl64_t s1_413_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_413_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_413_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA413 = (tmp3_0 + tmp3_1) * (s1_413_0 + s1_413_1);
    gl64_t kB413 = (tmp3_0 + tmp3_2) * (s1_413_0 + s1_413_2);
    gl64_t kC413 = (tmp3_1 + tmp3_2) * (s1_413_1 + s1_413_2);
    gl64_t kD413 = tmp3_0 * s1_413_0;
    gl64_t kE413 = tmp3_1 * s1_413_1;
    gl64_t kF413 = tmp3_2 * s1_413_2;
    gl64_t kG413 = kD413 - kE413;
    tmp3_0 = (kC413 + kG413) - kF413;
    tmp3_1 = ((((kA413 + kC413) - kE413) - kE413) - kD413);
    tmp3_2 = kB413 - kG413;
    // Op 414: dim1x1 add
    gl64_t s0_414 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_414 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_414 + s1_414;
    // Op 415: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 416: dim3x3 mul
    gl64_t s1_416_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_416_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_416_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA416 = (tmp3_0 + tmp3_1) * (s1_416_0 + s1_416_1);
    gl64_t kB416 = (tmp3_0 + tmp3_2) * (s1_416_0 + s1_416_2);
    gl64_t kC416 = (tmp3_1 + tmp3_2) * (s1_416_1 + s1_416_2);
    gl64_t kD416 = tmp3_0 * s1_416_0;
    gl64_t kE416 = tmp3_1 * s1_416_1;
    gl64_t kF416 = tmp3_2 * s1_416_2;
    gl64_t kG416 = kD416 - kE416;
    tmp3_0 = (kC416 + kG416) - kF416;
    tmp3_1 = ((((kA416 + kC416) - kE416) - kE416) - kD416);
    tmp3_2 = kB416 - kG416;
    // Op 417: dim3x1 add
    gl64_t s1_417 = *(gl64_t*)&expressions_params[9][5];
    tmp3_6 = tmp3_0 + s1_417; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 418: dim3x3 add
    gl64_t s1_418_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_418_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_418_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_418_0; tmp3_1 = tmp3_7 + s1_418_1; tmp3_2 = tmp3_8 + s1_418_2;
    // Op 419: dim3x3 mul
    gl64_t kA419 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB419 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC419 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD419 = tmp3_12 * tmp3_0;
    gl64_t kE419 = tmp3_13 * tmp3_1;
    gl64_t kF419 = tmp3_14 * tmp3_2;
    gl64_t kG419 = kD419 - kE419;
    tmp3_0 = (kC419 + kG419) - kF419;
    tmp3_1 = ((((kA419 + kC419) - kE419) - kE419) - kD419);
    tmp3_2 = kB419 - kG419;
    // Op 420: dim3x3 mul
    uint64_t s0_420_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_2));
    gl64_t s0_420_0 = *(gl64_t*)&dParams->aux_trace[s0_420_pos];
    gl64_t s0_420_1 = *(gl64_t*)&dParams->aux_trace[s0_420_pos + TILE_HEIGHT];
    gl64_t s0_420_2 = *(gl64_t*)&dParams->aux_trace[s0_420_pos + 2*TILE_HEIGHT];
    gl64_t kA420 = (s0_420_0 + s0_420_1) * (tmp3_0 + tmp3_1);
    gl64_t kB420 = (s0_420_0 + s0_420_2) * (tmp3_0 + tmp3_2);
    gl64_t kC420 = (s0_420_1 + s0_420_2) * (tmp3_1 + tmp3_2);
    gl64_t kD420 = s0_420_0 * tmp3_0;
    gl64_t kE420 = s0_420_1 * tmp3_1;
    gl64_t kF420 = s0_420_2 * tmp3_2;
    gl64_t kG420 = kD420 - kE420;
    tmp3_0 = (kC420 + kG420) - kF420;
    tmp3_1 = ((((kA420 + kC420) - kE420) - kE420) - kD420);
    tmp3_2 = kB420 - kG420;
    // Op 421: dim1x1 sub_swap
    gl64_t s0_421 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    gl64_t s1_421 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_421 - s0_421;
    // Op 422: dim3x3 add
    gl64_t s1_422_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_422_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_422_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_422_0; tmp3_7 = tmp3_7 + s1_422_1; tmp3_8 = tmp3_8 + s1_422_2;
    // Op 423: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 424: dim1x1 sub_swap
    gl64_t s0_424 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    gl64_t s1_424 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_424 - s0_424;
    // Op 425: dim3x3 add
    gl64_t s1_425_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_425_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_425_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_425_0; tmp3_10 = tmp3_10 + s1_425_1; tmp3_11 = tmp3_11 + s1_425_2;
    // Op 426: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 427: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 428: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 429: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 430: dim3x3 mul
    gl64_t s1_430_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_430_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_430_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA430 = (tmp3_0 + tmp3_1) * (s1_430_0 + s1_430_1);
    gl64_t kB430 = (tmp3_0 + tmp3_2) * (s1_430_0 + s1_430_2);
    gl64_t kC430 = (tmp3_1 + tmp3_2) * (s1_430_1 + s1_430_2);
    gl64_t kD430 = tmp3_0 * s1_430_0;
    gl64_t kE430 = tmp3_1 * s1_430_1;
    gl64_t kF430 = tmp3_2 * s1_430_2;
    gl64_t kG430 = kD430 - kE430;
    tmp3_12 = (kC430 + kG430) - kF430;
    tmp3_13 = ((((kA430 + kC430) - kE430) - kE430) - kD430);
    tmp3_14 = kB430 - kG430;
    // Op 431: dim3x1 mul
    gl64_t s0_431_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_431_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_431_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_431 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    tmp3_0 = s0_431_0 * s1_431; tmp3_1 = s0_431_1 * s1_431; tmp3_2 = s0_431_2 * s1_431;
    // Op 432: dim3x1 add
    gl64_t s1_432 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_432; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    gl64_t s1_434 = *(gl64_t*)&expressions_params[9][2];
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
    // Op 436: dim1x1 mul
    gl64_t s0_436 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_436 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_436 * s1_436;
    // Op 437: dim1x1 add
    gl64_t s1_437 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_437;
    // Op 438: dim1x1 add
    gl64_t s1_438 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_438;
    // Op 439: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 441: dim1x1 mul
    gl64_t s0_441 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_441 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_441 * s1_441;
    // Op 442: dim1x1 add
    gl64_t s1_442 = *(gl64_t*)&expressions_params[9][8];
    tmp1_0 = tmp1_0 + s1_442;
    // Op 443: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 444: dim3x3 mul
    gl64_t s1_444_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_444_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_444_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA444 = (tmp3_0 + tmp3_1) * (s1_444_0 + s1_444_1);
    gl64_t kB444 = (tmp3_0 + tmp3_2) * (s1_444_0 + s1_444_2);
    gl64_t kC444 = (tmp3_1 + tmp3_2) * (s1_444_1 + s1_444_2);
    gl64_t kD444 = tmp3_0 * s1_444_0;
    gl64_t kE444 = tmp3_1 * s1_444_1;
    gl64_t kF444 = tmp3_2 * s1_444_2;
    gl64_t kG444 = kD444 - kE444;
    tmp3_0 = (kC444 + kG444) - kF444;
    tmp3_1 = ((((kA444 + kC444) - kE444) - kE444) - kD444);
    tmp3_2 = kB444 - kG444;
    // Op 445: dim3x1 add
    gl64_t s1_445 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_445; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 446: dim3x3 mul
    gl64_t s1_446_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_446_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_446_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA446 = (tmp3_0 + tmp3_1) * (s1_446_0 + s1_446_1);
    gl64_t kB446 = (tmp3_0 + tmp3_2) * (s1_446_0 + s1_446_2);
    gl64_t kC446 = (tmp3_1 + tmp3_2) * (s1_446_1 + s1_446_2);
    gl64_t kD446 = tmp3_0 * s1_446_0;
    gl64_t kE446 = tmp3_1 * s1_446_1;
    gl64_t kF446 = tmp3_2 * s1_446_2;
    gl64_t kG446 = kD446 - kE446;
    tmp3_0 = (kC446 + kG446) - kF446;
    tmp3_1 = ((((kA446 + kC446) - kE446) - kE446) - kD446);
    tmp3_2 = kB446 - kG446;
    // Op 447: dim3x1 add
    gl64_t s1_447 = *(gl64_t*)&expressions_params[9][5];
    tmp3_9 = tmp3_0 + s1_447; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 448: dim3x3 add
    gl64_t s1_448_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_448_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_448_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_448_0; tmp3_4 = tmp3_10 + s1_448_1; tmp3_5 = tmp3_11 + s1_448_2;
    // Op 449: dim3x1 mul
    gl64_t s0_449_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_449_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_449_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_449 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    tmp3_0 = s0_449_0 * s1_449; tmp3_1 = s0_449_1 * s1_449; tmp3_2 = s0_449_2 * s1_449;
    // Op 450: dim3x1 add
    gl64_t s1_450 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_450; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 451: dim3x3 mul
    gl64_t s1_451_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_451_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_451_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA451 = (tmp3_0 + tmp3_1) * (s1_451_0 + s1_451_1);
    gl64_t kB451 = (tmp3_0 + tmp3_2) * (s1_451_0 + s1_451_2);
    gl64_t kC451 = (tmp3_1 + tmp3_2) * (s1_451_1 + s1_451_2);
    gl64_t kD451 = tmp3_0 * s1_451_0;
    gl64_t kE451 = tmp3_1 * s1_451_1;
    gl64_t kF451 = tmp3_2 * s1_451_2;
    gl64_t kG451 = kD451 - kE451;
    tmp3_0 = (kC451 + kG451) - kF451;
    tmp3_1 = ((((kA451 + kC451) - kE451) - kE451) - kD451);
    tmp3_2 = kB451 - kG451;
    // Op 452: dim3x1 add
    gl64_t s1_452 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_452; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 454: dim1x1 mul
    gl64_t s0_454 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_454 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_454 * s1_454;
    // Op 455: dim1x1 add
    gl64_t s1_455 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_455;
    // Op 456: dim1x1 add
    gl64_t s0_456 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    tmp1_0 = s0_456 + tmp1_0;
    // Op 457: dim1x1 add
    gl64_t s1_457 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_457;
    // Op 458: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 459: dim3x3 mul
    gl64_t s1_459_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_459_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_459_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA459 = (tmp3_0 + tmp3_1) * (s1_459_0 + s1_459_1);
    gl64_t kB459 = (tmp3_0 + tmp3_2) * (s1_459_0 + s1_459_2);
    gl64_t kC459 = (tmp3_1 + tmp3_2) * (s1_459_1 + s1_459_2);
    gl64_t kD459 = tmp3_0 * s1_459_0;
    gl64_t kE459 = tmp3_1 * s1_459_1;
    gl64_t kF459 = tmp3_2 * s1_459_2;
    gl64_t kG459 = kD459 - kE459;
    tmp3_0 = (kC459 + kG459) - kF459;
    tmp3_1 = ((((kA459 + kC459) - kE459) - kE459) - kD459);
    tmp3_2 = kB459 - kG459;
    // Op 460: dim1x1 mul
    gl64_t s0_460 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_460 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_460 * s1_460;
    // Op 461: dim1x1 add
    gl64_t s1_461 = *(gl64_t*)&expressions_params[9][8];
    tmp1_0 = tmp1_0 + s1_461;
    // Op 462: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 463: dim3x3 mul
    gl64_t s1_463_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_463_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_463_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA463 = (tmp3_0 + tmp3_1) * (s1_463_0 + s1_463_1);
    gl64_t kB463 = (tmp3_0 + tmp3_2) * (s1_463_0 + s1_463_2);
    gl64_t kC463 = (tmp3_1 + tmp3_2) * (s1_463_1 + s1_463_2);
    gl64_t kD463 = tmp3_0 * s1_463_0;
    gl64_t kE463 = tmp3_1 * s1_463_1;
    gl64_t kF463 = tmp3_2 * s1_463_2;
    gl64_t kG463 = kD463 - kE463;
    tmp3_0 = (kC463 + kG463) - kF463;
    tmp3_1 = ((((kA463 + kC463) - kE463) - kE463) - kD463);
    tmp3_2 = kB463 - kG463;
    // Op 464: dim1x1 add
    gl64_t s0_464 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_464 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_464 + s1_464;
    // Op 465: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 466: dim3x3 mul
    gl64_t s1_466_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_466_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_466_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA466 = (tmp3_0 + tmp3_1) * (s1_466_0 + s1_466_1);
    gl64_t kB466 = (tmp3_0 + tmp3_2) * (s1_466_0 + s1_466_2);
    gl64_t kC466 = (tmp3_1 + tmp3_2) * (s1_466_1 + s1_466_2);
    gl64_t kD466 = tmp3_0 * s1_466_0;
    gl64_t kE466 = tmp3_1 * s1_466_1;
    gl64_t kF466 = tmp3_2 * s1_466_2;
    gl64_t kG466 = kD466 - kE466;
    tmp3_0 = (kC466 + kG466) - kF466;
    tmp3_1 = ((((kA466 + kC466) - kE466) - kE466) - kD466);
    tmp3_2 = kB466 - kG466;
    // Op 467: dim3x1 add
    gl64_t s1_467 = *(gl64_t*)&expressions_params[9][5];
    tmp3_6 = tmp3_0 + s1_467; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 468: dim3x3 add
    gl64_t s1_468_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_468_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_468_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_468_0; tmp3_1 = tmp3_7 + s1_468_1; tmp3_2 = tmp3_8 + s1_468_2;
    // Op 469: dim3x3 mul
    gl64_t kA469 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB469 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC469 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD469 = tmp3_3 * tmp3_0;
    gl64_t kE469 = tmp3_4 * tmp3_1;
    gl64_t kF469 = tmp3_5 * tmp3_2;
    gl64_t kG469 = kD469 - kE469;
    tmp3_0 = (kC469 + kG469) - kF469;
    tmp3_1 = ((((kA469 + kC469) - kE469) - kE469) - kD469);
    tmp3_2 = kB469 - kG469;
    // Op 470: dim3x3 mul
    gl64_t s0_470_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+0, domainSize, nCols_2))];
    gl64_t s0_470_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+1, domainSize, nCols_2))];
    gl64_t s0_470_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+2, domainSize, nCols_2))];
    gl64_t kA470 = (s0_470_0 + s0_470_1) * (tmp3_0 + tmp3_1);
    gl64_t kB470 = (s0_470_0 + s0_470_2) * (tmp3_0 + tmp3_2);
    gl64_t kC470 = (s0_470_1 + s0_470_2) * (tmp3_1 + tmp3_2);
    gl64_t kD470 = s0_470_0 * tmp3_0;
    gl64_t kE470 = s0_470_1 * tmp3_1;
    gl64_t kF470 = s0_470_2 * tmp3_2;
    gl64_t kG470 = kD470 - kE470;
    tmp3_0 = (kC470 + kG470) - kF470;
    tmp3_1 = ((((kA470 + kC470) - kE470) - kE470) - kD470);
    tmp3_2 = kB470 - kG470;
    // Op 471: dim1x1 sub_swap
    gl64_t s0_471 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    gl64_t s1_471 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_471 - s0_471;
    // Op 472: dim3x3 add
    gl64_t s1_472_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_472_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_472_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_472_0; tmp3_7 = tmp3_7 + s1_472_1; tmp3_8 = tmp3_8 + s1_472_2;
    // Op 473: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 474: dim1x1 sub_swap
    gl64_t s0_474 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    gl64_t s1_474 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_474 - s0_474;
    // Op 475: dim3x3 add
    gl64_t s1_475_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_475_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_475_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_475_0; tmp3_10 = tmp3_10 + s1_475_1; tmp3_11 = tmp3_11 + s1_475_2;
    // Op 476: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 477: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 478: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 479: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 480: dim3x3 mul
    gl64_t s1_480_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_480_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_480_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA480 = (tmp3_0 + tmp3_1) * (s1_480_0 + s1_480_1);
    gl64_t kB480 = (tmp3_0 + tmp3_2) * (s1_480_0 + s1_480_2);
    gl64_t kC480 = (tmp3_1 + tmp3_2) * (s1_480_1 + s1_480_2);
    gl64_t kD480 = tmp3_0 * s1_480_0;
    gl64_t kE480 = tmp3_1 * s1_480_1;
    gl64_t kF480 = tmp3_2 * s1_480_2;
    gl64_t kG480 = kD480 - kE480;
    tmp3_3 = (kC480 + kG480) - kF480;
    tmp3_4 = ((((kA480 + kC480) - kE480) - kE480) - kD480);
    tmp3_5 = kB480 - kG480;
    // Op 481: dim3x1 mul
    gl64_t s0_481_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_481_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_481_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_481 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    tmp3_0 = s0_481_0 * s1_481; tmp3_1 = s0_481_1 * s1_481; tmp3_2 = s0_481_2 * s1_481;
    // Op 482: dim3x1 add
    gl64_t s1_482 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_482; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 483: dim3x3 mul
    gl64_t s1_483_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_483_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_483_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA483 = (tmp3_0 + tmp3_1) * (s1_483_0 + s1_483_1);
    gl64_t kB483 = (tmp3_0 + tmp3_2) * (s1_483_0 + s1_483_2);
    gl64_t kC483 = (tmp3_1 + tmp3_2) * (s1_483_1 + s1_483_2);
    gl64_t kD483 = tmp3_0 * s1_483_0;
    gl64_t kE483 = tmp3_1 * s1_483_1;
    gl64_t kF483 = tmp3_2 * s1_483_2;
    gl64_t kG483 = kD483 - kE483;
    tmp3_0 = (kC483 + kG483) - kF483;
    tmp3_1 = ((((kA483 + kC483) - kE483) - kE483) - kD483);
    tmp3_2 = kB483 - kG483;
    // Op 484: dim3x1 add
    gl64_t s1_484 = *(gl64_t*)&expressions_params[9][2];
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
    gl64_t s0_486 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_486 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_486 * s1_486;
    // Op 487: dim1x1 add
    gl64_t s1_487 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_487;
    // Op 488: dim1x1 add
    gl64_t s1_488 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_488;
    // Op 489: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 490: dim3x3 mul
    gl64_t s1_490_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_490_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_490_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA490 = (tmp3_0 + tmp3_1) * (s1_490_0 + s1_490_1);
    gl64_t kB490 = (tmp3_0 + tmp3_2) * (s1_490_0 + s1_490_2);
    gl64_t kC490 = (tmp3_1 + tmp3_2) * (s1_490_1 + s1_490_2);
    gl64_t kD490 = tmp3_0 * s1_490_0;
    gl64_t kE490 = tmp3_1 * s1_490_1;
    gl64_t kF490 = tmp3_2 * s1_490_2;
    gl64_t kG490 = kD490 - kE490;
    tmp3_0 = (kC490 + kG490) - kF490;
    tmp3_1 = ((((kA490 + kC490) - kE490) - kE490) - kD490);
    tmp3_2 = kB490 - kG490;
    // Op 491: dim1x1 mul
    gl64_t s0_491 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_491 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_491 * s1_491;
    // Op 492: dim1x1 add
    gl64_t s1_492 = *(gl64_t*)&expressions_params[9][9];
    tmp1_0 = tmp1_0 + s1_492;
    // Op 493: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 495: dim3x1 add
    gl64_t s1_495 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_495; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 496: dim3x3 mul
    gl64_t s1_496_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_496_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_496_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA496 = (tmp3_0 + tmp3_1) * (s1_496_0 + s1_496_1);
    gl64_t kB496 = (tmp3_0 + tmp3_2) * (s1_496_0 + s1_496_2);
    gl64_t kC496 = (tmp3_1 + tmp3_2) * (s1_496_1 + s1_496_2);
    gl64_t kD496 = tmp3_0 * s1_496_0;
    gl64_t kE496 = tmp3_1 * s1_496_1;
    gl64_t kF496 = tmp3_2 * s1_496_2;
    gl64_t kG496 = kD496 - kE496;
    tmp3_0 = (kC496 + kG496) - kF496;
    tmp3_1 = ((((kA496 + kC496) - kE496) - kE496) - kD496);
    tmp3_2 = kB496 - kG496;
    // Op 497: dim3x1 add
    gl64_t s1_497 = *(gl64_t*)&expressions_params[9][5];
    tmp3_9 = tmp3_0 + s1_497; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 498: dim3x3 add
    gl64_t s1_498_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_498_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_498_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_12 = tmp3_9 + s1_498_0; tmp3_13 = tmp3_10 + s1_498_1; tmp3_14 = tmp3_11 + s1_498_2;
    // Op 499: dim3x1 mul
    gl64_t s0_499_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_499_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_499_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_499 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 26, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 26, domainSize, nCols_1))];
    tmp3_0 = s0_499_0 * s1_499; tmp3_1 = s0_499_1 * s1_499; tmp3_2 = s0_499_2 * s1_499;
    // Op 500: dim3x1 add
    gl64_t s1_500 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 25, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 25, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_500; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 502: dim3x1 add
    gl64_t s1_502 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_502; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 503: dim3x3 mul
    gl64_t s1_503_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_503_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_503_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA503 = (tmp3_0 + tmp3_1) * (s1_503_0 + s1_503_1);
    gl64_t kB503 = (tmp3_0 + tmp3_2) * (s1_503_0 + s1_503_2);
    gl64_t kC503 = (tmp3_1 + tmp3_2) * (s1_503_1 + s1_503_2);
    gl64_t kD503 = tmp3_0 * s1_503_0;
    gl64_t kE503 = tmp3_1 * s1_503_1;
    gl64_t kF503 = tmp3_2 * s1_503_2;
    gl64_t kG503 = kD503 - kE503;
    tmp3_0 = (kC503 + kG503) - kF503;
    tmp3_1 = ((((kA503 + kC503) - kE503) - kE503) - kD503);
    tmp3_2 = kB503 - kG503;
    // Op 504: dim1x1 mul
    gl64_t s0_504 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_504 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_504 * s1_504;
    // Op 505: dim1x1 add
    gl64_t s1_505 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_505;
    // Op 506: dim1x1 add
    gl64_t s0_506 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    tmp1_0 = s0_506 + tmp1_0;
    // Op 507: dim1x1 add
    gl64_t s1_507 = *(gl64_t*)&expressions_params[9][4];
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
    // Op 510: dim1x1 mul
    gl64_t s0_510 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_510 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_510 * s1_510;
    // Op 511: dim1x1 add
    gl64_t s1_511 = *(gl64_t*)&expressions_params[9][9];
    tmp1_0 = tmp1_0 + s1_511;
    // Op 512: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 513: dim3x3 mul
    gl64_t s1_513_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_513_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_513_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA513 = (tmp3_0 + tmp3_1) * (s1_513_0 + s1_513_1);
    gl64_t kB513 = (tmp3_0 + tmp3_2) * (s1_513_0 + s1_513_2);
    gl64_t kC513 = (tmp3_1 + tmp3_2) * (s1_513_1 + s1_513_2);
    gl64_t kD513 = tmp3_0 * s1_513_0;
    gl64_t kE513 = tmp3_1 * s1_513_1;
    gl64_t kF513 = tmp3_2 * s1_513_2;
    gl64_t kG513 = kD513 - kE513;
    tmp3_0 = (kC513 + kG513) - kF513;
    tmp3_1 = ((((kA513 + kC513) - kE513) - kE513) - kD513);
    tmp3_2 = kB513 - kG513;
    // Op 514: dim1x1 add
    gl64_t s0_514 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_514 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_514 + s1_514;
    // Op 515: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 516: dim3x3 mul
    gl64_t s1_516_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_516_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_516_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA516 = (tmp3_0 + tmp3_1) * (s1_516_0 + s1_516_1);
    gl64_t kB516 = (tmp3_0 + tmp3_2) * (s1_516_0 + s1_516_2);
    gl64_t kC516 = (tmp3_1 + tmp3_2) * (s1_516_1 + s1_516_2);
    gl64_t kD516 = tmp3_0 * s1_516_0;
    gl64_t kE516 = tmp3_1 * s1_516_1;
    gl64_t kF516 = tmp3_2 * s1_516_2;
    gl64_t kG516 = kD516 - kE516;
    tmp3_0 = (kC516 + kG516) - kF516;
    tmp3_1 = ((((kA516 + kC516) - kE516) - kE516) - kD516);
    tmp3_2 = kB516 - kG516;
    // Op 517: dim3x1 add
    gl64_t s1_517 = *(gl64_t*)&expressions_params[9][5];
    tmp3_6 = tmp3_0 + s1_517; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 518: dim3x3 add
    gl64_t s1_518_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_518_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_518_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_518_0; tmp3_1 = tmp3_7 + s1_518_1; tmp3_2 = tmp3_8 + s1_518_2;
    // Op 519: dim3x3 mul
    gl64_t kA519 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB519 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC519 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD519 = tmp3_12 * tmp3_0;
    gl64_t kE519 = tmp3_13 * tmp3_1;
    gl64_t kF519 = tmp3_14 * tmp3_2;
    gl64_t kG519 = kD519 - kE519;
    tmp3_0 = (kC519 + kG519) - kF519;
    tmp3_1 = ((((kA519 + kC519) - kE519) - kE519) - kD519);
    tmp3_2 = kB519 - kG519;
    // Op 520: dim3x3 mul
    gl64_t s0_520_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+0, domainSize, nCols_2))];
    gl64_t s0_520_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+1, domainSize, nCols_2))];
    gl64_t s0_520_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+2, domainSize, nCols_2))];
    gl64_t kA520 = (s0_520_0 + s0_520_1) * (tmp3_0 + tmp3_1);
    gl64_t kB520 = (s0_520_0 + s0_520_2) * (tmp3_0 + tmp3_2);
    gl64_t kC520 = (s0_520_1 + s0_520_2) * (tmp3_1 + tmp3_2);
    gl64_t kD520 = s0_520_0 * tmp3_0;
    gl64_t kE520 = s0_520_1 * tmp3_1;
    gl64_t kF520 = s0_520_2 * tmp3_2;
    gl64_t kG520 = kD520 - kE520;
    tmp3_0 = (kC520 + kG520) - kF520;
    tmp3_1 = ((((kA520 + kC520) - kE520) - kE520) - kD520);
    tmp3_2 = kB520 - kG520;
    // Op 521: dim1x1 sub_swap
    gl64_t s0_521 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    gl64_t s1_521 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_521 - s0_521;
    // Op 522: dim3x3 add
    gl64_t s1_522_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_522_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_522_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_522_0; tmp3_7 = tmp3_7 + s1_522_1; tmp3_8 = tmp3_8 + s1_522_2;
    // Op 523: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 524: dim1x1 sub_swap
    gl64_t s0_524 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    gl64_t s1_524 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_524 - s0_524;
    // Op 525: dim3x3 add
    gl64_t s1_525_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_525_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_525_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_525_0; tmp3_10 = tmp3_10 + s1_525_1; tmp3_11 = tmp3_11 + s1_525_2;
    // Op 526: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 527: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 528: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 529: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 530: dim3x3 mul
    gl64_t s1_530_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_530_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_530_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA530 = (tmp3_0 + tmp3_1) * (s1_530_0 + s1_530_1);
    gl64_t kB530 = (tmp3_0 + tmp3_2) * (s1_530_0 + s1_530_2);
    gl64_t kC530 = (tmp3_1 + tmp3_2) * (s1_530_1 + s1_530_2);
    gl64_t kD530 = tmp3_0 * s1_530_0;
    gl64_t kE530 = tmp3_1 * s1_530_1;
    gl64_t kF530 = tmp3_2 * s1_530_2;
    gl64_t kG530 = kD530 - kE530;
    tmp3_12 = (kC530 + kG530) - kF530;
    tmp3_13 = ((((kA530 + kC530) - kE530) - kE530) - kD530);
    tmp3_14 = kB530 - kG530;
    // Op 531: dim3x1 mul
    gl64_t s0_531_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_531_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_531_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_531 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    tmp3_0 = s0_531_0 * s1_531; tmp3_1 = s0_531_1 * s1_531; tmp3_2 = s0_531_2 * s1_531;
    // Op 532: dim3x1 add
    gl64_t s1_532 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 27, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_532; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    tmp3_0 = tmp3_0 + s1_534; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 535: dim3x3 mul
    gl64_t s1_535_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_535_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_535_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA535 = (tmp3_0 + tmp3_1) * (s1_535_0 + s1_535_1);
    gl64_t kB535 = (tmp3_0 + tmp3_2) * (s1_535_0 + s1_535_2);
    gl64_t kC535 = (tmp3_1 + tmp3_2) * (s1_535_1 + s1_535_2);
    gl64_t kD535 = tmp3_0 * s1_535_0;
    gl64_t kE535 = tmp3_1 * s1_535_1;
    gl64_t kF535 = tmp3_2 * s1_535_2;
    gl64_t kG535 = kD535 - kE535;
    tmp3_0 = (kC535 + kG535) - kF535;
    tmp3_1 = ((((kA535 + kC535) - kE535) - kE535) - kD535);
    tmp3_2 = kB535 - kG535;
    // Op 536: dim1x1 mul
    gl64_t s0_536 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_536 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_536 * s1_536;
    // Op 537: dim1x1 add
    gl64_t s1_537 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_537;
    // Op 538: dim1x1 add
    gl64_t s1_538 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_538;
    // Op 539: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 540: dim3x3 mul
    gl64_t s1_540_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_540_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_540_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA540 = (tmp3_0 + tmp3_1) * (s1_540_0 + s1_540_1);
    gl64_t kB540 = (tmp3_0 + tmp3_2) * (s1_540_0 + s1_540_2);
    gl64_t kC540 = (tmp3_1 + tmp3_2) * (s1_540_1 + s1_540_2);
    gl64_t kD540 = tmp3_0 * s1_540_0;
    gl64_t kE540 = tmp3_1 * s1_540_1;
    gl64_t kF540 = tmp3_2 * s1_540_2;
    gl64_t kG540 = kD540 - kE540;
    tmp3_0 = (kC540 + kG540) - kF540;
    tmp3_1 = ((((kA540 + kC540) - kE540) - kE540) - kD540);
    tmp3_2 = kB540 - kG540;
    // Op 541: dim1x1 mul
    gl64_t s0_541 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_541 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_541 * s1_541;
    // Op 542: dim1x1 add
    gl64_t s1_542 = *(gl64_t*)&expressions_params[9][10];
    tmp1_0 = tmp1_0 + s1_542;
    // Op 543: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 544: dim3x3 mul
    gl64_t s1_544_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_544_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_544_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA544 = (tmp3_0 + tmp3_1) * (s1_544_0 + s1_544_1);
    gl64_t kB544 = (tmp3_0 + tmp3_2) * (s1_544_0 + s1_544_2);
    gl64_t kC544 = (tmp3_1 + tmp3_2) * (s1_544_1 + s1_544_2);
    gl64_t kD544 = tmp3_0 * s1_544_0;
    gl64_t kE544 = tmp3_1 * s1_544_1;
    gl64_t kF544 = tmp3_2 * s1_544_2;
    gl64_t kG544 = kD544 - kE544;
    tmp3_0 = (kC544 + kG544) - kF544;
    tmp3_1 = ((((kA544 + kC544) - kE544) - kE544) - kD544);
    tmp3_2 = kB544 - kG544;
    // Op 545: dim3x1 add
    gl64_t s1_545 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_545; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 547: dim3x1 add
    gl64_t s1_547 = *(gl64_t*)&expressions_params[9][5];
    tmp3_9 = tmp3_0 + s1_547; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 548: dim3x3 add
    gl64_t s1_548_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_548_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_548_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_548_0; tmp3_4 = tmp3_10 + s1_548_1; tmp3_5 = tmp3_11 + s1_548_2;
    // Op 549: dim3x1 mul
    gl64_t s0_549_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_549_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_549_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_549 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 28, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 28, domainSize, nCols_1))];
    tmp3_0 = s0_549_0 * s1_549; tmp3_1 = s0_549_1 * s1_549; tmp3_2 = s0_549_2 * s1_549;
    // Op 550: dim3x1 add
    gl64_t s1_550 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 27, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_550; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 551: dim3x3 mul
    gl64_t s1_551_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_551_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_551_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA551 = (tmp3_0 + tmp3_1) * (s1_551_0 + s1_551_1);
    gl64_t kB551 = (tmp3_0 + tmp3_2) * (s1_551_0 + s1_551_2);
    gl64_t kC551 = (tmp3_1 + tmp3_2) * (s1_551_1 + s1_551_2);
    gl64_t kD551 = tmp3_0 * s1_551_0;
    gl64_t kE551 = tmp3_1 * s1_551_1;
    gl64_t kF551 = tmp3_2 * s1_551_2;
    gl64_t kG551 = kD551 - kE551;
    tmp3_0 = (kC551 + kG551) - kF551;
    tmp3_1 = ((((kA551 + kC551) - kE551) - kE551) - kD551);
    tmp3_2 = kB551 - kG551;
    // Op 552: dim3x1 add
    gl64_t s1_552 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_552; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 553: dim3x3 mul
    gl64_t s1_553_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_553_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_553_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA553 = (tmp3_0 + tmp3_1) * (s1_553_0 + s1_553_1);
    gl64_t kB553 = (tmp3_0 + tmp3_2) * (s1_553_0 + s1_553_2);
    gl64_t kC553 = (tmp3_1 + tmp3_2) * (s1_553_1 + s1_553_2);
    gl64_t kD553 = tmp3_0 * s1_553_0;
    gl64_t kE553 = tmp3_1 * s1_553_1;
    gl64_t kF553 = tmp3_2 * s1_553_2;
    gl64_t kG553 = kD553 - kE553;
    tmp3_0 = (kC553 + kG553) - kF553;
    tmp3_1 = ((((kA553 + kC553) - kE553) - kE553) - kD553);
    tmp3_2 = kB553 - kG553;
    // Op 554: dim1x1 mul
    gl64_t s0_554 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_554 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_554 * s1_554;
    // Op 555: dim1x1 add
    gl64_t s1_555 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_555;
    // Op 556: dim1x1 add
    gl64_t s0_556 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    tmp1_0 = s0_556 + tmp1_0;
    // Op 557: dim1x1 add
    gl64_t s1_557 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_557;
    // Op 558: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 559: dim3x3 mul
    gl64_t s1_559_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_559_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_559_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA559 = (tmp3_0 + tmp3_1) * (s1_559_0 + s1_559_1);
    gl64_t kB559 = (tmp3_0 + tmp3_2) * (s1_559_0 + s1_559_2);
    gl64_t kC559 = (tmp3_1 + tmp3_2) * (s1_559_1 + s1_559_2);
    gl64_t kD559 = tmp3_0 * s1_559_0;
    gl64_t kE559 = tmp3_1 * s1_559_1;
    gl64_t kF559 = tmp3_2 * s1_559_2;
    gl64_t kG559 = kD559 - kE559;
    tmp3_0 = (kC559 + kG559) - kF559;
    tmp3_1 = ((((kA559 + kC559) - kE559) - kE559) - kD559);
    tmp3_2 = kB559 - kG559;
    // Op 560: dim1x1 mul
    gl64_t s0_560 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_560 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_560 * s1_560;
    // Op 561: dim1x1 add
    gl64_t s1_561 = *(gl64_t*)&expressions_params[9][10];
    tmp1_0 = tmp1_0 + s1_561;
    // Op 562: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 563: dim3x3 mul
    gl64_t s1_563_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_563_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_563_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA563 = (tmp3_0 + tmp3_1) * (s1_563_0 + s1_563_1);
    gl64_t kB563 = (tmp3_0 + tmp3_2) * (s1_563_0 + s1_563_2);
    gl64_t kC563 = (tmp3_1 + tmp3_2) * (s1_563_1 + s1_563_2);
    gl64_t kD563 = tmp3_0 * s1_563_0;
    gl64_t kE563 = tmp3_1 * s1_563_1;
    gl64_t kF563 = tmp3_2 * s1_563_2;
    gl64_t kG563 = kD563 - kE563;
    tmp3_0 = (kC563 + kG563) - kF563;
    tmp3_1 = ((((kA563 + kC563) - kE563) - kE563) - kD563);
    tmp3_2 = kB563 - kG563;
    // Op 564: dim1x1 add
    gl64_t s0_564 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_564 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_564 + s1_564;
    // Op 565: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 566: dim3x3 mul
    gl64_t s1_566_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_566_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_566_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA566 = (tmp3_0 + tmp3_1) * (s1_566_0 + s1_566_1);
    gl64_t kB566 = (tmp3_0 + tmp3_2) * (s1_566_0 + s1_566_2);
    gl64_t kC566 = (tmp3_1 + tmp3_2) * (s1_566_1 + s1_566_2);
    gl64_t kD566 = tmp3_0 * s1_566_0;
    gl64_t kE566 = tmp3_1 * s1_566_1;
    gl64_t kF566 = tmp3_2 * s1_566_2;
    gl64_t kG566 = kD566 - kE566;
    tmp3_0 = (kC566 + kG566) - kF566;
    tmp3_1 = ((((kA566 + kC566) - kE566) - kE566) - kD566);
    tmp3_2 = kB566 - kG566;
    // Op 567: dim3x1 add
    gl64_t s1_567 = *(gl64_t*)&expressions_params[9][5];
    tmp3_6 = tmp3_0 + s1_567; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 568: dim3x3 add
    gl64_t s1_568_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_568_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_568_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_568_0; tmp3_1 = tmp3_7 + s1_568_1; tmp3_2 = tmp3_8 + s1_568_2;
    // Op 569: dim3x3 mul
    gl64_t kA569 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB569 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC569 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD569 = tmp3_3 * tmp3_0;
    gl64_t kE569 = tmp3_4 * tmp3_1;
    gl64_t kF569 = tmp3_5 * tmp3_2;
    gl64_t kG569 = kD569 - kE569;
    tmp3_0 = (kC569 + kG569) - kF569;
    tmp3_1 = ((((kA569 + kC569) - kE569) - kE569) - kD569);
    tmp3_2 = kB569 - kG569;
    // Op 570: dim3x3 mul
    uint64_t s0_570_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_2));
    gl64_t s0_570_0 = *(gl64_t*)&dParams->aux_trace[s0_570_pos];
    gl64_t s0_570_1 = *(gl64_t*)&dParams->aux_trace[s0_570_pos + TILE_HEIGHT];
    gl64_t s0_570_2 = *(gl64_t*)&dParams->aux_trace[s0_570_pos + 2*TILE_HEIGHT];
    gl64_t kA570 = (s0_570_0 + s0_570_1) * (tmp3_0 + tmp3_1);
    gl64_t kB570 = (s0_570_0 + s0_570_2) * (tmp3_0 + tmp3_2);
    gl64_t kC570 = (s0_570_1 + s0_570_2) * (tmp3_1 + tmp3_2);
    gl64_t kD570 = s0_570_0 * tmp3_0;
    gl64_t kE570 = s0_570_1 * tmp3_1;
    gl64_t kF570 = s0_570_2 * tmp3_2;
    gl64_t kG570 = kD570 - kE570;
    tmp3_0 = (kC570 + kG570) - kF570;
    tmp3_1 = ((((kA570 + kC570) - kE570) - kE570) - kD570);
    tmp3_2 = kB570 - kG570;
    // Op 571: dim1x1 sub_swap
    gl64_t s0_571 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    gl64_t s1_571 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_571 - s0_571;
    // Op 572: dim3x3 add
    gl64_t s1_572_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_572_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_572_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_572_0; tmp3_7 = tmp3_7 + s1_572_1; tmp3_8 = tmp3_8 + s1_572_2;
    // Op 573: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 574: dim1x1 sub_swap
    gl64_t s0_574 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    gl64_t s1_574 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_574 - s0_574;
    // Op 575: dim3x3 add
    gl64_t s1_575_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_575_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_575_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_575_0; tmp3_10 = tmp3_10 + s1_575_1; tmp3_11 = tmp3_11 + s1_575_2;
    // Op 576: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 577: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 578: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 579: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 580: dim3x3 mul
    gl64_t s1_580_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_580_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_580_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA580 = (tmp3_0 + tmp3_1) * (s1_580_0 + s1_580_1);
    gl64_t kB580 = (tmp3_0 + tmp3_2) * (s1_580_0 + s1_580_2);
    gl64_t kC580 = (tmp3_1 + tmp3_2) * (s1_580_1 + s1_580_2);
    gl64_t kD580 = tmp3_0 * s1_580_0;
    gl64_t kE580 = tmp3_1 * s1_580_1;
    gl64_t kF580 = tmp3_2 * s1_580_2;
    gl64_t kG580 = kD580 - kE580;
    tmp3_3 = (kC580 + kG580) - kF580;
    tmp3_4 = ((((kA580 + kC580) - kE580) - kE580) - kD580);
    tmp3_5 = kB580 - kG580;
    // Op 581: dim3x1 mul
    gl64_t s0_581_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_581_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_581_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_581 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    tmp3_0 = s0_581_0 * s1_581; tmp3_1 = s0_581_1 * s1_581; tmp3_2 = s0_581_2 * s1_581;
    // Op 582: dim3x1 add
    gl64_t s1_582 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
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
    gl64_t s1_584 = *(gl64_t*)&expressions_params[9][2];
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
    // Op 586: dim1x1 mul
    gl64_t s0_586 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_586 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_586 * s1_586;
    // Op 587: dim1x1 add
    gl64_t s1_587 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_587;
    // Op 588: dim1x1 add
    gl64_t s1_588 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_588;
    // Op 589: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 590: dim3x3 mul
    gl64_t s1_590_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_590_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_590_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA590 = (tmp3_0 + tmp3_1) * (s1_590_0 + s1_590_1);
    gl64_t kB590 = (tmp3_0 + tmp3_2) * (s1_590_0 + s1_590_2);
    gl64_t kC590 = (tmp3_1 + tmp3_2) * (s1_590_1 + s1_590_2);
    gl64_t kD590 = tmp3_0 * s1_590_0;
    gl64_t kE590 = tmp3_1 * s1_590_1;
    gl64_t kF590 = tmp3_2 * s1_590_2;
    gl64_t kG590 = kD590 - kE590;
    tmp3_0 = (kC590 + kG590) - kF590;
    tmp3_1 = ((((kA590 + kC590) - kE590) - kE590) - kD590);
    tmp3_2 = kB590 - kG590;
    // Op 591: dim1x1 mul
    gl64_t s0_591 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_591 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_591 * s1_591;
    // Op 592: dim1x1 add
    gl64_t s1_592 = *(gl64_t*)&expressions_params[9][11];
    tmp1_0 = tmp1_0 + s1_592;
    // Op 593: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 594: dim3x3 mul
    gl64_t s1_594_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_594_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_594_2 = *(gl64_t*)&expressions_params[13][0+2];
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
    // Op 595: dim3x1 add
    gl64_t s1_595 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_595; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 596: dim3x3 mul
    gl64_t s1_596_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_596_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_596_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA596 = (tmp3_0 + tmp3_1) * (s1_596_0 + s1_596_1);
    gl64_t kB596 = (tmp3_0 + tmp3_2) * (s1_596_0 + s1_596_2);
    gl64_t kC596 = (tmp3_1 + tmp3_2) * (s1_596_1 + s1_596_2);
    gl64_t kD596 = tmp3_0 * s1_596_0;
    gl64_t kE596 = tmp3_1 * s1_596_1;
    gl64_t kF596 = tmp3_2 * s1_596_2;
    gl64_t kG596 = kD596 - kE596;
    tmp3_0 = (kC596 + kG596) - kF596;
    tmp3_1 = ((((kA596 + kC596) - kE596) - kE596) - kD596);
    tmp3_2 = kB596 - kG596;
    // Op 597: dim3x1 add
    gl64_t s1_597 = *(gl64_t*)&expressions_params[9][5];
    tmp3_9 = tmp3_0 + s1_597; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 598: dim3x3 add
    gl64_t s1_598_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_598_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_598_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_12 = tmp3_9 + s1_598_0; tmp3_13 = tmp3_10 + s1_598_1; tmp3_14 = tmp3_11 + s1_598_2;
    // Op 599: dim3x1 mul
    gl64_t s0_599_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_599_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_599_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_599 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 30, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 30, domainSize, nCols_1))];
    tmp3_0 = s0_599_0 * s1_599; tmp3_1 = s0_599_1 * s1_599; tmp3_2 = s0_599_2 * s1_599;
    // Op 600: dim3x1 add
    gl64_t s1_600 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 29, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 29, domainSize, nCols_1))];
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
    gl64_t s1_602 = *(gl64_t*)&expressions_params[9][2];
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
    // Op 604: dim1x1 mul
    gl64_t s0_604 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_604 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_604 * s1_604;
    // Op 605: dim1x1 add
    gl64_t s1_605 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_605;
    // Op 606: dim1x1 add
    gl64_t s0_606 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    tmp1_0 = s0_606 + tmp1_0;
    // Op 607: dim1x1 add
    gl64_t s1_607 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_607;
    // Op 608: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 610: dim1x1 mul
    gl64_t s0_610 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_610 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_610 * s1_610;
    // Op 611: dim1x1 add
    gl64_t s1_611 = *(gl64_t*)&expressions_params[9][11];
    tmp1_0 = tmp1_0 + s1_611;
    // Op 612: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 613: dim3x3 mul
    gl64_t s1_613_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_613_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_613_2 = *(gl64_t*)&expressions_params[13][0+2];
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
    // Op 614: dim1x1 add
    gl64_t s0_614 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_614 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_614 + s1_614;
    // Op 615: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 616: dim3x3 mul
    gl64_t s1_616_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_616_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_616_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA616 = (tmp3_0 + tmp3_1) * (s1_616_0 + s1_616_1);
    gl64_t kB616 = (tmp3_0 + tmp3_2) * (s1_616_0 + s1_616_2);
    gl64_t kC616 = (tmp3_1 + tmp3_2) * (s1_616_1 + s1_616_2);
    gl64_t kD616 = tmp3_0 * s1_616_0;
    gl64_t kE616 = tmp3_1 * s1_616_1;
    gl64_t kF616 = tmp3_2 * s1_616_2;
    gl64_t kG616 = kD616 - kE616;
    tmp3_0 = (kC616 + kG616) - kF616;
    tmp3_1 = ((((kA616 + kC616) - kE616) - kE616) - kD616);
    tmp3_2 = kB616 - kG616;
    // Op 617: dim3x1 add
    gl64_t s1_617 = *(gl64_t*)&expressions_params[9][5];
    tmp3_6 = tmp3_0 + s1_617; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 618: dim3x3 add
    gl64_t s1_618_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_618_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_618_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_618_0; tmp3_1 = tmp3_7 + s1_618_1; tmp3_2 = tmp3_8 + s1_618_2;
    // Op 619: dim3x3 mul
    gl64_t kA619 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB619 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC619 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD619 = tmp3_12 * tmp3_0;
    gl64_t kE619 = tmp3_13 * tmp3_1;
    gl64_t kF619 = tmp3_14 * tmp3_2;
    gl64_t kG619 = kD619 - kE619;
    tmp3_0 = (kC619 + kG619) - kF619;
    tmp3_1 = ((((kA619 + kC619) - kE619) - kE619) - kD619);
    tmp3_2 = kB619 - kG619;
    // Op 620: dim3x3 mul
    uint64_t s0_620_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_2));
    gl64_t s0_620_0 = *(gl64_t*)&dParams->aux_trace[s0_620_pos];
    gl64_t s0_620_1 = *(gl64_t*)&dParams->aux_trace[s0_620_pos + TILE_HEIGHT];
    gl64_t s0_620_2 = *(gl64_t*)&dParams->aux_trace[s0_620_pos + 2*TILE_HEIGHT];
    gl64_t kA620 = (s0_620_0 + s0_620_1) * (tmp3_0 + tmp3_1);
    gl64_t kB620 = (s0_620_0 + s0_620_2) * (tmp3_0 + tmp3_2);
    gl64_t kC620 = (s0_620_1 + s0_620_2) * (tmp3_1 + tmp3_2);
    gl64_t kD620 = s0_620_0 * tmp3_0;
    gl64_t kE620 = s0_620_1 * tmp3_1;
    gl64_t kF620 = s0_620_2 * tmp3_2;
    gl64_t kG620 = kD620 - kE620;
    tmp3_0 = (kC620 + kG620) - kF620;
    tmp3_1 = ((((kA620 + kC620) - kE620) - kE620) - kD620);
    tmp3_2 = kB620 - kG620;
    // Op 621: dim1x1 sub_swap
    gl64_t s0_621 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    gl64_t s1_621 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_621 - s0_621;
    // Op 622: dim3x3 add
    gl64_t s1_622_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_622_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_622_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_622_0; tmp3_7 = tmp3_7 + s1_622_1; tmp3_8 = tmp3_8 + s1_622_2;
    // Op 623: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 624: dim1x1 sub_swap
    gl64_t s0_624 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    gl64_t s1_624 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_624 - s0_624;
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
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
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
    // Op 631: dim1x1 mul
    gl64_t s0_631 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_631 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_631 * s1_631;
    // Op 632: dim1x1 sub
    gl64_t s0_632 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_632 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    tmp1_3 = s0_632 - s1_632;
    // Op 633: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_3;
    // Op 634: dim3x1 mul
    gl64_t s0_634_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_634_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_634_2 = *(gl64_t*)&expressions_params[13][0+2];
    tmp3_0 = s0_634_0 * tmp1_0; tmp3_1 = s0_634_1 * tmp1_0; tmp3_2 = s0_634_2 * tmp1_0;
    // Op 635: dim3x1 add
    gl64_t s1_635 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_635; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 639: dim1x1 mul
    gl64_t s0_639 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_639 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_639 * s1_639;
    // Op 640: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 641: dim3x3 mul
    gl64_t s1_641_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_641_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_641_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA641 = (tmp3_0 + tmp3_1) * (s1_641_0 + s1_641_1);
    gl64_t kB641 = (tmp3_0 + tmp3_2) * (s1_641_0 + s1_641_2);
    gl64_t kC641 = (tmp3_1 + tmp3_2) * (s1_641_1 + s1_641_2);
    gl64_t kD641 = tmp3_0 * s1_641_0;
    gl64_t kE641 = tmp3_1 * s1_641_1;
    gl64_t kF641 = tmp3_2 * s1_641_2;
    gl64_t kG641 = kD641 - kE641;
    tmp3_0 = (kC641 + kG641) - kF641;
    tmp3_1 = ((((kA641 + kC641) - kE641) - kE641) - kD641);
    tmp3_2 = kB641 - kG641;
    // Op 642: dim3x3 mul
    gl64_t s1_642_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_642_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_642_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA642 = (tmp3_0 + tmp3_1) * (s1_642_0 + s1_642_1);
    gl64_t kB642 = (tmp3_0 + tmp3_2) * (s1_642_0 + s1_642_2);
    gl64_t kC642 = (tmp3_1 + tmp3_2) * (s1_642_1 + s1_642_2);
    gl64_t kD642 = tmp3_0 * s1_642_0;
    gl64_t kE642 = tmp3_1 * s1_642_1;
    gl64_t kF642 = tmp3_2 * s1_642_2;
    gl64_t kG642 = kD642 - kE642;
    tmp3_0 = (kC642 + kG642) - kF642;
    tmp3_1 = ((((kA642 + kC642) - kE642) - kE642) - kD642);
    tmp3_2 = kB642 - kG642;
    // Op 643: dim1x1 mul
    gl64_t s0_643 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_643 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_643 * s1_643;
    // Op 644: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 645: dim3x3 mul
    gl64_t s1_645_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_645_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_645_2 = *(gl64_t*)&expressions_params[13][0+2];
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
    // Op 646: dim3x3 mul
    gl64_t s1_646_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_646_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_646_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA646 = (tmp3_0 + tmp3_1) * (s1_646_0 + s1_646_1);
    gl64_t kB646 = (tmp3_0 + tmp3_2) * (s1_646_0 + s1_646_2);
    gl64_t kC646 = (tmp3_1 + tmp3_2) * (s1_646_1 + s1_646_2);
    gl64_t kD646 = tmp3_0 * s1_646_0;
    gl64_t kE646 = tmp3_1 * s1_646_1;
    gl64_t kF646 = tmp3_2 * s1_646_2;
    gl64_t kG646 = kD646 - kE646;
    tmp3_0 = (kC646 + kG646) - kF646;
    tmp3_1 = ((((kA646 + kC646) - kE646) - kE646) - kD646);
    tmp3_2 = kB646 - kG646;
    // Op 647: dim1x1 mul
    gl64_t s0_647 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_647 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_647 * s1_647;
    // Op 648: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 649: dim3x3 mul
    gl64_t s1_649_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_649_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_649_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA649 = (tmp3_0 + tmp3_1) * (s1_649_0 + s1_649_1);
    gl64_t kB649 = (tmp3_0 + tmp3_2) * (s1_649_0 + s1_649_2);
    gl64_t kC649 = (tmp3_1 + tmp3_2) * (s1_649_1 + s1_649_2);
    gl64_t kD649 = tmp3_0 * s1_649_0;
    gl64_t kE649 = tmp3_1 * s1_649_1;
    gl64_t kF649 = tmp3_2 * s1_649_2;
    gl64_t kG649 = kD649 - kE649;
    tmp3_0 = (kC649 + kG649) - kF649;
    tmp3_1 = ((((kA649 + kC649) - kE649) - kE649) - kD649);
    tmp3_2 = kB649 - kG649;
    // Op 650: dim1x1 mul
    gl64_t s0_650 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_650 = *(gl64_t*)&expressions_params[9][12];
    tmp1_0 = s0_650 * s1_650;
    // Op 651: dim1x1 mul
    gl64_t s0_651 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_651 = *(gl64_t*)&expressions_params[9][13];
    tmp1_3 = s0_651 * s1_651;
    // Op 652: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 653: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 654: dim3x3 mul
    gl64_t s1_654_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_654_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_654_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA654 = (tmp3_0 + tmp3_1) * (s1_654_0 + s1_654_1);
    gl64_t kB654 = (tmp3_0 + tmp3_2) * (s1_654_0 + s1_654_2);
    gl64_t kC654 = (tmp3_1 + tmp3_2) * (s1_654_1 + s1_654_2);
    gl64_t kD654 = tmp3_0 * s1_654_0;
    gl64_t kE654 = tmp3_1 * s1_654_1;
    gl64_t kF654 = tmp3_2 * s1_654_2;
    gl64_t kG654 = kD654 - kE654;
    tmp3_0 = (kC654 + kG654) - kF654;
    tmp3_1 = ((((kA654 + kC654) - kE654) - kE654) - kD654);
    tmp3_2 = kB654 - kG654;
    // Op 655: dim3x1 add
    gl64_t s1_655 = *(gl64_t*)&expressions_params[9][14];
    tmp3_0 = tmp3_0 + s1_655; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 656: dim3x3 add
    gl64_t s1_656_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_656_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_656_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_656_0; tmp3_1 = tmp3_1 + s1_656_1; tmp3_2 = tmp3_2 + s1_656_2;
    // Op 657: dim3x3 mul
    gl64_t s0_657_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 27+0, domainSize, nCols_2))];
    gl64_t s0_657_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 27+1, domainSize, nCols_2))];
    gl64_t s0_657_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 27+2, domainSize, nCols_2))];
    gl64_t kA657 = (s0_657_0 + s0_657_1) * (tmp3_0 + tmp3_1);
    gl64_t kB657 = (s0_657_0 + s0_657_2) * (tmp3_0 + tmp3_2);
    gl64_t kC657 = (s0_657_1 + s0_657_2) * (tmp3_1 + tmp3_2);
    gl64_t kD657 = s0_657_0 * tmp3_0;
    gl64_t kE657 = s0_657_1 * tmp3_1;
    gl64_t kF657 = s0_657_2 * tmp3_2;
    gl64_t kG657 = kD657 - kE657;
    tmp3_0 = (kC657 + kG657) - kF657;
    tmp3_1 = ((((kA657 + kC657) - kE657) - kE657) - kD657);
    tmp3_2 = kB657 - kG657;
    // Op 658: dim3x1 sub
    gl64_t s1_658 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 - s1_658; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 659: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 660: dim3x3 mul
    gl64_t s1_660_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_660_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_660_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA660 = (tmp3_0 + tmp3_1) * (s1_660_0 + s1_660_1);
    gl64_t kB660 = (tmp3_0 + tmp3_2) * (s1_660_0 + s1_660_2);
    gl64_t kC660 = (tmp3_1 + tmp3_2) * (s1_660_1 + s1_660_2);
    gl64_t kD660 = tmp3_0 * s1_660_0;
    gl64_t kE660 = tmp3_1 * s1_660_1;
    gl64_t kF660 = tmp3_2 * s1_660_2;
    gl64_t kG660 = kD660 - kE660;
    tmp3_6 = (kC660 + kG660) - kF660;
    tmp3_7 = ((((kA660 + kC660) - kE660) - kE660) - kD660);
    tmp3_8 = kB660 - kG660;
    // Op 661: dim1x1 sub_swap
    gl64_t s0_661 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    gl64_t s1_661 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_661 - s0_661;
    // Op 662: dim3x1 mul
    uint64_t s0_662_pos = dExpsArgs->mapOffsetsExps[2] + (false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_2) : getBufferOffset(logicalRow_0, 0, domainSize, nCols_2));
    gl64_t s0_662_0 = *(gl64_t*)&dParams->aux_trace[s0_662_pos];
    gl64_t s0_662_1 = *(gl64_t*)&dParams->aux_trace[s0_662_pos + TILE_HEIGHT];
    gl64_t s0_662_2 = *(gl64_t*)&dParams->aux_trace[s0_662_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_662_0 * tmp1_0; tmp3_1 = s0_662_1 * tmp1_0; tmp3_2 = s0_662_2 * tmp1_0;
    // Op 663: dim3x3 sub
    uint64_t s0_663_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_2));
    gl64_t s0_663_0 = *(gl64_t*)&dParams->aux_trace[s0_663_pos];
    gl64_t s0_663_1 = *(gl64_t*)&dParams->aux_trace[s0_663_pos + TILE_HEIGHT];
    gl64_t s0_663_2 = *(gl64_t*)&dParams->aux_trace[s0_663_pos + 2*TILE_HEIGHT];
    tmp3_3 = s0_663_0 - tmp3_0; tmp3_4 = s0_663_1 - tmp3_1; tmp3_5 = s0_663_2 - tmp3_2;
    // Op 664: dim3x3 add
    gl64_t s0_664_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+0, domainSize, nCols_2))];
    gl64_t s0_664_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+1, domainSize, nCols_2))];
    gl64_t s0_664_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+2, domainSize, nCols_2))];
    gl64_t s1_664_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+0, domainSize, nCols_2))];
    gl64_t s1_664_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+1, domainSize, nCols_2))];
    gl64_t s1_664_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+2, domainSize, nCols_2))];
    tmp3_0 = s0_664_0 + s1_664_0; tmp3_1 = s0_664_1 + s1_664_1; tmp3_2 = s0_664_2 + s1_664_2;
    // Op 665: dim3x3 add
    uint64_t s0_665_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_2));
    gl64_t s0_665_0 = *(gl64_t*)&dParams->aux_trace[s0_665_pos];
    gl64_t s0_665_1 = *(gl64_t*)&dParams->aux_trace[s0_665_pos + TILE_HEIGHT];
    gl64_t s0_665_2 = *(gl64_t*)&dParams->aux_trace[s0_665_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_665_0 + tmp3_0; tmp3_1 = s0_665_1 + tmp3_1; tmp3_2 = s0_665_2 + tmp3_2;
    // Op 666: dim3x3 add
    uint64_t s0_666_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_2));
    gl64_t s0_666_0 = *(gl64_t*)&dParams->aux_trace[s0_666_pos];
    gl64_t s0_666_1 = *(gl64_t*)&dParams->aux_trace[s0_666_pos + TILE_HEIGHT];
    gl64_t s0_666_2 = *(gl64_t*)&dParams->aux_trace[s0_666_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_666_0 + tmp3_0; tmp3_1 = s0_666_1 + tmp3_1; tmp3_2 = s0_666_2 + tmp3_2;
    // Op 667: dim3x3 add
    gl64_t s0_667_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+0, domainSize, nCols_2))];
    gl64_t s0_667_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+1, domainSize, nCols_2))];
    gl64_t s0_667_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+2, domainSize, nCols_2))];
    tmp3_0 = s0_667_0 + tmp3_0; tmp3_1 = s0_667_1 + tmp3_1; tmp3_2 = s0_667_2 + tmp3_2;
    // Op 668: dim3x3 add
    gl64_t s0_668_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+0, domainSize, nCols_2))];
    gl64_t s0_668_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+1, domainSize, nCols_2))];
    gl64_t s0_668_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+2, domainSize, nCols_2))];
    tmp3_0 = s0_668_0 + tmp3_0; tmp3_1 = s0_668_1 + tmp3_1; tmp3_2 = s0_668_2 + tmp3_2;
    // Op 669: dim3x3 add
    uint64_t s0_669_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_2));
    gl64_t s0_669_0 = *(gl64_t*)&dParams->aux_trace[s0_669_pos];
    gl64_t s0_669_1 = *(gl64_t*)&dParams->aux_trace[s0_669_pos + TILE_HEIGHT];
    gl64_t s0_669_2 = *(gl64_t*)&dParams->aux_trace[s0_669_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_669_0 + tmp3_0; tmp3_1 = s0_669_1 + tmp3_1; tmp3_2 = s0_669_2 + tmp3_2;
    // Op 670: dim3x3 add
    uint64_t s0_670_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_2));
    gl64_t s0_670_0 = *(gl64_t*)&dParams->aux_trace[s0_670_pos];
    gl64_t s0_670_1 = *(gl64_t*)&dParams->aux_trace[s0_670_pos + TILE_HEIGHT];
    gl64_t s0_670_2 = *(gl64_t*)&dParams->aux_trace[s0_670_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_670_0 + tmp3_0; tmp3_1 = s0_670_1 + tmp3_1; tmp3_2 = s0_670_2 + tmp3_2;
    // Op 671: dim3x3 add
    gl64_t s0_671_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 27+0, domainSize, nCols_2))];
    gl64_t s0_671_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 27+1, domainSize, nCols_2))];
    gl64_t s0_671_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 27+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 27+2, domainSize, nCols_2))];
    tmp3_0 = s0_671_0 + tmp3_0; tmp3_1 = s0_671_1 + tmp3_1; tmp3_2 = s0_671_2 + tmp3_2;
    // Op 672: dim3x3 sub
    tmp3_3 = tmp3_3 - tmp3_0; tmp3_4 = tmp3_4 - tmp3_1; tmp3_5 = tmp3_5 - tmp3_2;
    // Op 673: dim1x1 mul
    gl64_t s0_673 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_673 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_673 * s1_673;
    // Op 674: dim3x1 mul
    gl64_t s0_674_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_674_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_674_2 = *(gl64_t*)&expressions_params[13][0+2];
    tmp3_0 = s0_674_0 * tmp1_0; tmp3_1 = s0_674_1 * tmp1_0; tmp3_2 = s0_674_2 * tmp1_0;
    // Op 675: dim3x1 add
    gl64_t s1_675 = *(gl64_t*)&expressions_params[9][2];
    tmp3_0 = tmp3_0 + s1_675; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 676: dim3x3 mul
    gl64_t s1_676_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_676_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_676_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA676 = (tmp3_0 + tmp3_1) * (s1_676_0 + s1_676_1);
    gl64_t kB676 = (tmp3_0 + tmp3_2) * (s1_676_0 + s1_676_2);
    gl64_t kC676 = (tmp3_1 + tmp3_2) * (s1_676_1 + s1_676_2);
    gl64_t kD676 = tmp3_0 * s1_676_0;
    gl64_t kE676 = tmp3_1 * s1_676_1;
    gl64_t kF676 = tmp3_2 * s1_676_2;
    gl64_t kG676 = kD676 - kE676;
    tmp3_0 = (kC676 + kG676) - kF676;
    tmp3_1 = ((((kA676 + kC676) - kE676) - kE676) - kD676);
    tmp3_2 = kB676 - kG676;
    // Op 677: dim1x1 mul
    gl64_t s0_677 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_677 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = s0_677 * s1_677;
    // Op 678: dim1x1 add
    gl64_t s1_678 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_678;
    // Op 679: dim1x1 add
    gl64_t s1_679 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = tmp1_0 + s1_679;
    // Op 680: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 681: dim3x3 mul
    gl64_t s1_681_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_681_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_681_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA681 = (tmp3_0 + tmp3_1) * (s1_681_0 + s1_681_1);
    gl64_t kB681 = (tmp3_0 + tmp3_2) * (s1_681_0 + s1_681_2);
    gl64_t kC681 = (tmp3_1 + tmp3_2) * (s1_681_1 + s1_681_2);
    gl64_t kD681 = tmp3_0 * s1_681_0;
    gl64_t kE681 = tmp3_1 * s1_681_1;
    gl64_t kF681 = tmp3_2 * s1_681_2;
    gl64_t kG681 = kD681 - kE681;
    tmp3_0 = (kC681 + kG681) - kF681;
    tmp3_1 = ((((kA681 + kC681) - kE681) - kE681) - kD681);
    tmp3_2 = kB681 - kG681;
    // Op 682: dim3x1 add
    gl64_t s1_682 = *(gl64_t*)&expressions_params[9][18];
    tmp3_0 = tmp3_0 + s1_682; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 683: dim3x3 mul
    gl64_t s1_683_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_683_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_683_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA683 = (tmp3_0 + tmp3_1) * (s1_683_0 + s1_683_1);
    gl64_t kB683 = (tmp3_0 + tmp3_2) * (s1_683_0 + s1_683_2);
    gl64_t kC683 = (tmp3_1 + tmp3_2) * (s1_683_1 + s1_683_2);
    gl64_t kD683 = tmp3_0 * s1_683_0;
    gl64_t kE683 = tmp3_1 * s1_683_1;
    gl64_t kF683 = tmp3_2 * s1_683_2;
    gl64_t kG683 = kD683 - kE683;
    tmp3_0 = (kC683 + kG683) - kF683;
    tmp3_1 = ((((kA683 + kC683) - kE683) - kE683) - kD683);
    tmp3_2 = kB683 - kG683;
    // Op 684: dim3x1 add
    gl64_t s1_684 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_684; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 685: dim3x3 mul
    gl64_t s1_685_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_685_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_685_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA685 = (tmp3_0 + tmp3_1) * (s1_685_0 + s1_685_1);
    gl64_t kB685 = (tmp3_0 + tmp3_2) * (s1_685_0 + s1_685_2);
    gl64_t kC685 = (tmp3_1 + tmp3_2) * (s1_685_1 + s1_685_2);
    gl64_t kD685 = tmp3_0 * s1_685_0;
    gl64_t kE685 = tmp3_1 * s1_685_1;
    gl64_t kF685 = tmp3_2 * s1_685_2;
    gl64_t kG685 = kD685 - kE685;
    tmp3_0 = (kC685 + kG685) - kF685;
    tmp3_1 = ((((kA685 + kC685) - kE685) - kE685) - kD685);
    tmp3_2 = kB685 - kG685;
    // Op 686: dim3x1 add
    gl64_t s1_686 = *(gl64_t*)&expressions_params[9][5];
    tmp3_0 = tmp3_0 + s1_686; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 687: dim3x3 add
    gl64_t s1_687_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_687_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_687_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_687_0; tmp3_1 = tmp3_1 + s1_687_1; tmp3_2 = tmp3_2 + s1_687_2;
    // Op 688: dim3x3 mul
    gl64_t kA688 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB688 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC688 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD688 = tmp3_3 * tmp3_0;
    gl64_t kE688 = tmp3_4 * tmp3_1;
    gl64_t kF688 = tmp3_5 * tmp3_2;
    gl64_t kG688 = kD688 - kE688;
    tmp3_0 = (kC688 + kG688) - kF688;
    tmp3_1 = ((((kA688 + kC688) - kE688) - kE688) - kD688);
    tmp3_2 = kB688 - kG688;
    // Op 689: dim1x1 sub_swap
    gl64_t s0_689 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_689 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_689 - s0_689;
    // Op 690: dim3x1 sub
    tmp3_0 = tmp3_0 - tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 691: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 692: dim3x3 mul
    gl64_t s1_692_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_692_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_692_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA692 = (tmp3_0 + tmp3_1) * (s1_692_0 + s1_692_1);
    gl64_t kB692 = (tmp3_0 + tmp3_2) * (s1_692_0 + s1_692_2);
    gl64_t kC692 = (tmp3_1 + tmp3_2) * (s1_692_1 + s1_692_2);
    gl64_t kD692 = tmp3_0 * s1_692_0;
    gl64_t kE692 = tmp3_1 * s1_692_1;
    gl64_t kF692 = tmp3_2 * s1_692_2;
    gl64_t kG692 = kD692 - kE692;
    tmp3_6 = (kC692 + kG692) - kF692;
    tmp3_7 = ((((kA692 + kC692) - kE692) - kE692) - kD692);
    tmp3_8 = kB692 - kG692;
    // Op 693: dim3x1 mul
    gl64_t s0_693_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_693_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_693_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_693 = *(gl64_t*)&expressions_params[10][5];
    tmp3_0 = s0_693_0 * s1_693; tmp3_1 = s0_693_1 * s1_693; tmp3_2 = s0_693_2 * s1_693;
    // Op 694: dim3x3 mul
    gl64_t s1_694_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_694_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_694_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA694 = (tmp3_0 + tmp3_1) * (s1_694_0 + s1_694_1);
    gl64_t kB694 = (tmp3_0 + tmp3_2) * (s1_694_0 + s1_694_2);
    gl64_t kC694 = (tmp3_1 + tmp3_2) * (s1_694_1 + s1_694_2);
    gl64_t kD694 = tmp3_0 * s1_694_0;
    gl64_t kE694 = tmp3_1 * s1_694_1;
    gl64_t kF694 = tmp3_2 * s1_694_2;
    gl64_t kG694 = kD694 - kE694;
    tmp3_0 = (kC694 + kG694) - kF694;
    tmp3_1 = ((((kA694 + kC694) - kE694) - kE694) - kD694);
    tmp3_2 = kB694 - kG694;
    // Op 695: dim3x1 add
    gl64_t s1_695 = *(gl64_t*)&expressions_params[10][3];
    tmp3_0 = tmp3_0 + s1_695; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 696: dim3x3 mul
    gl64_t s1_696_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_696_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_696_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA696 = (tmp3_0 + tmp3_1) * (s1_696_0 + s1_696_1);
    gl64_t kB696 = (tmp3_0 + tmp3_2) * (s1_696_0 + s1_696_2);
    gl64_t kC696 = (tmp3_1 + tmp3_2) * (s1_696_1 + s1_696_2);
    gl64_t kD696 = tmp3_0 * s1_696_0;
    gl64_t kE696 = tmp3_1 * s1_696_1;
    gl64_t kF696 = tmp3_2 * s1_696_2;
    gl64_t kG696 = kD696 - kE696;
    tmp3_0 = (kC696 + kG696) - kF696;
    tmp3_1 = ((((kA696 + kC696) - kE696) - kE696) - kD696);
    tmp3_2 = kB696 - kG696;
    // Op 697: dim3x1 add
    gl64_t s1_697 = *(gl64_t*)&expressions_params[10][4];
    tmp3_0 = tmp3_0 + s1_697; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 698: dim3x3 mul
    gl64_t s1_698_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_698_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_698_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA698 = (tmp3_0 + tmp3_1) * (s1_698_0 + s1_698_1);
    gl64_t kB698 = (tmp3_0 + tmp3_2) * (s1_698_0 + s1_698_2);
    gl64_t kC698 = (tmp3_1 + tmp3_2) * (s1_698_1 + s1_698_2);
    gl64_t kD698 = tmp3_0 * s1_698_0;
    gl64_t kE698 = tmp3_1 * s1_698_1;
    gl64_t kF698 = tmp3_2 * s1_698_2;
    gl64_t kG698 = kD698 - kE698;
    tmp3_0 = (kC698 + kG698) - kF698;
    tmp3_1 = ((((kA698 + kC698) - kE698) - kE698) - kD698);
    tmp3_2 = kB698 - kG698;
    // Op 699: dim3x1 add
    gl64_t s1_699 = *(gl64_t*)&expressions_params[10][2];
    tmp3_0 = tmp3_0 + s1_699; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 700: dim3x3 mul
    gl64_t s1_700_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_700_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_700_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA700 = (tmp3_0 + tmp3_1) * (s1_700_0 + s1_700_1);
    gl64_t kB700 = (tmp3_0 + tmp3_2) * (s1_700_0 + s1_700_2);
    gl64_t kC700 = (tmp3_1 + tmp3_2) * (s1_700_1 + s1_700_2);
    gl64_t kD700 = tmp3_0 * s1_700_0;
    gl64_t kE700 = tmp3_1 * s1_700_1;
    gl64_t kF700 = tmp3_2 * s1_700_2;
    gl64_t kG700 = kD700 - kE700;
    tmp3_0 = (kC700 + kG700) - kF700;
    tmp3_1 = ((((kA700 + kC700) - kE700) - kE700) - kD700);
    tmp3_2 = kB700 - kG700;
    // Op 701: dim3x1 add
    gl64_t s1_701 = *(gl64_t*)&expressions_params[10][12];
    tmp3_0 = tmp3_0 + s1_701; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 702: dim3x3 mul
    gl64_t s1_702_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_702_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_702_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA702 = (tmp3_0 + tmp3_1) * (s1_702_0 + s1_702_1);
    gl64_t kB702 = (tmp3_0 + tmp3_2) * (s1_702_0 + s1_702_2);
    gl64_t kC702 = (tmp3_1 + tmp3_2) * (s1_702_1 + s1_702_2);
    gl64_t kD702 = tmp3_0 * s1_702_0;
    gl64_t kE702 = tmp3_1 * s1_702_1;
    gl64_t kF702 = tmp3_2 * s1_702_2;
    gl64_t kG702 = kD702 - kE702;
    tmp3_0 = (kC702 + kG702) - kF702;
    tmp3_1 = ((((kA702 + kC702) - kE702) - kE702) - kD702);
    tmp3_2 = kB702 - kG702;
    // Op 703: dim3x1 add
    gl64_t s1_703 = *(gl64_t*)&expressions_params[10][1];
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
    gl64_t s1_705 = *(gl64_t*)&expressions_params[9][15];
    tmp3_0 = tmp3_0 + s1_705; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 706: dim3x3 mul
    gl64_t s1_706_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_706_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_706_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA706 = (tmp3_0 + tmp3_1) * (s1_706_0 + s1_706_1);
    gl64_t kB706 = (tmp3_0 + tmp3_2) * (s1_706_0 + s1_706_2);
    gl64_t kC706 = (tmp3_1 + tmp3_2) * (s1_706_1 + s1_706_2);
    gl64_t kD706 = tmp3_0 * s1_706_0;
    gl64_t kE706 = tmp3_1 * s1_706_1;
    gl64_t kF706 = tmp3_2 * s1_706_2;
    gl64_t kG706 = kD706 - kE706;
    tmp3_0 = (kC706 + kG706) - kF706;
    tmp3_1 = ((((kA706 + kC706) - kE706) - kE706) - kD706);
    tmp3_2 = kB706 - kG706;
    // Op 707: dim3x3 mul
    gl64_t s1_707_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_707_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_707_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA707 = (tmp3_0 + tmp3_1) * (s1_707_0 + s1_707_1);
    gl64_t kB707 = (tmp3_0 + tmp3_2) * (s1_707_0 + s1_707_2);
    gl64_t kC707 = (tmp3_1 + tmp3_2) * (s1_707_1 + s1_707_2);
    gl64_t kD707 = tmp3_0 * s1_707_0;
    gl64_t kE707 = tmp3_1 * s1_707_1;
    gl64_t kF707 = tmp3_2 * s1_707_2;
    gl64_t kG707 = kD707 - kE707;
    tmp3_0 = (kC707 + kG707) - kF707;
    tmp3_1 = ((((kA707 + kC707) - kE707) - kE707) - kD707);
    tmp3_2 = kB707 - kG707;
    // Op 708: dim3x1 add
    gl64_t s1_708 = *(gl64_t*)&expressions_params[10][0];
    tmp3_0 = tmp3_0 + s1_708; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    gl64_t s1_710 = *(gl64_t*)&expressions_params[9][16];
    tmp3_0 = tmp3_0 + s1_710; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 711: dim3x3 add
    gl64_t s1_711_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_711_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_711_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_711_0; tmp3_1 = tmp3_1 + s1_711_1; tmp3_2 = tmp3_2 + s1_711_2;
    // Op 712: dim3x3 mul
    gl64_t s1_712_0 = *(gl64_t*)&expressions_params[10][17];
    gl64_t s1_712_1 = *(gl64_t*)&expressions_params[10][17+1];
    gl64_t s1_712_2 = *(gl64_t*)&expressions_params[10][17+2];
    gl64_t kA712 = (tmp3_0 + tmp3_1) * (s1_712_0 + s1_712_1);
    gl64_t kB712 = (tmp3_0 + tmp3_2) * (s1_712_0 + s1_712_2);
    gl64_t kC712 = (tmp3_1 + tmp3_2) * (s1_712_1 + s1_712_2);
    gl64_t kD712 = tmp3_0 * s1_712_0;
    gl64_t kE712 = tmp3_1 * s1_712_1;
    gl64_t kF712 = tmp3_2 * s1_712_2;
    gl64_t kG712 = kD712 - kE712;
    tmp3_0 = (kC712 + kG712) - kF712;
    tmp3_1 = ((((kA712 + kC712) - kE712) - kE712) - kD712);
    tmp3_2 = kB712 - kG712;
    // Op 713: dim3x1 add
    gl64_t s1_713 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_713; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 714: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 715: dim3x3 mul
    gl64_t s1_715_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_715_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_715_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA715 = (tmp3_0 + tmp3_1) * (s1_715_0 + s1_715_1);
    gl64_t kB715 = (tmp3_0 + tmp3_2) * (s1_715_0 + s1_715_2);
    gl64_t kC715 = (tmp3_1 + tmp3_2) * (s1_715_1 + s1_715_2);
    gl64_t kD715 = tmp3_0 * s1_715_0;
    gl64_t kE715 = tmp3_1 * s1_715_1;
    gl64_t kF715 = tmp3_2 * s1_715_2;
    gl64_t kG715 = kD715 - kE715;
    tmp3_6 = (kC715 + kG715) - kF715;
    tmp3_7 = ((((kA715 + kC715) - kE715) - kE715) - kD715);
    tmp3_8 = kB715 - kG715;
    // Op 716: dim3x1 mul
    gl64_t s0_716_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_716_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_716_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_716 = *(gl64_t*)&expressions_params[10][10];
    tmp3_0 = s0_716_0 * s1_716; tmp3_1 = s0_716_1 * s1_716; tmp3_2 = s0_716_2 * s1_716;
    // Op 717: dim3x3 mul
    gl64_t s1_717_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_717_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_717_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA717 = (tmp3_0 + tmp3_1) * (s1_717_0 + s1_717_1);
    gl64_t kB717 = (tmp3_0 + tmp3_2) * (s1_717_0 + s1_717_2);
    gl64_t kC717 = (tmp3_1 + tmp3_2) * (s1_717_1 + s1_717_2);
    gl64_t kD717 = tmp3_0 * s1_717_0;
    gl64_t kE717 = tmp3_1 * s1_717_1;
    gl64_t kF717 = tmp3_2 * s1_717_2;
    gl64_t kG717 = kD717 - kE717;
    tmp3_0 = (kC717 + kG717) - kF717;
    tmp3_1 = ((((kA717 + kC717) - kE717) - kE717) - kD717);
    tmp3_2 = kB717 - kG717;
    // Op 718: dim3x1 add
    gl64_t s1_718 = *(gl64_t*)&expressions_params[10][8];
    tmp3_0 = tmp3_0 + s1_718; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 719: dim3x3 mul
    gl64_t s1_719_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_719_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_719_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA719 = (tmp3_0 + tmp3_1) * (s1_719_0 + s1_719_1);
    gl64_t kB719 = (tmp3_0 + tmp3_2) * (s1_719_0 + s1_719_2);
    gl64_t kC719 = (tmp3_1 + tmp3_2) * (s1_719_1 + s1_719_2);
    gl64_t kD719 = tmp3_0 * s1_719_0;
    gl64_t kE719 = tmp3_1 * s1_719_1;
    gl64_t kF719 = tmp3_2 * s1_719_2;
    gl64_t kG719 = kD719 - kE719;
    tmp3_0 = (kC719 + kG719) - kF719;
    tmp3_1 = ((((kA719 + kC719) - kE719) - kE719) - kD719);
    tmp3_2 = kB719 - kG719;
    // Op 720: dim3x1 add
    gl64_t s1_720 = *(gl64_t*)&expressions_params[10][9];
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
    gl64_t s1_722 = *(gl64_t*)&expressions_params[10][7];
    tmp3_0 = tmp3_0 + s1_722; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 723: dim3x3 mul
    gl64_t s1_723_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_723_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_723_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA723 = (tmp3_0 + tmp3_1) * (s1_723_0 + s1_723_1);
    gl64_t kB723 = (tmp3_0 + tmp3_2) * (s1_723_0 + s1_723_2);
    gl64_t kC723 = (tmp3_1 + tmp3_2) * (s1_723_1 + s1_723_2);
    gl64_t kD723 = tmp3_0 * s1_723_0;
    gl64_t kE723 = tmp3_1 * s1_723_1;
    gl64_t kF723 = tmp3_2 * s1_723_2;
    gl64_t kG723 = kD723 - kE723;
    tmp3_0 = (kC723 + kG723) - kF723;
    tmp3_1 = ((((kA723 + kC723) - kE723) - kE723) - kD723);
    tmp3_2 = kB723 - kG723;
    // Op 724: dim3x1 add
    gl64_t s1_724 = *(gl64_t*)&expressions_params[10][13];
    tmp3_0 = tmp3_0 + s1_724; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 725: dim3x3 mul
    gl64_t s1_725_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_725_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_725_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA725 = (tmp3_0 + tmp3_1) * (s1_725_0 + s1_725_1);
    gl64_t kB725 = (tmp3_0 + tmp3_2) * (s1_725_0 + s1_725_2);
    gl64_t kC725 = (tmp3_1 + tmp3_2) * (s1_725_1 + s1_725_2);
    gl64_t kD725 = tmp3_0 * s1_725_0;
    gl64_t kE725 = tmp3_1 * s1_725_1;
    gl64_t kF725 = tmp3_2 * s1_725_2;
    gl64_t kG725 = kD725 - kE725;
    tmp3_0 = (kC725 + kG725) - kF725;
    tmp3_1 = ((((kA725 + kC725) - kE725) - kE725) - kD725);
    tmp3_2 = kB725 - kG725;
    // Op 726: dim3x1 add
    gl64_t s1_726 = *(gl64_t*)&expressions_params[10][6];
    tmp3_0 = tmp3_0 + s1_726; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 728: dim3x1 add
    gl64_t s1_728 = *(gl64_t*)&expressions_params[9][15];
    tmp3_0 = tmp3_0 + s1_728; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 729: dim3x3 mul
    gl64_t s1_729_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_729_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_729_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA729 = (tmp3_0 + tmp3_1) * (s1_729_0 + s1_729_1);
    gl64_t kB729 = (tmp3_0 + tmp3_2) * (s1_729_0 + s1_729_2);
    gl64_t kC729 = (tmp3_1 + tmp3_2) * (s1_729_1 + s1_729_2);
    gl64_t kD729 = tmp3_0 * s1_729_0;
    gl64_t kE729 = tmp3_1 * s1_729_1;
    gl64_t kF729 = tmp3_2 * s1_729_2;
    gl64_t kG729 = kD729 - kE729;
    tmp3_0 = (kC729 + kG729) - kF729;
    tmp3_1 = ((((kA729 + kC729) - kE729) - kE729) - kD729);
    tmp3_2 = kB729 - kG729;
    // Op 730: dim3x1 add
    gl64_t s1_730 = *(gl64_t*)&expressions_params[10][11];
    tmp3_0 = tmp3_0 + s1_730; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 732: dim1x1 add
    gl64_t s0_732 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_732 = *(gl64_t*)&expressions_params[10][0];
    tmp1_0 = s0_732 + s1_732;
    // Op 733: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 734: dim3x3 mul
    gl64_t s1_734_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_734_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_734_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA734 = (tmp3_0 + tmp3_1) * (s1_734_0 + s1_734_1);
    gl64_t kB734 = (tmp3_0 + tmp3_2) * (s1_734_0 + s1_734_2);
    gl64_t kC734 = (tmp3_1 + tmp3_2) * (s1_734_1 + s1_734_2);
    gl64_t kD734 = tmp3_0 * s1_734_0;
    gl64_t kE734 = tmp3_1 * s1_734_1;
    gl64_t kF734 = tmp3_2 * s1_734_2;
    gl64_t kG734 = kD734 - kE734;
    tmp3_0 = (kC734 + kG734) - kF734;
    tmp3_1 = ((((kA734 + kC734) - kE734) - kE734) - kD734);
    tmp3_2 = kB734 - kG734;
    // Op 735: dim3x1 add
    gl64_t s1_735 = *(gl64_t*)&expressions_params[9][16];
    tmp3_0 = tmp3_0 + s1_735; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 736: dim3x3 add
    gl64_t s1_736_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_736_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_736_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_736_0; tmp3_1 = tmp3_1 + s1_736_1; tmp3_2 = tmp3_2 + s1_736_2;
    // Op 737: dim3x3 mul
    gl64_t s1_737_0 = *(gl64_t*)&expressions_params[10][20];
    gl64_t s1_737_1 = *(gl64_t*)&expressions_params[10][20+1];
    gl64_t s1_737_2 = *(gl64_t*)&expressions_params[10][20+2];
    gl64_t kA737 = (tmp3_0 + tmp3_1) * (s1_737_0 + s1_737_1);
    gl64_t kB737 = (tmp3_0 + tmp3_2) * (s1_737_0 + s1_737_2);
    gl64_t kC737 = (tmp3_1 + tmp3_2) * (s1_737_1 + s1_737_2);
    gl64_t kD737 = tmp3_0 * s1_737_0;
    gl64_t kE737 = tmp3_1 * s1_737_1;
    gl64_t kF737 = tmp3_2 * s1_737_2;
    gl64_t kG737 = kD737 - kE737;
    tmp3_0 = (kC737 + kG737) - kF737;
    tmp3_1 = ((((kA737 + kC737) - kE737) - kE737) - kD737);
    tmp3_2 = kB737 - kG737;
    // Op 738: dim1x1 sub
    gl64_t s0_738 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_738 = *(gl64_t*)&expressions_params[10][11];
    tmp1_0 = s0_738 - s1_738;
    // Op 739: dim3x1 sub
    tmp3_0 = tmp3_0 - tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 740: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 741: dim3x3 mul
    gl64_t s1_741_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_741_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_741_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA741 = (tmp3_0 + tmp3_1) * (s1_741_0 + s1_741_1);
    gl64_t kB741 = (tmp3_0 + tmp3_2) * (s1_741_0 + s1_741_2);
    gl64_t kC741 = (tmp3_1 + tmp3_2) * (s1_741_1 + s1_741_2);
    gl64_t kD741 = tmp3_0 * s1_741_0;
    gl64_t kE741 = tmp3_1 * s1_741_1;
    gl64_t kF741 = tmp3_2 * s1_741_2;
    gl64_t kG741 = kD741 - kE741;
    tmp3_6 = (kC741 + kG741) - kF741;
    tmp3_7 = ((((kA741 + kC741) - kE741) - kE741) - kD741);
    tmp3_8 = kB741 - kG741;
    // Op 742: dim3x1 add
    gl64_t s0_742_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s0_742_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s0_742_2 = *(gl64_t*)&expressions_params[13][3+2];
    gl64_t s1_742 = *(gl64_t*)&expressions_params[9][14];
    tmp3_0 = s0_742_0 + s1_742; tmp3_1 = s0_742_1; tmp3_2 = s0_742_2;
    // Op 743: dim3x3 mul
    gl64_t s1_743_0 = *(gl64_t*)&expressions_params[10][23];
    gl64_t s1_743_1 = *(gl64_t*)&expressions_params[10][23+1];
    gl64_t s1_743_2 = *(gl64_t*)&expressions_params[10][23+2];
    gl64_t kA743 = (tmp3_0 + tmp3_1) * (s1_743_0 + s1_743_1);
    gl64_t kB743 = (tmp3_0 + tmp3_2) * (s1_743_0 + s1_743_2);
    gl64_t kC743 = (tmp3_1 + tmp3_2) * (s1_743_1 + s1_743_2);
    gl64_t kD743 = tmp3_0 * s1_743_0;
    gl64_t kE743 = tmp3_1 * s1_743_1;
    gl64_t kF743 = tmp3_2 * s1_743_2;
    gl64_t kG743 = kD743 - kE743;
    tmp3_0 = (kC743 + kG743) - kF743;
    tmp3_1 = ((((kA743 + kC743) - kE743) - kE743) - kD743);
    tmp3_2 = kB743 - kG743;
    // Op 744: dim1x1 sub
    gl64_t s0_744 = *(gl64_t*)&expressions_params[9][1];
    gl64_t s1_744 = *(gl64_t*)&expressions_params[10][16];
    tmp1_0 = s0_744 - s1_744;
    // Op 745: dim3x1 sub
    tmp3_0 = tmp3_0 - tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 746: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 747: dim3x3 mul
    gl64_t s1_747_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_747_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_747_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA747 = (tmp3_0 + tmp3_1) * (s1_747_0 + s1_747_1);
    gl64_t kB747 = (tmp3_0 + tmp3_2) * (s1_747_0 + s1_747_2);
    gl64_t kC747 = (tmp3_1 + tmp3_2) * (s1_747_1 + s1_747_2);
    gl64_t kD747 = tmp3_0 * s1_747_0;
    gl64_t kE747 = tmp3_1 * s1_747_1;
    gl64_t kF747 = tmp3_2 * s1_747_2;
    gl64_t kG747 = kD747 - kE747;
    tmp3_6 = (kC747 + kG747) - kF747;
    tmp3_7 = ((((kA747 + kC747) - kE747) - kE747) - kD747);
    tmp3_8 = kB747 - kG747;
    // Op 748: dim3x1 mul
    gl64_t s0_748_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_748_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_748_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_748 = *(gl64_t*)&expressions_params[10][14];
    tmp3_0 = s0_748_0 * s1_748; tmp3_1 = s0_748_1 * s1_748; tmp3_2 = s0_748_2 * s1_748;
    // Op 749: dim3x1 add
    gl64_t s1_749 = *(gl64_t*)&expressions_params[9][17];
    tmp3_0 = tmp3_0 + s1_749; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 750: dim3x3 add
    gl64_t s1_750_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_750_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_750_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_750_0; tmp3_1 = tmp3_1 + s1_750_1; tmp3_2 = tmp3_2 + s1_750_2;
    // Op 751: dim3x3 mul
    gl64_t s1_751_0 = *(gl64_t*)&expressions_params[10][26];
    gl64_t s1_751_1 = *(gl64_t*)&expressions_params[10][26+1];
    gl64_t s1_751_2 = *(gl64_t*)&expressions_params[10][26+2];
    gl64_t kA751 = (tmp3_0 + tmp3_1) * (s1_751_0 + s1_751_1);
    gl64_t kB751 = (tmp3_0 + tmp3_2) * (s1_751_0 + s1_751_2);
    gl64_t kC751 = (tmp3_1 + tmp3_2) * (s1_751_1 + s1_751_2);
    gl64_t kD751 = tmp3_0 * s1_751_0;
    gl64_t kE751 = tmp3_1 * s1_751_1;
    gl64_t kF751 = tmp3_2 * s1_751_2;
    gl64_t kG751 = kD751 - kE751;
    tmp3_0 = (kC751 + kG751) - kF751;
    tmp3_1 = ((((kA751 + kC751) - kE751) - kE751) - kD751);
    tmp3_2 = kB751 - kG751;
    // Op 752: dim3x1 add
    gl64_t s1_752 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_752; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 753: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 754: dim3x3 mul
    gl64_t s1_754_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_754_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_754_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA754 = (tmp3_0 + tmp3_1) * (s1_754_0 + s1_754_1);
    gl64_t kB754 = (tmp3_0 + tmp3_2) * (s1_754_0 + s1_754_2);
    gl64_t kC754 = (tmp3_1 + tmp3_2) * (s1_754_1 + s1_754_2);
    gl64_t kD754 = tmp3_0 * s1_754_0;
    gl64_t kE754 = tmp3_1 * s1_754_1;
    gl64_t kF754 = tmp3_2 * s1_754_2;
    gl64_t kG754 = kD754 - kE754;
    tmp3_6 = (kC754 + kG754) - kF754;
    tmp3_7 = ((((kA754 + kC754) - kE754) - kE754) - kD754);
    tmp3_8 = kB754 - kG754;
    // Op 755: dim3x1 mul
    gl64_t s0_755_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_755_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_755_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_755 = *(gl64_t*)&expressions_params[10][15];
    tmp3_0 = s0_755_0 * s1_755; tmp3_1 = s0_755_1 * s1_755; tmp3_2 = s0_755_2 * s1_755;
    // Op 756: dim3x1 add
    gl64_t s1_756 = *(gl64_t*)&expressions_params[9][17];
    tmp3_0 = tmp3_0 + s1_756; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 757: dim3x3 add
    gl64_t s1_757_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_757_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_757_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_757_0; tmp3_1 = tmp3_1 + s1_757_1; tmp3_2 = tmp3_2 + s1_757_2;
    // Op 758: dim3x3 mul
    gl64_t s1_758_0 = *(gl64_t*)&expressions_params[10][29];
    gl64_t s1_758_1 = *(gl64_t*)&expressions_params[10][29+1];
    gl64_t s1_758_2 = *(gl64_t*)&expressions_params[10][29+2];
    gl64_t kA758 = (tmp3_0 + tmp3_1) * (s1_758_0 + s1_758_1);
    gl64_t kB758 = (tmp3_0 + tmp3_2) * (s1_758_0 + s1_758_2);
    gl64_t kC758 = (tmp3_1 + tmp3_2) * (s1_758_1 + s1_758_2);
    gl64_t kD758 = tmp3_0 * s1_758_0;
    gl64_t kE758 = tmp3_1 * s1_758_1;
    gl64_t kF758 = tmp3_2 * s1_758_2;
    gl64_t kG758 = kD758 - kE758;
    tmp3_0 = (kC758 + kG758) - kF758;
    tmp3_1 = ((((kA758 + kC758) - kE758) - kE758) - kD758);
    tmp3_2 = kB758 - kG758;
    // Op 759: dim3x1 add
    gl64_t s1_759 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_759; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 760: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 761: dim3x3 mul
    gl64_t s1_761_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_761_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_761_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA761 = (tmp3_0 + tmp3_1) * (s1_761_0 + s1_761_1);
    gl64_t kB761 = (tmp3_0 + tmp3_2) * (s1_761_0 + s1_761_2);
    gl64_t kC761 = (tmp3_1 + tmp3_2) * (s1_761_1 + s1_761_2);
    gl64_t kD761 = tmp3_0 * s1_761_0;
    gl64_t kE761 = tmp3_1 * s1_761_1;
    gl64_t kF761 = tmp3_2 * s1_761_2;
    gl64_t kG761 = kD761 - kE761;
    tmp3_3 = (kC761 + kG761) - kF761;
    tmp3_4 = ((((kA761 + kC761) - kE761) - kE761) - kD761);
    tmp3_5 = kB761 - kG761;
    // Op 762: dim3x3 sub_swap
    uint64_t s0_762_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_2));
    gl64_t s0_762_0 = *(gl64_t*)&dParams->aux_trace[s0_762_pos];
    gl64_t s0_762_1 = *(gl64_t*)&dParams->aux_trace[s0_762_pos + TILE_HEIGHT];
    gl64_t s0_762_2 = *(gl64_t*)&dParams->aux_trace[s0_762_pos + 2*TILE_HEIGHT];
    gl64_t s1_762_0 = *(gl64_t*)&expressions_params[12][0];
    gl64_t s1_762_1 = *(gl64_t*)&expressions_params[12][0+1];
    gl64_t s1_762_2 = *(gl64_t*)&expressions_params[12][0+2];
    tmp3_6 = s1_762_0 - s0_762_0; tmp3_7 = s1_762_1 - s0_762_1; tmp3_8 = s1_762_2 - s0_762_2;
    // Op 763: dim3x3 add
    gl64_t s0_763_0 = *(gl64_t*)&expressions_params[10][17];
    gl64_t s0_763_1 = *(gl64_t*)&expressions_params[10][17+1];
    gl64_t s0_763_2 = *(gl64_t*)&expressions_params[10][17+2];
    gl64_t s1_763_0 = *(gl64_t*)&expressions_params[10][20];
    gl64_t s1_763_1 = *(gl64_t*)&expressions_params[10][20+1];
    gl64_t s1_763_2 = *(gl64_t*)&expressions_params[10][20+2];
    tmp3_0 = s0_763_0 + s1_763_0; tmp3_1 = s0_763_1 + s1_763_1; tmp3_2 = s0_763_2 + s1_763_2;
    // Op 764: dim3x3 add
    gl64_t s1_764_0 = *(gl64_t*)&expressions_params[10][23];
    gl64_t s1_764_1 = *(gl64_t*)&expressions_params[10][23+1];
    gl64_t s1_764_2 = *(gl64_t*)&expressions_params[10][23+2];
    tmp3_0 = tmp3_0 + s1_764_0; tmp3_1 = tmp3_1 + s1_764_1; tmp3_2 = tmp3_2 + s1_764_2;
    // Op 765: dim3x3 add
    gl64_t s1_765_0 = *(gl64_t*)&expressions_params[10][26];
    gl64_t s1_765_1 = *(gl64_t*)&expressions_params[10][26+1];
    gl64_t s1_765_2 = *(gl64_t*)&expressions_params[10][26+2];
    tmp3_0 = tmp3_0 + s1_765_0; tmp3_1 = tmp3_1 + s1_765_1; tmp3_2 = tmp3_2 + s1_765_2;
    // Op 766: dim3x3 add
    gl64_t s1_766_0 = *(gl64_t*)&expressions_params[10][29];
    gl64_t s1_766_1 = *(gl64_t*)&expressions_params[10][29+1];
    gl64_t s1_766_2 = *(gl64_t*)&expressions_params[10][29+2];
    tmp3_0 = tmp3_0 + s1_766_0; tmp3_1 = tmp3_1 + s1_766_1; tmp3_2 = tmp3_2 + s1_766_2;
    // Op 767: dim3x3 sub
    tmp3_0 = tmp3_6 - tmp3_0; tmp3_1 = tmp3_7 - tmp3_1; tmp3_2 = tmp3_8 - tmp3_2;
    // Op 768: dim3x1 mul
    gl64_t s1_768 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp3_0 = tmp3_0 * s1_768; tmp3_1 = tmp3_1 * s1_768; tmp3_2 = tmp3_2 * s1_768;
    // Op 769: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 770: dim3x1 mul
    gl64_t s1_770 = *(gl64_t*)&dParams->aux_trace[dArgs->zi_offset + (1 - 1) * domainSize + row + threadIdx.x];
    tmp3_0 = tmp3_0 * s1_770; tmp3_1 = tmp3_1 * s1_770; tmp3_2 = tmp3_2 * s1_770;

    // Write final result to shared memory and store to output
    *(gl64_t*)&expressions_params[bufferCommitsSize + 1][0 * blockDim.x + threadIdx.x] = tmp3_0;
    *(gl64_t*)&expressions_params[bufferCommitsSize + 1][1 * blockDim.x + threadIdx.x] = tmp3_1;
    *(gl64_t*)&expressions_params[bufferCommitsSize + 1][2 * blockDim.x + threadIdx.x] = tmp3_2;
    storePolynomial__((ExpsArguments*)dExpsArgs, (Goldilocks::Element*)&expressions_params[bufferCommitsSize + 1][0 * blockDim.x], row);
}
