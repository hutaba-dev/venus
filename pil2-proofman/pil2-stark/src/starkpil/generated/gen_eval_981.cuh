// Auto-generated expression evaluator - matches load__() semantics exactly
// Q expressions: domainExtended=true always, type 1 goes through aux_trace

// Fingerprint: d3f5e199  nOps=728 nTemp1=8 nTemp3=5
#define GENERATED_EVAL_NOPS_d3f5e199 728
#define GENERATED_EVAL_NTEMP1_d3f5e199 8
#define GENERATED_EVAL_NTEMP3_d3f5e199 5

template<bool IsCyclic>
__device__ __forceinline__ void eval_expr_d3f5e199(
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

    // Register-resident temporaries: 8 tmp1 + 15 tmp3 slots
    gl64_t tmp1_0 = gl64_t(uint64_t(0));
    gl64_t tmp1_1 = gl64_t(uint64_t(0));
    gl64_t tmp1_2 = gl64_t(uint64_t(0));
    gl64_t tmp1_3 = gl64_t(uint64_t(0));
    gl64_t tmp1_4 = gl64_t(uint64_t(0));
    gl64_t tmp1_5 = gl64_t(uint64_t(0));
    gl64_t tmp1_6 = gl64_t(uint64_t(0));
    gl64_t tmp1_7 = gl64_t(uint64_t(0));
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
    gl64_t s1_0 = *(gl64_t*)&expressions_params[10][30];
    tmp1_0 = s0_0 - s1_0;
    // Op 1: dim1x1 mul
    gl64_t s1_1 = *(gl64_t*)&expressions_params[10][30];
    tmp1_0 = tmp1_0 * s1_1;
    // Op 2: dim3x1 mul
    gl64_t s0_2_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s0_2_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s0_2_2 = *(gl64_t*)&expressions_params[13][6+2];
    tmp3_0 = s0_2_0 * tmp1_0; tmp3_1 = s0_2_1 * tmp1_0; tmp3_2 = s0_2_2 * tmp1_0;
    // Op 3: dim1x1 sub
    gl64_t s0_3 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_3 = *(gl64_t*)&expressions_params[10][31];
    tmp1_0 = s0_3 - s1_3;
    // Op 4: dim1x1 mul
    gl64_t s1_4 = *(gl64_t*)&expressions_params[10][31];
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
    gl64_t s1_7 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_7 - s1_7;
    // Op 8: dim1x1 mul
    gl64_t s1_8 = *(gl64_t*)&expressions_params[10][1];
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
    // Op 11: dim1x1 sub
    gl64_t s0_11 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_11 = *(gl64_t*)&expressions_params[10][15];
    tmp1_0 = s0_11 - s1_11;
    // Op 12: dim1x1 mul
    gl64_t s1_12 = *(gl64_t*)&expressions_params[10][15];
    tmp1_0 = tmp1_0 * s1_12;
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
    // Op 15: dim1x1 sub
    gl64_t s0_15 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_15 = *(gl64_t*)&expressions_params[10][29];
    tmp1_0 = s0_15 - s1_15;
    // Op 16: dim1x1 mul
    gl64_t s1_16 = *(gl64_t*)&expressions_params[10][29];
    tmp1_0 = tmp1_0 * s1_16;
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
    // Op 19: dim1x1 sub
    gl64_t s0_19 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_19 = *(gl64_t*)&expressions_params[10][15];
    tmp1_0 = s0_19 - s1_19;
    // Op 20: dim1x1 mul
    gl64_t s1_20 = *(gl64_t*)&expressions_params[10][29];
    tmp1_0 = tmp1_0 * s1_20;
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
    gl64_t s0_23 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_23 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_23 - s0_23;
    // Op 24: dim1x1 mul
    gl64_t s0_24 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
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
    gl64_t s0_27 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 4, domainSize, nCols_1))];
    gl64_t s1_27 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s1_27 - s0_27;
    // Op 28: dim1x1 mul
    gl64_t s0_28 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    tmp1_0 = s0_28 * tmp1_0;
    // Op 29: dim1x1 add
    gl64_t s0_29 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 4, domainSize, nCols_1))];
    tmp1_0 = s0_29 + tmp1_0;
    // Op 30: dim1x1 sub
    gl64_t s0_30 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_0 = s0_30 - tmp1_0;
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
    // Op 33: dim1x1 sub
    gl64_t s0_33 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_33 = *(gl64_t*)&expressions_params[10][15];
    tmp1_0 = s0_33 - s1_33;
    // Op 34: dim1x1 mul
    gl64_t s0_34 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
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
    gl64_t s0_37 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_37 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_37 - s0_37;
    // Op 38: dim1x1 mul
    gl64_t s0_38 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_38 * tmp1_0;
    // Op 39: dim1x1 sub
    gl64_t s0_39 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    gl64_t s1_39 = *(gl64_t*)&expressions_params[10][16];
    tmp1_1 = s0_39 - s1_39;
    // Op 40: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
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
    // Op 43: dim1x1 sub_swap
    gl64_t s0_43 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_43 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_43 - s0_43;
    // Op 44: dim1x1 mul
    gl64_t s0_44 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_44 * tmp1_0;
    // Op 45: dim1x1 sub
    gl64_t s0_45 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_45 = *(gl64_t*)&expressions_params[10][17];
    tmp1_1 = s0_45 - s1_45;
    // Op 46: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
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
    gl64_t s0_49 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_49 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_49 - s0_49;
    // Op 50: dim1x1 mul
    gl64_t s0_50 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_50 * tmp1_0;
    // Op 51: dim1x1 sub
    gl64_t s0_51 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_51 = *(gl64_t*)&expressions_params[10][18];
    tmp1_1 = s0_51 - s1_51;
    // Op 52: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 53: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 54: dim3x3 mul
    gl64_t s1_54_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_54_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_54_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA54 = (tmp3_0 + tmp3_1) * (s1_54_0 + s1_54_1);
    gl64_t kB54 = (tmp3_0 + tmp3_2) * (s1_54_0 + s1_54_2);
    gl64_t kC54 = (tmp3_1 + tmp3_2) * (s1_54_1 + s1_54_2);
    gl64_t kD54 = tmp3_0 * s1_54_0;
    gl64_t kE54 = tmp3_1 * s1_54_1;
    gl64_t kF54 = tmp3_2 * s1_54_2;
    gl64_t kG54 = kD54 - kE54;
    tmp3_0 = (kC54 + kG54) - kF54;
    tmp3_1 = ((((kA54 + kC54) - kE54) - kE54) - kD54);
    tmp3_2 = kB54 - kG54;
    // Op 55: dim1x1 sub_swap
    gl64_t s0_55 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_55 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_55 - s0_55;
    // Op 56: dim1x1 mul
    gl64_t s0_56 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_56 * tmp1_0;
    // Op 57: dim1x1 sub
    gl64_t s0_57 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_57 = *(gl64_t*)&expressions_params[10][20];
    tmp1_1 = s0_57 - s1_57;
    // Op 58: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
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
    gl64_t s0_61 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_61 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_61 - s0_61;
    // Op 62: dim1x1 mul
    gl64_t s0_62 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
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
    gl64_t s0_65 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_65 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_65 - s0_65;
    // Op 66: dim1x1 mul
    gl64_t s0_66 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_66 * tmp1_0;
    // Op 67: dim1x1 sub
    gl64_t s0_67 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_67 = *(gl64_t*)&expressions_params[10][31];
    tmp1_1 = s0_67 - s1_67;
    // Op 68: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
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
    // Op 71: dim1x1 add
    gl64_t s0_71 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_71 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    tmp1_0 = s0_71 + s1_71;
    // Op 72: dim1x1 add
    gl64_t s0_72 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    tmp1_0 = s0_72 + tmp1_0;
    // Op 73: dim1x1 add
    gl64_t s0_73 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_73 + tmp1_0;
    // Op 74: dim1x1 add
    gl64_t s0_74 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_0 = s0_74 + tmp1_0;
    // Op 75: dim1x1 add
    gl64_t s0_75 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_1 = s0_75 + tmp1_0;
    // Op 76: dim1x1 sub
    gl64_t s1_76 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_1 - s1_76;
    // Op 77: dim1x1 mul
    tmp1_0 = tmp1_1 * tmp1_0;
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
    gl64_t s0_80 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_80 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_80 - s0_80;
    // Op 81: dim1x1 mul
    gl64_t s0_81 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
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
    gl64_t s0_84 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_84 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_84 - s0_84;
    // Op 85: dim1x1 mul
    gl64_t s0_85 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
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
    gl64_t s0_88 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    gl64_t s1_88 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_88 - s0_88;
    // Op 89: dim1x1 mul
    gl64_t s0_89 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
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
    // Op 92: dim1x1 sub_swap
    gl64_t s0_92 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    gl64_t s1_92 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_92 - s0_92;
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
    // Op 96: dim1x1 sub_swap
    gl64_t s0_96 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    gl64_t s1_96 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_96 - s0_96;
    // Op 97: dim1x1 mul
    gl64_t s0_97 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
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
    // Op 100: dim1x1 sub_swap
    gl64_t s0_100 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    gl64_t s1_100 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_100 - s0_100;
    // Op 101: dim1x1 mul
    gl64_t s0_101 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
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
    // Op 104: dim1x1 sub_swap
    gl64_t s0_104 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_104 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_104 - s0_104;
    // Op 105: dim1x1 mul
    gl64_t s0_105 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_2 = s0_105 * tmp1_0;
    // Op 106: dim1x1 sub_swap
    gl64_t s1_106 = *(gl64_t*)&expressions_params[9][0];
    tmp1_4 = s1_106 - tmp1_1;
    // Op 107: dim1x1 mul
    gl64_t s0_107 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    gl64_t s1_107 = *(gl64_t*)&expressions_params[9][6];
    tmp1_1 = s0_107 * s1_107;
    // Op 108: dim1x1 add
    tmp1_1 = tmp1_4 + tmp1_1;
    // Op 109: dim1x1 mul
    gl64_t s0_109 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    gl64_t s1_109 = *(gl64_t*)&expressions_params[9][7];
    tmp1_0 = s0_109 * s1_109;
    // Op 110: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 111: dim1x1 mul
    gl64_t s0_111 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    gl64_t s1_111 = *(gl64_t*)&expressions_params[9][8];
    tmp1_1 = s0_111 * s1_111;
    // Op 112: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_1;
    // Op 113: dim1x1 mul
    gl64_t s0_113 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    gl64_t s1_113 = *(gl64_t*)&expressions_params[9][9];
    tmp1_1 = s0_113 * s1_113;
    // Op 114: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_1;
    // Op 115: dim1x1 mul
    gl64_t s0_115 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_115 = *(gl64_t*)&expressions_params[9][10];
    tmp1_1 = s0_115 * s1_115;
    // Op 116: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_1;
    // Op 117: dim1x1 mul
    gl64_t s0_117 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_117 = *(gl64_t*)&expressions_params[9][11];
    tmp1_1 = s0_117 * s1_117;
    // Op 118: dim1x1 add
    tmp1_7 = tmp1_0 + tmp1_1;
    // Op 119: dim1x1 sub
    gl64_t s1_119 = *(gl64_t*)&expressions_params[10][19];
    tmp1_0 = tmp1_7 - s1_119;
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
    // Op 123: dim1x1 sub_swap
    gl64_t s0_123 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    gl64_t s1_123 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_123 - s0_123;
    // Op 124: dim1x1 sub_swap
    gl64_t s0_124 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_124 = *(gl64_t*)&expressions_params[9][0];
    tmp1_2 = s1_124 - s0_124;
    // Op 125: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_2;
    // Op 126: dim1x1 sub
    gl64_t s0_126 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    tmp1_0 = s0_126 - tmp1_0;
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
    // Op 129: dim1x1 sub
    gl64_t s0_129 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_129 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_129 - s1_129;
    // Op 130: dim1x1 mul
    gl64_t s0_130 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    tmp1_0 = s0_130 * tmp1_0;
    // Op 131: dim1x1 sub_swap
    gl64_t s0_131 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    gl64_t s1_131 = *(gl64_t*)&expressions_params[10][7];
    tmp1_2 = s1_131 - s0_131;
    // Op 132: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_2;
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
    gl64_t s0_135 = *(gl64_t*)&expressions_params[10][15];
    gl64_t s1_135 = *(gl64_t*)&expressions_params[10][21];
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
    gl64_t s0_138 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    gl64_t s1_138 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_138 * s1_138;
    // Op 139: dim1x1 mul
    gl64_t s1_139 = *(gl64_t*)&expressions_params[10][7];
    tmp1_0 = tmp1_0 * s1_139;
    // Op 140: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 141: dim3x3 mul
    gl64_t s1_141_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_141_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_141_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA141 = (tmp3_0 + tmp3_1) * (s1_141_0 + s1_141_1);
    gl64_t kB141 = (tmp3_0 + tmp3_2) * (s1_141_0 + s1_141_2);
    gl64_t kC141 = (tmp3_1 + tmp3_2) * (s1_141_1 + s1_141_2);
    gl64_t kD141 = tmp3_0 * s1_141_0;
    gl64_t kE141 = tmp3_1 * s1_141_1;
    gl64_t kF141 = tmp3_2 * s1_141_2;
    gl64_t kG141 = kD141 - kE141;
    tmp3_0 = (kC141 + kG141) - kF141;
    tmp3_1 = ((((kA141 + kC141) - kE141) - kE141) - kD141);
    tmp3_2 = kB141 - kG141;
    // Op 142: dim1x1 sub
    gl64_t s0_142 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_142 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_142 - s1_142;
    // Op 143: dim1x1 mul
    gl64_t s0_143 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    tmp1_0 = s0_143 * tmp1_0;
    // Op 144: dim1x1 sub_swap
    gl64_t s0_144 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    gl64_t s1_144 = *(gl64_t*)&expressions_params[10][8];
    tmp1_2 = s1_144 - s0_144;
    // Op 145: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_2;
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
    // Op 148: dim1x1 mul
    gl64_t s0_148 = *(gl64_t*)&expressions_params[10][15];
    gl64_t s1_148 = *(gl64_t*)&expressions_params[10][22];
    tmp1_0 = s0_148 * s1_148;
    // Op 149: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 150: dim3x3 mul
    gl64_t s1_150_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_150_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_150_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA150 = (tmp3_0 + tmp3_1) * (s1_150_0 + s1_150_1);
    gl64_t kB150 = (tmp3_0 + tmp3_2) * (s1_150_0 + s1_150_2);
    gl64_t kC150 = (tmp3_1 + tmp3_2) * (s1_150_1 + s1_150_2);
    gl64_t kD150 = tmp3_0 * s1_150_0;
    gl64_t kE150 = tmp3_1 * s1_150_1;
    gl64_t kF150 = tmp3_2 * s1_150_2;
    gl64_t kG150 = kD150 - kE150;
    tmp3_0 = (kC150 + kG150) - kF150;
    tmp3_1 = ((((kA150 + kC150) - kE150) - kE150) - kD150);
    tmp3_2 = kB150 - kG150;
    // Op 151: dim1x1 mul
    gl64_t s0_151 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    gl64_t s1_151 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_151 * s1_151;
    // Op 152: dim1x1 mul
    gl64_t s1_152 = *(gl64_t*)&expressions_params[10][8];
    tmp1_0 = tmp1_0 * s1_152;
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
    // Op 155: dim1x1 sub
    gl64_t s0_155 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_155 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_155 - s1_155;
    // Op 156: dim1x1 mul
    gl64_t s0_156 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    tmp1_0 = s0_156 * tmp1_0;
    // Op 157: dim1x1 sub_swap
    gl64_t s0_157 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    gl64_t s1_157 = *(gl64_t*)&expressions_params[10][9];
    tmp1_2 = s1_157 - s0_157;
    // Op 158: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_2;
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
    // Op 161: dim1x1 mul
    gl64_t s0_161 = *(gl64_t*)&expressions_params[10][15];
    gl64_t s1_161 = *(gl64_t*)&expressions_params[10][23];
    tmp1_0 = s0_161 * s1_161;
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
    // Op 164: dim1x1 mul
    gl64_t s0_164 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    gl64_t s1_164 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_164 * s1_164;
    // Op 165: dim1x1 mul
    gl64_t s1_165 = *(gl64_t*)&expressions_params[10][9];
    tmp1_0 = tmp1_0 * s1_165;
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
    // Op 168: dim1x1 sub
    gl64_t s0_168 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_168 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_168 - s1_168;
    // Op 169: dim1x1 mul
    gl64_t s0_169 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    tmp1_0 = s0_169 * tmp1_0;
    // Op 170: dim1x1 sub_swap
    gl64_t s0_170 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    gl64_t s1_170 = *(gl64_t*)&expressions_params[10][10];
    tmp1_2 = s1_170 - s0_170;
    // Op 171: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_2;
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
    gl64_t s0_174 = *(gl64_t*)&expressions_params[10][15];
    gl64_t s1_174 = *(gl64_t*)&expressions_params[10][24];
    tmp1_0 = s0_174 * s1_174;
    // Op 175: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 176: dim3x3 mul
    gl64_t s1_176_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_176_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_176_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA176 = (tmp3_0 + tmp3_1) * (s1_176_0 + s1_176_1);
    gl64_t kB176 = (tmp3_0 + tmp3_2) * (s1_176_0 + s1_176_2);
    gl64_t kC176 = (tmp3_1 + tmp3_2) * (s1_176_1 + s1_176_2);
    gl64_t kD176 = tmp3_0 * s1_176_0;
    gl64_t kE176 = tmp3_1 * s1_176_1;
    gl64_t kF176 = tmp3_2 * s1_176_2;
    gl64_t kG176 = kD176 - kE176;
    tmp3_0 = (kC176 + kG176) - kF176;
    tmp3_1 = ((((kA176 + kC176) - kE176) - kE176) - kD176);
    tmp3_2 = kB176 - kG176;
    // Op 177: dim1x1 mul
    gl64_t s0_177 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    gl64_t s1_177 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_177 * s1_177;
    // Op 178: dim1x1 mul
    gl64_t s1_178 = *(gl64_t*)&expressions_params[10][10];
    tmp1_0 = tmp1_0 * s1_178;
    // Op 179: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 180: dim3x3 mul
    gl64_t s1_180_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_180_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_180_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA180 = (tmp3_0 + tmp3_1) * (s1_180_0 + s1_180_1);
    gl64_t kB180 = (tmp3_0 + tmp3_2) * (s1_180_0 + s1_180_2);
    gl64_t kC180 = (tmp3_1 + tmp3_2) * (s1_180_1 + s1_180_2);
    gl64_t kD180 = tmp3_0 * s1_180_0;
    gl64_t kE180 = tmp3_1 * s1_180_1;
    gl64_t kF180 = tmp3_2 * s1_180_2;
    gl64_t kG180 = kD180 - kE180;
    tmp3_0 = (kC180 + kG180) - kF180;
    tmp3_1 = ((((kA180 + kC180) - kE180) - kE180) - kD180);
    tmp3_2 = kB180 - kG180;
    // Op 181: dim1x1 sub
    gl64_t s0_181 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_181 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_181 - s1_181;
    // Op 182: dim1x1 mul
    gl64_t s0_182 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    tmp1_0 = s0_182 * tmp1_0;
    // Op 183: dim1x1 sub_swap
    gl64_t s0_183 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    gl64_t s1_183 = *(gl64_t*)&expressions_params[10][11];
    tmp1_2 = s1_183 - s0_183;
    // Op 184: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_2;
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
    // Op 187: dim1x1 mul
    gl64_t s0_187 = *(gl64_t*)&expressions_params[10][15];
    gl64_t s1_187 = *(gl64_t*)&expressions_params[10][25];
    tmp1_0 = s0_187 * s1_187;
    // Op 188: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 189: dim3x3 mul
    gl64_t s1_189_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_189_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_189_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA189 = (tmp3_0 + tmp3_1) * (s1_189_0 + s1_189_1);
    gl64_t kB189 = (tmp3_0 + tmp3_2) * (s1_189_0 + s1_189_2);
    gl64_t kC189 = (tmp3_1 + tmp3_2) * (s1_189_1 + s1_189_2);
    gl64_t kD189 = tmp3_0 * s1_189_0;
    gl64_t kE189 = tmp3_1 * s1_189_1;
    gl64_t kF189 = tmp3_2 * s1_189_2;
    gl64_t kG189 = kD189 - kE189;
    tmp3_0 = (kC189 + kG189) - kF189;
    tmp3_1 = ((((kA189 + kC189) - kE189) - kE189) - kD189);
    tmp3_2 = kB189 - kG189;
    // Op 190: dim1x1 mul
    gl64_t s0_190 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    gl64_t s1_190 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_190 * s1_190;
    // Op 191: dim1x1 mul
    gl64_t s1_191 = *(gl64_t*)&expressions_params[10][11];
    tmp1_0 = tmp1_0 * s1_191;
    // Op 192: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 193: dim3x3 mul
    gl64_t s1_193_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_193_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_193_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA193 = (tmp3_0 + tmp3_1) * (s1_193_0 + s1_193_1);
    gl64_t kB193 = (tmp3_0 + tmp3_2) * (s1_193_0 + s1_193_2);
    gl64_t kC193 = (tmp3_1 + tmp3_2) * (s1_193_1 + s1_193_2);
    gl64_t kD193 = tmp3_0 * s1_193_0;
    gl64_t kE193 = tmp3_1 * s1_193_1;
    gl64_t kF193 = tmp3_2 * s1_193_2;
    gl64_t kG193 = kD193 - kE193;
    tmp3_0 = (kC193 + kG193) - kF193;
    tmp3_1 = ((((kA193 + kC193) - kE193) - kE193) - kD193);
    tmp3_2 = kB193 - kG193;
    // Op 194: dim1x1 sub
    gl64_t s0_194 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_194 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_194 - s1_194;
    // Op 195: dim1x1 mul
    gl64_t s0_195 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    tmp1_0 = s0_195 * tmp1_0;
    // Op 196: dim1x1 sub_swap
    gl64_t s0_196 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    gl64_t s1_196 = *(gl64_t*)&expressions_params[10][12];
    tmp1_2 = s1_196 - s0_196;
    // Op 197: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_2;
    // Op 198: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 199: dim3x3 mul
    gl64_t s1_199_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_199_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_199_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA199 = (tmp3_0 + tmp3_1) * (s1_199_0 + s1_199_1);
    gl64_t kB199 = (tmp3_0 + tmp3_2) * (s1_199_0 + s1_199_2);
    gl64_t kC199 = (tmp3_1 + tmp3_2) * (s1_199_1 + s1_199_2);
    gl64_t kD199 = tmp3_0 * s1_199_0;
    gl64_t kE199 = tmp3_1 * s1_199_1;
    gl64_t kF199 = tmp3_2 * s1_199_2;
    gl64_t kG199 = kD199 - kE199;
    tmp3_0 = (kC199 + kG199) - kF199;
    tmp3_1 = ((((kA199 + kC199) - kE199) - kE199) - kD199);
    tmp3_2 = kB199 - kG199;
    // Op 200: dim1x1 mul
    gl64_t s0_200 = *(gl64_t*)&expressions_params[10][15];
    gl64_t s1_200 = *(gl64_t*)&expressions_params[10][26];
    tmp1_0 = s0_200 * s1_200;
    // Op 201: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 202: dim3x3 mul
    gl64_t s1_202_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_202_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_202_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA202 = (tmp3_0 + tmp3_1) * (s1_202_0 + s1_202_1);
    gl64_t kB202 = (tmp3_0 + tmp3_2) * (s1_202_0 + s1_202_2);
    gl64_t kC202 = (tmp3_1 + tmp3_2) * (s1_202_1 + s1_202_2);
    gl64_t kD202 = tmp3_0 * s1_202_0;
    gl64_t kE202 = tmp3_1 * s1_202_1;
    gl64_t kF202 = tmp3_2 * s1_202_2;
    gl64_t kG202 = kD202 - kE202;
    tmp3_0 = (kC202 + kG202) - kF202;
    tmp3_1 = ((((kA202 + kC202) - kE202) - kE202) - kD202);
    tmp3_2 = kB202 - kG202;
    // Op 203: dim1x1 mul
    gl64_t s0_203 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    gl64_t s1_203 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_203 * s1_203;
    // Op 204: dim1x1 mul
    gl64_t s1_204 = *(gl64_t*)&expressions_params[10][12];
    tmp1_0 = tmp1_0 * s1_204;
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
    // Op 207: dim1x1 sub
    gl64_t s0_207 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_207 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_207 - s1_207;
    // Op 208: dim1x1 mul
    gl64_t s0_208 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    tmp1_0 = s0_208 * tmp1_0;
    // Op 209: dim1x1 sub_swap
    gl64_t s0_209 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    gl64_t s1_209 = *(gl64_t*)&expressions_params[10][13];
    tmp1_2 = s1_209 - s0_209;
    // Op 210: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_2;
    // Op 211: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 212: dim3x3 mul
    gl64_t s1_212_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_212_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_212_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA212 = (tmp3_0 + tmp3_1) * (s1_212_0 + s1_212_1);
    gl64_t kB212 = (tmp3_0 + tmp3_2) * (s1_212_0 + s1_212_2);
    gl64_t kC212 = (tmp3_1 + tmp3_2) * (s1_212_1 + s1_212_2);
    gl64_t kD212 = tmp3_0 * s1_212_0;
    gl64_t kE212 = tmp3_1 * s1_212_1;
    gl64_t kF212 = tmp3_2 * s1_212_2;
    gl64_t kG212 = kD212 - kE212;
    tmp3_0 = (kC212 + kG212) - kF212;
    tmp3_1 = ((((kA212 + kC212) - kE212) - kE212) - kD212);
    tmp3_2 = kB212 - kG212;
    // Op 213: dim1x1 mul
    gl64_t s0_213 = *(gl64_t*)&expressions_params[10][15];
    gl64_t s1_213 = *(gl64_t*)&expressions_params[10][27];
    tmp1_0 = s0_213 * s1_213;
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
    // Op 216: dim1x1 mul
    gl64_t s0_216 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    gl64_t s1_216 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_216 * s1_216;
    // Op 217: dim1x1 mul
    gl64_t s1_217 = *(gl64_t*)&expressions_params[10][13];
    tmp1_0 = tmp1_0 * s1_217;
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
    gl64_t s0_220 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_220 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_220 - s1_220;
    // Op 221: dim1x1 mul
    gl64_t s0_221 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    tmp1_0 = s0_221 * tmp1_0;
    // Op 222: dim1x1 sub_swap
    gl64_t s0_222 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    gl64_t s1_222 = *(gl64_t*)&expressions_params[10][14];
    tmp1_2 = s1_222 - s0_222;
    // Op 223: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_2;
    // Op 224: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 225: dim3x3 mul
    gl64_t s1_225_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_225_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_225_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA225 = (tmp3_0 + tmp3_1) * (s1_225_0 + s1_225_1);
    gl64_t kB225 = (tmp3_0 + tmp3_2) * (s1_225_0 + s1_225_2);
    gl64_t kC225 = (tmp3_1 + tmp3_2) * (s1_225_1 + s1_225_2);
    gl64_t kD225 = tmp3_0 * s1_225_0;
    gl64_t kE225 = tmp3_1 * s1_225_1;
    gl64_t kF225 = tmp3_2 * s1_225_2;
    gl64_t kG225 = kD225 - kE225;
    tmp3_0 = (kC225 + kG225) - kF225;
    tmp3_1 = ((((kA225 + kC225) - kE225) - kE225) - kD225);
    tmp3_2 = kB225 - kG225;
    // Op 226: dim1x1 mul
    gl64_t s0_226 = *(gl64_t*)&expressions_params[10][15];
    gl64_t s1_226 = *(gl64_t*)&expressions_params[10][28];
    tmp1_0 = s0_226 * s1_226;
    // Op 227: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 228: dim3x3 mul
    gl64_t s1_228_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_228_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_228_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA228 = (tmp3_0 + tmp3_1) * (s1_228_0 + s1_228_1);
    gl64_t kB228 = (tmp3_0 + tmp3_2) * (s1_228_0 + s1_228_2);
    gl64_t kC228 = (tmp3_1 + tmp3_2) * (s1_228_1 + s1_228_2);
    gl64_t kD228 = tmp3_0 * s1_228_0;
    gl64_t kE228 = tmp3_1 * s1_228_1;
    gl64_t kF228 = tmp3_2 * s1_228_2;
    gl64_t kG228 = kD228 - kE228;
    tmp3_0 = (kC228 + kG228) - kF228;
    tmp3_1 = ((((kA228 + kC228) - kE228) - kE228) - kD228);
    tmp3_2 = kB228 - kG228;
    // Op 229: dim1x1 mul
    gl64_t s0_229 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    gl64_t s1_229 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_229 * s1_229;
    // Op 230: dim1x1 mul
    gl64_t s1_230 = *(gl64_t*)&expressions_params[10][14];
    tmp1_0 = tmp1_0 * s1_230;
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
    gl64_t s0_233 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    gl64_t s1_233 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s0_233 * s1_233;
    // Op 234: dim1x1 add
    gl64_t s0_234 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp1_0 = s0_234 + tmp1_0;
    // Op 235: dim1x1 mul
    gl64_t s0_235 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    gl64_t s1_235 = *(gl64_t*)&expressions_params[9][2];
    tmp1_2 = s0_235 * s1_235;
    // Op 236: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_2;
    // Op 237: dim1x1 mul
    gl64_t s0_237 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    gl64_t s1_237 = *(gl64_t*)&expressions_params[9][3];
    tmp1_2 = s0_237 * s1_237;
    // Op 238: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_2;
    // Op 239: dim1x1 mul
    tmp1_1 = tmp1_4 * tmp1_0;
    // Op 240: dim1x1 mul
    gl64_t s0_240 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    gl64_t s1_240 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s0_240 * s1_240;
    // Op 241: dim1x1 add
    gl64_t s0_241 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    tmp1_0 = s0_241 + tmp1_0;
    // Op 242: dim1x1 mul
    gl64_t s0_242 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    gl64_t s1_242 = *(gl64_t*)&expressions_params[9][2];
    tmp1_2 = s0_242 * s1_242;
    // Op 243: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_2;
    // Op 244: dim1x1 mul
    gl64_t s0_244 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    gl64_t s1_244 = *(gl64_t*)&expressions_params[9][3];
    tmp1_2 = s0_244 * s1_244;
    // Op 245: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_2;
    // Op 246: dim1x1 mul
    gl64_t s0_246 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_246 * tmp1_0;
    // Op 247: dim1x1 add
    tmp1_2 = tmp1_1 + tmp1_0;
    // Op 248: dim1x1 mul
    gl64_t s0_248 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    gl64_t s1_248 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s0_248 * s1_248;
    // Op 249: dim1x1 add
    gl64_t s0_249 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    tmp1_0 = s0_249 + tmp1_0;
    // Op 250: dim1x1 mul
    gl64_t s0_250 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    gl64_t s1_250 = *(gl64_t*)&expressions_params[9][2];
    tmp1_1 = s0_250 * s1_250;
    // Op 251: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_1;
    // Op 252: dim1x1 mul
    gl64_t s0_252 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    gl64_t s1_252 = *(gl64_t*)&expressions_params[9][3];
    tmp1_1 = s0_252 * s1_252;
    // Op 253: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_1;
    // Op 254: dim1x1 mul
    gl64_t s0_254 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_0 = s0_254 * tmp1_0;
    // Op 255: dim1x1 add
    tmp1_1 = tmp1_2 + tmp1_0;
    // Op 256: dim1x1 mul
    gl64_t s0_256 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    gl64_t s1_256 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s0_256 * s1_256;
    // Op 257: dim1x1 add
    gl64_t s0_257 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    tmp1_0 = s0_257 + tmp1_0;
    // Op 258: dim1x1 mul
    gl64_t s0_258 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    gl64_t s1_258 = *(gl64_t*)&expressions_params[9][2];
    tmp1_2 = s0_258 * s1_258;
    // Op 259: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_2;
    // Op 260: dim1x1 mul
    gl64_t s0_260 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    gl64_t s1_260 = *(gl64_t*)&expressions_params[9][3];
    tmp1_2 = s0_260 * s1_260;
    // Op 261: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_2;
    // Op 262: dim1x1 mul
    gl64_t s0_262 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_262 * tmp1_0;
    // Op 263: dim1x1 add
    tmp1_3 = tmp1_1 + tmp1_0;
    // Op 264: dim1x1 mul
    gl64_t s0_264 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    gl64_t s1_264 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s0_264 * s1_264;
    // Op 265: dim1x1 add
    gl64_t s0_265 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    tmp1_0 = s0_265 + tmp1_0;
    // Op 266: dim1x1 mul
    gl64_t s0_266 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    gl64_t s1_266 = *(gl64_t*)&expressions_params[9][2];
    tmp1_1 = s0_266 * s1_266;
    // Op 267: dim1x1 add
    tmp1_2 = tmp1_0 + tmp1_1;
    // Op 268: dim1x1 mul
    gl64_t s0_268 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    gl64_t s1_268 = *(gl64_t*)&expressions_params[10][21];
    tmp1_0 = s0_268 * s1_268;
    // Op 269: dim1x1 mul
    gl64_t s0_269 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    gl64_t s1_269 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_2, 13, domainSize, nCols_1))];
    tmp1_1 = s0_269 * s1_269;
    // Op 270: dim1x1 add
    tmp1_5 = tmp1_0 + tmp1_1;
    // Op 271: dim1x1 mul
    gl64_t s1_271 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = tmp1_5 * s1_271;
    // Op 272: dim1x1 add
    tmp1_0 = tmp1_2 + tmp1_0;
    // Op 273: dim1x1 mul
    gl64_t s0_273 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    tmp1_0 = s0_273 * tmp1_0;
    // Op 274: dim1x1 add
    tmp1_1 = tmp1_3 + tmp1_0;
    // Op 275: dim1x1 mul
    gl64_t s0_275 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    gl64_t s1_275 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s0_275 * s1_275;
    // Op 276: dim1x1 add
    gl64_t s0_276 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    tmp1_0 = s0_276 + tmp1_0;
    // Op 277: dim1x1 mul
    gl64_t s1_277 = *(gl64_t*)&expressions_params[9][2];
    tmp1_3 = tmp1_5 * s1_277;
    // Op 278: dim1x1 add
    tmp1_2 = tmp1_0 + tmp1_3;
    // Op 279: dim1x1 mul
    gl64_t s0_279 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    gl64_t s1_279 = *(gl64_t*)&expressions_params[10][22];
    tmp1_0 = s0_279 * s1_279;
    // Op 280: dim1x1 mul
    gl64_t s0_280 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    gl64_t s1_280 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_2, 14, domainSize, nCols_1))];
    tmp1_3 = s0_280 * s1_280;
    // Op 281: dim1x1 add
    tmp1_6 = tmp1_0 + tmp1_3;
    // Op 282: dim1x1 mul
    gl64_t s1_282 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = tmp1_6 * s1_282;
    // Op 283: dim1x1 add
    tmp1_0 = tmp1_2 + tmp1_0;
    // Op 284: dim1x1 mul
    gl64_t s0_284 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    tmp1_0 = s0_284 * tmp1_0;
    // Op 285: dim1x1 add
    tmp1_3 = tmp1_1 + tmp1_0;
    // Op 286: dim1x1 mul
    gl64_t s1_286 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = tmp1_5 * s1_286;
    // Op 287: dim1x1 add
    gl64_t s0_287 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    tmp1_0 = s0_287 + tmp1_0;
    // Op 288: dim1x1 mul
    gl64_t s1_288 = *(gl64_t*)&expressions_params[9][2];
    tmp1_1 = tmp1_6 * s1_288;
    // Op 289: dim1x1 add
    tmp1_2 = tmp1_0 + tmp1_1;
    // Op 290: dim1x1 mul
    gl64_t s0_290 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    gl64_t s1_290 = *(gl64_t*)&expressions_params[10][23];
    tmp1_0 = s0_290 * s1_290;
    // Op 291: dim1x1 mul
    gl64_t s0_291 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    gl64_t s1_291 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_2, 15, domainSize, nCols_1))];
    tmp1_1 = s0_291 * s1_291;
    // Op 292: dim1x1 add
    tmp1_1 = tmp1_0 + tmp1_1;
    // Op 293: dim1x1 mul
    gl64_t s1_293 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = tmp1_1 * s1_293;
    // Op 294: dim1x1 add
    tmp1_0 = tmp1_2 + tmp1_0;
    // Op 295: dim1x1 mul
    gl64_t s0_295 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp1_0 = s0_295 * tmp1_0;
    // Op 296: dim1x1 add
    tmp1_0 = tmp1_3 + tmp1_0;
    // Op 297: dim1x1 sub
    gl64_t s0_297 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp1_0 = s0_297 - tmp1_0;
    // Op 298: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 299: dim3x3 mul
    gl64_t s1_299_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_299_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_299_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA299 = (tmp3_0 + tmp3_1) * (s1_299_0 + s1_299_1);
    gl64_t kB299 = (tmp3_0 + tmp3_2) * (s1_299_0 + s1_299_2);
    gl64_t kC299 = (tmp3_1 + tmp3_2) * (s1_299_1 + s1_299_2);
    gl64_t kD299 = tmp3_0 * s1_299_0;
    gl64_t kE299 = tmp3_1 * s1_299_1;
    gl64_t kF299 = tmp3_2 * s1_299_2;
    gl64_t kG299 = kD299 - kE299;
    tmp3_0 = (kC299 + kG299) - kF299;
    tmp3_1 = ((((kA299 + kC299) - kE299) - kE299) - kD299);
    tmp3_2 = kB299 - kG299;
    // Op 300: dim1x1 mul
    gl64_t s0_300 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    gl64_t s1_300 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s0_300 * s1_300;
    // Op 301: dim1x1 add
    gl64_t s0_301 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    tmp1_0 = s0_301 + tmp1_0;
    // Op 302: dim1x1 mul
    gl64_t s0_302 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    gl64_t s1_302 = *(gl64_t*)&expressions_params[9][2];
    tmp1_3 = s0_302 * s1_302;
    // Op 303: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 304: dim1x1 mul
    gl64_t s1_304 = *(gl64_t*)&expressions_params[9][3];
    tmp1_3 = tmp1_5 * s1_304;
    // Op 305: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 306: dim1x1 mul
    tmp1_3 = tmp1_4 * tmp1_0;
    // Op 307: dim1x1 mul
    gl64_t s0_307 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    gl64_t s1_307 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s0_307 * s1_307;
    // Op 308: dim1x1 add
    gl64_t s0_308 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    tmp1_0 = s0_308 + tmp1_0;
    // Op 309: dim1x1 mul
    gl64_t s1_309 = *(gl64_t*)&expressions_params[9][2];
    tmp1_4 = tmp1_5 * s1_309;
    // Op 310: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_4;
    // Op 311: dim1x1 mul
    gl64_t s1_311 = *(gl64_t*)&expressions_params[9][3];
    tmp1_4 = tmp1_6 * s1_311;
    // Op 312: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_4;
    // Op 313: dim1x1 mul
    gl64_t s0_313 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_313 * tmp1_0;
    // Op 314: dim1x1 add
    tmp1_4 = tmp1_3 + tmp1_0;
    // Op 315: dim1x1 mul
    gl64_t s1_315 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = tmp1_5 * s1_315;
    // Op 316: dim1x1 add
    gl64_t s0_316 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    tmp1_0 = s0_316 + tmp1_0;
    // Op 317: dim1x1 mul
    gl64_t s1_317 = *(gl64_t*)&expressions_params[9][2];
    tmp1_3 = tmp1_6 * s1_317;
    // Op 318: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 319: dim1x1 mul
    gl64_t s1_319 = *(gl64_t*)&expressions_params[9][3];
    tmp1_3 = tmp1_1 * s1_319;
    // Op 320: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_3;
    // Op 321: dim1x1 mul
    gl64_t s0_321 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_0 = s0_321 * tmp1_0;
    // Op 322: dim1x1 add
    tmp1_3 = tmp1_4 + tmp1_0;
    // Op 323: dim1x1 mul
    gl64_t s1_323 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = tmp1_6 * s1_323;
    // Op 324: dim1x1 add
    tmp1_0 = tmp1_5 + tmp1_0;
    // Op 325: dim1x1 mul
    gl64_t s1_325 = *(gl64_t*)&expressions_params[9][2];
    tmp1_5 = tmp1_1 * s1_325;
    // Op 326: dim1x1 add
    tmp1_4 = tmp1_0 + tmp1_5;
    // Op 327: dim1x1 mul
    gl64_t s0_327 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    gl64_t s1_327 = *(gl64_t*)&expressions_params[10][24];
    tmp1_0 = s0_327 * s1_327;
    // Op 328: dim1x1 mul
    gl64_t s0_328 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    gl64_t s1_328 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_2, 16, domainSize, nCols_1))];
    tmp1_5 = s0_328 * s1_328;
    // Op 329: dim1x1 add
    tmp1_5 = tmp1_0 + tmp1_5;
    // Op 330: dim1x1 mul
    gl64_t s1_330 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = tmp1_5 * s1_330;
    // Op 331: dim1x1 add
    tmp1_0 = tmp1_4 + tmp1_0;
    // Op 332: dim1x1 mul
    gl64_t s0_332 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_332 * tmp1_0;
    // Op 333: dim1x1 add
    tmp1_4 = tmp1_3 + tmp1_0;
    // Op 334: dim1x1 mul
    gl64_t s1_334 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = tmp1_1 * s1_334;
    // Op 335: dim1x1 add
    tmp1_0 = tmp1_6 + tmp1_0;
    // Op 336: dim1x1 mul
    gl64_t s1_336 = *(gl64_t*)&expressions_params[9][2];
    tmp1_6 = tmp1_5 * s1_336;
    // Op 337: dim1x1 add
    tmp1_3 = tmp1_0 + tmp1_6;
    // Op 338: dim1x1 mul
    gl64_t s0_338 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    gl64_t s1_338 = *(gl64_t*)&expressions_params[10][25];
    tmp1_0 = s0_338 * s1_338;
    // Op 339: dim1x1 mul
    gl64_t s0_339 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    gl64_t s1_339 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_2, 17, domainSize, nCols_1))];
    tmp1_6 = s0_339 * s1_339;
    // Op 340: dim1x1 add
    tmp1_6 = tmp1_0 + tmp1_6;
    // Op 341: dim1x1 mul
    gl64_t s1_341 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = tmp1_6 * s1_341;
    // Op 342: dim1x1 add
    tmp1_0 = tmp1_3 + tmp1_0;
    // Op 343: dim1x1 mul
    gl64_t s0_343 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    tmp1_0 = s0_343 * tmp1_0;
    // Op 344: dim1x1 add
    tmp1_3 = tmp1_4 + tmp1_0;
    // Op 345: dim1x1 mul
    gl64_t s1_345 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = tmp1_5 * s1_345;
    // Op 346: dim1x1 add
    tmp1_0 = tmp1_1 + tmp1_0;
    // Op 347: dim1x1 mul
    gl64_t s1_347 = *(gl64_t*)&expressions_params[9][2];
    tmp1_1 = tmp1_6 * s1_347;
    // Op 348: dim1x1 add
    tmp1_4 = tmp1_0 + tmp1_1;
    // Op 349: dim1x1 mul
    gl64_t s0_349 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    gl64_t s1_349 = *(gl64_t*)&expressions_params[10][26];
    tmp1_0 = s0_349 * s1_349;
    // Op 350: dim1x1 mul
    gl64_t s0_350 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    gl64_t s1_350 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_2, 18, domainSize, nCols_1))];
    tmp1_1 = s0_350 * s1_350;
    // Op 351: dim1x1 add
    tmp1_1 = tmp1_0 + tmp1_1;
    // Op 352: dim1x1 mul
    gl64_t s1_352 = *(gl64_t*)&expressions_params[9][3];
    tmp1_0 = tmp1_1 * s1_352;
    // Op 353: dim1x1 add
    tmp1_0 = tmp1_4 + tmp1_0;
    // Op 354: dim1x1 mul
    gl64_t s0_354 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    tmp1_0 = s0_354 * tmp1_0;
    // Op 355: dim1x1 add
    tmp1_0 = tmp1_3 + tmp1_0;
    // Op 356: dim1x1 mul
    gl64_t s1_356 = *(gl64_t*)&expressions_params[9][1];
    tmp1_6 = tmp1_6 * s1_356;
    // Op 357: dim1x1 add
    tmp1_5 = tmp1_5 + tmp1_6;
    // Op 358: dim1x1 mul
    gl64_t s1_358 = *(gl64_t*)&expressions_params[9][2];
    tmp1_1 = tmp1_1 * s1_358;
    // Op 359: dim1x1 add
    tmp1_6 = tmp1_5 + tmp1_1;
    // Op 360: dim1x1 mul
    gl64_t s0_360 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    gl64_t s1_360 = *(gl64_t*)&expressions_params[10][27];
    tmp1_1 = s0_360 * s1_360;
    // Op 361: dim1x1 mul
    gl64_t s0_361 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    gl64_t s1_361 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_2, 19, domainSize, nCols_1))];
    tmp1_5 = s0_361 * s1_361;
    // Op 362: dim1x1 add
    tmp1_1 = tmp1_1 + tmp1_5;
    // Op 363: dim1x1 mul
    gl64_t s1_363 = *(gl64_t*)&expressions_params[9][3];
    tmp1_1 = tmp1_1 * s1_363;
    // Op 364: dim1x1 add
    tmp1_1 = tmp1_6 + tmp1_1;
    // Op 365: dim1x1 mul
    gl64_t s0_365 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp1_1 = s0_365 * tmp1_1;
    // Op 366: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_1;
    // Op 367: dim1x1 sub
    gl64_t s0_367 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    tmp1_0 = s0_367 - tmp1_0;
    // Op 368: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 369: dim3x3 mul
    gl64_t s1_369_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_369_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_369_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA369 = (tmp3_0 + tmp3_1) * (s1_369_0 + s1_369_1);
    gl64_t kB369 = (tmp3_0 + tmp3_2) * (s1_369_0 + s1_369_2);
    gl64_t kC369 = (tmp3_1 + tmp3_2) * (s1_369_1 + s1_369_2);
    gl64_t kD369 = tmp3_0 * s1_369_0;
    gl64_t kE369 = tmp3_1 * s1_369_1;
    gl64_t kF369 = tmp3_2 * s1_369_2;
    gl64_t kG369 = kD369 - kE369;
    tmp3_0 = (kC369 + kG369) - kF369;
    tmp3_1 = ((((kA369 + kC369) - kE369) - kE369) - kD369);
    tmp3_2 = kB369 - kG369;
    // Op 370: dim1x1 sub
    gl64_t s0_370 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_370 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_370 - s1_370;
    // Op 371: dim1x1 mul
    gl64_t s0_371 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    tmp1_6 = s0_371 * tmp1_0;
    // Op 372: dim1x1 sub_swap
    gl64_t s0_372 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_372 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s1_372 - s0_372;
    // Op 373: dim1x1 sub
    gl64_t s0_373 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    tmp1_0 = s0_373 - tmp1_0;
    // Op 374: dim1x1 mul
    tmp1_0 = tmp1_6 * tmp1_0;
    // Op 375: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 376: dim3x3 mul
    gl64_t s1_376_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_376_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_376_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA376 = (tmp3_0 + tmp3_1) * (s1_376_0 + s1_376_1);
    gl64_t kB376 = (tmp3_0 + tmp3_2) * (s1_376_0 + s1_376_2);
    gl64_t kC376 = (tmp3_1 + tmp3_2) * (s1_376_1 + s1_376_2);
    gl64_t kD376 = tmp3_0 * s1_376_0;
    gl64_t kE376 = tmp3_1 * s1_376_1;
    gl64_t kF376 = tmp3_2 * s1_376_2;
    gl64_t kG376 = kD376 - kE376;
    tmp3_0 = (kC376 + kG376) - kF376;
    tmp3_1 = ((((kA376 + kC376) - kE376) - kE376) - kD376);
    tmp3_2 = kB376 - kG376;
    // Op 377: dim1x1 sub_swap
    gl64_t s0_377 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    gl64_t s1_377 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_377 - s0_377;
    // Op 378: dim1x1 sub_swap
    gl64_t s0_378 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 4, domainSize, nCols_1))];
    gl64_t s1_378 = *(gl64_t*)&expressions_params[9][0];
    tmp1_1 = s1_378 - s0_378;
    // Op 379: dim1x1 mul
    tmp1_5 = tmp1_0 * tmp1_1;
    // Op 380: dim1x1 sub
    gl64_t s0_380 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 3, domainSize, nCols_1))];
    gl64_t s1_380 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_380 - s1_380;
    // Op 381: dim1x1 sub
    gl64_t s0_381 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    tmp1_0 = s0_381 - tmp1_0;
    // Op 382: dim1x1 mul
    tmp1_0 = tmp1_5 * tmp1_0;
    // Op 383: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 384: dim3x3 mul
    gl64_t s1_384_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_384_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_384_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA384 = (tmp3_0 + tmp3_1) * (s1_384_0 + s1_384_1);
    gl64_t kB384 = (tmp3_0 + tmp3_2) * (s1_384_0 + s1_384_2);
    gl64_t kC384 = (tmp3_1 + tmp3_2) * (s1_384_1 + s1_384_2);
    gl64_t kD384 = tmp3_0 * s1_384_0;
    gl64_t kE384 = tmp3_1 * s1_384_1;
    gl64_t kF384 = tmp3_2 * s1_384_2;
    gl64_t kG384 = kD384 - kE384;
    tmp3_0 = (kC384 + kG384) - kF384;
    tmp3_1 = ((((kA384 + kC384) - kE384) - kE384) - kD384);
    tmp3_2 = kB384 - kG384;
    // Op 385: dim1x1 add
    gl64_t s0_385 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_385 = *(gl64_t*)&expressions_params[10][2];
    tmp1_0 = s0_385 + s1_385;
    // Op 386: dim1x1 sub
    gl64_t s0_386 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    tmp1_0 = s0_386 - tmp1_0;
    // Op 387: dim1x1 mul
    tmp1_0 = tmp1_6 * tmp1_0;
    // Op 388: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 389: dim3x3 mul
    gl64_t s1_389_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_389_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_389_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA389 = (tmp3_0 + tmp3_1) * (s1_389_0 + s1_389_1);
    gl64_t kB389 = (tmp3_0 + tmp3_2) * (s1_389_0 + s1_389_2);
    gl64_t kC389 = (tmp3_1 + tmp3_2) * (s1_389_1 + s1_389_2);
    gl64_t kD389 = tmp3_0 * s1_389_0;
    gl64_t kE389 = tmp3_1 * s1_389_1;
    gl64_t kF389 = tmp3_2 * s1_389_2;
    gl64_t kG389 = kD389 - kE389;
    tmp3_0 = (kC389 + kG389) - kF389;
    tmp3_1 = ((((kA389 + kC389) - kE389) - kE389) - kD389);
    tmp3_2 = kB389 - kG389;
    // Op 390: dim1x1 add
    gl64_t s0_390 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 1, domainSize, nCols_1))];
    gl64_t s1_390 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_390 + s1_390;
    // Op 391: dim1x1 sub
    gl64_t s0_391 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    tmp1_0 = s0_391 - tmp1_0;
    // Op 392: dim1x1 mul
    tmp1_0 = tmp1_5 * tmp1_0;
    // Op 393: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 394: dim3x3 mul
    gl64_t s1_394_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_394_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_394_2 = *(gl64_t*)&expressions_params[13][6+2];
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
    // Op 395: dim1x1 add
    gl64_t s0_395 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_395 = *(gl64_t*)&expressions_params[10][3];
    tmp1_0 = s0_395 + s1_395;
    // Op 396: dim1x1 sub
    gl64_t s0_396 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    tmp1_0 = s0_396 - tmp1_0;
    // Op 397: dim1x1 mul
    tmp1_0 = tmp1_6 * tmp1_0;
    // Op 398: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 399: dim3x3 mul
    gl64_t s1_399_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_399_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_399_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA399 = (tmp3_0 + tmp3_1) * (s1_399_0 + s1_399_1);
    gl64_t kB399 = (tmp3_0 + tmp3_2) * (s1_399_0 + s1_399_2);
    gl64_t kC399 = (tmp3_1 + tmp3_2) * (s1_399_1 + s1_399_2);
    gl64_t kD399 = tmp3_0 * s1_399_0;
    gl64_t kE399 = tmp3_1 * s1_399_1;
    gl64_t kF399 = tmp3_2 * s1_399_2;
    gl64_t kG399 = kD399 - kE399;
    tmp3_0 = (kC399 + kG399) - kF399;
    tmp3_1 = ((((kA399 + kC399) - kE399) - kE399) - kD399);
    tmp3_2 = kB399 - kG399;
    // Op 400: dim1x1 add
    gl64_t s0_400 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 2, domainSize, nCols_1))];
    gl64_t s1_400 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_400 + s1_400;
    // Op 401: dim1x1 sub
    gl64_t s0_401 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    tmp1_0 = s0_401 - tmp1_0;
    // Op 402: dim1x1 mul
    tmp1_0 = tmp1_5 * tmp1_0;
    // Op 403: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 404: dim3x3 mul
    gl64_t s1_404_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_404_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_404_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA404 = (tmp3_0 + tmp3_1) * (s1_404_0 + s1_404_1);
    gl64_t kB404 = (tmp3_0 + tmp3_2) * (s1_404_0 + s1_404_2);
    gl64_t kC404 = (tmp3_1 + tmp3_2) * (s1_404_1 + s1_404_2);
    gl64_t kD404 = tmp3_0 * s1_404_0;
    gl64_t kE404 = tmp3_1 * s1_404_1;
    gl64_t kF404 = tmp3_2 * s1_404_2;
    gl64_t kG404 = kD404 - kE404;
    tmp3_0 = (kC404 + kG404) - kF404;
    tmp3_1 = ((((kA404 + kC404) - kE404) - kE404) - kD404);
    tmp3_2 = kB404 - kG404;
    // Op 405: dim1x1 sub
    gl64_t s1_405 = *(gl64_t*)&expressions_params[10][5];
    tmp1_0 = tmp1_7 - s1_405;
    // Op 406: dim1x1 mul
    tmp1_0 = tmp1_6 * tmp1_0;
    // Op 407: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 408: dim3x3 mul
    gl64_t s1_408_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_408_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_408_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA408 = (tmp3_0 + tmp3_1) * (s1_408_0 + s1_408_1);
    gl64_t kB408 = (tmp3_0 + tmp3_2) * (s1_408_0 + s1_408_2);
    gl64_t kC408 = (tmp3_1 + tmp3_2) * (s1_408_1 + s1_408_2);
    gl64_t kD408 = tmp3_0 * s1_408_0;
    gl64_t kE408 = tmp3_1 * s1_408_1;
    gl64_t kF408 = tmp3_2 * s1_408_2;
    gl64_t kG408 = kD408 - kE408;
    tmp3_0 = (kC408 + kG408) - kF408;
    tmp3_1 = ((((kA408 + kC408) - kE408) - kE408) - kD408);
    tmp3_2 = kB408 - kG408;
    // Op 409: dim1x1 add
    gl64_t s0_409 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 7, domainSize, nCols_1))];
    gl64_t s1_409 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 8, domainSize, nCols_1))];
    tmp1_0 = s0_409 + s1_409;
    // Op 410: dim1x1 add
    gl64_t s0_410 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 9, domainSize, nCols_1))];
    tmp1_0 = s0_410 + tmp1_0;
    // Op 411: dim1x1 add
    gl64_t s0_411 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 10, domainSize, nCols_1))];
    tmp1_0 = s0_411 + tmp1_0;
    // Op 412: dim1x1 add
    gl64_t s0_412 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 11, domainSize, nCols_1))];
    tmp1_0 = s0_412 + tmp1_0;
    // Op 413: dim1x1 add
    gl64_t s0_413 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 12, domainSize, nCols_1))];
    tmp1_0 = s0_413 + tmp1_0;
    // Op 414: dim1x1 sub_swap
    gl64_t s1_414 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_414 - tmp1_0;
    // Op 415: dim1x1 mul
    gl64_t s0_415 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 12, domainSize, nCols_1))];
    gl64_t s1_415 = *(gl64_t*)&expressions_params[9][6];
    tmp1_1 = s0_415 * s1_415;
    // Op 416: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_1;
    // Op 417: dim1x1 mul
    gl64_t s0_417 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 11, domainSize, nCols_1))];
    gl64_t s1_417 = *(gl64_t*)&expressions_params[9][7];
    tmp1_1 = s0_417 * s1_417;
    // Op 418: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_1;
    // Op 419: dim1x1 mul
    gl64_t s0_419 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 10, domainSize, nCols_1))];
    gl64_t s1_419 = *(gl64_t*)&expressions_params[9][8];
    tmp1_1 = s0_419 * s1_419;
    // Op 420: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_1;
    // Op 421: dim1x1 mul
    gl64_t s0_421 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 9, domainSize, nCols_1))];
    gl64_t s1_421 = *(gl64_t*)&expressions_params[9][9];
    tmp1_1 = s0_421 * s1_421;
    // Op 422: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_1;
    // Op 423: dim1x1 mul
    gl64_t s0_423 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 8, domainSize, nCols_1))];
    gl64_t s1_423 = *(gl64_t*)&expressions_params[9][10];
    tmp1_1 = s0_423 * s1_423;
    // Op 424: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_1;
    // Op 425: dim1x1 mul
    gl64_t s0_425 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 7, domainSize, nCols_1))];
    gl64_t s1_425 = *(gl64_t*)&expressions_params[9][11];
    tmp1_1 = s0_425 * s1_425;
    // Op 426: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_1;
    // Op 427: dim1x1 sub
    tmp1_0 = tmp1_7 - tmp1_0;
    // Op 428: dim1x1 mul
    tmp1_0 = tmp1_5 * tmp1_0;
    // Op 429: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    tmp3_0 = (kC430 + kG430) - kF430;
    tmp3_1 = ((((kA430 + kC430) - kE430) - kE430) - kD430);
    tmp3_2 = kB430 - kG430;
    // Op 431: dim1x1 sub
    gl64_t s0_431 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_431 = *(gl64_t*)&expressions_params[10][30];
    tmp1_0 = s0_431 - s1_431;
    // Op 432: dim1x1 mul
    tmp1_0 = tmp1_6 * tmp1_0;
    // Op 433: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 434: dim3x3 mul
    gl64_t s1_434_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_434_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_434_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA434 = (tmp3_0 + tmp3_1) * (s1_434_0 + s1_434_1);
    gl64_t kB434 = (tmp3_0 + tmp3_2) * (s1_434_0 + s1_434_2);
    gl64_t kC434 = (tmp3_1 + tmp3_2) * (s1_434_1 + s1_434_2);
    gl64_t kD434 = tmp3_0 * s1_434_0;
    gl64_t kE434 = tmp3_1 * s1_434_1;
    gl64_t kF434 = tmp3_2 * s1_434_2;
    gl64_t kG434 = kD434 - kE434;
    tmp3_0 = (kC434 + kG434) - kF434;
    tmp3_1 = ((((kA434 + kC434) - kE434) - kE434) - kD434);
    tmp3_2 = kB434 - kG434;
    // Op 435: dim1x1 sub
    gl64_t s0_435 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_435 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 6, domainSize, nCols_1))];
    tmp1_0 = s0_435 - s1_435;
    // Op 436: dim1x1 mul
    tmp1_0 = tmp1_5 * tmp1_0;
    // Op 437: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 438: dim3x3 mul
    gl64_t s1_438_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_438_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_438_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA438 = (tmp3_0 + tmp3_1) * (s1_438_0 + s1_438_1);
    gl64_t kB438 = (tmp3_0 + tmp3_2) * (s1_438_0 + s1_438_2);
    gl64_t kC438 = (tmp3_1 + tmp3_2) * (s1_438_1 + s1_438_2);
    gl64_t kD438 = tmp3_0 * s1_438_0;
    gl64_t kE438 = tmp3_1 * s1_438_1;
    gl64_t kF438 = tmp3_2 * s1_438_2;
    gl64_t kG438 = kD438 - kE438;
    tmp3_0 = (kC438 + kG438) - kF438;
    tmp3_1 = ((((kA438 + kC438) - kE438) - kE438) - kD438);
    tmp3_2 = kB438 - kG438;
    // Op 439: dim1x1 sub
    gl64_t s0_439 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_439 = *(gl64_t*)&expressions_params[10][4];
    tmp1_0 = s0_439 - s1_439;
    // Op 440: dim1x1 mul
    tmp1_0 = tmp1_6 * tmp1_0;
    // Op 441: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    tmp3_0 = (kC442 + kG442) - kF442;
    tmp3_1 = ((((kA442 + kC442) - kE442) - kE442) - kD442);
    tmp3_2 = kB442 - kG442;
    // Op 443: dim1x1 sub
    gl64_t s0_443 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_443 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 0, domainSize, nCols_1))];
    tmp1_0 = s0_443 - s1_443;
    // Op 444: dim1x1 mul
    tmp1_0 = tmp1_5 * tmp1_0;
    // Op 445: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 446: dim3x3 mul
    gl64_t s1_446_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_446_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_446_2 = *(gl64_t*)&expressions_params[13][6+2];
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
    // Op 447: dim1x1 mul
    gl64_t s0_447 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_447 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    tmp1_0 = s0_447 * s1_447;
    // Op 448: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 449: dim3x3 mul
    gl64_t s1_449_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_449_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_449_2 = *(gl64_t*)&expressions_params[13][6+2];
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
    gl64_t s0_450 = *(gl64_t*)&expressions_params[9][2];
    gl64_t s1_450 = *(gl64_t*)&expressions_params[10][34];
    tmp1_0 = s0_450 * s1_450;
    // Op 451: dim1x1 add
    gl64_t s1_451 = *(gl64_t*)&expressions_params[10][33];
    tmp1_0 = tmp1_0 + s1_451;
    // Op 452: dim1x1 sub
    gl64_t s1_452 = *(gl64_t*)&expressions_params[10][20];
    tmp1_0 = tmp1_0 - s1_452;
    // Op 453: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 454: dim3x3 mul
    gl64_t s1_454_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_454_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_454_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA454 = (tmp3_0 + tmp3_1) * (s1_454_0 + s1_454_1);
    gl64_t kB454 = (tmp3_0 + tmp3_2) * (s1_454_0 + s1_454_2);
    gl64_t kC454 = (tmp3_1 + tmp3_2) * (s1_454_1 + s1_454_2);
    gl64_t kD454 = tmp3_0 * s1_454_0;
    gl64_t kE454 = tmp3_1 * s1_454_1;
    gl64_t kF454 = tmp3_2 * s1_454_2;
    gl64_t kG454 = kD454 - kE454;
    tmp3_12 = (kC454 + kG454) - kF454;
    tmp3_13 = ((((kA454 + kC454) - kE454) - kE454) - kD454);
    tmp3_14 = kB454 - kG454;
    // Op 455: dim3x1 mul
    gl64_t s0_455_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_455_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_455_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_455 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    tmp3_0 = s0_455_0 * s1_455; tmp3_1 = s0_455_1 * s1_455; tmp3_2 = s0_455_2 * s1_455;
    // Op 456: dim3x1 add
    gl64_t s1_456 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_456; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    gl64_t s1_458 = *(gl64_t*)&expressions_params[9][4];
    tmp3_9 = tmp3_0 + s1_458; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 459: dim3x3 add
    gl64_t s1_459_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_459_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_459_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_459_0; tmp3_4 = tmp3_10 + s1_459_1; tmp3_5 = tmp3_11 + s1_459_2;
    // Op 460: dim3x1 mul
    gl64_t s0_460_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_460_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_460_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_460 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    tmp3_0 = s0_460_0 * s1_460; tmp3_1 = s0_460_1 * s1_460; tmp3_2 = s0_460_2 * s1_460;
    // Op 461: dim3x1 add
    gl64_t s1_461 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_461; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 462: dim3x3 mul
    gl64_t s1_462_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_462_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_462_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA462 = (tmp3_0 + tmp3_1) * (s1_462_0 + s1_462_1);
    gl64_t kB462 = (tmp3_0 + tmp3_2) * (s1_462_0 + s1_462_2);
    gl64_t kC462 = (tmp3_1 + tmp3_2) * (s1_462_1 + s1_462_2);
    gl64_t kD462 = tmp3_0 * s1_462_0;
    gl64_t kE462 = tmp3_1 * s1_462_1;
    gl64_t kF462 = tmp3_2 * s1_462_2;
    gl64_t kG462 = kD462 - kE462;
    tmp3_0 = (kC462 + kG462) - kF462;
    tmp3_1 = ((((kA462 + kC462) - kE462) - kE462) - kD462);
    tmp3_2 = kB462 - kG462;
    // Op 463: dim3x1 add
    gl64_t s1_463 = *(gl64_t*)&expressions_params[9][4];
    tmp3_6 = tmp3_0 + s1_463; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 464: dim3x3 add
    gl64_t s1_464_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_464_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_464_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_464_0; tmp3_1 = tmp3_7 + s1_464_1; tmp3_2 = tmp3_8 + s1_464_2;
    // Op 465: dim3x3 mul
    gl64_t kA465 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB465 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC465 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD465 = tmp3_3 * tmp3_0;
    gl64_t kE465 = tmp3_4 * tmp3_1;
    gl64_t kF465 = tmp3_5 * tmp3_2;
    gl64_t kG465 = kD465 - kE465;
    tmp3_0 = (kC465 + kG465) - kF465;
    tmp3_1 = ((((kA465 + kC465) - kE465) - kE465) - kD465);
    tmp3_2 = kB465 - kG465;
    // Op 466: dim3x3 mul
    gl64_t s0_466_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+0, domainSize, nCols_2))];
    gl64_t s0_466_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+1, domainSize, nCols_2))];
    gl64_t s0_466_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+2, domainSize, nCols_2))];
    gl64_t kA466 = (s0_466_0 + s0_466_1) * (tmp3_0 + tmp3_1);
    gl64_t kB466 = (s0_466_0 + s0_466_2) * (tmp3_0 + tmp3_2);
    gl64_t kC466 = (s0_466_1 + s0_466_2) * (tmp3_1 + tmp3_2);
    gl64_t kD466 = s0_466_0 * tmp3_0;
    gl64_t kE466 = s0_466_1 * tmp3_1;
    gl64_t kF466 = s0_466_2 * tmp3_2;
    gl64_t kG466 = kD466 - kE466;
    tmp3_0 = (kC466 + kG466) - kF466;
    tmp3_1 = ((((kA466 + kC466) - kE466) - kE466) - kD466);
    tmp3_2 = kB466 - kG466;
    // Op 467: dim3x3 add
    gl64_t s1_467_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_467_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_467_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_467_0; tmp3_7 = tmp3_7 + s1_467_1; tmp3_8 = tmp3_8 + s1_467_2;
    // Op 468: dim3x1 mul
    gl64_t s1_468 = *(gl64_t*)&expressions_params[9][5];
    tmp3_6 = tmp3_6 * s1_468; tmp3_7 = tmp3_7 * s1_468; tmp3_8 = tmp3_8 * s1_468;
    // Op 469: dim3x3 add
    gl64_t s1_469_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_469_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_469_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_469_0; tmp3_10 = tmp3_10 + s1_469_1; tmp3_11 = tmp3_11 + s1_469_2;
    // Op 470: dim3x1 mul
    gl64_t s1_470 = *(gl64_t*)&expressions_params[9][5];
    tmp3_9 = tmp3_9 * s1_470; tmp3_10 = tmp3_10 * s1_470; tmp3_11 = tmp3_11 * s1_470;
    // Op 471: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 472: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 473: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 474: dim3x3 mul
    gl64_t s1_474_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_474_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_474_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA474 = (tmp3_0 + tmp3_1) * (s1_474_0 + s1_474_1);
    gl64_t kB474 = (tmp3_0 + tmp3_2) * (s1_474_0 + s1_474_2);
    gl64_t kC474 = (tmp3_1 + tmp3_2) * (s1_474_1 + s1_474_2);
    gl64_t kD474 = tmp3_0 * s1_474_0;
    gl64_t kE474 = tmp3_1 * s1_474_1;
    gl64_t kF474 = tmp3_2 * s1_474_2;
    gl64_t kG474 = kD474 - kE474;
    tmp3_3 = (kC474 + kG474) - kF474;
    tmp3_4 = ((((kA474 + kC474) - kE474) - kE474) - kD474);
    tmp3_5 = kB474 - kG474;
    // Op 475: dim3x1 mul
    gl64_t s0_475_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_475_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_475_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_475 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    tmp3_0 = s0_475_0 * s1_475; tmp3_1 = s0_475_1 * s1_475; tmp3_2 = s0_475_2 * s1_475;
    // Op 476: dim3x1 add
    gl64_t s1_476 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_476; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 477: dim3x3 mul
    gl64_t s1_477_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_477_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_477_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA477 = (tmp3_0 + tmp3_1) * (s1_477_0 + s1_477_1);
    gl64_t kB477 = (tmp3_0 + tmp3_2) * (s1_477_0 + s1_477_2);
    gl64_t kC477 = (tmp3_1 + tmp3_2) * (s1_477_1 + s1_477_2);
    gl64_t kD477 = tmp3_0 * s1_477_0;
    gl64_t kE477 = tmp3_1 * s1_477_1;
    gl64_t kF477 = tmp3_2 * s1_477_2;
    gl64_t kG477 = kD477 - kE477;
    tmp3_0 = (kC477 + kG477) - kF477;
    tmp3_1 = ((((kA477 + kC477) - kE477) - kE477) - kD477);
    tmp3_2 = kB477 - kG477;
    // Op 478: dim3x1 add
    gl64_t s1_478 = *(gl64_t*)&expressions_params[9][4];
    tmp3_9 = tmp3_0 + s1_478; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 479: dim3x3 add
    gl64_t s1_479_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_479_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_479_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_12 = tmp3_9 + s1_479_0; tmp3_13 = tmp3_10 + s1_479_1; tmp3_14 = tmp3_11 + s1_479_2;
    // Op 480: dim3x1 mul
    gl64_t s0_480_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_480_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_480_2 = *(gl64_t*)&expressions_params[13][0+2];
    tmp3_0 = s0_480_0 * tmp1_7; tmp3_1 = s0_480_1 * tmp1_7; tmp3_2 = s0_480_2 * tmp1_7;
    // Op 481: dim1x1 mul
    gl64_t s0_481 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_481 = *(gl64_t*)&expressions_params[9][12];
    tmp1_7 = s0_481 * s1_481;
    // Op 482: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_7; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    gl64_t s1_484 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
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
    // Op 486: dim3x3 mul
    gl64_t s1_486_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_486_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_486_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA486 = (tmp3_0 + tmp3_1) * (s1_486_0 + s1_486_1);
    gl64_t kB486 = (tmp3_0 + tmp3_2) * (s1_486_0 + s1_486_2);
    gl64_t kC486 = (tmp3_1 + tmp3_2) * (s1_486_1 + s1_486_2);
    gl64_t kD486 = tmp3_0 * s1_486_0;
    gl64_t kE486 = tmp3_1 * s1_486_1;
    gl64_t kF486 = tmp3_2 * s1_486_2;
    gl64_t kG486 = kD486 - kE486;
    tmp3_0 = (kC486 + kG486) - kF486;
    tmp3_1 = ((((kA486 + kC486) - kE486) - kE486) - kD486);
    tmp3_2 = kB486 - kG486;
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
    // Op 488: dim1x1 mul
    gl64_t s0_488 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_488 = *(gl64_t*)&expressions_params[9][12];
    tmp1_7 = s0_488 * s1_488;
    // Op 489: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_7; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 491: dim3x3 mul
    gl64_t s1_491_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_491_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_491_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA491 = (tmp3_0 + tmp3_1) * (s1_491_0 + s1_491_1);
    gl64_t kB491 = (tmp3_0 + tmp3_2) * (s1_491_0 + s1_491_2);
    gl64_t kC491 = (tmp3_1 + tmp3_2) * (s1_491_1 + s1_491_2);
    gl64_t kD491 = tmp3_0 * s1_491_0;
    gl64_t kE491 = tmp3_1 * s1_491_1;
    gl64_t kF491 = tmp3_2 * s1_491_2;
    gl64_t kG491 = kD491 - kE491;
    tmp3_0 = (kC491 + kG491) - kF491;
    tmp3_1 = ((((kA491 + kC491) - kE491) - kE491) - kD491);
    tmp3_2 = kB491 - kG491;
    // Op 492: dim1x1 mul
    gl64_t s0_492 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    gl64_t s1_492 = *(gl64_t*)&expressions_params[9][12];
    tmp1_7 = s0_492 * s1_492;
    // Op 493: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_7; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 495: dim3x3 mul
    gl64_t s1_495_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_495_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_495_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA495 = (tmp3_0 + tmp3_1) * (s1_495_0 + s1_495_1);
    gl64_t kB495 = (tmp3_0 + tmp3_2) * (s1_495_0 + s1_495_2);
    gl64_t kC495 = (tmp3_1 + tmp3_2) * (s1_495_1 + s1_495_2);
    gl64_t kD495 = tmp3_0 * s1_495_0;
    gl64_t kE495 = tmp3_1 * s1_495_1;
    gl64_t kF495 = tmp3_2 * s1_495_2;
    gl64_t kG495 = kD495 - kE495;
    tmp3_0 = (kC495 + kG495) - kF495;
    tmp3_1 = ((((kA495 + kC495) - kE495) - kE495) - kD495);
    tmp3_2 = kB495 - kG495;
    // Op 496: dim1x1 mul
    gl64_t s0_496 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_496 = *(gl64_t*)&expressions_params[9][12];
    tmp1_7 = s0_496 * s1_496;
    // Op 497: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_7; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 498: dim3x3 mul
    gl64_t s1_498_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_498_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_498_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA498 = (tmp3_0 + tmp3_1) * (s1_498_0 + s1_498_1);
    gl64_t kB498 = (tmp3_0 + tmp3_2) * (s1_498_0 + s1_498_2);
    gl64_t kC498 = (tmp3_1 + tmp3_2) * (s1_498_1 + s1_498_2);
    gl64_t kD498 = tmp3_0 * s1_498_0;
    gl64_t kE498 = tmp3_1 * s1_498_1;
    gl64_t kF498 = tmp3_2 * s1_498_2;
    gl64_t kG498 = kD498 - kE498;
    tmp3_0 = (kC498 + kG498) - kF498;
    tmp3_1 = ((((kA498 + kC498) - kE498) - kE498) - kD498);
    tmp3_2 = kB498 - kG498;
    // Op 499: dim1x1 mul
    gl64_t s0_499 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_499 = *(gl64_t*)&expressions_params[9][8];
    tmp1_7 = s0_499 * s1_499;
    // Op 500: dim1x1 add
    gl64_t s1_500 = *(gl64_t*)&expressions_params[9][13];
    tmp1_7 = tmp1_7 + s1_500;
    // Op 501: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_7; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 502: dim3x3 mul
    gl64_t s1_502_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_502_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_502_2 = *(gl64_t*)&expressions_params[13][0+2];
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
    // Op 503: dim3x1 add
    gl64_t s1_503 = *(gl64_t*)&expressions_params[9][14];
    tmp3_6 = tmp3_0 + s1_503; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 504: dim3x3 add
    gl64_t s1_504_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_504_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_504_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_504_0; tmp3_1 = tmp3_7 + s1_504_1; tmp3_2 = tmp3_8 + s1_504_2;
    // Op 505: dim3x3 mul
    gl64_t kA505 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB505 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC505 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD505 = tmp3_12 * tmp3_0;
    gl64_t kE505 = tmp3_13 * tmp3_1;
    gl64_t kF505 = tmp3_14 * tmp3_2;
    gl64_t kG505 = kD505 - kE505;
    tmp3_0 = (kC505 + kG505) - kF505;
    tmp3_1 = ((((kA505 + kC505) - kE505) - kE505) - kD505);
    tmp3_2 = kB505 - kG505;
    // Op 506: dim3x3 mul
    gl64_t s0_506_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+0, domainSize, nCols_2))];
    gl64_t s0_506_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+1, domainSize, nCols_2))];
    gl64_t s0_506_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+2, domainSize, nCols_2))];
    gl64_t kA506 = (s0_506_0 + s0_506_1) * (tmp3_0 + tmp3_1);
    gl64_t kB506 = (s0_506_0 + s0_506_2) * (tmp3_0 + tmp3_2);
    gl64_t kC506 = (s0_506_1 + s0_506_2) * (tmp3_1 + tmp3_2);
    gl64_t kD506 = s0_506_0 * tmp3_0;
    gl64_t kE506 = s0_506_1 * tmp3_1;
    gl64_t kF506 = s0_506_2 * tmp3_2;
    gl64_t kG506 = kD506 - kE506;
    tmp3_0 = (kC506 + kG506) - kF506;
    tmp3_1 = ((((kA506 + kC506) - kE506) - kE506) - kD506);
    tmp3_2 = kB506 - kG506;
    // Op 507: dim3x3 add
    gl64_t s1_507_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_507_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_507_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_507_0; tmp3_7 = tmp3_7 + s1_507_1; tmp3_8 = tmp3_8 + s1_507_2;
    // Op 508: dim3x1 mul
    gl64_t s1_508 = *(gl64_t*)&expressions_params[9][5];
    tmp3_6 = tmp3_6 * s1_508; tmp3_7 = tmp3_7 * s1_508; tmp3_8 = tmp3_8 * s1_508;
    // Op 509: dim3x3 add
    gl64_t s1_509_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_509_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_509_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_509_0; tmp3_10 = tmp3_10 + s1_509_1; tmp3_11 = tmp3_11 + s1_509_2;
    // Op 510: dim3x1 mul
    gl64_t s1_510 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp3_9 = tmp3_9 * s1_510; tmp3_10 = tmp3_10 * s1_510; tmp3_11 = tmp3_11 * s1_510;
    // Op 511: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 512: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 513: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 514: dim3x3 mul
    gl64_t s1_514_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_514_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_514_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA514 = (tmp3_0 + tmp3_1) * (s1_514_0 + s1_514_1);
    gl64_t kB514 = (tmp3_0 + tmp3_2) * (s1_514_0 + s1_514_2);
    gl64_t kC514 = (tmp3_1 + tmp3_2) * (s1_514_1 + s1_514_2);
    gl64_t kD514 = tmp3_0 * s1_514_0;
    gl64_t kE514 = tmp3_1 * s1_514_1;
    gl64_t kF514 = tmp3_2 * s1_514_2;
    gl64_t kG514 = kD514 - kE514;
    tmp3_12 = (kC514 + kG514) - kF514;
    tmp3_13 = ((((kA514 + kC514) - kE514) - kE514) - kD514);
    tmp3_14 = kB514 - kG514;
    // Op 515: dim1x1 mul
    gl64_t s0_515 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    gl64_t s1_515 = *(gl64_t*)&expressions_params[9][1];
    tmp1_7 = s0_515 * s1_515;
    // Op 516: dim1x1 add
    gl64_t s0_516 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    tmp1_7 = s0_516 + tmp1_7;
    // Op 517: dim1x1 mul
    gl64_t s0_517 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    gl64_t s1_517 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_517 * s1_517;
    // Op 518: dim1x1 add
    tmp1_0 = tmp1_7 + tmp1_0;
    // Op 519: dim1x1 mul
    gl64_t s0_519 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    gl64_t s1_519 = *(gl64_t*)&expressions_params[9][3];
    tmp1_7 = s0_519 * s1_519;
    // Op 520: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_7;
    // Op 521: dim3x1 mul
    gl64_t s0_521_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_521_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_521_2 = *(gl64_t*)&expressions_params[13][0+2];
    tmp3_0 = s0_521_0 * tmp1_0; tmp3_1 = s0_521_1 * tmp1_0; tmp3_2 = s0_521_2 * tmp1_0;
    // Op 522: dim1x1 mul
    gl64_t s0_522 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    gl64_t s1_522 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s0_522 * s1_522;
    // Op 523: dim1x1 add
    gl64_t s0_523 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_0 = s0_523 + tmp1_0;
    // Op 524: dim1x1 mul
    gl64_t s0_524 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    gl64_t s1_524 = *(gl64_t*)&expressions_params[9][2];
    tmp1_7 = s0_524 * s1_524;
    // Op 525: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_7;
    // Op 526: dim1x1 mul
    gl64_t s0_526 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    gl64_t s1_526 = *(gl64_t*)&expressions_params[9][3];
    tmp1_7 = s0_526 * s1_526;
    // Op 527: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_7;
    // Op 528: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 529: dim3x3 mul
    gl64_t s1_529_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_529_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_529_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA529 = (tmp3_0 + tmp3_1) * (s1_529_0 + s1_529_1);
    gl64_t kB529 = (tmp3_0 + tmp3_2) * (s1_529_0 + s1_529_2);
    gl64_t kC529 = (tmp3_1 + tmp3_2) * (s1_529_1 + s1_529_2);
    gl64_t kD529 = tmp3_0 * s1_529_0;
    gl64_t kE529 = tmp3_1 * s1_529_1;
    gl64_t kF529 = tmp3_2 * s1_529_2;
    gl64_t kG529 = kD529 - kE529;
    tmp3_0 = (kC529 + kG529) - kF529;
    tmp3_1 = ((((kA529 + kC529) - kE529) - kE529) - kD529);
    tmp3_2 = kB529 - kG529;
    // Op 530: dim3x1 add
    gl64_t s1_530 = *(gl64_t*)&expressions_params[9][12];
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
    // Op 532: dim1x1 mul
    gl64_t s0_532 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_532 = *(gl64_t*)&expressions_params[9][8];
    tmp1_0 = s0_532 * s1_532;
    // Op 533: dim1x1 add
    gl64_t s1_533 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_533;
    // Op 534: dim1x1 add
    gl64_t s1_534 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = tmp1_0 + s1_534;
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
    // Op 537: dim1x1 mul
    gl64_t s0_537 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    gl64_t s1_537 = *(gl64_t*)&expressions_params[9][12];
    tmp1_0 = s0_537 * s1_537;
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
    gl64_t s1_540 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_540; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 541: dim3x3 mul
    gl64_t s1_541_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_541_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_541_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA541 = (tmp3_0 + tmp3_1) * (s1_541_0 + s1_541_1);
    gl64_t kB541 = (tmp3_0 + tmp3_2) * (s1_541_0 + s1_541_2);
    gl64_t kC541 = (tmp3_1 + tmp3_2) * (s1_541_1 + s1_541_2);
    gl64_t kD541 = tmp3_0 * s1_541_0;
    gl64_t kE541 = tmp3_1 * s1_541_1;
    gl64_t kF541 = tmp3_2 * s1_541_2;
    gl64_t kG541 = kD541 - kE541;
    tmp3_0 = (kC541 + kG541) - kF541;
    tmp3_1 = ((((kA541 + kC541) - kE541) - kE541) - kD541);
    tmp3_2 = kB541 - kG541;
    // Op 542: dim3x1 add
    gl64_t s1_542 = *(gl64_t*)&expressions_params[9][15];
    tmp3_9 = tmp3_0 + s1_542; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 543: dim3x3 add
    gl64_t s1_543_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_543_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_543_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_543_0; tmp3_4 = tmp3_10 + s1_543_1; tmp3_5 = tmp3_11 + s1_543_2;
    // Op 544: dim3x1 mul
    gl64_t s0_544_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_544_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_544_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_544 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    tmp3_0 = s0_544_0 * s1_544; tmp3_1 = s0_544_1 * s1_544; tmp3_2 = s0_544_2 * s1_544;
    // Op 545: dim3x1 add
    gl64_t s1_545 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
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
    gl64_t s1_547 = *(gl64_t*)&expressions_params[9][12];
    tmp3_0 = tmp3_0 + s1_547; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 548: dim3x3 mul
    gl64_t s1_548_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_548_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_548_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA548 = (tmp3_0 + tmp3_1) * (s1_548_0 + s1_548_1);
    gl64_t kB548 = (tmp3_0 + tmp3_2) * (s1_548_0 + s1_548_2);
    gl64_t kC548 = (tmp3_1 + tmp3_2) * (s1_548_1 + s1_548_2);
    gl64_t kD548 = tmp3_0 * s1_548_0;
    gl64_t kE548 = tmp3_1 * s1_548_1;
    gl64_t kF548 = tmp3_2 * s1_548_2;
    gl64_t kG548 = kD548 - kE548;
    tmp3_0 = (kC548 + kG548) - kF548;
    tmp3_1 = ((((kA548 + kC548) - kE548) - kE548) - kD548);
    tmp3_2 = kB548 - kG548;
    // Op 549: dim1x1 mul
    gl64_t s0_549 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_549 = *(gl64_t*)&expressions_params[9][8];
    tmp1_0 = s0_549 * s1_549;
    // Op 550: dim1x1 add
    gl64_t s1_550 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_550;
    // Op 551: dim1x1 sub_swap
    gl64_t s0_551 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_551 = *(gl64_t*)&expressions_params[9][0];
    tmp1_7 = s1_551 - s0_551;
    // Op 552: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_7;
    // Op 553: dim1x1 add
    gl64_t s1_553 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = tmp1_0 + s1_553;
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
    // Op 556: dim1x1 mul
    gl64_t s0_556 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_556 = *(gl64_t*)&expressions_params[9][12];
    tmp1_0 = s0_556 * s1_556;
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
    // Op 559: dim1x1 add
    gl64_t s1_559 = *(gl64_t*)&expressions_params[9][0];
    tmp1_7 = tmp1_7 + s1_559;
    // Op 560: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_7; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 561: dim3x3 mul
    gl64_t s1_561_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_561_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_561_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA561 = (tmp3_0 + tmp3_1) * (s1_561_0 + s1_561_1);
    gl64_t kB561 = (tmp3_0 + tmp3_2) * (s1_561_0 + s1_561_2);
    gl64_t kC561 = (tmp3_1 + tmp3_2) * (s1_561_1 + s1_561_2);
    gl64_t kD561 = tmp3_0 * s1_561_0;
    gl64_t kE561 = tmp3_1 * s1_561_1;
    gl64_t kF561 = tmp3_2 * s1_561_2;
    gl64_t kG561 = kD561 - kE561;
    tmp3_0 = (kC561 + kG561) - kF561;
    tmp3_1 = ((((kA561 + kC561) - kE561) - kE561) - kD561);
    tmp3_2 = kB561 - kG561;
    // Op 562: dim3x1 add
    gl64_t s1_562 = *(gl64_t*)&expressions_params[9][15];
    tmp3_6 = tmp3_0 + s1_562; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 563: dim3x3 add
    gl64_t s1_563_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_563_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_563_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_563_0; tmp3_1 = tmp3_7 + s1_563_1; tmp3_2 = tmp3_8 + s1_563_2;
    // Op 564: dim3x3 mul
    gl64_t kA564 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB564 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC564 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD564 = tmp3_3 * tmp3_0;
    gl64_t kE564 = tmp3_4 * tmp3_1;
    gl64_t kF564 = tmp3_5 * tmp3_2;
    gl64_t kG564 = kD564 - kE564;
    tmp3_0 = (kC564 + kG564) - kF564;
    tmp3_1 = ((((kA564 + kC564) - kE564) - kE564) - kD564);
    tmp3_2 = kB564 - kG564;
    // Op 565: dim3x3 mul
    uint64_t s0_565_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_2));
    gl64_t s0_565_0 = *(gl64_t*)&dParams->aux_trace[s0_565_pos];
    gl64_t s0_565_1 = *(gl64_t*)&dParams->aux_trace[s0_565_pos + TILE_HEIGHT];
    gl64_t s0_565_2 = *(gl64_t*)&dParams->aux_trace[s0_565_pos + 2*TILE_HEIGHT];
    gl64_t kA565 = (s0_565_0 + s0_565_1) * (tmp3_0 + tmp3_1);
    gl64_t kB565 = (s0_565_0 + s0_565_2) * (tmp3_0 + tmp3_2);
    gl64_t kC565 = (s0_565_1 + s0_565_2) * (tmp3_1 + tmp3_2);
    gl64_t kD565 = s0_565_0 * tmp3_0;
    gl64_t kE565 = s0_565_1 * tmp3_1;
    gl64_t kF565 = s0_565_2 * tmp3_2;
    gl64_t kG565 = kD565 - kE565;
    tmp3_0 = (kC565 + kG565) - kF565;
    tmp3_1 = ((((kA565 + kC565) - kE565) - kE565) - kD565);
    tmp3_2 = kB565 - kG565;
    // Op 566: dim3x3 add
    gl64_t s1_566_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_566_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_566_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_566_0; tmp3_7 = tmp3_7 + s1_566_1; tmp3_8 = tmp3_8 + s1_566_2;
    // Op 567: dim3x1 mul
    gl64_t s1_567 = *(gl64_t*)&expressions_params[9][5];
    tmp3_6 = tmp3_6 * s1_567; tmp3_7 = tmp3_7 * s1_567; tmp3_8 = tmp3_8 * s1_567;
    // Op 568: dim1x1 sub_swap
    gl64_t s0_568 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_568 = *(gl64_t*)&expressions_params[9][0];
    tmp1_7 = s1_568 - s0_568;
    // Op 569: dim1x1 sub_swap
    gl64_t s1_569 = *(gl64_t*)&expressions_params[9][16];
    tmp1_7 = s1_569 - tmp1_7;
    // Op 570: dim3x3 add
    gl64_t s1_570_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_570_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_570_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_570_0; tmp3_10 = tmp3_10 + s1_570_1; tmp3_11 = tmp3_11 + s1_570_2;
    // Op 571: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_7; tmp3_10 = tmp3_10 * tmp1_7; tmp3_11 = tmp3_11 * tmp1_7;
    // Op 572: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 573: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 574: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 575: dim3x3 mul
    gl64_t s1_575_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_575_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_575_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA575 = (tmp3_0 + tmp3_1) * (s1_575_0 + s1_575_1);
    gl64_t kB575 = (tmp3_0 + tmp3_2) * (s1_575_0 + s1_575_2);
    gl64_t kC575 = (tmp3_1 + tmp3_2) * (s1_575_1 + s1_575_2);
    gl64_t kD575 = tmp3_0 * s1_575_0;
    gl64_t kE575 = tmp3_1 * s1_575_1;
    gl64_t kF575 = tmp3_2 * s1_575_2;
    gl64_t kG575 = kD575 - kE575;
    tmp3_6 = (kC575 + kG575) - kF575;
    tmp3_7 = ((((kA575 + kC575) - kE575) - kE575) - kD575);
    tmp3_8 = kB575 - kG575;
    // Op 576: dim1x1 sub_swap
    gl64_t s0_576 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    gl64_t s1_576 = *(gl64_t*)&expressions_params[9][0];
    tmp1_7 = s1_576 - s0_576;
    // Op 577: dim3x1 mul
    uint64_t s0_577_pos = dExpsArgs->mapOffsetsExps[2] + (false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_2) : getBufferOffset(logicalRow_0, 0, domainSize, nCols_2));
    gl64_t s0_577_0 = *(gl64_t*)&dParams->aux_trace[s0_577_pos];
    gl64_t s0_577_1 = *(gl64_t*)&dParams->aux_trace[s0_577_pos + TILE_HEIGHT];
    gl64_t s0_577_2 = *(gl64_t*)&dParams->aux_trace[s0_577_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_577_0 * tmp1_7; tmp3_1 = s0_577_1 * tmp1_7; tmp3_2 = s0_577_2 * tmp1_7;
    // Op 578: dim3x3 sub
    uint64_t s0_578_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_2));
    gl64_t s0_578_0 = *(gl64_t*)&dParams->aux_trace[s0_578_pos];
    gl64_t s0_578_1 = *(gl64_t*)&dParams->aux_trace[s0_578_pos + TILE_HEIGHT];
    gl64_t s0_578_2 = *(gl64_t*)&dParams->aux_trace[s0_578_pos + 2*TILE_HEIGHT];
    tmp3_12 = s0_578_0 - tmp3_0; tmp3_13 = s0_578_1 - tmp3_1; tmp3_14 = s0_578_2 - tmp3_2;
    // Op 579: dim3x3 add
    gl64_t s0_579_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+0, domainSize, nCols_2))];
    gl64_t s0_579_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+1, domainSize, nCols_2))];
    gl64_t s0_579_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+2, domainSize, nCols_2))];
    gl64_t s1_579_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+0, domainSize, nCols_2))];
    gl64_t s1_579_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+1, domainSize, nCols_2))];
    gl64_t s1_579_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+2, domainSize, nCols_2))];
    tmp3_0 = s0_579_0 + s1_579_0; tmp3_1 = s0_579_1 + s1_579_1; tmp3_2 = s0_579_2 + s1_579_2;
    // Op 580: dim3x3 add
    uint64_t s0_580_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_2));
    gl64_t s0_580_0 = *(gl64_t*)&dParams->aux_trace[s0_580_pos];
    gl64_t s0_580_1 = *(gl64_t*)&dParams->aux_trace[s0_580_pos + TILE_HEIGHT];
    gl64_t s0_580_2 = *(gl64_t*)&dParams->aux_trace[s0_580_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_580_0 + tmp3_0; tmp3_1 = s0_580_1 + tmp3_1; tmp3_2 = s0_580_2 + tmp3_2;
    // Op 581: dim3x3 sub
    tmp3_12 = tmp3_12 - tmp3_0; tmp3_13 = tmp3_13 - tmp3_1; tmp3_14 = tmp3_14 - tmp3_2;
    // Op 582: dim3x1 mul
    gl64_t s0_582_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_582_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_582_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_582 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp3_0 = s0_582_0 * s1_582; tmp3_1 = s0_582_1 * s1_582; tmp3_2 = s0_582_2 * s1_582;
    // Op 583: dim3x1 add
    gl64_t s1_583 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_583; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 584: dim3x3 mul
    gl64_t s1_584_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_584_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_584_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA584 = (tmp3_0 + tmp3_1) * (s1_584_0 + s1_584_1);
    gl64_t kB584 = (tmp3_0 + tmp3_2) * (s1_584_0 + s1_584_2);
    gl64_t kC584 = (tmp3_1 + tmp3_2) * (s1_584_1 + s1_584_2);
    gl64_t kD584 = tmp3_0 * s1_584_0;
    gl64_t kE584 = tmp3_1 * s1_584_1;
    gl64_t kF584 = tmp3_2 * s1_584_2;
    gl64_t kG584 = kD584 - kE584;
    tmp3_0 = (kC584 + kG584) - kF584;
    tmp3_1 = ((((kA584 + kC584) - kE584) - kE584) - kD584);
    tmp3_2 = kB584 - kG584;
    // Op 585: dim3x1 add
    gl64_t s1_585 = *(gl64_t*)&expressions_params[9][4];
    tmp3_0 = tmp3_0 + s1_585; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 586: dim3x3 add
    gl64_t s1_586_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_586_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_586_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_586_0; tmp3_1 = tmp3_1 + s1_586_1; tmp3_2 = tmp3_2 + s1_586_2;
    // Op 587: dim3x3 mul
    gl64_t kA587 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB587 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC587 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD587 = tmp3_12 * tmp3_0;
    gl64_t kE587 = tmp3_13 * tmp3_1;
    gl64_t kF587 = tmp3_14 * tmp3_2;
    gl64_t kG587 = kD587 - kE587;
    tmp3_0 = (kC587 + kG587) - kF587;
    tmp3_1 = ((((kA587 + kC587) - kE587) - kE587) - kD587);
    tmp3_2 = kB587 - kG587;
    // Op 588: dim3x1 add
    gl64_t s1_588 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_588; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 589: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 590: dim3x3 mul
    gl64_t s1_590_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_590_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_590_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA590 = (tmp3_0 + tmp3_1) * (s1_590_0 + s1_590_1);
    gl64_t kB590 = (tmp3_0 + tmp3_2) * (s1_590_0 + s1_590_2);
    gl64_t kC590 = (tmp3_1 + tmp3_2) * (s1_590_1 + s1_590_2);
    gl64_t kD590 = tmp3_0 * s1_590_0;
    gl64_t kE590 = tmp3_1 * s1_590_1;
    gl64_t kF590 = tmp3_2 * s1_590_2;
    gl64_t kG590 = kD590 - kE590;
    tmp3_6 = (kC590 + kG590) - kF590;
    tmp3_7 = ((((kA590 + kC590) - kE590) - kE590) - kD590);
    tmp3_8 = kB590 - kG590;
    // Op 591: dim3x3 mul
    gl64_t s0_591_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_591_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_591_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_591_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_591_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_591_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA591 = (s0_591_0 + s0_591_1) * (s1_591_0 + s1_591_1);
    gl64_t kB591 = (s0_591_0 + s0_591_2) * (s1_591_0 + s1_591_2);
    gl64_t kC591 = (s0_591_1 + s0_591_2) * (s1_591_1 + s1_591_2);
    gl64_t kD591 = s0_591_0 * s1_591_0;
    gl64_t kE591 = s0_591_1 * s1_591_1;
    gl64_t kF591 = s0_591_2 * s1_591_2;
    gl64_t kG591 = kD591 - kE591;
    tmp3_0 = (kC591 + kG591) - kF591;
    tmp3_1 = ((((kA591 + kC591) - kE591) - kE591) - kD591);
    tmp3_2 = kB591 - kG591;
    // Op 592: dim3x3 mul
    gl64_t s1_592_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_592_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_592_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA592 = (tmp3_0 + tmp3_1) * (s1_592_0 + s1_592_1);
    gl64_t kB592 = (tmp3_0 + tmp3_2) * (s1_592_0 + s1_592_2);
    gl64_t kC592 = (tmp3_1 + tmp3_2) * (s1_592_1 + s1_592_2);
    gl64_t kD592 = tmp3_0 * s1_592_0;
    gl64_t kE592 = tmp3_1 * s1_592_1;
    gl64_t kF592 = tmp3_2 * s1_592_2;
    gl64_t kG592 = kD592 - kE592;
    tmp3_0 = (kC592 + kG592) - kF592;
    tmp3_1 = ((((kA592 + kC592) - kE592) - kE592) - kD592);
    tmp3_2 = kB592 - kG592;
    // Op 593: dim3x3 mul
    gl64_t s1_593_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_593_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_593_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA593 = (tmp3_0 + tmp3_1) * (s1_593_0 + s1_593_1);
    gl64_t kB593 = (tmp3_0 + tmp3_2) * (s1_593_0 + s1_593_2);
    gl64_t kC593 = (tmp3_1 + tmp3_2) * (s1_593_1 + s1_593_2);
    gl64_t kD593 = tmp3_0 * s1_593_0;
    gl64_t kE593 = tmp3_1 * s1_593_1;
    gl64_t kF593 = tmp3_2 * s1_593_2;
    gl64_t kG593 = kD593 - kE593;
    tmp3_0 = (kC593 + kG593) - kF593;
    tmp3_1 = ((((kA593 + kC593) - kE593) - kE593) - kD593);
    tmp3_2 = kB593 - kG593;
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
    // Op 598: dim3x3 mul
    gl64_t s1_598_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_598_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_598_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA598 = (tmp3_0 + tmp3_1) * (s1_598_0 + s1_598_1);
    gl64_t kB598 = (tmp3_0 + tmp3_2) * (s1_598_0 + s1_598_2);
    gl64_t kC598 = (tmp3_1 + tmp3_2) * (s1_598_1 + s1_598_2);
    gl64_t kD598 = tmp3_0 * s1_598_0;
    gl64_t kE598 = tmp3_1 * s1_598_1;
    gl64_t kF598 = tmp3_2 * s1_598_2;
    gl64_t kG598 = kD598 - kE598;
    tmp3_0 = (kC598 + kG598) - kF598;
    tmp3_1 = ((((kA598 + kC598) - kE598) - kE598) - kD598);
    tmp3_2 = kB598 - kG598;
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
    gl64_t s1_600 = *(gl64_t*)&expressions_params[9][13];
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
    gl64_t s1_602 = *(gl64_t*)&expressions_params[9][14];
    tmp3_0 = tmp3_0 + s1_602; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 603: dim3x3 add
    gl64_t s1_603_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_603_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_603_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_603_0; tmp3_1 = tmp3_1 + s1_603_1; tmp3_2 = tmp3_2 + s1_603_2;
    // Op 604: dim3x3 mul
    gl64_t s1_604_0 = *(gl64_t*)&expressions_params[10][35];
    gl64_t s1_604_1 = *(gl64_t*)&expressions_params[10][35+1];
    gl64_t s1_604_2 = *(gl64_t*)&expressions_params[10][35+2];
    gl64_t kA604 = (tmp3_0 + tmp3_1) * (s1_604_0 + s1_604_1);
    gl64_t kB604 = (tmp3_0 + tmp3_2) * (s1_604_0 + s1_604_2);
    gl64_t kC604 = (tmp3_1 + tmp3_2) * (s1_604_1 + s1_604_2);
    gl64_t kD604 = tmp3_0 * s1_604_0;
    gl64_t kE604 = tmp3_1 * s1_604_1;
    gl64_t kF604 = tmp3_2 * s1_604_2;
    gl64_t kG604 = kD604 - kE604;
    tmp3_0 = (kC604 + kG604) - kF604;
    tmp3_1 = ((((kA604 + kC604) - kE604) - kE604) - kD604);
    tmp3_2 = kB604 - kG604;
    // Op 605: dim1x1 sub
    gl64_t s0_605 = *(gl64_t*)&expressions_params[9][16];
    gl64_t s1_605 = *(gl64_t*)&expressions_params[10][32];
    tmp1_7 = s0_605 - s1_605;
    // Op 606: dim3x1 sub
    tmp3_0 = tmp3_0 - tmp1_7; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 607: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 608: dim3x3 mul
    gl64_t s1_608_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_608_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_608_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA608 = (tmp3_0 + tmp3_1) * (s1_608_0 + s1_608_1);
    gl64_t kB608 = (tmp3_0 + tmp3_2) * (s1_608_0 + s1_608_2);
    gl64_t kC608 = (tmp3_1 + tmp3_2) * (s1_608_1 + s1_608_2);
    gl64_t kD608 = tmp3_0 * s1_608_0;
    gl64_t kE608 = tmp3_1 * s1_608_1;
    gl64_t kF608 = tmp3_2 * s1_608_2;
    gl64_t kG608 = kD608 - kE608;
    tmp3_6 = (kC608 + kG608) - kF608;
    tmp3_7 = ((((kA608 + kC608) - kE608) - kE608) - kD608);
    tmp3_8 = kB608 - kG608;
    // Op 609: dim3x1 mul
    gl64_t s0_609_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_609_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_609_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_609 = *(gl64_t*)&expressions_params[10][14];
    tmp3_0 = s0_609_0 * s1_609; tmp3_1 = s0_609_1 * s1_609; tmp3_2 = s0_609_2 * s1_609;
    // Op 610: dim3x1 add
    gl64_t s1_610 = *(gl64_t*)&expressions_params[10][13];
    tmp3_0 = tmp3_0 + s1_610; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 611: dim3x3 mul
    gl64_t s1_611_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_611_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_611_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA611 = (tmp3_0 + tmp3_1) * (s1_611_0 + s1_611_1);
    gl64_t kB611 = (tmp3_0 + tmp3_2) * (s1_611_0 + s1_611_2);
    gl64_t kC611 = (tmp3_1 + tmp3_2) * (s1_611_1 + s1_611_2);
    gl64_t kD611 = tmp3_0 * s1_611_0;
    gl64_t kE611 = tmp3_1 * s1_611_1;
    gl64_t kF611 = tmp3_2 * s1_611_2;
    gl64_t kG611 = kD611 - kE611;
    tmp3_0 = (kC611 + kG611) - kF611;
    tmp3_1 = ((((kA611 + kC611) - kE611) - kE611) - kD611);
    tmp3_2 = kB611 - kG611;
    // Op 612: dim3x1 add
    gl64_t s1_612 = *(gl64_t*)&expressions_params[10][12];
    tmp3_0 = tmp3_0 + s1_612; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 614: dim3x1 add
    gl64_t s1_614 = *(gl64_t*)&expressions_params[10][11];
    tmp3_0 = tmp3_0 + s1_614; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    gl64_t s1_616 = *(gl64_t*)&expressions_params[10][10];
    tmp3_0 = tmp3_0 + s1_616; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 617: dim3x3 mul
    gl64_t s1_617_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_617_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_617_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA617 = (tmp3_0 + tmp3_1) * (s1_617_0 + s1_617_1);
    gl64_t kB617 = (tmp3_0 + tmp3_2) * (s1_617_0 + s1_617_2);
    gl64_t kC617 = (tmp3_1 + tmp3_2) * (s1_617_1 + s1_617_2);
    gl64_t kD617 = tmp3_0 * s1_617_0;
    gl64_t kE617 = tmp3_1 * s1_617_1;
    gl64_t kF617 = tmp3_2 * s1_617_2;
    gl64_t kG617 = kD617 - kE617;
    tmp3_0 = (kC617 + kG617) - kF617;
    tmp3_1 = ((((kA617 + kC617) - kE617) - kE617) - kD617);
    tmp3_2 = kB617 - kG617;
    // Op 618: dim3x1 add
    gl64_t s1_618 = *(gl64_t*)&expressions_params[10][9];
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
    gl64_t s1_622 = *(gl64_t*)&expressions_params[10][7];
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
    gl64_t s1_624 = *(gl64_t*)&expressions_params[10][30];
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
    gl64_t s1_626 = *(gl64_t*)&expressions_params[10][4];
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
    gl64_t s1_630 = *(gl64_t*)&expressions_params[10][5];
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
    gl64_t s1_632 = *(gl64_t*)&expressions_params[10][3];
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
    gl64_t s1_634 = *(gl64_t*)&expressions_params[10][2];
    tmp3_0 = tmp3_0 + s1_634; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 635: dim3x3 mul
    gl64_t s1_635_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_635_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_635_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA635 = (tmp3_0 + tmp3_1) * (s1_635_0 + s1_635_1);
    gl64_t kB635 = (tmp3_0 + tmp3_2) * (s1_635_0 + s1_635_2);
    gl64_t kC635 = (tmp3_1 + tmp3_2) * (s1_635_1 + s1_635_2);
    gl64_t kD635 = tmp3_0 * s1_635_0;
    gl64_t kE635 = tmp3_1 * s1_635_1;
    gl64_t kF635 = tmp3_2 * s1_635_2;
    gl64_t kG635 = kD635 - kE635;
    tmp3_0 = (kC635 + kG635) - kF635;
    tmp3_1 = ((((kA635 + kC635) - kE635) - kE635) - kD635);
    tmp3_2 = kB635 - kG635;
    // Op 636: dim3x1 add
    gl64_t s1_636 = *(gl64_t*)&expressions_params[10][1];
    tmp3_0 = tmp3_0 + s1_636; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    gl64_t s1_638 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_638; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 639: dim3x3 mul
    gl64_t s1_639_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_639_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_639_2 = *(gl64_t*)&expressions_params[13][0+2];
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
    // Op 640: dim3x3 mul
    gl64_t s1_640_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_640_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_640_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA640 = (tmp3_0 + tmp3_1) * (s1_640_0 + s1_640_1);
    gl64_t kB640 = (tmp3_0 + tmp3_2) * (s1_640_0 + s1_640_2);
    gl64_t kC640 = (tmp3_1 + tmp3_2) * (s1_640_1 + s1_640_2);
    gl64_t kD640 = tmp3_0 * s1_640_0;
    gl64_t kE640 = tmp3_1 * s1_640_1;
    gl64_t kF640 = tmp3_2 * s1_640_2;
    gl64_t kG640 = kD640 - kE640;
    tmp3_0 = (kC640 + kG640) - kF640;
    tmp3_1 = ((((kA640 + kC640) - kE640) - kE640) - kD640);
    tmp3_2 = kB640 - kG640;
    // Op 641: dim3x1 add
    gl64_t s1_641 = *(gl64_t*)&expressions_params[10][0];
    tmp3_0 = tmp3_0 + s1_641; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 643: dim3x1 add
    gl64_t s1_643 = *(gl64_t*)&expressions_params[9][17];
    tmp3_0 = tmp3_0 + s1_643; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 644: dim3x3 add
    gl64_t s1_644_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_644_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_644_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_644_0; tmp3_1 = tmp3_1 + s1_644_1; tmp3_2 = tmp3_2 + s1_644_2;
    // Op 645: dim3x3 mul
    gl64_t s1_645_0 = *(gl64_t*)&expressions_params[10][38];
    gl64_t s1_645_1 = *(gl64_t*)&expressions_params[10][38+1];
    gl64_t s1_645_2 = *(gl64_t*)&expressions_params[10][38+2];
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
    // Op 646: dim3x1 add
    gl64_t s1_646 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_646; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 647: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 648: dim3x3 mul
    gl64_t s1_648_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_648_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_648_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA648 = (tmp3_0 + tmp3_1) * (s1_648_0 + s1_648_1);
    gl64_t kB648 = (tmp3_0 + tmp3_2) * (s1_648_0 + s1_648_2);
    gl64_t kC648 = (tmp3_1 + tmp3_2) * (s1_648_1 + s1_648_2);
    gl64_t kD648 = tmp3_0 * s1_648_0;
    gl64_t kE648 = tmp3_1 * s1_648_1;
    gl64_t kF648 = tmp3_2 * s1_648_2;
    gl64_t kG648 = kD648 - kE648;
    tmp3_6 = (kC648 + kG648) - kF648;
    tmp3_7 = ((((kA648 + kC648) - kE648) - kE648) - kD648);
    tmp3_8 = kB648 - kG648;
    // Op 649: dim3x1 mul
    gl64_t s0_649_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_649_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_649_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_649 = *(gl64_t*)&expressions_params[10][28];
    tmp3_0 = s0_649_0 * s1_649; tmp3_1 = s0_649_1 * s1_649; tmp3_2 = s0_649_2 * s1_649;
    // Op 650: dim3x1 add
    gl64_t s1_650 = *(gl64_t*)&expressions_params[10][27];
    tmp3_0 = tmp3_0 + s1_650; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    gl64_t s1_652 = *(gl64_t*)&expressions_params[10][26];
    tmp3_0 = tmp3_0 + s1_652; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 653: dim3x3 mul
    gl64_t s1_653_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_653_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_653_2 = *(gl64_t*)&expressions_params[13][0+2];
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
    gl64_t s1_654 = *(gl64_t*)&expressions_params[10][25];
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
    gl64_t s1_656 = *(gl64_t*)&expressions_params[10][24];
    tmp3_0 = tmp3_0 + s1_656; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 657: dim3x3 mul
    gl64_t s1_657_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_657_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_657_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA657 = (tmp3_0 + tmp3_1) * (s1_657_0 + s1_657_1);
    gl64_t kB657 = (tmp3_0 + tmp3_2) * (s1_657_0 + s1_657_2);
    gl64_t kC657 = (tmp3_1 + tmp3_2) * (s1_657_1 + s1_657_2);
    gl64_t kD657 = tmp3_0 * s1_657_0;
    gl64_t kE657 = tmp3_1 * s1_657_1;
    gl64_t kF657 = tmp3_2 * s1_657_2;
    gl64_t kG657 = kD657 - kE657;
    tmp3_0 = (kC657 + kG657) - kF657;
    tmp3_1 = ((((kA657 + kC657) - kE657) - kE657) - kD657);
    tmp3_2 = kB657 - kG657;
    // Op 658: dim3x1 add
    gl64_t s1_658 = *(gl64_t*)&expressions_params[10][23];
    tmp3_0 = tmp3_0 + s1_658; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 659: dim3x3 mul
    gl64_t s1_659_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_659_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_659_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA659 = (tmp3_0 + tmp3_1) * (s1_659_0 + s1_659_1);
    gl64_t kB659 = (tmp3_0 + tmp3_2) * (s1_659_0 + s1_659_2);
    gl64_t kC659 = (tmp3_1 + tmp3_2) * (s1_659_1 + s1_659_2);
    gl64_t kD659 = tmp3_0 * s1_659_0;
    gl64_t kE659 = tmp3_1 * s1_659_1;
    gl64_t kF659 = tmp3_2 * s1_659_2;
    gl64_t kG659 = kD659 - kE659;
    tmp3_0 = (kC659 + kG659) - kF659;
    tmp3_1 = ((((kA659 + kC659) - kE659) - kE659) - kD659);
    tmp3_2 = kB659 - kG659;
    // Op 660: dim3x1 add
    gl64_t s1_660 = *(gl64_t*)&expressions_params[10][22];
    tmp3_0 = tmp3_0 + s1_660; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 661: dim3x3 mul
    gl64_t s1_661_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_661_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_661_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA661 = (tmp3_0 + tmp3_1) * (s1_661_0 + s1_661_1);
    gl64_t kB661 = (tmp3_0 + tmp3_2) * (s1_661_0 + s1_661_2);
    gl64_t kC661 = (tmp3_1 + tmp3_2) * (s1_661_1 + s1_661_2);
    gl64_t kD661 = tmp3_0 * s1_661_0;
    gl64_t kE661 = tmp3_1 * s1_661_1;
    gl64_t kF661 = tmp3_2 * s1_661_2;
    gl64_t kG661 = kD661 - kE661;
    tmp3_0 = (kC661 + kG661) - kF661;
    tmp3_1 = ((((kA661 + kC661) - kE661) - kE661) - kD661);
    tmp3_2 = kB661 - kG661;
    // Op 662: dim3x1 add
    gl64_t s1_662 = *(gl64_t*)&expressions_params[10][21];
    tmp3_0 = tmp3_0 + s1_662; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 663: dim3x3 mul
    gl64_t s1_663_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_663_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_663_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA663 = (tmp3_0 + tmp3_1) * (s1_663_0 + s1_663_1);
    gl64_t kB663 = (tmp3_0 + tmp3_2) * (s1_663_0 + s1_663_2);
    gl64_t kC663 = (tmp3_1 + tmp3_2) * (s1_663_1 + s1_663_2);
    gl64_t kD663 = tmp3_0 * s1_663_0;
    gl64_t kE663 = tmp3_1 * s1_663_1;
    gl64_t kF663 = tmp3_2 * s1_663_2;
    gl64_t kG663 = kD663 - kE663;
    tmp3_0 = (kC663 + kG663) - kF663;
    tmp3_1 = ((((kA663 + kC663) - kE663) - kE663) - kD663);
    tmp3_2 = kB663 - kG663;
    // Op 664: dim3x1 add
    gl64_t s1_664 = *(gl64_t*)&expressions_params[10][31];
    tmp3_0 = tmp3_0 + s1_664; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 665: dim3x3 mul
    gl64_t s1_665_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_665_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_665_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA665 = (tmp3_0 + tmp3_1) * (s1_665_0 + s1_665_1);
    gl64_t kB665 = (tmp3_0 + tmp3_2) * (s1_665_0 + s1_665_2);
    gl64_t kC665 = (tmp3_1 + tmp3_2) * (s1_665_1 + s1_665_2);
    gl64_t kD665 = tmp3_0 * s1_665_0;
    gl64_t kE665 = tmp3_1 * s1_665_1;
    gl64_t kF665 = tmp3_2 * s1_665_2;
    gl64_t kG665 = kD665 - kE665;
    tmp3_0 = (kC665 + kG665) - kF665;
    tmp3_1 = ((((kA665 + kC665) - kE665) - kE665) - kD665);
    tmp3_2 = kB665 - kG665;
    // Op 666: dim3x1 add
    gl64_t s1_666 = *(gl64_t*)&expressions_params[10][18];
    tmp3_0 = tmp3_0 + s1_666; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 667: dim3x3 mul
    gl64_t s1_667_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_667_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_667_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA667 = (tmp3_0 + tmp3_1) * (s1_667_0 + s1_667_1);
    gl64_t kB667 = (tmp3_0 + tmp3_2) * (s1_667_0 + s1_667_2);
    gl64_t kC667 = (tmp3_1 + tmp3_2) * (s1_667_1 + s1_667_2);
    gl64_t kD667 = tmp3_0 * s1_667_0;
    gl64_t kE667 = tmp3_1 * s1_667_1;
    gl64_t kF667 = tmp3_2 * s1_667_2;
    gl64_t kG667 = kD667 - kE667;
    tmp3_0 = (kC667 + kG667) - kF667;
    tmp3_1 = ((((kA667 + kC667) - kE667) - kE667) - kD667);
    tmp3_2 = kB667 - kG667;
    // Op 668: dim3x1 add
    gl64_t s1_668 = *(gl64_t*)&expressions_params[10][20];
    tmp3_0 = tmp3_0 + s1_668; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    gl64_t s1_670 = *(gl64_t*)&expressions_params[10][19];
    tmp3_0 = tmp3_0 + s1_670; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 671: dim3x3 mul
    gl64_t s1_671_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_671_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_671_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA671 = (tmp3_0 + tmp3_1) * (s1_671_0 + s1_671_1);
    gl64_t kB671 = (tmp3_0 + tmp3_2) * (s1_671_0 + s1_671_2);
    gl64_t kC671 = (tmp3_1 + tmp3_2) * (s1_671_1 + s1_671_2);
    gl64_t kD671 = tmp3_0 * s1_671_0;
    gl64_t kE671 = tmp3_1 * s1_671_1;
    gl64_t kF671 = tmp3_2 * s1_671_2;
    gl64_t kG671 = kD671 - kE671;
    tmp3_0 = (kC671 + kG671) - kF671;
    tmp3_1 = ((((kA671 + kC671) - kE671) - kE671) - kD671);
    tmp3_2 = kB671 - kG671;
    // Op 672: dim3x1 add
    gl64_t s1_672 = *(gl64_t*)&expressions_params[10][17];
    tmp3_0 = tmp3_0 + s1_672; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 673: dim3x3 mul
    gl64_t s1_673_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_673_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_673_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA673 = (tmp3_0 + tmp3_1) * (s1_673_0 + s1_673_1);
    gl64_t kB673 = (tmp3_0 + tmp3_2) * (s1_673_0 + s1_673_2);
    gl64_t kC673 = (tmp3_1 + tmp3_2) * (s1_673_1 + s1_673_2);
    gl64_t kD673 = tmp3_0 * s1_673_0;
    gl64_t kE673 = tmp3_1 * s1_673_1;
    gl64_t kF673 = tmp3_2 * s1_673_2;
    gl64_t kG673 = kD673 - kE673;
    tmp3_0 = (kC673 + kG673) - kF673;
    tmp3_1 = ((((kA673 + kC673) - kE673) - kE673) - kD673);
    tmp3_2 = kB673 - kG673;
    // Op 674: dim3x1 add
    gl64_t s1_674 = *(gl64_t*)&expressions_params[10][16];
    tmp3_0 = tmp3_0 + s1_674; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 675: dim3x3 mul
    gl64_t s1_675_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_675_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_675_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA675 = (tmp3_0 + tmp3_1) * (s1_675_0 + s1_675_1);
    gl64_t kB675 = (tmp3_0 + tmp3_2) * (s1_675_0 + s1_675_2);
    gl64_t kC675 = (tmp3_1 + tmp3_2) * (s1_675_1 + s1_675_2);
    gl64_t kD675 = tmp3_0 * s1_675_0;
    gl64_t kE675 = tmp3_1 * s1_675_1;
    gl64_t kF675 = tmp3_2 * s1_675_2;
    gl64_t kG675 = kD675 - kE675;
    tmp3_0 = (kC675 + kG675) - kF675;
    tmp3_1 = ((((kA675 + kC675) - kE675) - kE675) - kD675);
    tmp3_2 = kB675 - kG675;
    // Op 676: dim3x1 add
    gl64_t s1_676 = *(gl64_t*)&expressions_params[10][15];
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
    gl64_t s1_678 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_678; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 679: dim3x3 mul
    gl64_t s1_679_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_679_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_679_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA679 = (tmp3_0 + tmp3_1) * (s1_679_0 + s1_679_1);
    gl64_t kB679 = (tmp3_0 + tmp3_2) * (s1_679_0 + s1_679_2);
    gl64_t kC679 = (tmp3_1 + tmp3_2) * (s1_679_1 + s1_679_2);
    gl64_t kD679 = tmp3_0 * s1_679_0;
    gl64_t kE679 = tmp3_1 * s1_679_1;
    gl64_t kF679 = tmp3_2 * s1_679_2;
    gl64_t kG679 = kD679 - kE679;
    tmp3_0 = (kC679 + kG679) - kF679;
    tmp3_1 = ((((kA679 + kC679) - kE679) - kE679) - kD679);
    tmp3_2 = kB679 - kG679;
    // Op 680: dim3x1 add
    gl64_t s1_680 = *(gl64_t*)&expressions_params[10][29];
    tmp3_0 = tmp3_0 + s1_680; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 682: dim1x1 add
    gl64_t s0_682 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_682 = *(gl64_t*)&expressions_params[10][0];
    tmp1_7 = s0_682 + s1_682;
    // Op 683: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_7; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 684: dim3x3 mul
    gl64_t s1_684_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_684_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_684_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA684 = (tmp3_0 + tmp3_1) * (s1_684_0 + s1_684_1);
    gl64_t kB684 = (tmp3_0 + tmp3_2) * (s1_684_0 + s1_684_2);
    gl64_t kC684 = (tmp3_1 + tmp3_2) * (s1_684_1 + s1_684_2);
    gl64_t kD684 = tmp3_0 * s1_684_0;
    gl64_t kE684 = tmp3_1 * s1_684_1;
    gl64_t kF684 = tmp3_2 * s1_684_2;
    gl64_t kG684 = kD684 - kE684;
    tmp3_0 = (kC684 + kG684) - kF684;
    tmp3_1 = ((((kA684 + kC684) - kE684) - kE684) - kD684);
    tmp3_2 = kB684 - kG684;
    // Op 685: dim3x1 add
    gl64_t s1_685 = *(gl64_t*)&expressions_params[9][17];
    tmp3_0 = tmp3_0 + s1_685; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 686: dim3x3 add
    gl64_t s1_686_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_686_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_686_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_686_0; tmp3_1 = tmp3_1 + s1_686_1; tmp3_2 = tmp3_2 + s1_686_2;
    // Op 687: dim3x3 mul
    gl64_t s1_687_0 = *(gl64_t*)&expressions_params[10][41];
    gl64_t s1_687_1 = *(gl64_t*)&expressions_params[10][41+1];
    gl64_t s1_687_2 = *(gl64_t*)&expressions_params[10][41+2];
    gl64_t kA687 = (tmp3_0 + tmp3_1) * (s1_687_0 + s1_687_1);
    gl64_t kB687 = (tmp3_0 + tmp3_2) * (s1_687_0 + s1_687_2);
    gl64_t kC687 = (tmp3_1 + tmp3_2) * (s1_687_1 + s1_687_2);
    gl64_t kD687 = tmp3_0 * s1_687_0;
    gl64_t kE687 = tmp3_1 * s1_687_1;
    gl64_t kF687 = tmp3_2 * s1_687_2;
    gl64_t kG687 = kD687 - kE687;
    tmp3_0 = (kC687 + kG687) - kF687;
    tmp3_1 = ((((kA687 + kC687) - kE687) - kE687) - kD687);
    tmp3_2 = kB687 - kG687;
    // Op 688: dim1x1 sub
    gl64_t s0_688 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_688 = *(gl64_t*)&expressions_params[10][29];
    tmp1_7 = s0_688 - s1_688;
    // Op 689: dim3x1 sub
    tmp3_0 = tmp3_0 - tmp1_7; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 690: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 691: dim3x3 mul
    gl64_t s1_691_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_691_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_691_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA691 = (tmp3_0 + tmp3_1) * (s1_691_0 + s1_691_1);
    gl64_t kB691 = (tmp3_0 + tmp3_2) * (s1_691_0 + s1_691_2);
    gl64_t kC691 = (tmp3_1 + tmp3_2) * (s1_691_1 + s1_691_2);
    gl64_t kD691 = tmp3_0 * s1_691_0;
    gl64_t kE691 = tmp3_1 * s1_691_1;
    gl64_t kF691 = tmp3_2 * s1_691_2;
    gl64_t kG691 = kD691 - kE691;
    tmp3_6 = (kC691 + kG691) - kF691;
    tmp3_7 = ((((kA691 + kC691) - kE691) - kE691) - kD691);
    tmp3_8 = kB691 - kG691;
    // Op 692: dim3x1 mul
    gl64_t s0_692_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_692_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_692_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_692 = *(gl64_t*)&expressions_params[9][12];
    tmp3_0 = s0_692_0 * s1_692; tmp3_1 = s0_692_1 * s1_692; tmp3_2 = s0_692_2 * s1_692;
    // Op 693: dim3x1 add
    gl64_t s1_693 = *(gl64_t*)&expressions_params[9][7];
    tmp3_0 = tmp3_0 + s1_693; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 695: dim3x3 mul
    gl64_t s1_695_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_695_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_695_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA695 = (tmp3_0 + tmp3_1) * (s1_695_0 + s1_695_1);
    gl64_t kB695 = (tmp3_0 + tmp3_2) * (s1_695_0 + s1_695_2);
    gl64_t kC695 = (tmp3_1 + tmp3_2) * (s1_695_1 + s1_695_2);
    gl64_t kD695 = tmp3_0 * s1_695_0;
    gl64_t kE695 = tmp3_1 * s1_695_1;
    gl64_t kF695 = tmp3_2 * s1_695_2;
    gl64_t kG695 = kD695 - kE695;
    tmp3_0 = (kC695 + kG695) - kF695;
    tmp3_1 = ((((kA695 + kC695) - kE695) - kE695) - kD695);
    tmp3_2 = kB695 - kG695;
    // Op 696: dim3x1 add
    gl64_t s1_696 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_696; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    gl64_t s1_698 = *(gl64_t*)&expressions_params[9][15];
    tmp3_0 = tmp3_0 + s1_698; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 699: dim3x3 add
    gl64_t s1_699_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_699_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_699_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_699_0; tmp3_1 = tmp3_1 + s1_699_1; tmp3_2 = tmp3_2 + s1_699_2;
    // Op 700: dim3x3 mul
    gl64_t s1_700_0 = *(gl64_t*)&expressions_params[10][44];
    gl64_t s1_700_1 = *(gl64_t*)&expressions_params[10][44+1];
    gl64_t s1_700_2 = *(gl64_t*)&expressions_params[10][44+2];
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
    // Op 701: dim3x1 sub
    gl64_t s1_701 = *(gl64_t*)&expressions_params[10][32];
    tmp3_0 = tmp3_0 - s1_701; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 702: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 703: dim3x3 mul
    gl64_t s1_703_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_703_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_703_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA703 = (tmp3_0 + tmp3_1) * (s1_703_0 + s1_703_1);
    gl64_t kB703 = (tmp3_0 + tmp3_2) * (s1_703_0 + s1_703_2);
    gl64_t kC703 = (tmp3_1 + tmp3_2) * (s1_703_1 + s1_703_2);
    gl64_t kD703 = tmp3_0 * s1_703_0;
    gl64_t kE703 = tmp3_1 * s1_703_1;
    gl64_t kF703 = tmp3_2 * s1_703_2;
    gl64_t kG703 = kD703 - kE703;
    tmp3_6 = (kC703 + kG703) - kF703;
    tmp3_7 = ((((kA703 + kC703) - kE703) - kE703) - kD703);
    tmp3_8 = kB703 - kG703;
    // Op 704: dim3x1 mul
    gl64_t s0_704_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_704_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_704_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_704 = *(gl64_t*)&expressions_params[10][33];
    tmp3_0 = s0_704_0 * s1_704; tmp3_1 = s0_704_1 * s1_704; tmp3_2 = s0_704_2 * s1_704;
    // Op 705: dim3x1 add
    gl64_t s1_705 = *(gl64_t*)&expressions_params[9][18];
    tmp3_0 = tmp3_0 + s1_705; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 706: dim3x3 add
    gl64_t s1_706_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_706_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_706_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_706_0; tmp3_1 = tmp3_1 + s1_706_1; tmp3_2 = tmp3_2 + s1_706_2;
    // Op 707: dim3x3 mul
    gl64_t s1_707_0 = *(gl64_t*)&expressions_params[10][47];
    gl64_t s1_707_1 = *(gl64_t*)&expressions_params[10][47+1];
    gl64_t s1_707_2 = *(gl64_t*)&expressions_params[10][47+2];
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
    gl64_t s1_708 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_708; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 709: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 710: dim3x3 mul
    gl64_t s1_710_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_710_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_710_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA710 = (tmp3_0 + tmp3_1) * (s1_710_0 + s1_710_1);
    gl64_t kB710 = (tmp3_0 + tmp3_2) * (s1_710_0 + s1_710_2);
    gl64_t kC710 = (tmp3_1 + tmp3_2) * (s1_710_1 + s1_710_2);
    gl64_t kD710 = tmp3_0 * s1_710_0;
    gl64_t kE710 = tmp3_1 * s1_710_1;
    gl64_t kF710 = tmp3_2 * s1_710_2;
    gl64_t kG710 = kD710 - kE710;
    tmp3_6 = (kC710 + kG710) - kF710;
    tmp3_7 = ((((kA710 + kC710) - kE710) - kE710) - kD710);
    tmp3_8 = kB710 - kG710;
    // Op 711: dim3x1 mul
    gl64_t s0_711_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_711_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_711_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_711 = *(gl64_t*)&expressions_params[10][34];
    tmp3_0 = s0_711_0 * s1_711; tmp3_1 = s0_711_1 * s1_711; tmp3_2 = s0_711_2 * s1_711;
    // Op 712: dim3x1 add
    gl64_t s1_712 = *(gl64_t*)&expressions_params[9][18];
    tmp3_0 = tmp3_0 + s1_712; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 713: dim3x3 add
    gl64_t s1_713_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_713_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_713_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_713_0; tmp3_1 = tmp3_1 + s1_713_1; tmp3_2 = tmp3_2 + s1_713_2;
    // Op 714: dim3x3 mul
    gl64_t s1_714_0 = *(gl64_t*)&expressions_params[10][50];
    gl64_t s1_714_1 = *(gl64_t*)&expressions_params[10][50+1];
    gl64_t s1_714_2 = *(gl64_t*)&expressions_params[10][50+2];
    gl64_t kA714 = (tmp3_0 + tmp3_1) * (s1_714_0 + s1_714_1);
    gl64_t kB714 = (tmp3_0 + tmp3_2) * (s1_714_0 + s1_714_2);
    gl64_t kC714 = (tmp3_1 + tmp3_2) * (s1_714_1 + s1_714_2);
    gl64_t kD714 = tmp3_0 * s1_714_0;
    gl64_t kE714 = tmp3_1 * s1_714_1;
    gl64_t kF714 = tmp3_2 * s1_714_2;
    gl64_t kG714 = kD714 - kE714;
    tmp3_0 = (kC714 + kG714) - kF714;
    tmp3_1 = ((((kA714 + kC714) - kE714) - kE714) - kD714);
    tmp3_2 = kB714 - kG714;
    // Op 715: dim3x1 add
    gl64_t s1_715 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_715; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 716: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
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
    // Op 718: dim3x3 sub_swap
    uint64_t s0_718_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_2));
    gl64_t s0_718_0 = *(gl64_t*)&dParams->aux_trace[s0_718_pos];
    gl64_t s0_718_1 = *(gl64_t*)&dParams->aux_trace[s0_718_pos + TILE_HEIGHT];
    gl64_t s0_718_2 = *(gl64_t*)&dParams->aux_trace[s0_718_pos + 2*TILE_HEIGHT];
    gl64_t s1_718_0 = *(gl64_t*)&expressions_params[12][0];
    gl64_t s1_718_1 = *(gl64_t*)&expressions_params[12][0+1];
    gl64_t s1_718_2 = *(gl64_t*)&expressions_params[12][0+2];
    tmp3_6 = s1_718_0 - s0_718_0; tmp3_7 = s1_718_1 - s0_718_1; tmp3_8 = s1_718_2 - s0_718_2;
    // Op 719: dim3x3 add
    gl64_t s0_719_0 = *(gl64_t*)&expressions_params[10][35];
    gl64_t s0_719_1 = *(gl64_t*)&expressions_params[10][35+1];
    gl64_t s0_719_2 = *(gl64_t*)&expressions_params[10][35+2];
    gl64_t s1_719_0 = *(gl64_t*)&expressions_params[10][38];
    gl64_t s1_719_1 = *(gl64_t*)&expressions_params[10][38+1];
    gl64_t s1_719_2 = *(gl64_t*)&expressions_params[10][38+2];
    tmp3_0 = s0_719_0 + s1_719_0; tmp3_1 = s0_719_1 + s1_719_1; tmp3_2 = s0_719_2 + s1_719_2;
    // Op 720: dim3x3 add
    gl64_t s1_720_0 = *(gl64_t*)&expressions_params[10][41];
    gl64_t s1_720_1 = *(gl64_t*)&expressions_params[10][41+1];
    gl64_t s1_720_2 = *(gl64_t*)&expressions_params[10][41+2];
    tmp3_0 = tmp3_0 + s1_720_0; tmp3_1 = tmp3_1 + s1_720_1; tmp3_2 = tmp3_2 + s1_720_2;
    // Op 721: dim3x3 add
    gl64_t s1_721_0 = *(gl64_t*)&expressions_params[10][44];
    gl64_t s1_721_1 = *(gl64_t*)&expressions_params[10][44+1];
    gl64_t s1_721_2 = *(gl64_t*)&expressions_params[10][44+2];
    tmp3_0 = tmp3_0 + s1_721_0; tmp3_1 = tmp3_1 + s1_721_1; tmp3_2 = tmp3_2 + s1_721_2;
    // Op 722: dim3x3 add
    gl64_t s1_722_0 = *(gl64_t*)&expressions_params[10][47];
    gl64_t s1_722_1 = *(gl64_t*)&expressions_params[10][47+1];
    gl64_t s1_722_2 = *(gl64_t*)&expressions_params[10][47+2];
    tmp3_0 = tmp3_0 + s1_722_0; tmp3_1 = tmp3_1 + s1_722_1; tmp3_2 = tmp3_2 + s1_722_2;
    // Op 723: dim3x3 add
    gl64_t s1_723_0 = *(gl64_t*)&expressions_params[10][50];
    gl64_t s1_723_1 = *(gl64_t*)&expressions_params[10][50+1];
    gl64_t s1_723_2 = *(gl64_t*)&expressions_params[10][50+2];
    tmp3_0 = tmp3_0 + s1_723_0; tmp3_1 = tmp3_1 + s1_723_1; tmp3_2 = tmp3_2 + s1_723_2;
    // Op 724: dim3x3 sub
    tmp3_0 = tmp3_6 - tmp3_0; tmp3_1 = tmp3_7 - tmp3_1; tmp3_2 = tmp3_8 - tmp3_2;
    // Op 725: dim3x1 mul
    gl64_t s1_725 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp3_0 = tmp3_0 * s1_725; tmp3_1 = tmp3_1 * s1_725; tmp3_2 = tmp3_2 * s1_725;
    // Op 726: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 727: dim3x1 mul
    gl64_t s1_727 = *(gl64_t*)&dParams->aux_trace[dArgs->zi_offset + (1 - 1) * domainSize + row + threadIdx.x];
    tmp3_0 = tmp3_0 * s1_727; tmp3_1 = tmp3_1 * s1_727; tmp3_2 = tmp3_2 * s1_727;

    // Write final result to shared memory and store to output
    *(gl64_t*)&expressions_params[bufferCommitsSize + 1][0 * blockDim.x + threadIdx.x] = tmp3_0;
    *(gl64_t*)&expressions_params[bufferCommitsSize + 1][1 * blockDim.x + threadIdx.x] = tmp3_1;
    *(gl64_t*)&expressions_params[bufferCommitsSize + 1][2 * blockDim.x + threadIdx.x] = tmp3_2;
    storePolynomial__((ExpsArguments*)dExpsArgs, (Goldilocks::Element*)&expressions_params[bufferCommitsSize + 1][0 * blockDim.x], row);
}
