// ignore_for_file: unnecessary_type_check

import 'package:learn_flutter/note/@common/types.dart';
import 'package:test/test.dart';

void main() {
  test('common.types isSubtype 子类型判断', () {
    expect(isSubtype<num, int>(), isTrue);
    expect(isSubtype<num, String>(), isFalse);
  });

  test('common.types isNullable 判断', () {
    expect(isNullable<int>(), isFalse);
    expect(isNullable<int?>(), isTrue);

    expect(null is List<int>, isFalse);
    expect(null is List<int?>, isFalse);

    expect(null is int, isFalse);
    expect(null is int?, isTrue);
  });
}
