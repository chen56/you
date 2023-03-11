// ignore_for_file: unnecessary_type_check

import 'dart:core';

import 'package:test/test.dart';

void main() {
  test('list.split', () {
    expect(["1"].sublist(0, 1), ["1"]);
    expect(["1"].sublist(0, 0), []);
    expect(() => ["1"].sublist(0, 2), throwsA(isA<RangeError>()));
  });

  List<String> list;
}
