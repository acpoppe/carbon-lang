// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{explorer} %s 2>&1 | %{FileCheck-strict} %s
// RUN: %{explorer-trace} %s 2>&1 | %{FileCheck-allow-unmatched} %s
// AUTOUPDATE: %{explorer} %s
// CHECK:result: 0

package ExplorerTest api;

fn Main() -> i32 {
  var t: auto = (5, 2);
  match (t) {
    case (a: auto, b: auto) => {
      return a + b - 7;
    }
  }
  return 1;
}
