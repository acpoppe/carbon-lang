// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{not} %{explorer} %s 2>&1 | %{FileCheck-strict} %s
// RUN: %{not} %{explorer-trace} %s 2>&1 | %{FileCheck-allow-unmatched} %s
// AUTOUPDATE: %{explorer} %s

package ExplorerTest api;

class Foo {
  var x: i32;
  // CHECK:COMPILATION ERROR: {{.*}}/explorer/testdata/name_lookup/fail_class_duplicate.carbon:[[@LINE+1]]: Duplicate name `x` also found at {{.*}}/explorer/testdata/name_lookup/fail_class_duplicate.carbon:12
  var x: i32;
}

fn Main() -> i32 {
  return 0;
}
