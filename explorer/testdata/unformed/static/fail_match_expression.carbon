// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{not} %{explorer} %s 2>&1 | %{FileCheck-strict} %s
// RUN: %{not} %{explorer-trace} %s 2>&1 | %{FileCheck-allow-unmatched} %s
// AUTOUPDATE: %{explorer} %s

package ExplorerTest api;

fn Main() -> i32 {
  var x : i32;
  // CHECK:COMPILATION ERROR: {{.*}}/explorer/testdata/unformed/static/fail_match_expression.carbon:[[@LINE+1]]: use of uninitialized variable x
  match (x) {
    case 0 => {
      return 1;
    }
    default => {
      return 0;
    }
  }
}
