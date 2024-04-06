import 'package:checks/checks.dart';
import 'package:test/test.dart';

void main() {

  test('构造步骤', () {
    AA();
    logs.forEach((e) {
      print("'$e',");
    });

    //结论：
    //1. 自己的字段
    //3. 自己的构造器初始化器
    //2. 父字段
    //4. 父构造器初始化器
    //5. 自己的构造器
    //6. 父构造器
    check(logs).deepEquals([
      'field:AA.a',
      'field:AA():a',
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
  String a = field("AA.a", "x");

  AA() :a = field("AA():a", "x"), super(b:field("AA():super(b)", "x")) {
    logs.add("AA()");
  }
}
