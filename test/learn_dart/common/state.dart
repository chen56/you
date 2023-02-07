// ignore_for_file: unnecessary_type_check

import 'package:learn_flutter/utils.dart';
import 'package:test/test.dart';

void main() {
  test('common.types isSubtype 子类型判断', () {
    expect(isSubtype<num, int>(), isTrue);
    expect(isSubtype<num, String>(), isFalse);
  });
}

class Store {
  State<User> user = State(User.ofAnonymous());
}

class State<T> {
  T value;
  State(this.value);
}

class User {
  bool anonymous = true;
  String username = "";
  String nickname = "";

  User({
    required this.username,
    String? nickname,
  }) : nickname = nickname ?? "";

  User.ofAnonymous() : anonymous = true;
}

extension StringExt on String {
  void log() {
    print('--------$this');
  }
  //extension无法Overriding
  // void toString() {
  //   print('--------$this');
  // }
}
