// ignore_for_file: unnecessary_type_check

import 'package:test/test.dart';

void main() {
  test('string.split', () {
    expect("".split("/"), [""]);
    expect("/".split("/"), ["", ""]);
    expect("/a".split("/"), ["", "a"]);
    expect("/a/".split("/"), ["", "a", ""]);
    expect("a".split("/"), ["a"]);
  });

  test('common.types isType 类型判断', () {
    expect(isType(Cat(), TypeIs<Animal>()), isTrue);
  });
  test('raw string', () {
    String name = "chen56";
    expect("name:$name", "name:chen56");
    expect(r"name:$name", "name:\$name", reason: "r means raw string");
  });
  test('null', () {
    expect(null.toString(), "null");
  });
}

class Animal {}

class Cat extends Animal {}

class TypeIs<T> {}

isType<T>(Object o, TypeIs<T> type) {
  return o is T;
}
