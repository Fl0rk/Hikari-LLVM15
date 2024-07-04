// RUN: %clang_cc1 -triple arm64-apple-ios -fsyntax-only -verify -fptrauth-intrinsics %s

#if __has_feature(ptrauth_qualifier)
#warning __ptrauth qualifier enabled!
// expected-warning@-1 {{__ptrauth qualifier enabled!}}
#endif

@interface Foo
// expected-warning@-1 {{class 'Foo' defined without specifying a base class}}
// expected-note@-2 {{add a super class to fix this problem}}

@property void *__ptrauth(1, 1, 1) invalid1;
// expected-error@-1 {{properties may not be qualified with __ptrauth; type is 'void *__ptrauth(1,1,1)'}}

@property void *__ptrauth(1, 0, 1) invalid2;
// expected-error@-1 {{properties may not be qualified with __ptrauth; type is 'void *__ptrauth(1,0,1)'}}

@property unsigned long long __ptrauth_restricted_intptr(1, 1, 1) invalid3;
// expected-error@-1 {{properties may not be qualified with __ptrauth_restricted_intptr; type is '__ptrauth_restricted_intptr(1,1,1) unsigned long long'}}

@property unsigned long long __ptrauth_restricted_intptr(1, 0, 1) invalid4;
// expected-error@-1 {{properties may not be qualified with __ptrauth_restricted_intptr; type is '__ptrauth_restricted_intptr(1,0,1) unsigned long long'}}

- (void *__ptrauth(1, 1, 1))invalid5;
// expected-error@-1 {{return types may not be qualified with __ptrauth; type is 'void *__ptrauth(1,1,1)'}}

- (void *__ptrauth(1, 0, 1))invalid6;
// expected-error@-1 {{return types may not be qualified with __ptrauth; type is 'void *__ptrauth(1,0,1)'}}

- (unsigned long long __ptrauth_restricted_intptr(1, 1, 1))invalid7;
// expected-error@-1 {{return types may not be qualified with __ptrauth_restricted_intptr; type is '__ptrauth_restricted_intptr(1,1,1) unsigned long long'}}

- (unsigned long long __ptrauth_restricted_intptr(1, 0, 1))invalid8;
// expected-error@-1 {{return types may not be qualified with __ptrauth_restricted_intptr; type is '__ptrauth_restricted_intptr(1,0,1) unsigned long long'}}

- (void)invalid9:(void *__ptrauth(1, 1, 1))a;
// expected-error@-1 {{parameter types may not be qualified with __ptrauth; type is 'void *__ptrauth(1,1,1)'}}
// expected-note@-2 {{method 'invalid9:' declared here}}

- (void)invalid10:(void *__ptrauth(1, 0, 1))a;
// expected-error@-1 {{parameter types may not be qualified with __ptrauth; type is 'void *__ptrauth(1,0,1)'}}
// expected-note@-2 {{method 'invalid10:' declared here}}

- (void)invalid11:(unsigned long long __ptrauth_restricted_intptr(1, 1, 1))a;
// expected-error@-1 {{parameter types may not be qualified with __ptrauth_restricted_intptr; type is '__ptrauth_restricted_intptr(1,1,1) unsigned long long'}}
// expected-note@-2 {{method 'invalid11:' declared here}}

- (void)invalid12:(unsigned long long __ptrauth_restricted_intptr(1, 0, 1))a;
// expected-error@-1 {{parameter types may not be qualified with __ptrauth_restricted_intptr; type is '__ptrauth_restricted_intptr(1,0,1) unsigned long long'}}
// expected-note@-2 {{method 'invalid12:' declared here}}
@end

@implementation Foo
// expected-warning@-1 4{{method definition for}}

- (void *__ptrauth(1, 1, 1))invalid13 {
// expected-error@-1 {{return types may not be qualified with __ptrauth; type is 'void *__ptrauth(1,1,1)'}}
  return 0;
}

- (void *__ptrauth(1, 0, 1))invalid14 {
// expected-error@-1 {{return types may not be qualified with __ptrauth; type is 'void *__ptrauth(1,0,1)'}}
  return 0;
}

- (unsigned long long __ptrauth_restricted_intptr(1, 1, 1))invalid15 {
// expected-error@-1 {{return types may not be qualified with __ptrauth_restricted_intptr; type is '__ptrauth_restricted_intptr(1,1,1) unsigned long long'}}
  return 0;
}

- (unsigned long long __ptrauth_restricted_intptr(1, 0, 1))invalid16 {
// expected-error@-1 {{return types may not be qualified with __ptrauth_restricted_intptr; type is '__ptrauth_restricted_intptr(1,0,1) unsigned long long'}}
  return 0;
}

- (void)invalid17:(void *__ptrauth(1, 1, 1))a {
// expected-error@-1 {{parameter types may not be qualified with __ptrauth; type is 'void *__ptrauth(1,1,1)'}}
}

- (void)invalid18:(void *__ptrauth(1, 0, 1))a {
// expected-error@-1 {{parameter types may not be qualified with __ptrauth; type is 'void *__ptrauth(1,0,1)'}}
}

- (void)invalid19:(unsigned long long __ptrauth_restricted_intptr(1, 1, 1))a {
// expected-error@-1 {{parameter types may not be qualified with __ptrauth_restricted_intptr; type is '__ptrauth_restricted_intptr(1,1,1) unsigned long long'}}
}

- (void)invalid20:(unsigned long long __ptrauth_restricted_intptr(1, 0, 1))a {
// expected-error@-1 {{parameter types may not be qualified with __ptrauth_restricted_intptr; type is '__ptrauth_restricted_intptr(1,0,1) unsigned long long'}}
}

@end