// ignore_for_file: unnecessary_type_check

import 'dart:core';

import 'package:test/test.dart';

void main() {
  group("base ", () {
    test("description", () {});
  });
}

base mixin BaseMixin {}
base class BaseClass {}

// base具有传播性，父类base，子类也必须base
base class AA with BaseMixin {}

// base具有传播性，父类base，子类也必须base
base class ImplA implements BaseMixin {}
