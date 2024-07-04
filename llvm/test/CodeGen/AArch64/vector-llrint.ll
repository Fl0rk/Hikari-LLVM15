; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=aarch64 -mattr=+neon | FileCheck %s

define <1 x i64> @llrint_v1i64_v1f16(<1 x half> %x) {
; CHECK-LABEL: llrint_v1i64_v1f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fcvt s0, h0
; CHECK-NEXT:    frintx s0, s0
; CHECK-NEXT:    fcvtzs x8, s0
; CHECK-NEXT:    fmov d0, x8
; CHECK-NEXT:    ret
  %a = call <1 x i64> @llvm.llrint.v1i64.v1f16(<1 x half> %x)
  ret <1 x i64> %a
}
declare <1 x i64> @llvm.llrint.v1i64.v1f16(<1 x half>)

define <2 x i64> @llrint_v1i64_v2f16(<2 x half> %x) {
; CHECK-LABEL: llrint_v1i64_v2f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-NEXT:    mov h1, v0.h[1]
; CHECK-NEXT:    fcvt s0, h0
; CHECK-NEXT:    fcvt s1, h1
; CHECK-NEXT:    frintx s0, s0
; CHECK-NEXT:    frintx s1, s1
; CHECK-NEXT:    fcvtzs x8, s0
; CHECK-NEXT:    fcvtzs x9, s1
; CHECK-NEXT:    fmov d0, x8
; CHECK-NEXT:    mov v0.d[1], x9
; CHECK-NEXT:    ret
  %a = call <2 x i64> @llvm.llrint.v2i64.v2f16(<2 x half> %x)
  ret <2 x i64> %a
}
declare <2 x i64> @llvm.llrint.v2i64.v2f16(<2 x half>)

define <4 x i64> @llrint_v4i64_v4f16(<4 x half> %x) {
; CHECK-LABEL: llrint_v4i64_v4f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-NEXT:    mov h1, v0.h[2]
; CHECK-NEXT:    mov h2, v0.h[1]
; CHECK-NEXT:    mov h3, v0.h[3]
; CHECK-NEXT:    fcvt s0, h0
; CHECK-NEXT:    fcvt s1, h1
; CHECK-NEXT:    fcvt s2, h2
; CHECK-NEXT:    fcvt s3, h3
; CHECK-NEXT:    frintx s0, s0
; CHECK-NEXT:    frintx s1, s1
; CHECK-NEXT:    frintx s2, s2
; CHECK-NEXT:    frintx s3, s3
; CHECK-NEXT:    fcvtzs x8, s0
; CHECK-NEXT:    fcvtzs x9, s1
; CHECK-NEXT:    fcvtzs x10, s2
; CHECK-NEXT:    fcvtzs x11, s3
; CHECK-NEXT:    fmov d0, x8
; CHECK-NEXT:    fmov d1, x9
; CHECK-NEXT:    mov v0.d[1], x10
; CHECK-NEXT:    mov v1.d[1], x11
; CHECK-NEXT:    ret
  %a = call <4 x i64> @llvm.llrint.v4i64.v4f16(<4 x half> %x)
  ret <4 x i64> %a
}
declare <4 x i64> @llvm.llrint.v4i64.v4f16(<4 x half>)

define <8 x i64> @llrint_v8i64_v8f16(<8 x half> %x) {
; CHECK-LABEL: llrint_v8i64_v8f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ext v1.16b, v0.16b, v0.16b, #8
; CHECK-NEXT:    mov h4, v0.h[2]
; CHECK-NEXT:    mov h3, v0.h[1]
; CHECK-NEXT:    mov h7, v0.h[3]
; CHECK-NEXT:    fcvt s0, h0
; CHECK-NEXT:    mov h2, v1.h[2]
; CHECK-NEXT:    mov h5, v1.h[1]
; CHECK-NEXT:    mov h6, v1.h[3]
; CHECK-NEXT:    fcvt s1, h1
; CHECK-NEXT:    fcvt s4, h4
; CHECK-NEXT:    fcvt s3, h3
; CHECK-NEXT:    fcvt s7, h7
; CHECK-NEXT:    frintx s0, s0
; CHECK-NEXT:    fcvt s2, h2
; CHECK-NEXT:    fcvt s5, h5
; CHECK-NEXT:    fcvt s6, h6
; CHECK-NEXT:    frintx s1, s1
; CHECK-NEXT:    frintx s4, s4
; CHECK-NEXT:    frintx s3, s3
; CHECK-NEXT:    frintx s7, s7
; CHECK-NEXT:    fcvtzs x9, s0
; CHECK-NEXT:    frintx s2, s2
; CHECK-NEXT:    frintx s5, s5
; CHECK-NEXT:    frintx s6, s6
; CHECK-NEXT:    fcvtzs x8, s1
; CHECK-NEXT:    fcvtzs x12, s4
; CHECK-NEXT:    fcvtzs x11, s3
; CHECK-NEXT:    fcvtzs x15, s7
; CHECK-NEXT:    fmov d0, x9
; CHECK-NEXT:    fcvtzs x10, s2
; CHECK-NEXT:    fcvtzs x13, s5
; CHECK-NEXT:    fcvtzs x14, s6
; CHECK-NEXT:    fmov d2, x8
; CHECK-NEXT:    fmov d1, x12
; CHECK-NEXT:    mov v0.d[1], x11
; CHECK-NEXT:    fmov d3, x10
; CHECK-NEXT:    mov v2.d[1], x13
; CHECK-NEXT:    mov v1.d[1], x15
; CHECK-NEXT:    mov v3.d[1], x14
; CHECK-NEXT:    ret
  %a = call <8 x i64> @llvm.llrint.v8i64.v8f16(<8 x half> %x)
  ret <8 x i64> %a
}
declare <8 x i64> @llvm.llrint.v8i64.v8f16(<8 x half>)

define <16 x i64> @llrint_v16i64_v16f16(<16 x half> %x) {
; CHECK-LABEL: llrint_v16i64_v16f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ext v2.16b, v0.16b, v0.16b, #8
; CHECK-NEXT:    ext v3.16b, v1.16b, v1.16b, #8
; CHECK-NEXT:    mov h17, v0.h[1]
; CHECK-NEXT:    mov h19, v0.h[2]
; CHECK-NEXT:    fcvt s18, h0
; CHECK-NEXT:    mov h0, v0.h[3]
; CHECK-NEXT:    mov h4, v2.h[1]
; CHECK-NEXT:    mov h5, v2.h[2]
; CHECK-NEXT:    fcvt s7, h3
; CHECK-NEXT:    fcvt s6, h2
; CHECK-NEXT:    mov h16, v3.h[2]
; CHECK-NEXT:    mov h2, v2.h[3]
; CHECK-NEXT:    fcvt s17, h17
; CHECK-NEXT:    fcvt s19, h19
; CHECK-NEXT:    frintx s18, s18
; CHECK-NEXT:    fcvt s0, h0
; CHECK-NEXT:    fcvt s4, h4
; CHECK-NEXT:    fcvt s5, h5
; CHECK-NEXT:    frintx s7, s7
; CHECK-NEXT:    frintx s6, s6
; CHECK-NEXT:    fcvt s16, h16
; CHECK-NEXT:    fcvt s2, h2
; CHECK-NEXT:    frintx s17, s17
; CHECK-NEXT:    frintx s19, s19
; CHECK-NEXT:    fcvtzs x13, s18
; CHECK-NEXT:    frintx s0, s0
; CHECK-NEXT:    frintx s4, s4
; CHECK-NEXT:    frintx s5, s5
; CHECK-NEXT:    fcvtzs x9, s7
; CHECK-NEXT:    mov h7, v1.h[2]
; CHECK-NEXT:    fcvtzs x8, s6
; CHECK-NEXT:    mov h6, v1.h[1]
; CHECK-NEXT:    frintx s16, s16
; CHECK-NEXT:    fcvtzs x14, s17
; CHECK-NEXT:    fcvtzs x15, s19
; CHECK-NEXT:    fcvtzs x10, s4
; CHECK-NEXT:    mov h4, v3.h[1]
; CHECK-NEXT:    fcvtzs x11, s5
; CHECK-NEXT:    mov h5, v1.h[3]
; CHECK-NEXT:    mov h3, v3.h[3]
; CHECK-NEXT:    fcvt s1, h1
; CHECK-NEXT:    fcvt s7, h7
; CHECK-NEXT:    fcvt s6, h6
; CHECK-NEXT:    fcvtzs x12, s16
; CHECK-NEXT:    frintx s16, s2
; CHECK-NEXT:    fmov d2, x8
; CHECK-NEXT:    fcvt s4, h4
; CHECK-NEXT:    fcvt s3, h3
; CHECK-NEXT:    fcvt s5, h5
; CHECK-NEXT:    frintx s1, s1
; CHECK-NEXT:    frintx s7, s7
; CHECK-NEXT:    frintx s17, s6
; CHECK-NEXT:    fmov d6, x9
; CHECK-NEXT:    mov v2.d[1], x10
; CHECK-NEXT:    frintx s4, s4
; CHECK-NEXT:    frintx s18, s3
; CHECK-NEXT:    frintx s5, s5
; CHECK-NEXT:    fcvtzs x8, s1
; CHECK-NEXT:    fcvtzs x9, s7
; CHECK-NEXT:    fmov d3, x11
; CHECK-NEXT:    fcvtzs x11, s0
; CHECK-NEXT:    fmov d7, x12
; CHECK-NEXT:    fcvtzs x12, s16
; CHECK-NEXT:    fcvtzs x16, s17
; CHECK-NEXT:    fcvtzs x17, s4
; CHECK-NEXT:    fmov d0, x13
; CHECK-NEXT:    fmov d1, x15
; CHECK-NEXT:    fcvtzs x18, s18
; CHECK-NEXT:    fcvtzs x0, s5
; CHECK-NEXT:    fmov d4, x8
; CHECK-NEXT:    fmov d5, x9
; CHECK-NEXT:    mov v0.d[1], x14
; CHECK-NEXT:    mov v1.d[1], x11
; CHECK-NEXT:    mov v3.d[1], x12
; CHECK-NEXT:    mov v4.d[1], x16
; CHECK-NEXT:    mov v6.d[1], x17
; CHECK-NEXT:    mov v7.d[1], x18
; CHECK-NEXT:    mov v5.d[1], x0
; CHECK-NEXT:    ret
  %a = call <16 x i64> @llvm.llrint.v16i64.v16f16(<16 x half> %x)
  ret <16 x i64> %a
}
declare <16 x i64> @llvm.llrint.v16i64.v16f16(<16 x half>)

define <32 x i64> @llrint_v32i64_v32f16(<32 x half> %x) {
; CHECK-LABEL: llrint_v32i64_v32f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ext v4.16b, v1.16b, v1.16b, #8
; CHECK-NEXT:    ext v5.16b, v2.16b, v2.16b, #8
; CHECK-NEXT:    ext v6.16b, v3.16b, v3.16b, #8
; CHECK-NEXT:    ext v7.16b, v0.16b, v0.16b, #8
; CHECK-NEXT:    mov h19, v0.h[1]
; CHECK-NEXT:    fcvt s21, h0
; CHECK-NEXT:    mov h23, v1.h[2]
; CHECK-NEXT:    fcvt s22, h1
; CHECK-NEXT:    fcvt s26, h2
; CHECK-NEXT:    mov h27, v2.h[1]
; CHECK-NEXT:    mov h28, v2.h[2]
; CHECK-NEXT:    mov h16, v4.h[2]
; CHECK-NEXT:    fcvt s17, h5
; CHECK-NEXT:    mov h18, v5.h[2]
; CHECK-NEXT:    mov h20, v6.h[2]
; CHECK-NEXT:    fcvt s24, h7
; CHECK-NEXT:    fcvt s25, h6
; CHECK-NEXT:    fcvt s19, h19
; CHECK-NEXT:    frintx s22, s22
; CHECK-NEXT:    fcvt s16, h16
; CHECK-NEXT:    frintx s17, s17
; CHECK-NEXT:    fcvt s18, h18
; CHECK-NEXT:    fcvt s20, h20
; CHECK-NEXT:    frintx s16, s16
; CHECK-NEXT:    fcvtzs x12, s17
; CHECK-NEXT:    frintx s17, s18
; CHECK-NEXT:    frintx s18, s21
; CHECK-NEXT:    fcvt s21, h23
; CHECK-NEXT:    frintx s23, s24
; CHECK-NEXT:    frintx s24, s25
; CHECK-NEXT:    frintx s25, s19
; CHECK-NEXT:    mov h19, v7.h[1]
; CHECK-NEXT:    fcvtzs x13, s16
; CHECK-NEXT:    frintx s16, s20
; CHECK-NEXT:    frintx s20, s26
; CHECK-NEXT:    fcvtzs x9, s23
; CHECK-NEXT:    mov h23, v3.h[2]
; CHECK-NEXT:    fcvt s26, h27
; CHECK-NEXT:    fcvtzs x15, s24
; CHECK-NEXT:    fcvtzs x10, s25
; CHECK-NEXT:    fcvt s24, h28
; CHECK-NEXT:    mov h25, v3.h[3]
; CHECK-NEXT:    fcvtzs x14, s17
; CHECK-NEXT:    frintx s21, s21
; CHECK-NEXT:    fmov d17, x12
; CHECK-NEXT:    fcvtzs x12, s16
; CHECK-NEXT:    fmov d16, x13
; CHECK-NEXT:    fcvtzs x13, s22
; CHECK-NEXT:    fcvt s22, h3
; CHECK-NEXT:    mov h3, v3.h[1]
; CHECK-NEXT:    mov h27, v0.h[2]
; CHECK-NEXT:    mov h28, v2.h[3]
; CHECK-NEXT:    fcvt s23, h23
; CHECK-NEXT:    frintx s26, s26
; CHECK-NEXT:    fcvtzs x16, s20
; CHECK-NEXT:    frintx s20, s24
; CHECK-NEXT:    fcvt s24, h25
; CHECK-NEXT:    fcvtzs x11, s18
; CHECK-NEXT:    fmov d18, x14
; CHECK-NEXT:    fcvtzs x14, s21
; CHECK-NEXT:    frintx s22, s22
; CHECK-NEXT:    fcvt s3, h3
; CHECK-NEXT:    fcvt s25, h27
; CHECK-NEXT:    fcvt s27, h28
; CHECK-NEXT:    frintx s23, s23
; CHECK-NEXT:    mov h21, v1.h[3]
; CHECK-NEXT:    fmov d2, x15
; CHECK-NEXT:    fcvtzs x15, s26
; CHECK-NEXT:    fmov d26, x13
; CHECK-NEXT:    mov h1, v1.h[1]
; CHECK-NEXT:    fcvtzs x13, s20
; CHECK-NEXT:    frintx s20, s24
; CHECK-NEXT:    fmov d24, x14
; CHECK-NEXT:    fcvtzs x14, s22
; CHECK-NEXT:    frintx s3, s3
; CHECK-NEXT:    fmov d22, x16
; CHECK-NEXT:    frintx s27, s27
; CHECK-NEXT:    fcvtzs x16, s23
; CHECK-NEXT:    fcvt s21, h21
; CHECK-NEXT:    frintx s25, s25
; CHECK-NEXT:    fcvt s1, h1
; CHECK-NEXT:    mov h0, v0.h[3]
; CHECK-NEXT:    mov h23, v7.h[2]
; CHECK-NEXT:    mov v22.d[1], x15
; CHECK-NEXT:    fcvtzs x15, s20
; CHECK-NEXT:    fmov d20, x13
; CHECK-NEXT:    fcvtzs x13, s3
; CHECK-NEXT:    fmov d3, x14
; CHECK-NEXT:    fcvtzs x14, s27
; CHECK-NEXT:    fmov d27, x16
; CHECK-NEXT:    frintx s21, s21
; CHECK-NEXT:    mov h7, v7.h[3]
; CHECK-NEXT:    frintx s1, s1
; CHECK-NEXT:    fcvt s0, h0
; CHECK-NEXT:    fcvt s23, h23
; CHECK-NEXT:    fcvt s19, h19
; CHECK-NEXT:    mov v27.d[1], x15
; CHECK-NEXT:    fcvtzs x15, s25
; CHECK-NEXT:    mov h25, v6.h[3]
; CHECK-NEXT:    mov h6, v6.h[1]
; CHECK-NEXT:    mov v3.d[1], x13
; CHECK-NEXT:    fcvtzs x13, s21
; CHECK-NEXT:    mov h21, v5.h[1]
; CHECK-NEXT:    mov h5, v5.h[3]
; CHECK-NEXT:    mov v20.d[1], x14
; CHECK-NEXT:    fcvtzs x14, s1
; CHECK-NEXT:    mov h1, v4.h[1]
; CHECK-NEXT:    frintx s0, s0
; CHECK-NEXT:    fcvt s25, h25
; CHECK-NEXT:    fcvt s7, h7
; CHECK-NEXT:    stp q3, q27, [x8, #192]
; CHECK-NEXT:    fcvt s6, h6
; CHECK-NEXT:    mov h3, v4.h[3]
; CHECK-NEXT:    stp q22, q20, [x8, #128]
; CHECK-NEXT:    fcvt s21, h21
; CHECK-NEXT:    fcvt s5, h5
; CHECK-NEXT:    mov v24.d[1], x13
; CHECK-NEXT:    mov v26.d[1], x14
; CHECK-NEXT:    fcvt s4, h4
; CHECK-NEXT:    frintx s22, s25
; CHECK-NEXT:    fmov d20, x12
; CHECK-NEXT:    fcvt s1, h1
; CHECK-NEXT:    frintx s6, s6
; CHECK-NEXT:    fcvt s3, h3
; CHECK-NEXT:    fcvtzs x12, s0
; CHECK-NEXT:    frintx s5, s5
; CHECK-NEXT:    frintx s21, s21
; CHECK-NEXT:    fmov d0, x11
; CHECK-NEXT:    stp q26, q24, [x8, #64]
; CHECK-NEXT:    fmov d24, x15
; CHECK-NEXT:    frintx s4, s4
; CHECK-NEXT:    fcvtzs x11, s22
; CHECK-NEXT:    frintx s22, s23
; CHECK-NEXT:    frintx s1, s1
; CHECK-NEXT:    fcvtzs x13, s6
; CHECK-NEXT:    frintx s3, s3
; CHECK-NEXT:    frintx s6, s7
; CHECK-NEXT:    fcvtzs x14, s5
; CHECK-NEXT:    mov v24.d[1], x12
; CHECK-NEXT:    frintx s5, s19
; CHECK-NEXT:    fcvtzs x12, s21
; CHECK-NEXT:    mov v0.d[1], x10
; CHECK-NEXT:    fcvtzs x10, s4
; CHECK-NEXT:    mov v20.d[1], x11
; CHECK-NEXT:    fcvtzs x11, s22
; CHECK-NEXT:    mov v2.d[1], x13
; CHECK-NEXT:    fcvtzs x15, s3
; CHECK-NEXT:    fcvtzs x13, s1
; CHECK-NEXT:    mov v18.d[1], x14
; CHECK-NEXT:    fcvtzs x14, s6
; CHECK-NEXT:    stp q0, q24, [x8]
; CHECK-NEXT:    mov v17.d[1], x12
; CHECK-NEXT:    fcvtzs x12, s5
; CHECK-NEXT:    fmov d0, x10
; CHECK-NEXT:    fmov d1, x11
; CHECK-NEXT:    stp q2, q20, [x8, #224]
; CHECK-NEXT:    fmov d2, x9
; CHECK-NEXT:    mov v16.d[1], x15
; CHECK-NEXT:    stp q17, q18, [x8, #160]
; CHECK-NEXT:    mov v0.d[1], x13
; CHECK-NEXT:    mov v1.d[1], x14
; CHECK-NEXT:    mov v2.d[1], x12
; CHECK-NEXT:    stp q0, q16, [x8, #96]
; CHECK-NEXT:    stp q2, q1, [x8, #32]
; CHECK-NEXT:    ret
  %a = call <32 x i64> @llvm.llrint.v32i64.v32f16(<32 x half> %x)
  ret <32 x i64> %a
}
declare <32 x i64> @llvm.llrint.v32i64.v32f16(<32 x half>)

define <1 x i64> @llrint_v1i64_v1f32(<1 x float> %x) {
; CHECK-LABEL: llrint_v1i64_v1f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-NEXT:    frintx s0, s0
; CHECK-NEXT:    fcvtzs x8, s0
; CHECK-NEXT:    fmov d0, x8
; CHECK-NEXT:    ret
  %a = call <1 x i64> @llvm.llrint.v1i64.v1f32(<1 x float> %x)
  ret <1 x i64> %a
}
declare <1 x i64> @llvm.llrint.v1i64.v1f32(<1 x float>)

define <2 x i64> @llrint_v2i64_v2f32(<2 x float> %x) {
; CHECK-LABEL: llrint_v2i64_v2f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    frintx v0.2s, v0.2s
; CHECK-NEXT:    fcvtl v0.2d, v0.2s
; CHECK-NEXT:    fcvtzs v0.2d, v0.2d
; CHECK-NEXT:    ret
  %a = call <2 x i64> @llvm.llrint.v2i64.v2f32(<2 x float> %x)
  ret <2 x i64> %a
}
declare <2 x i64> @llvm.llrint.v2i64.v2f32(<2 x float>)

define <4 x i64> @llrint_v4i64_v4f32(<4 x float> %x) {
; CHECK-LABEL: llrint_v4i64_v4f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ext v1.16b, v0.16b, v0.16b, #8
; CHECK-NEXT:    frintx v0.2s, v0.2s
; CHECK-NEXT:    frintx v1.2s, v1.2s
; CHECK-NEXT:    fcvtl v0.2d, v0.2s
; CHECK-NEXT:    fcvtl v1.2d, v1.2s
; CHECK-NEXT:    fcvtzs v0.2d, v0.2d
; CHECK-NEXT:    fcvtzs v1.2d, v1.2d
; CHECK-NEXT:    ret
  %a = call <4 x i64> @llvm.llrint.v4i64.v4f32(<4 x float> %x)
  ret <4 x i64> %a
}
declare <4 x i64> @llvm.llrint.v4i64.v4f32(<4 x float>)

define <8 x i64> @llrint_v8i64_v8f32(<8 x float> %x) {
; CHECK-LABEL: llrint_v8i64_v8f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ext v2.16b, v0.16b, v0.16b, #8
; CHECK-NEXT:    ext v3.16b, v1.16b, v1.16b, #8
; CHECK-NEXT:    frintx v0.2s, v0.2s
; CHECK-NEXT:    frintx v1.2s, v1.2s
; CHECK-NEXT:    frintx v2.2s, v2.2s
; CHECK-NEXT:    frintx v3.2s, v3.2s
; CHECK-NEXT:    fcvtl v0.2d, v0.2s
; CHECK-NEXT:    fcvtl v1.2d, v1.2s
; CHECK-NEXT:    fcvtl v4.2d, v2.2s
; CHECK-NEXT:    fcvtl v3.2d, v3.2s
; CHECK-NEXT:    fcvtzs v0.2d, v0.2d
; CHECK-NEXT:    fcvtzs v2.2d, v1.2d
; CHECK-NEXT:    fcvtzs v1.2d, v4.2d
; CHECK-NEXT:    fcvtzs v3.2d, v3.2d
; CHECK-NEXT:    ret
  %a = call <8 x i64> @llvm.llrint.v8i64.v8f32(<8 x float> %x)
  ret <8 x i64> %a
}
declare <8 x i64> @llvm.llrint.v8i64.v8f32(<8 x float>)

define <16 x i64> @llrint_v16i64_v16f32(<16 x float> %x) {
; CHECK-LABEL: llrint_v16i64_v16f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ext v4.16b, v1.16b, v1.16b, #8
; CHECK-NEXT:    ext v5.16b, v0.16b, v0.16b, #8
; CHECK-NEXT:    ext v6.16b, v2.16b, v2.16b, #8
; CHECK-NEXT:    ext v7.16b, v3.16b, v3.16b, #8
; CHECK-NEXT:    frintx v0.2s, v0.2s
; CHECK-NEXT:    frintx v1.2s, v1.2s
; CHECK-NEXT:    frintx v2.2s, v2.2s
; CHECK-NEXT:    frintx v3.2s, v3.2s
; CHECK-NEXT:    frintx v5.2s, v5.2s
; CHECK-NEXT:    frintx v4.2s, v4.2s
; CHECK-NEXT:    frintx v6.2s, v6.2s
; CHECK-NEXT:    frintx v7.2s, v7.2s
; CHECK-NEXT:    fcvtl v0.2d, v0.2s
; CHECK-NEXT:    fcvtl v1.2d, v1.2s
; CHECK-NEXT:    fcvtl v16.2d, v2.2s
; CHECK-NEXT:    fcvtl v18.2d, v3.2s
; CHECK-NEXT:    fcvtl v5.2d, v5.2s
; CHECK-NEXT:    fcvtl v17.2d, v4.2s
; CHECK-NEXT:    fcvtl v19.2d, v6.2s
; CHECK-NEXT:    fcvtl v7.2d, v7.2s
; CHECK-NEXT:    fcvtzs v0.2d, v0.2d
; CHECK-NEXT:    fcvtzs v2.2d, v1.2d
; CHECK-NEXT:    fcvtzs v4.2d, v16.2d
; CHECK-NEXT:    fcvtzs v6.2d, v18.2d
; CHECK-NEXT:    fcvtzs v1.2d, v5.2d
; CHECK-NEXT:    fcvtzs v3.2d, v17.2d
; CHECK-NEXT:    fcvtzs v5.2d, v19.2d
; CHECK-NEXT:    fcvtzs v7.2d, v7.2d
; CHECK-NEXT:    ret
  %a = call <16 x i64> @llvm.llrint.v16i64.v16f32(<16 x float> %x)
  ret <16 x i64> %a
}
declare <16 x i64> @llvm.llrint.v16i64.v16f32(<16 x float>)

define <32 x i64> @llrint_v32i64_v32f32(<32 x float> %x) {
; CHECK-LABEL: llrint_v32i64_v32f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ext v16.16b, v7.16b, v7.16b, #8
; CHECK-NEXT:    ext v17.16b, v6.16b, v6.16b, #8
; CHECK-NEXT:    frintx v7.2s, v7.2s
; CHECK-NEXT:    frintx v6.2s, v6.2s
; CHECK-NEXT:    ext v18.16b, v5.16b, v5.16b, #8
; CHECK-NEXT:    ext v21.16b, v4.16b, v4.16b, #8
; CHECK-NEXT:    ext v22.16b, v2.16b, v2.16b, #8
; CHECK-NEXT:    frintx v5.2s, v5.2s
; CHECK-NEXT:    ext v23.16b, v3.16b, v3.16b, #8
; CHECK-NEXT:    frintx v4.2s, v4.2s
; CHECK-NEXT:    ext v19.16b, v0.16b, v0.16b, #8
; CHECK-NEXT:    ext v20.16b, v1.16b, v1.16b, #8
; CHECK-NEXT:    frintx v16.2s, v16.2s
; CHECK-NEXT:    frintx v17.2s, v17.2s
; CHECK-NEXT:    fcvtl v7.2d, v7.2s
; CHECK-NEXT:    fcvtl v6.2d, v6.2s
; CHECK-NEXT:    frintx v18.2s, v18.2s
; CHECK-NEXT:    frintx v21.2s, v21.2s
; CHECK-NEXT:    frintx v2.2s, v2.2s
; CHECK-NEXT:    frintx v3.2s, v3.2s
; CHECK-NEXT:    fcvtl v5.2d, v5.2s
; CHECK-NEXT:    frintx v23.2s, v23.2s
; CHECK-NEXT:    fcvtl v4.2d, v4.2s
; CHECK-NEXT:    frintx v1.2s, v1.2s
; CHECK-NEXT:    fcvtl v16.2d, v16.2s
; CHECK-NEXT:    fcvtl v17.2d, v17.2s
; CHECK-NEXT:    fcvtzs v7.2d, v7.2d
; CHECK-NEXT:    fcvtzs v6.2d, v6.2d
; CHECK-NEXT:    fcvtl v18.2d, v18.2s
; CHECK-NEXT:    fcvtl v21.2d, v21.2s
; CHECK-NEXT:    frintx v20.2s, v20.2s
; CHECK-NEXT:    fcvtl v3.2d, v3.2s
; CHECK-NEXT:    fcvtzs v5.2d, v5.2d
; CHECK-NEXT:    frintx v0.2s, v0.2s
; CHECK-NEXT:    fcvtl v2.2d, v2.2s
; CHECK-NEXT:    fcvtzs v4.2d, v4.2d
; CHECK-NEXT:    fcvtzs v16.2d, v16.2d
; CHECK-NEXT:    fcvtzs v17.2d, v17.2d
; CHECK-NEXT:    fcvtl v1.2d, v1.2s
; CHECK-NEXT:    fcvtzs v3.2d, v3.2d
; CHECK-NEXT:    fcvtl v0.2d, v0.2s
; CHECK-NEXT:    fcvtzs v2.2d, v2.2d
; CHECK-NEXT:    stp q6, q17, [x8, #192]
; CHECK-NEXT:    fcvtl v6.2d, v23.2s
; CHECK-NEXT:    frintx v17.2s, v19.2s
; CHECK-NEXT:    stp q7, q16, [x8, #224]
; CHECK-NEXT:    frintx v7.2s, v22.2s
; CHECK-NEXT:    fcvtzs v16.2d, v18.2d
; CHECK-NEXT:    fcvtzs v18.2d, v21.2d
; CHECK-NEXT:    fcvtzs v1.2d, v1.2d
; CHECK-NEXT:    fcvtzs v0.2d, v0.2d
; CHECK-NEXT:    fcvtzs v6.2d, v6.2d
; CHECK-NEXT:    stp q5, q16, [x8, #160]
; CHECK-NEXT:    fcvtl v7.2d, v7.2s
; CHECK-NEXT:    fcvtl v5.2d, v20.2s
; CHECK-NEXT:    stp q4, q18, [x8, #128]
; CHECK-NEXT:    fcvtl v4.2d, v17.2s
; CHECK-NEXT:    stp q3, q6, [x8, #96]
; CHECK-NEXT:    fcvtzs v7.2d, v7.2d
; CHECK-NEXT:    fcvtzs v3.2d, v5.2d
; CHECK-NEXT:    stp q1, q3, [x8, #32]
; CHECK-NEXT:    stp q2, q7, [x8, #64]
; CHECK-NEXT:    fcvtzs v2.2d, v4.2d
; CHECK-NEXT:    stp q0, q2, [x8]
; CHECK-NEXT:    ret
  %a = call <32 x i64> @llvm.llrint.v32i64.v32f32(<32 x float> %x)
  ret <32 x i64> %a
}
declare <32 x i64> @llvm.llrint.v32i64.v32f32(<32 x float>)

define <1 x i64> @llrint_v1i64_v1f64(<1 x double> %x) {
; CHECK-LABEL: llrint_v1i64_v1f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    frintx d0, d0
; CHECK-NEXT:    fcvtzs x8, d0
; CHECK-NEXT:    fmov d0, x8
; CHECK-NEXT:    ret
  %a = call <1 x i64> @llvm.llrint.v1i64.v1f64(<1 x double> %x)
  ret <1 x i64> %a
}
declare <1 x i64> @llvm.llrint.v1i64.v1f64(<1 x double>)

define <2 x i64> @llrint_v2i64_v2f64(<2 x double> %x) {
; CHECK-LABEL: llrint_v2i64_v2f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    frintx v0.2d, v0.2d
; CHECK-NEXT:    fcvtzs v0.2d, v0.2d
; CHECK-NEXT:    ret
  %a = call <2 x i64> @llvm.llrint.v2i64.v2f64(<2 x double> %x)
  ret <2 x i64> %a
}
declare <2 x i64> @llvm.llrint.v2i64.v2f64(<2 x double>)

define <4 x i64> @llrint_v4i64_v4f64(<4 x double> %x) {
; CHECK-LABEL: llrint_v4i64_v4f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    frintx v0.2d, v0.2d
; CHECK-NEXT:    frintx v1.2d, v1.2d
; CHECK-NEXT:    fcvtzs v0.2d, v0.2d
; CHECK-NEXT:    fcvtzs v1.2d, v1.2d
; CHECK-NEXT:    ret
  %a = call <4 x i64> @llvm.llrint.v4i64.v4f64(<4 x double> %x)
  ret <4 x i64> %a
}
declare <4 x i64> @llvm.llrint.v4i64.v4f64(<4 x double>)

define <8 x i64> @llrint_v8i64_v8f64(<8 x double> %x) {
; CHECK-LABEL: llrint_v8i64_v8f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    frintx v0.2d, v0.2d
; CHECK-NEXT:    frintx v1.2d, v1.2d
; CHECK-NEXT:    frintx v2.2d, v2.2d
; CHECK-NEXT:    frintx v3.2d, v3.2d
; CHECK-NEXT:    fcvtzs v0.2d, v0.2d
; CHECK-NEXT:    fcvtzs v1.2d, v1.2d
; CHECK-NEXT:    fcvtzs v2.2d, v2.2d
; CHECK-NEXT:    fcvtzs v3.2d, v3.2d
; CHECK-NEXT:    ret
  %a = call <8 x i64> @llvm.llrint.v8i64.v8f64(<8 x double> %x)
  ret <8 x i64> %a
}
declare <8 x i64> @llvm.llrint.v8i64.v8f64(<8 x double>)

define <16 x i64> @llrint_v16f64(<16 x double> %x) {
; CHECK-LABEL: llrint_v16f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    frintx v0.2d, v0.2d
; CHECK-NEXT:    frintx v1.2d, v1.2d
; CHECK-NEXT:    frintx v2.2d, v2.2d
; CHECK-NEXT:    frintx v3.2d, v3.2d
; CHECK-NEXT:    frintx v4.2d, v4.2d
; CHECK-NEXT:    frintx v5.2d, v5.2d
; CHECK-NEXT:    frintx v6.2d, v6.2d
; CHECK-NEXT:    frintx v7.2d, v7.2d
; CHECK-NEXT:    fcvtzs v0.2d, v0.2d
; CHECK-NEXT:    fcvtzs v1.2d, v1.2d
; CHECK-NEXT:    fcvtzs v2.2d, v2.2d
; CHECK-NEXT:    fcvtzs v3.2d, v3.2d
; CHECK-NEXT:    fcvtzs v4.2d, v4.2d
; CHECK-NEXT:    fcvtzs v5.2d, v5.2d
; CHECK-NEXT:    fcvtzs v6.2d, v6.2d
; CHECK-NEXT:    fcvtzs v7.2d, v7.2d
; CHECK-NEXT:    ret
  %a = call <16 x i64> @llvm.llrint.v16i64.v16f64(<16 x double> %x)
  ret <16 x i64> %a
}
declare <16 x i64> @llvm.llrint.v16i64.v16f64(<16 x double>)

define <32 x i64> @llrint_v32f64(<32 x double> %x) {
; CHECK-LABEL: llrint_v32f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldp q17, q16, [sp, #96]
; CHECK-NEXT:    frintx v7.2d, v7.2d
; CHECK-NEXT:    ldp q19, q18, [sp, #64]
; CHECK-NEXT:    frintx v6.2d, v6.2d
; CHECK-NEXT:    ldp q21, q20, [sp, #32]
; CHECK-NEXT:    frintx v5.2d, v5.2d
; CHECK-NEXT:    frintx v16.2d, v16.2d
; CHECK-NEXT:    frintx v17.2d, v17.2d
; CHECK-NEXT:    frintx v4.2d, v4.2d
; CHECK-NEXT:    frintx v18.2d, v18.2d
; CHECK-NEXT:    frintx v19.2d, v19.2d
; CHECK-NEXT:    frintx v3.2d, v3.2d
; CHECK-NEXT:    ldp q23, q22, [sp]
; CHECK-NEXT:    frintx v20.2d, v20.2d
; CHECK-NEXT:    frintx v21.2d, v21.2d
; CHECK-NEXT:    frintx v2.2d, v2.2d
; CHECK-NEXT:    frintx v1.2d, v1.2d
; CHECK-NEXT:    fcvtzs v16.2d, v16.2d
; CHECK-NEXT:    fcvtzs v17.2d, v17.2d
; CHECK-NEXT:    frintx v0.2d, v0.2d
; CHECK-NEXT:    frintx v22.2d, v22.2d
; CHECK-NEXT:    fcvtzs v18.2d, v18.2d
; CHECK-NEXT:    frintx v23.2d, v23.2d
; CHECK-NEXT:    fcvtzs v19.2d, v19.2d
; CHECK-NEXT:    fcvtzs v20.2d, v20.2d
; CHECK-NEXT:    fcvtzs v7.2d, v7.2d
; CHECK-NEXT:    fcvtzs v6.2d, v6.2d
; CHECK-NEXT:    fcvtzs v5.2d, v5.2d
; CHECK-NEXT:    fcvtzs v4.2d, v4.2d
; CHECK-NEXT:    stp q17, q16, [x8, #224]
; CHECK-NEXT:    fcvtzs v16.2d, v21.2d
; CHECK-NEXT:    fcvtzs v3.2d, v3.2d
; CHECK-NEXT:    fcvtzs v17.2d, v22.2d
; CHECK-NEXT:    fcvtzs v2.2d, v2.2d
; CHECK-NEXT:    fcvtzs v1.2d, v1.2d
; CHECK-NEXT:    stp q19, q18, [x8, #192]
; CHECK-NEXT:    fcvtzs v18.2d, v23.2d
; CHECK-NEXT:    fcvtzs v0.2d, v0.2d
; CHECK-NEXT:    stp q4, q5, [x8, #64]
; CHECK-NEXT:    stp q6, q7, [x8, #96]
; CHECK-NEXT:    stp q2, q3, [x8, #32]
; CHECK-NEXT:    stp q0, q1, [x8]
; CHECK-NEXT:    stp q18, q17, [x8, #128]
; CHECK-NEXT:    stp q16, q20, [x8, #160]
; CHECK-NEXT:    ret
  %a = call <32 x i64> @llvm.llrint.v32i64.v16f64(<32 x double> %x)
  ret <32 x i64> %a
}
declare <32 x i64> @llvm.llrint.v32i64.v32f64(<32 x double>)