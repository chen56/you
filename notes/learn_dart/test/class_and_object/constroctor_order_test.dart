import 'package:checks/checks.dart';
import 'package:test/test.dart';

void main() {

  test('构造步骤', () {
    AA();
    for (var e in logs) {
      print("=======>'$e',");
    }

    //结论：
    //1. 自己的字段
    //3. 自己的构造器初始化器
    //2. 父字段
    //4. 父构造器初始化器
    //5. 自己的构造器
    //6. 父构造器
    check(logs).deepEquals([
      'field:AA.aa',
      'field:AA():aa',
      'field:AA():super(b)',
      'field:A.a',
      'field:[A():a]',
      'A()',
      'AA()',
    ]);
  });
}

List<String> logs = [];

T field<T>(String name, T field) {
  logs.add("field:$name");
  return field;
}

class A {
  String a = field("A.a", "x");
  String b;
  A({required this.b}) : a = field("[A():a]", "x") {
    logs.add("A()");
  }
}

class AA extends A {
  String aa = field("AA.aa", "x");

  AA() :aa = field("AA():aa", "x"), super(b:field("AA():super(b)", "x")) {
    logs.add("AA()");
  }
}
