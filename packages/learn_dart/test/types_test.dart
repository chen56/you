import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("dynamic", () {
    test('dynamic <> int', () {
      dynamic x = 1;
      int i = x;

      expect(x == i, isTrue);
      expect(x.runtimeType, equals(1.runtimeType));

      x = null;
      expect(x == null, isTrue);
      expect(x.runtimeType, Null);
    });
  });

  group("Symbol", () {
    bool isNullableOf<T>(T t) {
      return null is T;
    }

    test('Symbol 入门', () {
      const Symbol symbol = #ssss;
      expect(symbol, equals(Symbol("ssss")));
      expect(symbol.toString(), 'Symbol("ssss")');
    });
    test('Symbol', () {
      String? s = "";
      expect(isNullableOf(s), false);
      expect(isNullableOf<String?>(s), true);

      dynamic x = s;
      expect(isNullableOf<String?>(x), true);
      expect(isNullableOf(x), true);
    });
  });
  group("Enum", () {
    test('cast', () {
      bool isEnum<T>(T x) {
        return x is Enum;
      }

      Enum e = DiagnosticLevel.debug;
      DiagnosticLevel? c = DiagnosticLevel.debug;
      expect(isEnum<DiagnosticLevel>(DiagnosticLevel.debug), true);
      expect(isEnum(e), true);
      // ignore: unnecessary_type_check
      expect(e is Enum, true);
      // ignore: unnecessary_type_check
      expect(c is Enum, true);
      expect(isEnum(c), true);
    });
  });
}
