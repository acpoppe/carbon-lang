// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{explorer} %s 2>&1 | %{FileCheck-strict} %s
// RUN: %{explorer-trace} %s 2>&1 | %{FileCheck-allow-unmatched} %s
// AUTOUPDATE: %{explorer} %s
// CHECK:result: 3

package Foo api;
interface A {
  fn F[me: Self](o: Self) -> Self;
}
class X {
  impl as A {
    fn F[me: Self](o: Self) -> Self { return {.n = me.n + o.n}; }
  }
  var n: i32;
}
fn F[T:! A](v: T, w: T) -> T {
  return v.(T.F)(w);
}
fn Main() -> i32 {
  var v: X = {.n = 1};
  var w: X = {.n = 2};
  return F(v, w).n;
}
