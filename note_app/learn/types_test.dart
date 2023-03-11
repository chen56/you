import 'package:test/test.dart';

void main() {
  test('1', () {
    dynamic x = 1;
    int i = x;

    expect(x == i, isTrue);
    expect(x.runtimeType, equals(1.runtimeType));

    x = null;
    expect(x == null, isTrue);
  });
  test('2', () {
    dynamic? x = 1;
    int i = x;
    expect(x == i, isTrue);
    expect(x.runtimeType, equals(1.runtimeType));
  });

  test('Symbol', () {
    const Symbol symbol = #ssss;
    expect(symbol, equals(Symbol("ssss")));
    expect(symbol.toString(), 'Symbol("ssss")');
  });
}
