// ignore_for_file: unnecessary_type_check

import 'package:flutter/material.dart';
import 'package:flutter_note/utils.dart';
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
    expect(isType(Center(), TypeIs<Widget>()), isTrue);
  });
}
