// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{not} %{explorer} %s 2>&1 | %{FileCheck-strict} %s
// RUN: %{not} %{explorer-trace} %s 2>&1 | %{FileCheck-allow-unmatched} %s
// AUTOUPDATE: %{explorer} %s

package ExplorerTest api;

fn Main() -> i32 {
  // CHECK:SYNTAX ERROR: {{.*}}/explorer/testdata/basic_syntax/fail_invalid_integer_type.carbon:[[@LINE+1]]: Invalid type literal: i11111111111111111111111111
  var x: i11111111111111111111111111 = 1;
  return 0;
}
