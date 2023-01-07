import 'package:learn_flutter/param/param.dart';
import 'package:test/test.dart';

void main() {
  test('Param.define() ', () {
    var root = Param.root();
    expect(root.path("text.data").value, equals("empty value"));

    root.define("text.data", value: "default");
    expect(root.path("text.data").value, equals("default"));

    root.define("text.data", value: "default2");
    expect(root.path("text.data").value, equals("default"), reason: "只有第一次初始化有效");
  });

  test('Param.path() ', () {
    var root = Param.root();
    root.define("text.data", value: "default");

    root.path("text.data").value = "new value";
    expect(root.path("text.data").value, equals("new value"));
  });
}
