; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -verify-machineinstrs -mtriple=powerpc64le-unknown-linux-gnu \
; RUN:   -mcpu=pwr8 < %s | FileCheck %s
; RUN: llc -verify-machineinstrs -mtriple=powerpc64le-unknown-linux-gnu \
; RUN:   -mcpu=pwr9 -mattr -vsx < %s | FileCheck %s --check-prefix=CHECK-NO-VSX
; RUN: llc -verify-machineinstrs -mtriple=powerpc64le-unknown-linux-gnu \
; RUN:   -mcpu=pwr9 < %s | FileCheck %s
; RUN: llc -verify-machineinstrs -mtriple=powerpc64-unknown-linux-gnu \
; RUN:   -mcpu=pwr7 < %s | FileCheck %s --check-prefix=CHECK-NO-VSX
; RUN: llc -verify-machineinstrs -mtriple=powerpc-unknown-aix \
; RUN:   -mcpu=pwr7 < %s | FileCheck %s --check-prefix=CHECK-32BIT
; RUN: llc -verify-machineinstrs -mtriple=powerpc64-unknown-aix \
; RUN:   -mcpu=pwr8 < %s | FileCheck %s

declare void @llvm.ppc.stfiw(ptr, double)
define dso_local void @test_stfiw(ptr %cia, double %da) {
; CHECK-LABEL: test_stfiw:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    stxsiwx 1, 0, 3
; CHECK-NEXT:    blr
;
; CHECK-NO-VSX-LABEL: test_stfiw:
; CHECK-NO-VSX:       # %bb.0: # %entry
; CHECK-NO-VSX-NEXT:    stfiwx 1, 0, 3
; CHECK-NO-VSX-NEXT:    blr
;
; CHECK-32BIT-LABEL: test_stfiw:
; CHECK-32BIT:       # %bb.0: # %entry
; CHECK-32BIT-NEXT:    stfiwx 1, 0, 3
; CHECK-32BIT-NEXT:    blr
entry:
  tail call void @llvm.ppc.stfiw(ptr %cia, double %da)
  ret void
}

define dso_local void @test_xl_stfiw(ptr %cia, double %da) {
; CHECK-LABEL: test_xl_stfiw:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    stxsiwx 1, 0, 3
; CHECK-NEXT:    blr
;
; CHECK-NO-VSX-LABEL: test_xl_stfiw:
; CHECK-NO-VSX:       # %bb.0: # %entry
; CHECK-NO-VSX-NEXT:    stfiwx 1, 0, 3
; CHECK-NO-VSX-NEXT:    blr
;
; CHECK-32BIT-LABEL: test_xl_stfiw:
; CHECK-32BIT:       # %bb.0: # %entry
; CHECK-32BIT-NEXT:    stfiwx 1, 0, 3
; CHECK-32BIT-NEXT:    blr
entry:
  tail call void @llvm.ppc.stfiw(ptr %cia, double %da)
  ret void
}