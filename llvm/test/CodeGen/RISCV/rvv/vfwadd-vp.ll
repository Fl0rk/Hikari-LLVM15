; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=riscv64 -mattr=+v,+zvfh | FileCheck %s --check-prefixes=ZVFH
; RUN: llc < %s -mtriple=riscv64 -mattr=+v,+zvfhmin | FileCheck %s --check-prefixes=ZVFHMIN

define <vscale x 2 x float> @vfwadd_same_operand(<vscale x 2 x half> %arg, i32 signext %vl) {
; ZVFH-LABEL: vfwadd_same_operand:
; ZVFH:       # %bb.0: # %bb
; ZVFH-NEXT:    slli a0, a0, 32
; ZVFH-NEXT:    srli a0, a0, 32
; ZVFH-NEXT:    vsetvli zero, a0, e16, mf2, ta, ma
; ZVFH-NEXT:    vfwadd.vv v9, v8, v8
; ZVFH-NEXT:    vmv1r.v v8, v9
; ZVFH-NEXT:    ret
;
; ZVFHMIN-LABEL: vfwadd_same_operand:
; ZVFHMIN:       # %bb.0: # %bb
; ZVFHMIN-NEXT:    slli a0, a0, 32
; ZVFHMIN-NEXT:    srli a0, a0, 32
; ZVFHMIN-NEXT:    vsetvli zero, a0, e16, mf2, ta, ma
; ZVFHMIN-NEXT:    vfwcvt.f.f.v v9, v8
; ZVFHMIN-NEXT:    vsetvli zero, zero, e32, m1, ta, ma
; ZVFHMIN-NEXT:    vfadd.vv v8, v9, v9
; ZVFHMIN-NEXT:    ret
bb:
  %tmp = call <vscale x 2 x float> @llvm.vp.fpext.nxv2f32.nxv2f16(<vscale x 2 x half> %arg, <vscale x 2 x i1> splat (i1 true), i32 %vl)
  %tmp2 = call <vscale x 2 x float> @llvm.vp.fadd.nxv2f32(<vscale x 2 x float> %tmp, <vscale x 2 x float> %tmp, <vscale x 2 x i1> splat (i1 true), i32 %vl)
  ret <vscale x 2 x float> %tmp2
}

define <vscale x 2 x float> @vfwadd_tu(<vscale x 2 x half> %arg, <vscale x 2 x float> %arg1, i32 signext %arg2) {
; ZVFH-LABEL: vfwadd_tu:
; ZVFH:       # %bb.0: # %bb
; ZVFH-NEXT:    slli a0, a0, 32
; ZVFH-NEXT:    srli a0, a0, 32
; ZVFH-NEXT:    vsetvli zero, a0, e16, mf2, tu, ma
; ZVFH-NEXT:    vfwadd.wv v9, v9, v8
; ZVFH-NEXT:    vmv1r.v v8, v9
; ZVFH-NEXT:    ret
;
; ZVFHMIN-LABEL: vfwadd_tu:
; ZVFHMIN:       # %bb.0: # %bb
; ZVFHMIN-NEXT:    slli a0, a0, 32
; ZVFHMIN-NEXT:    srli a0, a0, 32
; ZVFHMIN-NEXT:    vsetvli zero, a0, e16, mf2, ta, ma
; ZVFHMIN-NEXT:    vfwcvt.f.f.v v10, v8
; ZVFHMIN-NEXT:    vsetvli zero, zero, e32, m1, tu, ma
; ZVFHMIN-NEXT:    vfadd.vv v9, v9, v10
; ZVFHMIN-NEXT:    vmv1r.v v8, v9
; ZVFHMIN-NEXT:    ret
bb:
  %tmp = call <vscale x 2 x float> @llvm.vp.fpext.nxv2f32.nxv2f16(<vscale x 2 x half> %arg, <vscale x 2 x i1> splat (i1 true), i32 %arg2)
  %tmp3 = call <vscale x 2 x float> @llvm.vp.fadd.nxv2f32(<vscale x 2 x float> %arg1, <vscale x 2 x float> %tmp, <vscale x 2 x i1> splat (i1 true), i32 %arg2)
  %tmp4 = call <vscale x 2 x float> @llvm.vp.merge.nxv2f32(<vscale x 2 x i1> splat (i1 true), <vscale x 2 x float> %tmp3, <vscale x 2 x float> %arg1, i32 %arg2)
  ret <vscale x 2 x float> %tmp4
}

declare <vscale x 2 x float> @llvm.vp.fpext.nxv2f32.nxv2f16(<vscale x 2 x half>, <vscale x 2 x i1>, i32)
declare <vscale x 2 x float> @llvm.vp.fadd.nxv2f32(<vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x i1>, i32)
declare <vscale x 2 x float> @llvm.vp.merge.nxv2f32(<vscale x 2 x i1>, <vscale x 2 x float>, <vscale x 2 x float>, i32)