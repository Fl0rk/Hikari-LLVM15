; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 3
; RUN: llc -mtriple=aarch64-linux-gnu -mattr=+sve2p1,+bf16 < %s | FileCheck %s

declare void @llvm.aarch64.sve.st1q.scatter.scalar.offset.nxv2i64.nxv2i64(<vscale x 2 x i64>, <vscale x 1 x i1>, <vscale x 2 x i64>, i64)
declare void @llvm.aarch64.sve.st1q.scatter.scalar.offset.nxv4i32.nxv2i64(<vscale x 4 x i32>, <vscale x 1 x i1>, <vscale x 2 x i64>, i64)
declare void @llvm.aarch64.sve.st1q.scatter.scalar.offset.nxv8i16.nxv2i64(<vscale x 8 x i16>, <vscale x 1 x i1>, <vscale x 2 x i64>, i64)
declare void @llvm.aarch64.sve.st1q.scatter.scalar.offset.nxv16i8.nxv2i64(<vscale x 16 x i8>, <vscale x 1 x i1>, <vscale x 2 x i64>, i64)
declare void @llvm.aarch64.sve.st1q.scatter.scalar.offset.nxv2f64.nxv2i64(<vscale x 2 x double>, <vscale x 1 x i1>, <vscale x 2 x i64>, i64)
declare void @llvm.aarch64.sve.st1q.scatter.scalar.offset.nxv4f32.nxv2i64(<vscale x 4 x float>, <vscale x 1 x i1>, <vscale x 2 x i64>, i64)
declare void @llvm.aarch64.sve.st1q.scatter.scalar.offset.nxv8f16.nxv2i64(<vscale x 8 x half>, <vscale x 1 x i1>, <vscale x 2 x i64>, i64)
declare void @llvm.aarch64.sve.st1q.scatter.scalar.offset.nxv8bf16.nxv2i64(<vscale x 8 x bfloat>, <vscale x 1 x i1>, <vscale x 2 x i64>, i64)
declare void @llvm.aarch64.sve.st1q.scatter.index.nxv8i16(<vscale x 8 x i16>, <vscale x 1 x i1>, ptr, <vscale x 2 x i64>)
declare void @llvm.aarch64.sve.st1q.scatter.index.nxv4i32(<vscale x 4 x i32>, <vscale x 1 x i1>, ptr, <vscale x 2 x i64>)
declare void @llvm.aarch64.sve.st1q.scatter.index.nxv2i64(<vscale x 2 x i64>, <vscale x 1 x i1>, ptr, <vscale x 2 x i64>)
declare void @llvm.aarch64.sve.st1q.scatter.index.nxv8bf16(<vscale x 8 x bfloat>, <vscale x 1 x i1>, ptr, <vscale x 2 x i64>)
declare void @llvm.aarch64.sve.st1q.scatter.index.nxv8f16(<vscale x 8 x half>, <vscale x 1 x i1>, ptr, <vscale x 2 x i64>)
declare void @llvm.aarch64.sve.st1q.scatter.index.nxv4f32(<vscale x 4 x float>, <vscale x 1 x i1>, ptr, <vscale x 2 x i64>)
declare void @llvm.aarch64.sve.st1q.scatter.index.nxv2f64(<vscale x 2 x double>, <vscale x 1 x i1>, ptr, <vscale x 2 x i64>)

define void @test_svst1q_scatter_u64index_s16(<vscale x 1 x i1> %pg, ptr %base, <vscale x 2 x i64> %idx, <vscale x 8 x i16> %data) {
; CHECK-LABEL: test_svst1q_scatter_u64index_s16:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    lsl z0.d, z0.d, #1
; CHECK-NEXT:    st1q { z1.q }, p0, [z0.d, x0]
; CHECK-NEXT:    ret
entry:
  tail call void @llvm.aarch64.sve.st1q.scatter.index.nxv8i16(<vscale x 8 x i16> %data, <vscale x 1 x i1> %pg, ptr %base, <vscale x 2 x i64> %idx)
  ret void
}

define void @test_svst1q_scatter_u64index_u16(<vscale x 1 x i1> %pg, ptr %base, <vscale x 2 x i64> %idx, <vscale x 8 x i16> %data) {
; CHECK-LABEL: test_svst1q_scatter_u64index_u16:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    lsl z0.d, z0.d, #1
; CHECK-NEXT:    st1q { z1.q }, p0, [z0.d, x0]
; CHECK-NEXT:    ret
entry:
  tail call void @llvm.aarch64.sve.st1q.scatter.index.nxv8i16(<vscale x 8 x i16> %data, <vscale x 1 x i1> %pg, ptr %base, <vscale x 2 x i64> %idx)
  ret void
}

define void @test_svst1q_scatter_u64index_s32(<vscale x 1 x i1> %pg, ptr %base, <vscale x 2 x i64> %idx, <vscale x 4 x i32> %data) {
; CHECK-LABEL: test_svst1q_scatter_u64index_s32:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    lsl z0.d, z0.d, #2
; CHECK-NEXT:    st1q { z1.q }, p0, [z0.d, x0]
; CHECK-NEXT:    ret
entry:
  tail call void @llvm.aarch64.sve.st1q.scatter.index.nxv4i32(<vscale x 4 x i32> %data, <vscale x 1 x i1> %pg, ptr %base, <vscale x 2 x i64> %idx)
  ret void
}

define void @test_svst1q_scatter_u64index_u32(<vscale x 1 x i1> %pg, ptr %base, <vscale x 2 x i64> %idx, <vscale x 4 x i32> %data) {
; CHECK-LABEL: test_svst1q_scatter_u64index_u32:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    lsl z0.d, z0.d, #2
; CHECK-NEXT:    st1q { z1.q }, p0, [z0.d, x0]
; CHECK-NEXT:    ret
entry:
  tail call void @llvm.aarch64.sve.st1q.scatter.index.nxv4i32(<vscale x 4 x i32> %data, <vscale x 1 x i1> %pg, ptr %base, <vscale x 2 x i64> %idx)
  ret void
}

define void @test_svst1q_scatter_u64index_s64(<vscale x 1 x i1> %pg, ptr %base, <vscale x 2 x i64> %idx, <vscale x 2 x i64> %data) {
; CHECK-LABEL: test_svst1q_scatter_u64index_s64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    lsl z0.d, z0.d, #3
; CHECK-NEXT:    st1q { z1.q }, p0, [z0.d, x0]
; CHECK-NEXT:    ret
entry:
  tail call void @llvm.aarch64.sve.st1q.scatter.index.nxv2i64(<vscale x 2 x i64> %data, <vscale x 1 x i1> %pg, ptr %base, <vscale x 2 x i64> %idx)
  ret void
}

define void @test_svst1q_scatter_u64index_u64(<vscale x 1 x i1> %pg, ptr %base, <vscale x 2 x i64> %idx, <vscale x 2 x i64> %data) {
; CHECK-LABEL: test_svst1q_scatter_u64index_u64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    lsl z0.d, z0.d, #3
; CHECK-NEXT:    st1q { z1.q }, p0, [z0.d, x0]
; CHECK-NEXT:    ret
entry:
  tail call void @llvm.aarch64.sve.st1q.scatter.index.nxv2i64(<vscale x 2 x i64> %data, <vscale x 1 x i1> %pg, ptr %base, <vscale x 2 x i64> %idx)
  ret void
}

define void @test_svst1q_scatter_u64index_bf16(<vscale x 1 x i1> %pg, ptr %base, <vscale x 2 x i64> %idx, <vscale x 8 x bfloat> %data) {
; CHECK-LABEL: test_svst1q_scatter_u64index_bf16:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    lsl z0.d, z0.d, #1
; CHECK-NEXT:    st1q { z1.q }, p0, [z0.d, x0]
; CHECK-NEXT:    ret
entry:
  tail call void @llvm.aarch64.sve.st1q.scatter.index.nxv8bf16(<vscale x 8 x bfloat> %data, <vscale x 1 x i1> %pg, ptr %base, <vscale x 2 x i64> %idx)
  ret void
}

define void @test_svst1q_scatter_u64index_f16(<vscale x 1 x i1> %pg, ptr %base, <vscale x 2 x i64> %idx, <vscale x 8 x half> %data) {
; CHECK-LABEL: test_svst1q_scatter_u64index_f16:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    lsl z0.d, z0.d, #1
; CHECK-NEXT:    st1q { z1.q }, p0, [z0.d, x0]
; CHECK-NEXT:    ret
entry:
  tail call void @llvm.aarch64.sve.st1q.scatter.index.nxv8f16(<vscale x 8 x half> %data, <vscale x 1 x i1> %pg, ptr %base, <vscale x 2 x i64> %idx)
  ret void
}

define void @test_svst1q_scatter_u64index_f32(<vscale x 1 x i1> %pg, ptr %base, <vscale x 2 x i64> %idx, <vscale x 4 x float> %data) {
; CHECK-LABEL: test_svst1q_scatter_u64index_f32:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    lsl z0.d, z0.d, #2
; CHECK-NEXT:    st1q { z1.q }, p0, [z0.d, x0]
; CHECK-NEXT:    ret
entry:
  tail call void @llvm.aarch64.sve.st1q.scatter.index.nxv4f32(<vscale x 4 x float> %data, <vscale x 1 x i1> %pg, ptr %base, <vscale x 2 x i64> %idx)
  ret void
}

define void @test_svst1q_scatter_u64index_f64(<vscale x 1 x i1> %pg, ptr %base, <vscale x 2 x i64> %idx, <vscale x 2 x double> %data) {
; CHECK-LABEL: test_svst1q_scatter_u64index_f64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    lsl z0.d, z0.d, #3
; CHECK-NEXT:    st1q { z1.q }, p0, [z0.d, x0]
; CHECK-NEXT:    ret
entry:
  tail call void @llvm.aarch64.sve.st1q.scatter.index.nxv2f64(<vscale x 2 x double> %data, <vscale x 1 x i1> %pg, ptr %base, <vscale x 2 x i64> %idx)
  ret void
}

define void @test_svst1q_scatter_u64base_index_s16(<vscale x 1 x i1> %pg, <vscale x 2 x i64> %base, i64 %idx, <vscale x 8 x i16> %data) {
; CHECK-LABEL: test_svst1q_scatter_u64base_index_s16:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    lsl x8, x0, #1
; CHECK-NEXT:    st1q { z1.q }, p0, [z0.d, x8]
; CHECK-NEXT:    ret
entry:
  %0 = shl i64 %idx, 1
  tail call void @llvm.aarch64.sve.st1q.scatter.scalar.offset.nxv8i16.nxv2i64(<vscale x 8 x i16> %data, <vscale x 1 x i1> %pg, <vscale x 2 x i64> %base, i64 %0)
  ret void
}

define void @test_svst1q_scatter_u64base_index_u16(<vscale x 1 x i1> %pg, <vscale x 2 x i64> %base, i64 %idx, <vscale x 8 x i16> %data) {
; CHECK-LABEL: test_svst1q_scatter_u64base_index_u16:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    lsl x8, x0, #1
; CHECK-NEXT:    st1q { z1.q }, p0, [z0.d, x8]
; CHECK-NEXT:    ret
entry:
  %0 = shl i64 %idx, 1
  tail call void @llvm.aarch64.sve.st1q.scatter.scalar.offset.nxv8i16.nxv2i64(<vscale x 8 x i16> %data, <vscale x 1 x i1> %pg, <vscale x 2 x i64> %base, i64 %0)
  ret void
}

define void @test_svst1q_scatter_u64base_index_s32(<vscale x 1 x i1> %pg, <vscale x 2 x i64> %base, i64 %idx, <vscale x 4 x i32> %data) {
; CHECK-LABEL: test_svst1q_scatter_u64base_index_s32:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    lsl x8, x0, #2
; CHECK-NEXT:    st1q { z1.q }, p0, [z0.d, x8]
; CHECK-NEXT:    ret
entry:
  %0 = shl i64 %idx, 2
  tail call void @llvm.aarch64.sve.st1q.scatter.scalar.offset.nxv4i32.nxv2i64(<vscale x 4 x i32> %data, <vscale x 1 x i1> %pg, <vscale x 2 x i64> %base, i64 %0)
  ret void
}

define void @test_svst1q_scatter_u64base_index_u32(<vscale x 1 x i1> %pg, <vscale x 2 x i64> %base, i64 %idx, <vscale x 4 x i32> %data) {
; CHECK-LABEL: test_svst1q_scatter_u64base_index_u32:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    lsl x8, x0, #2
; CHECK-NEXT:    st1q { z1.q }, p0, [z0.d, x8]
; CHECK-NEXT:    ret
entry:
  %0 = shl i64 %idx, 2
  tail call void @llvm.aarch64.sve.st1q.scatter.scalar.offset.nxv4i32.nxv2i64(<vscale x 4 x i32> %data, <vscale x 1 x i1> %pg, <vscale x 2 x i64> %base, i64 %0)
  ret void
}

define void @test_svst1q_scatter_u64base_index_s64(<vscale x 1 x i1> %pg, <vscale x 2 x i64> %base, i64 %idx, <vscale x 2 x i64> %data) {
; CHECK-LABEL: test_svst1q_scatter_u64base_index_s64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    lsl x8, x0, #3
; CHECK-NEXT:    st1q { z1.q }, p0, [z0.d, x8]
; CHECK-NEXT:    ret
entry:
  %0 = shl i64 %idx, 3
  tail call void @llvm.aarch64.sve.st1q.scatter.scalar.offset.nxv2i64.nxv2i64(<vscale x 2 x i64> %data, <vscale x 1 x i1> %pg, <vscale x 2 x i64> %base, i64 %0)
  ret void
}

define void @test_svst1q_scatter_u64base_index_u64(<vscale x 1 x i1> %pg, <vscale x 2 x i64> %base, i64 %idx, <vscale x 2 x i64> %data) {
; CHECK-LABEL: test_svst1q_scatter_u64base_index_u64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    lsl x8, x0, #3
; CHECK-NEXT:    st1q { z1.q }, p0, [z0.d, x8]
; CHECK-NEXT:    ret
entry:
  %0 = shl i64 %idx, 3
  tail call void @llvm.aarch64.sve.st1q.scatter.scalar.offset.nxv2i64.nxv2i64(<vscale x 2 x i64> %data, <vscale x 1 x i1> %pg, <vscale x 2 x i64> %base, i64 %0)
  ret void
}

define void @test_svst1q_scatter_u64base_index_bf16(<vscale x 1 x i1> %pg, <vscale x 2 x i64> %base, i64 %idx, <vscale x 8 x bfloat> %data) {
; CHECK-LABEL: test_svst1q_scatter_u64base_index_bf16:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    lsl x8, x0, #1
; CHECK-NEXT:    st1q { z1.q }, p0, [z0.d, x8]
; CHECK-NEXT:    ret
entry:
  %0 = shl i64 %idx, 1
  tail call void @llvm.aarch64.sve.st1q.scatter.scalar.offset.nxv8bf16.nxv2i64(<vscale x 8 x bfloat> %data, <vscale x 1 x i1> %pg, <vscale x 2 x i64> %base, i64 %0)
  ret void
}

define void @test_svst1q_scatter_u64base_index_f16(<vscale x 1 x i1> %pg, <vscale x 2 x i64> %base, i64 %idx, <vscale x 8 x half> %data) {
; CHECK-LABEL: test_svst1q_scatter_u64base_index_f16:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    lsl x8, x0, #1
; CHECK-NEXT:    st1q { z1.q }, p0, [z0.d, x8]
; CHECK-NEXT:    ret
entry:
  %0 = shl i64 %idx, 1
  tail call void @llvm.aarch64.sve.st1q.scatter.scalar.offset.nxv8f16.nxv2i64(<vscale x 8 x half> %data, <vscale x 1 x i1> %pg, <vscale x 2 x i64> %base, i64 %0)
  ret void
}

define void @test_svst1q_scatter_u64base_index_f32(<vscale x 1 x i1> %pg, <vscale x 2 x i64> %base, i64 %idx, <vscale x 4 x float> %data) {
; CHECK-LABEL: test_svst1q_scatter_u64base_index_f32:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    lsl x8, x0, #2
; CHECK-NEXT:    st1q { z1.q }, p0, [z0.d, x8]
; CHECK-NEXT:    ret
entry:
  %0 = shl i64 %idx, 2
  tail call void @llvm.aarch64.sve.st1q.scatter.scalar.offset.nxv4f32.nxv2i64(<vscale x 4 x float> %data, <vscale x 1 x i1> %pg, <vscale x 2 x i64> %base, i64 %0)
  ret void
}

define void @test_svst1q_scatter_u64base_index_f64(<vscale x 1 x i1> %pg, <vscale x 2 x i64> %base, i64 %idx, <vscale x 2 x double> %data) {
; CHECK-LABEL: test_svst1q_scatter_u64base_index_f64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    lsl x8, x0, #3
; CHECK-NEXT:    st1q { z1.q }, p0, [z0.d, x8]
; CHECK-NEXT:    ret
entry:
  %0 = shl i64 %idx, 3
  tail call void @llvm.aarch64.sve.st1q.scatter.scalar.offset.nxv2f64.nxv2i64(<vscale x 2 x double> %data, <vscale x 1 x i1> %pg, <vscale x 2 x i64> %base, i64 %0)
  ret void
}