// ignore_for_file: unnecessary_type_check, unnecessary_string_escapes

import 'package:test/test.dart';

void main() {
  test('reg', () {
    expect("a/page.dart/page.dart".replaceAll(RegExp("/\page.dart\$"), ""), "a/page.dart");
    expect("a/page.dart/page.dart".replaceAll("/\page.dart\$", ""), "a/page.dart/page.dart");
    expect("a1./1.button/page.dart".replaceAll(RegExp("/\\d+\."), "/"), "a1./button/page.dart");
    expect("a1./2.dev/page.dart".replaceAll(RegExp("/\\d+\."), "/"), "a1./dev/page.dart");
  });
}
