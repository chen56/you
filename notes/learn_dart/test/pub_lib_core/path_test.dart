// ignore_for_file: unnecessary_type_check

import 'package:test/test.dart';
import 'package:path/path.dart' as path;

void main() {
  test('string.split', () {
    expect(path.dirname("package:path/path.dart"), "package:path");

    String getPath(String package) {
      String s = package.replaceAll("package:flutter_web/", "");
      return path.dirname(s);
    }

    expect(getPath("package:flutter_web/page.dart"), ".");
    expect(getPath("package:flutter_web/x/page.dart"), "x");

    expect("a", path.join("","a"));
    expect("a", path.join("a",""));
  });
}
