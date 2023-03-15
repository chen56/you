// ignore_for_file: unnecessary_type_check

import 'package:flutter/widgets.dart';
import 'package:note/mate.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ObjectParam.get', () {
    ObjectParam<Widget?> p = ObjectParam(init: Container());
    var width = p.put("width", init: 1);
    expect(1, p.get("width").value);
    expect(1, width.value);

    // null
    var height = p.put("height", init: null);
    expect(null, p.get("height").value);
    expect(null, height.value);
  });
}
