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
}
