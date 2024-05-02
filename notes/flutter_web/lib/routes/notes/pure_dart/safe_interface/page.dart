// ignore_for_file: file_names


import 'package:flutter/widgets.dart';
import 'package:you_flutter/note.dart';

void build(BuildContext context, Cell print) {
  print(const MD(r'''
# json

[Interface default methods #dart-lang/language/issues/884](https://github.com/dart-lang/language/issues/884#issuecomment-2058089580)

my answer

  '''));

  // 1. one month ago, it is ok
  OneImpl().a();

  // 2. a month later，  still no problem
  OneImpl().a();
  OneImpl().b(); // and have a new default impl method, you can override it
}

/// base 是担保mixin 的接口使用者不要用implement,而是用with，因为implement的语义就是全实现，而不是又缺省实现
base mixin Interface {
  // 1. one month ago you defined interface method a
  void a();

  // 2.now, a month later, you have another interface method b
  //   b need a default impl
  void b() {
    // ignore: avoid_print
    print("b: defalut impl");
  }
}

base class OneImpl with Interface {
  // 1. one month ago, you impl a
  @override
  void a() {
    // ignore: avoid_print
    print("a: your impl");
  }
// 2. one month late, your get b, and no problem
//    b method have a default impl
}
