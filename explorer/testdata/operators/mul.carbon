// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{explorer} %s 2>&1 | %{FileCheck-strict} %s
// RUN: %{explorer-trace} %s 2>&1 | %{FileCheck-allow-unmatched} %s
// AUTOUPDATE: %{explorer} %s
// CHECK:result: 10

package ExplorerTest api;

class A { var n: i32; }

external impl A as MulWith(i32) where .Result == A {
  fn Op[me: Self](rhs: i32) -> A { return {.n = me.n * rhs}; }
}

fn Main() -> i32 {
  var a: A = {.n = 5};
  a = a * 2;
  return a.n;
}
