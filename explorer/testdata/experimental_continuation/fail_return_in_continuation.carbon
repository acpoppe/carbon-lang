// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{not} %{explorer} %s 2>&1 | %{FileCheck-strict} %s
// RUN: %{not} %{explorer-trace} %s 2>&1 | %{FileCheck-allow-unmatched} %s
// AUTOUPDATE: %{explorer} %s

package ExplorerTest api;

fn Main() -> i32 {
  var x: i32 = 0;
  __continuation k {
    x = x + 1;
    // CHECK:COMPILATION ERROR: {{.*}}/explorer/testdata/experimental_continuation/fail_return_in_continuation.carbon:[[@LINE+1]]: return is not within a function body
    return x;
  }
}
