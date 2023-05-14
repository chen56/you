// ignore_for_file: unnecessary_type_check

import 'package:flutter/material.dart';
import 'package:note/mate.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note/note_core.dart';

typedef OnClick = void Function();
// ignore: camel_case_types
typedef OnClick_ = void Function(int?)?;

void isInt<T>() {
  // ignore: avoid_print
  print("${T == int}");
}

void main() {
  late ObjectParam obj;
  Editors editors =
      Editors(emitter: defaultEmitter, formatter: defaultDartFormatter);
  setUp(() {
    obj = ObjectParam.root(editors: editors);
  });

  String singleCode<T>(T? init) {
    //use同一个name 第二次，会返回上次的param，所以每次需要一个不同的name
    return obj.use("x${UniqueKey().hashCode}", init).toCodeExpressionString();
  }

  String listCode<E>(List<E>? init) {
    return obj.use("x${UniqueKey().hashCode}", init).toCodeExpressionString();
  }

  group("editors", () {
    test("core type", () {
      expect(singleCode<double>(2), "2.0");
      expect(singleCode<double?>(2), "2.0");
      expect(singleCode<double?>(null), "null");

      expect(singleCode<int>(2), "2");
      expect(singleCode<int?>(2), "2");
      expect(singleCode<int?>(null), "null");

      expect(singleCode<String>("2"), "'2'");
      expect(singleCode<String?>("2"), "'2'");
      expect(singleCode<String?>(null), "null");
    });
    test("list", () {
      expect(listCode<int>([1, 2]), "[1, 2, ]");
      expect(listCode<int?>([1, 2]), "[1, 2, ]");
      expect(listCode<int?>(null), "[]");
    });
    // map 还不支持搞个球
    // test("map", () {
    //   expect(singleCode<Map>({"a": 1}), "{a: 1}");
    //   expect(singleCode<Map?>({"a": 1}), "{a: 1}");
    //   expect(singleCode<Map?>(null), "null");
    // });
    test("enum", () {
      expect(singleCode<Clip>(Clip.none), "Clip.none");
      expect(singleCode<Clip?>(Clip.none), "Clip.none");
      expect(singleCode<Clip?>(null), "null");
    });
    test("color", () {
      expect(singleCode<Color>(Colors.red.shade100), "Colors.red.shade100");
      expect(singleCode<Color?>(Colors.red.shade100), "Colors.red.shade100");
      expect(singleCode<Color?>(null), "null");
    });
    test("unknow value type :void Function()", () {
      expect(singleCode<void Function()>(() {}),
          contains("应该使用[NoteExt.simpleCode]替换掉无法生成的代码Closure: () => void"));

      // but can inject code
      expect(
          singleCode<void Function()>(() {}..sampleCodeStr = "(){}"), "(){}");
    });
  });
}
