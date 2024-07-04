// RUN: %clang_cc1 -fblocks -triple arm64-apple-ios -fptrauth-calls -fptrauth-intrinsics -verify %s

#if __has_feature(ptrauth_objc_signable_class)
@class TestClass;
typedef TestClass *ClassPtr;
typedef void(^BlockPtr)();
@interface TestClass {
@public
  __ptrauth(2, 1, 1) Class a;
  __ptrauth(2, 1, 3) volatile Class vi;
  __ptrauth(2, 1, 3) const Class ci;
  __ptrauth(2, 1, 1) id b;
  // expected-error@-1 {{__ptrauth qualifier may only be applied to pointer types; type here is 'id'}}
  __ptrauth(2, 1, 2) ClassPtr c;
  // expected-error@-1 {{__ptrauth qualifier may only be applied to pointer types; type here is 'ClassPtr' (aka 'TestClass *')}}
  __ptrauth(2, 1, 2) BlockPtr d;
  // expected-error@-1 {{__ptrauth qualifier may only be applied to pointer types; type here is 'BlockPtr' (aka 'void (^)()')}}
}

struct TestStruct {
  __ptrauth(2, 1, 3) Class e;
  __ptrauth(2, 1, 3) volatile Class vi;
  __ptrauth(2, 1, 3) const Class ci;
  __ptrauth(2, 1, 4) id f;
  // expected-error@-1 {{__ptrauth qualifier may only be applied to pointer types; type here is 'id'}}
  __ptrauth(2, 1, 5) ClassPtr g;
  // expected-error@-1 {{__ptrauth qualifier may only be applied to pointer types; type here is 'ClassPtr' (aka 'TestClass *')}}
  __ptrauth(2, 1, 2) BlockPtr h;
  // expected-error@-1 {{__ptrauth qualifier may only be applied to pointer types; type here is 'BlockPtr' (aka 'void (^)()')}}
};

@end

void foo() {
  __ptrauth(2, 1, 3) Class i;
  __ptrauth(2, 1, 3) volatile Class vi;
  __ptrauth(2, 1, 3) const Class ci;
  __ptrauth(2, 1, 4) id j;
  // expected-error@-1 {{__ptrauth qualifier may only be applied to pointer types; type here is 'id'}}
  __ptrauth(2, 1, 5) ClassPtr k;
  // expected-error@-1 {{__ptrauth qualifier may only be applied to pointer types; type here is 'ClassPtr' (aka 'TestClass *')}}
  __ptrauth(2, 1, 2) BlockPtr l;
  // expected-error@-1 {{__ptrauth qualifier may only be applied to pointer types; type here is 'BlockPtr' (aka 'void (^)()')}}
}

#endif