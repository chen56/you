import 'package:test/test.dart';

void main() {
  test('calculate', () {});
}

class A {
  String a;
  String b;
  C c;
  A(this.a, {required this.b, required this.c});
}

class AA extends A {
  AA(String a, {required super.b, required super.c}) : super(log(a));
}

class C {}

T log<T>(T obj, [String? message]) {
  print("message");
  return obj;
}
