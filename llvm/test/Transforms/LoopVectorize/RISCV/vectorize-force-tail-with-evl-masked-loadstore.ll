; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -passes=loop-vectorize \
; RUN: -force-tail-folding-style=data-with-evl \
; RUN: -prefer-predicate-over-epilogue=predicate-dont-vectorize \
; RUN: -mtriple=riscv64 -mattr=+v -S < %s | FileCheck %s --check-prefix=IF-EVL

; RUN: opt -passes=loop-vectorize \
; RUN: -force-tail-folding-style=none \
; RUN: -prefer-predicate-over-epilogue=predicate-dont-vectorize \
; RUN: -mtriple=riscv64 -mattr=+v -S < %s | FileCheck %s --check-prefix=NO-VP

define void @masked_loadstore(ptr noalias %a, ptr noalias %b, i64 %n) {
; IF-EVL-LABEL: @masked_loadstore(
; IF-EVL-NEXT:  entry:
; IF-EVL-NEXT:    [[TMP0:%.*]] = sub i64 -1, [[N:%.*]]
; IF-EVL-NEXT:    [[TMP1:%.*]] = call i64 @llvm.vscale.i64()
; IF-EVL-NEXT:    [[TMP2:%.*]] = mul i64 [[TMP1]], 4
; IF-EVL-NEXT:    [[TMP3:%.*]] = icmp ult i64 [[TMP0]], [[TMP2]]
; IF-EVL-NEXT:    br i1 [[TMP3]], label [[SCALAR_PH:%.*]], label [[VECTOR_PH:%.*]]
; IF-EVL:       vector.ph:
; IF-EVL-NEXT:    [[TMP4:%.*]] = call i64 @llvm.vscale.i64()
; IF-EVL-NEXT:    [[TMP5:%.*]] = mul i64 [[TMP4]], 4
; IF-EVL-NEXT:    [[TMP8:%.*]] = sub i64 [[TMP5]], 1
; IF-EVL-NEXT:    [[N_RND_UP:%.*]] = add i64 [[N]], [[TMP8]]
; IF-EVL-NEXT:    [[N_MOD_VF:%.*]] = urem i64 [[N_RND_UP]], [[TMP5]]
; IF-EVL-NEXT:    [[N_VEC:%.*]] = sub i64 [[N_RND_UP]], [[N_MOD_VF]]
; IF-EVL-NEXT:    [[TRIP_COUNT_MINUS_1:%.*]] = sub i64 [[N]], 1
; IF-EVL-NEXT:    [[TMP9:%.*]] = call i64 @llvm.vscale.i64()
; IF-EVL-NEXT:    [[TMP10:%.*]] = mul i64 [[TMP9]], 4
; IF-EVL-NEXT:    [[BROADCAST_SPLATINSERT1:%.*]] = insertelement <vscale x 4 x i64> poison, i64 [[TRIP_COUNT_MINUS_1]], i64 0
; IF-EVL-NEXT:    [[BROADCAST_SPLAT2:%.*]] = shufflevector <vscale x 4 x i64> [[BROADCAST_SPLATINSERT1]], <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer
; IF-EVL-NEXT:    br label [[VECTOR_BODY:%.*]]
; IF-EVL:       vector.body:
; IF-EVL-NEXT:    [[INDEX:%.*]] = phi i64 [ 0, [[VECTOR_PH]] ], [ [[INDEX_NEXT:%.*]], [[VECTOR_BODY]] ]
; IF-EVL-NEXT:    [[EVL_BASED_IV:%.*]] = phi i64 [ 0, [[VECTOR_PH]] ], [ [[INDEX_EVL_NEXT:%.*]], [[VECTOR_BODY]] ]
; IF-EVL-NEXT:    [[TMP11:%.*]] = sub i64 [[N]], [[EVL_BASED_IV]]
; IF-EVL-NEXT:    [[TMP12:%.*]] = call i32 @llvm.experimental.get.vector.length.i64(i64 [[TMP11]], i32 4, i1 true)
; IF-EVL-NEXT:    [[TMP13:%.*]] = add i64 [[EVL_BASED_IV]], 0
; IF-EVL-NEXT:    [[BROADCAST_SPLATINSERT:%.*]] = insertelement <vscale x 4 x i64> poison, i64 [[EVL_BASED_IV]], i64 0
; IF-EVL-NEXT:    [[BROADCAST_SPLAT:%.*]] = shufflevector <vscale x 4 x i64> [[BROADCAST_SPLATINSERT]], <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer
; IF-EVL-NEXT:    [[TMP14:%.*]] = call <vscale x 4 x i64> @llvm.experimental.stepvector.nxv4i64()
; IF-EVL-NEXT:    [[TMP15:%.*]] = add <vscale x 4 x i64> zeroinitializer, [[TMP14]]
; IF-EVL-NEXT:    [[VEC_IV:%.*]] = add <vscale x 4 x i64> [[BROADCAST_SPLAT]], [[TMP15]]
; IF-EVL-NEXT:    [[TMP16:%.*]] = icmp ule <vscale x 4 x i64> [[VEC_IV]], [[BROADCAST_SPLAT2]]
; IF-EVL-NEXT:    [[TMP17:%.*]] = getelementptr inbounds i32, ptr [[B:%.*]], i64 [[TMP13]]
; IF-EVL-NEXT:    [[TMP18:%.*]] = getelementptr inbounds i32, ptr [[TMP17]], i32 0
; IF-EVL-NEXT:    [[VP_OP_LOAD:%.*]] = call <vscale x 4 x i32> @llvm.vp.load.nxv4i32.p0(ptr align 4 [[TMP18]], <vscale x 4 x i1> shufflevector (<vscale x 4 x i1> insertelement (<vscale x 4 x i1> poison, i1 true, i64 0), <vscale x 4 x i1> poison, <vscale x 4 x i32> zeroinitializer), i32 [[TMP12]])
; IF-EVL-NEXT:    [[TMP19:%.*]] = icmp ne <vscale x 4 x i32> [[VP_OP_LOAD]], zeroinitializer
; IF-EVL-NEXT:    [[TMP20:%.*]] = select <vscale x 4 x i1> [[TMP16]], <vscale x 4 x i1> [[TMP19]], <vscale x 4 x i1> zeroinitializer
; IF-EVL-NEXT:    [[TMP21:%.*]] = getelementptr i32, ptr [[A:%.*]], i64 [[TMP13]]
; IF-EVL-NEXT:    [[TMP22:%.*]] = getelementptr i32, ptr [[TMP21]], i32 0
; IF-EVL-NEXT:    [[VP_OP_LOAD3:%.*]] = call <vscale x 4 x i32> @llvm.vp.load.nxv4i32.p0(ptr align 4 [[TMP22]], <vscale x 4 x i1> [[TMP20]], i32 [[TMP12]])
; IF-EVL-NEXT:    [[TMP23:%.*]] = add <vscale x 4 x i32> [[VP_OP_LOAD]], [[VP_OP_LOAD3]]
; IF-EVL-NEXT:    call void @llvm.vp.store.nxv4i32.p0(<vscale x 4 x i32> [[TMP23]], ptr align 4 [[TMP22]], <vscale x 4 x i1> [[TMP20]], i32 [[TMP12]])
; IF-EVL-NEXT:    [[TMP24:%.*]] = zext i32 [[TMP12]] to i64
; IF-EVL-NEXT:    [[INDEX_EVL_NEXT]] = add i64 [[TMP24]], [[EVL_BASED_IV]]
; IF-EVL-NEXT:    [[INDEX_NEXT]] = add i64 [[INDEX]], [[TMP10]]
; IF-EVL-NEXT:    [[TMP25:%.*]] = icmp eq i64 [[INDEX_NEXT]], [[N_VEC]]
; IF-EVL-NEXT:    br i1 [[TMP25]], label [[MIDDLE_BLOCK:%.*]], label [[VECTOR_BODY]], !llvm.loop [[LOOP0:![0-9]+]]
; IF-EVL:       middle.block:
; IF-EVL-NEXT:    br i1 true, label [[EXIT:%.*]], label [[SCALAR_PH]]
; IF-EVL:       scalar.ph:
; IF-EVL-NEXT:    [[BC_RESUME_VAL:%.*]] = phi i64 [ [[N_VEC]], [[MIDDLE_BLOCK]] ], [ 0, [[ENTRY:%.*]] ]
; IF-EVL-NEXT:    br label [[FOR_BODY:%.*]]
; IF-EVL:       for.body:
; IF-EVL-NEXT:    [[I_011:%.*]] = phi i64 [ [[INC:%.*]], [[FOR_INC:%.*]] ], [ [[BC_RESUME_VAL]], [[SCALAR_PH]] ]
; IF-EVL-NEXT:    [[ARRAYIDX:%.*]] = getelementptr inbounds i32, ptr [[B]], i64 [[I_011]]
; IF-EVL-NEXT:    [[TMP26:%.*]] = load i32, ptr [[ARRAYIDX]], align 4
; IF-EVL-NEXT:    [[CMP1:%.*]] = icmp ne i32 [[TMP26]], 0
; IF-EVL-NEXT:    br i1 [[CMP1]], label [[IF_THEN:%.*]], label [[FOR_INC]]
; IF-EVL:       if.then:
; IF-EVL-NEXT:    [[ARRAYIDX3:%.*]] = getelementptr inbounds i32, ptr [[A]], i64 [[I_011]]
; IF-EVL-NEXT:    [[TMP27:%.*]] = load i32, ptr [[ARRAYIDX3]], align 4
; IF-EVL-NEXT:    [[ADD:%.*]] = add i32 [[TMP26]], [[TMP27]]
; IF-EVL-NEXT:    store i32 [[ADD]], ptr [[ARRAYIDX3]], align 4
; IF-EVL-NEXT:    br label [[FOR_INC]]
; IF-EVL:       for.inc:
; IF-EVL-NEXT:    [[INC]] = add nuw nsw i64 [[I_011]], 1
; IF-EVL-NEXT:    [[EXITCOND_NOT:%.*]] = icmp eq i64 [[INC]], [[N]]
; IF-EVL-NEXT:    br i1 [[EXITCOND_NOT]], label [[EXIT]], label [[FOR_BODY]], !llvm.loop [[LOOP3:![0-9]+]]
; IF-EVL:       exit:
; IF-EVL-NEXT:    ret void
;
; NO-VP-LABEL: @masked_loadstore(
; NO-VP-NEXT:  entry:
; NO-VP-NEXT:    br label [[FOR_BODY:%.*]]
; NO-VP:       for.body:
; NO-VP-NEXT:    [[I_011:%.*]] = phi i64 [ [[INC:%.*]], [[FOR_INC:%.*]] ], [ 0, [[ENTRY:%.*]] ]
; NO-VP-NEXT:    [[ARRAYIDX:%.*]] = getelementptr inbounds i32, ptr [[B:%.*]], i64 [[I_011]]
; NO-VP-NEXT:    [[TMP0:%.*]] = load i32, ptr [[ARRAYIDX]], align 4
; NO-VP-NEXT:    [[CMP1:%.*]] = icmp ne i32 [[TMP0]], 0
; NO-VP-NEXT:    br i1 [[CMP1]], label [[IF_THEN:%.*]], label [[FOR_INC]]
; NO-VP:       if.then:
; NO-VP-NEXT:    [[ARRAYIDX3:%.*]] = getelementptr inbounds i32, ptr [[A:%.*]], i64 [[I_011]]
; NO-VP-NEXT:    [[TMP1:%.*]] = load i32, ptr [[ARRAYIDX3]], align 4
; NO-VP-NEXT:    [[ADD:%.*]] = add i32 [[TMP0]], [[TMP1]]
; NO-VP-NEXT:    store i32 [[ADD]], ptr [[ARRAYIDX3]], align 4
; NO-VP-NEXT:    br label [[FOR_INC]]
; NO-VP:       for.inc:
; NO-VP-NEXT:    [[INC]] = add nuw nsw i64 [[I_011]], 1
; NO-VP-NEXT:    [[EXITCOND_NOT:%.*]] = icmp eq i64 [[INC]], [[N:%.*]]
; NO-VP-NEXT:    br i1 [[EXITCOND_NOT]], label [[EXIT:%.*]], label [[FOR_BODY]]
; NO-VP:       exit:
; NO-VP-NEXT:    ret void
;
entry:
  br label %for.body

for.body:
  %i.011 = phi i64 [ %inc, %for.inc ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds i32, ptr %b, i64 %i.011
  %0 = load i32, ptr %arrayidx, align 4
  %cmp1 = icmp ne i32 %0, 0
  br i1 %cmp1, label %if.then, label %for.inc

if.then:
  %arrayidx3 = getelementptr inbounds i32, ptr %a, i64 %i.011
  %1 = load i32, ptr %arrayidx3, align 4
  %add = add i32 %0, %1
  store i32 %add, ptr %arrayidx3, align 4
  br label %for.inc

for.inc:
  %inc = add nuw nsw i64 %i.011, 1
  %exitcond.not = icmp eq i64 %inc, %n
  br i1 %exitcond.not, label %exit, label %for.body

exit:
  ret void
}