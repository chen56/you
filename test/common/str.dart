// ignore_for_file: unnecessary_type_check

import 'package:test/test.dart';

void main() {
  test('common.types isSubtype 子类型判断', () {
    expect("/".split("/"), ["",""]);
    expect("/a".split("/"), ["","a"]);
    expect("/a/".split("/"), ["","a",""]);
  });

}
