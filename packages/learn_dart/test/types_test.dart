import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('1', () {
    dynamic x = 1;
    int i = x;

    expect(x == i, isTrue);
    expect(x.runtimeType, equals(1.runtimeType));

    x = null;
    expect(x == null, isTrue);
    expect(x.runtimeType, Null);
  });
  test('2', () {
    dynamic x = 1;
    int i = x;
    expect(x == i, isTrue);
    expect(x.runtimeType, equals(1.runtimeType));
  });

  test('Symbol', () {
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
  group("Enum", () {
    test('cast', () {
      bool isEnum<T>(T x) {
        return x is Enum;
      }

      Enum e = DiagnosticLevel.debug;
      DiagnosticLevel? c = DiagnosticLevel.debug;
      expect(isEnum<DiagnosticLevel>(DiagnosticLevel.debug), true);
      expect(isEnum(e), true);
      expect(e is Enum, true);
      expect(c is Enum, true);
      expect(isEnum(c), true);
    });
  });
}

bool isNullableOf<T>(T t) {
  return null is T;
}

T declare<T>(String name, T t) {
  print("declare: $name: $t");
  return t;
}

class X {
  String a;
  X(this.a);
}
