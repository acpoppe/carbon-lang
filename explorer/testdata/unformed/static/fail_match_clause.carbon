// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{not} %{explorer} %s 2>&1 | %{FileCheck-strict} %s
// RUN: %{not} %{explorer-trace} %s 2>&1 | %{FileCheck-allow-unmatched} %s
// AUTOUPDATE: %{explorer} %s

package ExplorerTest api;

fn Foo() -> i32;

fn Main() -> i32 {
  var x : i32;
  match (Foo()) {
    case 0 => {
      return 2;
    }
    case 1 => {
      // CHECK:COMPILATION ERROR: {{.*}}/explorer/testdata/unformed/static/fail_match_clause.carbon:[[@LINE+1]]: use of uninitialized variable x
      return x;
    }
    default => {
      return 0;
    }
  }
}
