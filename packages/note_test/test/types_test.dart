import 'package:note/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("isType", () {
    test('主要场景：super is not null', () {
      expect(isType<num, num>(), isTrue);
      expect(isType<num?, num>(), isTrue);

      expect(isType<int, num>(), isTrue);
      expect(isType<int?, num>(), isTrue);

      expect(isType<double, num>(), isTrue);
      expect(isType<double?, num>(), isTrue);

      expect(!isType<String, num>(), isTrue);
      expect(!isType<String?, num>(), isTrue);
    });
  });
  test('次要场景：super is nullable', () {
    expect(isType<num, num>(), isTrue);
    expect(isType<num?, num>(), isTrue);

    expect(isType<int, num>(), isTrue);
    expect(isType<int?, num>(), isTrue);
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
