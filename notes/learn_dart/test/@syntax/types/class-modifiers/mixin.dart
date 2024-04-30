// ignore_for_file: unnecessary_type_check

import 'dart:core';

import 'package:test/test.dart';

void main() {
  group("base ", () {
    test("description", () {});
  });
}

mixin A {
  x() => "x";
}

// base具有传播性，父类base，子类也必须base
class AA with A {}

// base具有传播性，父类base，子类也必须base
class ImplA implements A {
  @override
  x() => throw UnimplementedError();
}
