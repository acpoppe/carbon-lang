// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{not} %{explorer} %s 2>&1 | %{FileCheck-strict} %s
// RUN: %{not} %{explorer-trace} %s 2>&1 | %{FileCheck-allow-unmatched} %s
// AUTOUPDATE: %{explorer} %s

package ExplorerTest api;

abstract class C {
  fn F() {}
// CHECK:COMPILATION ERROR: {{.*}}/explorer/testdata/class/fail_abstract_class.carbon:[[@LINE+1]]: Class prefixes `base` and `abstract` are not supported yet
}

fn Main() -> i32 {
  return 0;
}
