// ignore_for_file: unnecessary_type_check

import 'dart:core';

import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:you_note_dart/src/note/utils_core.dart';

void main() {
  group("combineNext", () {
    var x = [1, 2, 3, 4];
    test('combineNext', () {

      var combined = collections.combineNext(x);
      check(combined).deepEquals([(1, 2), (2, 3), (3, 4), (4, null)]);
    });
  });
}
