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

  test('substring', () {
    try {
      "abc".substring(1, 20);
      fail("not here");
    } catch (e) {
      expect(e, isA<RangeError>());
      expect(
          e.toString(), equals("RangeError (end): Invalid value: Not in inclusive range 1..3: 20"));
    }
  });
  group("length", () {
    test('长度', () {
      expect("中文字符串长度".runes.length, 7);
      expect("# 中文abc".length, 7);
      expect("# 中文abc".runes.length, 7);
    });
  });
  group("中文", () {
    test('长度', () {
      expect("中文字符串长度".length, 7);
      expect("中文字符串长度".runes.length, 7);
      expect("# 中文abc".length, 7);
      expect("# 中文abc".runes.length, 7);
    });
  });
}

class Animal {}

class Cat extends Animal {}

class TypeIs<T> {}

isType<T>(Object o, TypeIs<T> type) {
  return o is T;
}
