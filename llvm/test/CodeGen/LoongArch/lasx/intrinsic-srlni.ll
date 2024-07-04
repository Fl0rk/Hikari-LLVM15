; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc --mtriple=loongarch64 --mattr=+lasx < %s | FileCheck %s

declare <32 x i8> @llvm.loongarch.lasx.xvsrlni.b.h(<32 x i8>, <32 x i8>, i32)

define <32 x i8> @lasx_xvsrlni_b_h(<32 x i8> %va, <32 x i8> %vb) nounwind {
; CHECK-LABEL: lasx_xvsrlni_b_h:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvsrlni.b.h $xr0, $xr1, 1
; CHECK-NEXT:    ret
entry:
  %res = call <32 x i8> @llvm.loongarch.lasx.xvsrlni.b.h(<32 x i8> %va, <32 x i8> %vb, i32 1)
  ret <32 x i8> %res
}

declare <16 x i16> @llvm.loongarch.lasx.xvsrlni.h.w(<16 x i16>, <16 x i16>, i32)

define <16 x i16> @lasx_xvsrlni_h_w(<16 x i16> %va, <16 x i16> %vb) nounwind {
; CHECK-LABEL: lasx_xvsrlni_h_w:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvsrlni.h.w $xr0, $xr1, 1
; CHECK-NEXT:    ret
entry:
  %res = call <16 x i16> @llvm.loongarch.lasx.xvsrlni.h.w(<16 x i16> %va, <16 x i16> %vb, i32 1)
  ret <16 x i16> %res
}

declare <8 x i32> @llvm.loongarch.lasx.xvsrlni.w.d(<8 x i32>, <8 x i32>, i32)

define <8 x i32> @lasx_xvsrlni_w_d(<8 x i32> %va, <8 x i32> %vb) nounwind {
; CHECK-LABEL: lasx_xvsrlni_w_d:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvsrlni.w.d $xr0, $xr1, 1
; CHECK-NEXT:    ret
entry:
  %res = call <8 x i32> @llvm.loongarch.lasx.xvsrlni.w.d(<8 x i32> %va, <8 x i32> %vb, i32 1)
  ret <8 x i32> %res
}

declare <4 x i64> @llvm.loongarch.lasx.xvsrlni.d.q(<4 x i64>, <4 x i64>, i32)

define <4 x i64> @lasx_xvsrlni_d_q(<4 x i64> %va, <4 x i64> %vb) nounwind {
; CHECK-LABEL: lasx_xvsrlni_d_q:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvsrlni.d.q $xr0, $xr1, 1
; CHECK-NEXT:    ret
entry:
  %res = call <4 x i64> @llvm.loongarch.lasx.xvsrlni.d.q(<4 x i64> %va, <4 x i64> %vb, i32 1)
  ret <4 x i64> %res
}