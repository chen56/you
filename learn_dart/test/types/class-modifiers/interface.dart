// ignore_for_file: unnecessary_type_check

import 'dart:core';

import 'package:checks/checks.dart';
import 'package:test/test.dart';

void main() {
  group("interface ", () {
    test("description", () {
      A a = A();
      check(a.x()).equals("x");
      AA aa = AA();
      check(aa.x()).equals("x");

    });
  });
}

interface class A {
  x() => "x";
}
 class AA extends A {
}
// implements 就得实现父类所有方法
class ImplA implements A {
  @override
  x() => throw UnimplementedError();
}
