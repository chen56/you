// ignore_for_file: unnecessary_type_check

import 'dart:core';

import 'package:test/test.dart';

void main() {
  group("范型", () {
    test('list', () {
      List<int> notNull = [1, 2];
      expect(notNull is List, true);

      List<int>? nullable = [1, 2];
      expect(nullable is List, true);

      List<int>? nullableNull;
      expect(nullableNull is! List<int>, true);
      expect(nullableNull is List<int>?, true);
    });
  });
}
