// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{explorer} %s 2>&1 | %{FileCheck-strict} %s
// RUN: %{explorer-trace} %s 2>&1 | %{FileCheck-allow-unmatched} %s
// AUTOUPDATE: %{explorer} %s
// CHECK:result: 1

package ExplorerTest api;

fn map[T:! Type](f: __Fn (T) -> T, tuple: (T, T)) -> (T, T) {
  return (f(tuple[0]), f(tuple[1]));
}

fn inc(x: i32) -> i32 { return x + 1; }

fn Main() -> i32 {
  return map(inc, (0, 2))[0];
}
