// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py UTC_ARGS: --function-signature --include-generated-funcs --replace-value-regex "__omp_offloading_[0-9a-z]+_[0-9a-z]+" "reduction_size[.].+[.]" "pl_cond[.].+[.|,]" --prefix-filecheck-ir-name _
// Test target codegen - host bc file has to be created first.
// RUN: %clang_cc1 -verify -fopenmp -fopenmp-cuda-mode -x c++ -triple powerpc64le-unknown-unknown -fopenmp-targets=nvptx64-nvidia-cuda -emit-llvm-bc %s -o %t-ppc-host.bc
// RUN: %clang_cc1 -verify -fopenmp -fopenmp-cuda-mode -x c++ -triple nvptx64-unknown-unknown -fopenmp-targets=nvptx64-nvidia-cuda -emit-llvm %s -fopenmp-is-target-device -fopenmp-host-ir-file-path %t-ppc-host.bc -o - -disable-llvm-optzns | FileCheck %s --check-prefix=CHECK1
// RUN: %clang_cc1 -verify -fopenmp -fopenmp-cuda-mode -x c++ -triple i386-unknown-unknown -fopenmp-targets=nvptx-nvidia-cuda -emit-llvm-bc %s -o %t-x86-host.bc
// RUN: %clang_cc1 -verify -fopenmp -fopenmp-cuda-mode -x c++ -triple nvptx-unknown-unknown -fopenmp-targets=nvptx-nvidia-cuda -emit-llvm %s -fopenmp-is-target-device -fopenmp-host-ir-file-path %t-x86-host.bc -o - -disable-llvm-optzns | FileCheck %s --check-prefix=CHECK2
// RUN: %clang_cc1 -verify -fopenmp -fopenmp-cuda-mode -fexceptions -fcxx-exceptions -x c++ -triple nvptx-unknown-unknown -fopenmp-targets=nvptx-nvidia-cuda -emit-llvm %s -fopenmp-is-target-device -fopenmp-host-ir-file-path %t-x86-host.bc -o - -disable-llvm-optzns | FileCheck %s --check-prefix=CHECK2

// expected-no-diagnostics
#ifndef HEADER
#define HEADER

void work();

void use() {
      #pragma omp parallel
      work();
}

int main() {
      #pragma omp target parallel
      {  use(); }
        #pragma omp target
        {  use(); }
}

#endif
// CHECK1-LABEL: define {{[^@]+}}@{{__omp_offloading_[0-9a-z]+_[0-9a-z]+}}_main_l21
// CHECK1-SAME: (ptr noalias noundef [[DYN_PTR:%.*]]) #[[ATTR0:[0-9]+]] {
// CHECK1-NEXT:  entry:
// CHECK1-NEXT:    [[DYN_PTR_ADDR:%.*]] = alloca ptr, align 8
// CHECK1-NEXT:    [[CAPTURED_VARS_ADDRS:%.*]] = alloca [0 x ptr], align 8
// CHECK1-NEXT:    store ptr [[DYN_PTR]], ptr [[DYN_PTR_ADDR]], align 8
// CHECK1-NEXT:    [[TMP0:%.*]] = call i32 @__kmpc_target_init(ptr @{{__omp_offloading_[0-9a-z]+_[0-9a-z]+}}_main_l21_kernel_environment, ptr [[DYN_PTR]])
// CHECK1-NEXT:    [[EXEC_USER_CODE:%.*]] = icmp eq i32 [[TMP0]], -1
// CHECK1-NEXT:    br i1 [[EXEC_USER_CODE]], label [[USER_CODE_ENTRY:%.*]], label [[WORKER_EXIT:%.*]]
// CHECK1:       user_code.entry:
// CHECK1-NEXT:    [[TMP1:%.*]] = call i32 @__kmpc_global_thread_num(ptr @[[GLOB1:[0-9]+]])
// CHECK1-NEXT:    call void @__kmpc_parallel_51(ptr @[[GLOB1]], i32 [[TMP1]], i32 1, i32 -1, i32 -1, ptr @{{__omp_offloading_[0-9a-z]+_[0-9a-z]+}}_main_l21_omp_outlined, ptr null, ptr [[CAPTURED_VARS_ADDRS]], i64 0)
// CHECK1-NEXT:    call void @__kmpc_target_deinit()
// CHECK1-NEXT:    ret void
// CHECK1:       worker.exit:
// CHECK1-NEXT:    ret void
//
//
// CHECK1-LABEL: define {{[^@]+}}@{{__omp_offloading_[0-9a-z]+_[0-9a-z]+}}_main_l21_omp_outlined
// CHECK1-SAME: (ptr noalias noundef [[DOTGLOBAL_TID_:%.*]], ptr noalias noundef [[DOTBOUND_TID_:%.*]]) #[[ATTR1:[0-9]+]] {
// CHECK1-NEXT:  entry:
// CHECK1-NEXT:    [[DOTGLOBAL_TID__ADDR:%.*]] = alloca ptr, align 8
// CHECK1-NEXT:    [[DOTBOUND_TID__ADDR:%.*]] = alloca ptr, align 8
// CHECK1-NEXT:    store ptr [[DOTGLOBAL_TID_]], ptr [[DOTGLOBAL_TID__ADDR]], align 8
// CHECK1-NEXT:    store ptr [[DOTBOUND_TID_]], ptr [[DOTBOUND_TID__ADDR]], align 8
// CHECK1-NEXT:    call void @_Z3usev() #[[ATTR8:[0-9]+]]
// CHECK1-NEXT:    ret void
//
//
// CHECK1-LABEL: define {{[^@]+}}@_Z3usev
// CHECK1-SAME: () #[[ATTR2:[0-9]+]] {
// CHECK1-NEXT:  entry:
// CHECK1-NEXT:    [[CAPTURED_VARS_ADDRS:%.*]] = alloca [0 x ptr], align 8
// CHECK1-NEXT:    [[TMP0:%.*]] = call i32 @__kmpc_global_thread_num(ptr @[[GLOB1]])
// CHECK1-NEXT:    call void @__kmpc_parallel_51(ptr @[[GLOB1]], i32 [[TMP0]], i32 1, i32 -1, i32 -1, ptr @_Z3usev_omp_outlined, ptr @_Z3usev_omp_outlined_wrapper, ptr [[CAPTURED_VARS_ADDRS]], i64 0)
// CHECK1-NEXT:    ret void
//
//
// CHECK1-LABEL: define {{[^@]+}}@{{__omp_offloading_[0-9a-z]+_[0-9a-z]+}}_main_l23
// CHECK1-SAME: (ptr noalias noundef [[DYN_PTR:%.*]]) #[[ATTR5:[0-9]+]] {
// CHECK1-NEXT:  entry:
// CHECK1-NEXT:    [[DYN_PTR_ADDR:%.*]] = alloca ptr, align 8
// CHECK1-NEXT:    store ptr [[DYN_PTR]], ptr [[DYN_PTR_ADDR]], align 8
// CHECK1-NEXT:    [[TMP0:%.*]] = call i32 @__kmpc_target_init(ptr @{{__omp_offloading_[0-9a-z]+_[0-9a-z]+}}_main_l23_kernel_environment, ptr [[DYN_PTR]])
// CHECK1-NEXT:    [[EXEC_USER_CODE:%.*]] = icmp eq i32 [[TMP0]], -1
// CHECK1-NEXT:    br i1 [[EXEC_USER_CODE]], label [[USER_CODE_ENTRY:%.*]], label [[WORKER_EXIT:%.*]]
// CHECK1:       user_code.entry:
// CHECK1-NEXT:    call void @_Z3usev() #[[ATTR8]]
// CHECK1-NEXT:    call void @__kmpc_target_deinit()
// CHECK1-NEXT:    ret void
// CHECK1:       worker.exit:
// CHECK1-NEXT:    ret void
//
//
// CHECK1-LABEL: define {{[^@]+}}@_Z3usev_omp_outlined
// CHECK1-SAME: (ptr noalias noundef [[DOTGLOBAL_TID_:%.*]], ptr noalias noundef [[DOTBOUND_TID_:%.*]]) #[[ATTR1]] {
// CHECK1-NEXT:  entry:
// CHECK1-NEXT:    [[DOTGLOBAL_TID__ADDR:%.*]] = alloca ptr, align 8
// CHECK1-NEXT:    [[DOTBOUND_TID__ADDR:%.*]] = alloca ptr, align 8
// CHECK1-NEXT:    store ptr [[DOTGLOBAL_TID_]], ptr [[DOTGLOBAL_TID__ADDR]], align 8
// CHECK1-NEXT:    store ptr [[DOTBOUND_TID_]], ptr [[DOTBOUND_TID__ADDR]], align 8
// CHECK1-NEXT:    call void @_Z4workv() #[[ATTR8]]
// CHECK1-NEXT:    ret void
//
//
// CHECK1-LABEL: define {{[^@]+}}@_Z3usev_omp_outlined_wrapper
// CHECK1-SAME: (i16 noundef zeroext [[TMP0:%.*]], i32 noundef [[TMP1:%.*]]) #[[ATTR7:[0-9]+]] {
// CHECK1-NEXT:  entry:
// CHECK1-NEXT:    [[DOTADDR:%.*]] = alloca i16, align 2
// CHECK1-NEXT:    [[DOTADDR1:%.*]] = alloca i32, align 4
// CHECK1-NEXT:    [[DOTZERO_ADDR:%.*]] = alloca i32, align 4
// CHECK1-NEXT:    [[GLOBAL_ARGS:%.*]] = alloca ptr, align 8
// CHECK1-NEXT:    store i16 [[TMP0]], ptr [[DOTADDR]], align 2
// CHECK1-NEXT:    store i32 [[TMP1]], ptr [[DOTADDR1]], align 4
// CHECK1-NEXT:    store i32 0, ptr [[DOTZERO_ADDR]], align 4
// CHECK1-NEXT:    call void @__kmpc_get_shared_variables(ptr [[GLOBAL_ARGS]])
// CHECK1-NEXT:    call void @_Z3usev_omp_outlined(ptr [[DOTADDR1]], ptr [[DOTZERO_ADDR]]) #[[ATTR3:[0-9]+]]
// CHECK1-NEXT:    ret void
//
//
// CHECK2-LABEL: define {{[^@]+}}@{{__omp_offloading_[0-9a-z]+_[0-9a-z]+}}_main_l21
// CHECK2-SAME: (ptr noalias noundef [[DYN_PTR:%.*]]) #[[ATTR0:[0-9]+]] {
// CHECK2-NEXT:  entry:
// CHECK2-NEXT:    [[DYN_PTR_ADDR:%.*]] = alloca ptr, align 4
// CHECK2-NEXT:    [[CAPTURED_VARS_ADDRS:%.*]] = alloca [0 x ptr], align 4
// CHECK2-NEXT:    store ptr [[DYN_PTR]], ptr [[DYN_PTR_ADDR]], align 4
// CHECK2-NEXT:    [[TMP0:%.*]] = call i32 @__kmpc_target_init(ptr @{{__omp_offloading_[0-9a-z]+_[0-9a-z]+}}_main_l21_kernel_environment, ptr [[DYN_PTR]])
// CHECK2-NEXT:    [[EXEC_USER_CODE:%.*]] = icmp eq i32 [[TMP0]], -1
// CHECK2-NEXT:    br i1 [[EXEC_USER_CODE]], label [[USER_CODE_ENTRY:%.*]], label [[WORKER_EXIT:%.*]]
// CHECK2:       user_code.entry:
// CHECK2-NEXT:    [[TMP1:%.*]] = call i32 @__kmpc_global_thread_num(ptr @[[GLOB1:[0-9]+]])
// CHECK2-NEXT:    call void @__kmpc_parallel_51(ptr @[[GLOB1]], i32 [[TMP1]], i32 1, i32 -1, i32 -1, ptr @{{__omp_offloading_[0-9a-z]+_[0-9a-z]+}}_main_l21_omp_outlined, ptr null, ptr [[CAPTURED_VARS_ADDRS]], i32 0)
// CHECK2-NEXT:    call void @__kmpc_target_deinit()
// CHECK2-NEXT:    ret void
// CHECK2:       worker.exit:
// CHECK2-NEXT:    ret void
//
//
// CHECK2-LABEL: define {{[^@]+}}@{{__omp_offloading_[0-9a-z]+_[0-9a-z]+}}_main_l21_omp_outlined
// CHECK2-SAME: (ptr noalias noundef [[DOTGLOBAL_TID_:%.*]], ptr noalias noundef [[DOTBOUND_TID_:%.*]]) #[[ATTR1:[0-9]+]] {
// CHECK2-NEXT:  entry:
// CHECK2-NEXT:    [[DOTGLOBAL_TID__ADDR:%.*]] = alloca ptr, align 4
// CHECK2-NEXT:    [[DOTBOUND_TID__ADDR:%.*]] = alloca ptr, align 4
// CHECK2-NEXT:    store ptr [[DOTGLOBAL_TID_]], ptr [[DOTGLOBAL_TID__ADDR]], align 4
// CHECK2-NEXT:    store ptr [[DOTBOUND_TID_]], ptr [[DOTBOUND_TID__ADDR]], align 4
// CHECK2-NEXT:    call void @_Z3usev() #[[ATTR8:[0-9]+]]
// CHECK2-NEXT:    ret void
//
//
// CHECK2-LABEL: define {{[^@]+}}@_Z3usev
// CHECK2-SAME: () #[[ATTR2:[0-9]+]] {
// CHECK2-NEXT:  entry:
// CHECK2-NEXT:    [[CAPTURED_VARS_ADDRS:%.*]] = alloca [0 x ptr], align 4
// CHECK2-NEXT:    [[TMP0:%.*]] = call i32 @__kmpc_global_thread_num(ptr @[[GLOB1]])
// CHECK2-NEXT:    call void @__kmpc_parallel_51(ptr @[[GLOB1]], i32 [[TMP0]], i32 1, i32 -1, i32 -1, ptr @_Z3usev_omp_outlined, ptr @_Z3usev_omp_outlined_wrapper, ptr [[CAPTURED_VARS_ADDRS]], i32 0)
// CHECK2-NEXT:    ret void
//
//
// CHECK2-LABEL: define {{[^@]+}}@{{__omp_offloading_[0-9a-z]+_[0-9a-z]+}}_main_l23
// CHECK2-SAME: (ptr noalias noundef [[DYN_PTR:%.*]]) #[[ATTR5:[0-9]+]] {
// CHECK2-NEXT:  entry:
// CHECK2-NEXT:    [[DYN_PTR_ADDR:%.*]] = alloca ptr, align 4
// CHECK2-NEXT:    store ptr [[DYN_PTR]], ptr [[DYN_PTR_ADDR]], align 4
// CHECK2-NEXT:    [[TMP0:%.*]] = call i32 @__kmpc_target_init(ptr @{{__omp_offloading_[0-9a-z]+_[0-9a-z]+}}_main_l23_kernel_environment, ptr [[DYN_PTR]])
// CHECK2-NEXT:    [[EXEC_USER_CODE:%.*]] = icmp eq i32 [[TMP0]], -1
// CHECK2-NEXT:    br i1 [[EXEC_USER_CODE]], label [[USER_CODE_ENTRY:%.*]], label [[WORKER_EXIT:%.*]]
// CHECK2:       user_code.entry:
// CHECK2-NEXT:    call void @_Z3usev() #[[ATTR8]]
// CHECK2-NEXT:    call void @__kmpc_target_deinit()
// CHECK2-NEXT:    ret void
// CHECK2:       worker.exit:
// CHECK2-NEXT:    ret void
//
//
// CHECK2-LABEL: define {{[^@]+}}@_Z3usev_omp_outlined
// CHECK2-SAME: (ptr noalias noundef [[DOTGLOBAL_TID_:%.*]], ptr noalias noundef [[DOTBOUND_TID_:%.*]]) #[[ATTR1]] {
// CHECK2-NEXT:  entry:
// CHECK2-NEXT:    [[DOTGLOBAL_TID__ADDR:%.*]] = alloca ptr, align 4
// CHECK2-NEXT:    [[DOTBOUND_TID__ADDR:%.*]] = alloca ptr, align 4
// CHECK2-NEXT:    store ptr [[DOTGLOBAL_TID_]], ptr [[DOTGLOBAL_TID__ADDR]], align 4
// CHECK2-NEXT:    store ptr [[DOTBOUND_TID_]], ptr [[DOTBOUND_TID__ADDR]], align 4
// CHECK2-NEXT:    call void @_Z4workv() #[[ATTR8]]
// CHECK2-NEXT:    ret void
//
//
// CHECK2-LABEL: define {{[^@]+}}@_Z3usev_omp_outlined_wrapper
// CHECK2-SAME: (i16 noundef zeroext [[TMP0:%.*]], i32 noundef [[TMP1:%.*]]) #[[ATTR7:[0-9]+]] {
// CHECK2-NEXT:  entry:
// CHECK2-NEXT:    [[DOTADDR:%.*]] = alloca i16, align 2
// CHECK2-NEXT:    [[DOTADDR1:%.*]] = alloca i32, align 4
// CHECK2-NEXT:    [[DOTZERO_ADDR:%.*]] = alloca i32, align 4
// CHECK2-NEXT:    [[GLOBAL_ARGS:%.*]] = alloca ptr, align 4
// CHECK2-NEXT:    store i16 [[TMP0]], ptr [[DOTADDR]], align 2
// CHECK2-NEXT:    store i32 [[TMP1]], ptr [[DOTADDR1]], align 4
// CHECK2-NEXT:    store i32 0, ptr [[DOTZERO_ADDR]], align 4
// CHECK2-NEXT:    call void @__kmpc_get_shared_variables(ptr [[GLOBAL_ARGS]])
// CHECK2-NEXT:    call void @_Z3usev_omp_outlined(ptr [[DOTADDR1]], ptr [[DOTZERO_ADDR]]) #[[ATTR3:[0-9]+]]
// CHECK2-NEXT:    ret void
//