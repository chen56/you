// ignore_for_file: unnecessary_type_check

import 'package:flutter/material.dart';
import 'package:note/mate.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:code_builder/code_builder.dart' as code;

typedef OnClick = void Function();
// ignore: camel_case_types
typedef OnClick_ = void Function(int?)?;

void isInt<T>() {
  // ignore: avoid_print
  print("${T == int}");
}

void main() {
  late ObjectParam obj;
  Editors editors = Editors(emitter: defaultEmitter, formatter: defaultDartFormatter);

  String singleCode<T>(T? init) {
    return obj.use("x", init).toCodeExpressionString(editors: editors);
  }

  String listCode<E>(List<E>? init) {
    return obj.useList("x", init).toCodeExpressionString(editors: editors);
  }

  setUp(() {
    obj = ObjectParam(
        init: Container(), builder: (m) => Container(), builderRefer: code.refer("Container"));
  });
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
    test("map", () {
      expect(singleCode<Map>({"a": 1}), "{a: 1}");
      expect(singleCode<Map?>({"a": 1}), "{a: 1}");
      expect(singleCode<Map?>(null), "null");
    });
    test("enum", () {
      expect(singleCode<Alignment>(Alignment.center), "Alignment.center");
      expect(singleCode<Alignment?>(Alignment.center), "Alignment.center");
      expect(singleCode<Alignment?>(null), "null");
    });
    test("color", () {
      expect(singleCode<Color>(Colors.red.shade100), "Colors.red.shade100");
      expect(singleCode<Color?>(Colors.red.shade100), "Colors.red.shade100");
      expect(singleCode<Color?>(null), "null");
    });
    test("void Function()", () {
      expect(singleCode<void Function()>(() {}), "() {  } ");
      expect(singleCode<void Function()?>(() {}), "() {  } ");
      expect(singleCode<void Function()?>(null), "null");
    });
  });
}
