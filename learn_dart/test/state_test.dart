// ignore_for_file: unnecessary_type_check, avoid_print

import 'package:test/test.dart';

void main() {
  test('1', () {
    var c = Cat(name: "s");
    expect(c.alias, "super:null");
    expect(c.catAlias, "super:null");
    expect(c.catAge, 10);
  });
}

class Animal {
  String name;
  String? alias;
  int age;
  Animal({
    required this.name,
    String? alias,
    this.age = 10,
  }) : alias = "super:$alias";
}

class Cat extends Animal {
  String? catAlias;
  int catAge;
  Cat({
    required super.name,
    super.alias,
    super.age,
  }) {
    catAlias = alias;
    catAge = age;
  }
}
