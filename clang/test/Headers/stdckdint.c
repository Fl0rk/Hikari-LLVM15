// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py UTC_ARGS: --version 3
// RUN: %clang_cc1 -triple=x86_64 -emit-llvm -verify -std=c99 %s -o - | FileCheck %s
// RUN: %clang_cc1 -triple=x86_64 -emit-llvm -verify -std=c11 %s -o - | FileCheck %s
// RUN: %clang_cc1 -triple=x86_64 -emit-llvm -verify -std=c17 %s -o - | FileCheck %s
// RUN: %clang_cc1 -triple=x86_64 -emit-llvm -verify -std=c23 %s -o - | FileCheck %s

// expected-no-diagnostics

#include <stdbool.h>
#include <stdckdint.h>

// CHECK-LABEL: define dso_local zeroext i1 @test_ckd_add(
// CHECK-SAME: ) #[[ATTR0:[0-9]+]] {
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[RESULT:%.*]] = alloca i32, align 4
// CHECK-NEXT:    [[TMP0:%.*]] = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 -1073741826, i32 -1073741826)
// CHECK-NEXT:    [[TMP1:%.*]] = extractvalue { i32, i1 } [[TMP0]], 1
// CHECK-NEXT:    [[TMP2:%.*]] = extractvalue { i32, i1 } [[TMP0]], 0
// CHECK-NEXT:    store i32 [[TMP2]], ptr [[RESULT]], align 4
// CHECK-NEXT:    ret i1 [[TMP1]]
//
bool test_ckd_add() {
  int result;
  return ckd_add(&result, -1073741826, -1073741826);
}

// CHECK-LABEL: define dso_local zeroext i1 @test_ckd_sub(
// CHECK-SAME: ) #[[ATTR0]] {
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[RESULT:%.*]] = alloca i32, align 4
// CHECK-NEXT:    [[TMP0:%.*]] = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 -1073741826, i32 1073741826)
// CHECK-NEXT:    [[TMP1:%.*]] = extractvalue { i32, i1 } [[TMP0]], 1
// CHECK-NEXT:    [[TMP2:%.*]] = extractvalue { i32, i1 } [[TMP0]], 0
// CHECK-NEXT:    store i32 [[TMP2]], ptr [[RESULT]], align 4
// CHECK-NEXT:    ret i1 [[TMP1]]
//
bool test_ckd_sub() {
  int result;
  return ckd_sub(&result, -1073741826, 1073741826);
}

// CHECK-LABEL: define dso_local zeroext i1 @test_ckd_mul(
// CHECK-SAME: ) #[[ATTR0]] {
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[RESULT:%.*]] = alloca i32, align 4
// CHECK-NEXT:    [[TMP0:%.*]] = call { i32, i1 } @llvm.smul.with.overflow.i32(i32 -1073741826, i32 2)
// CHECK-NEXT:    [[TMP1:%.*]] = extractvalue { i32, i1 } [[TMP0]], 1
// CHECK-NEXT:    [[TMP2:%.*]] = extractvalue { i32, i1 } [[TMP0]], 0
// CHECK-NEXT:    store i32 [[TMP2]], ptr [[RESULT]], align 4
// CHECK-NEXT:    ret i1 [[TMP1]]
//
bool test_ckd_mul() {
  int result;
  return ckd_mul(&result, -1073741826, 2);
}