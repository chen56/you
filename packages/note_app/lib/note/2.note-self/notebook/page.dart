// ignore_for_file: avoid_print

import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: " Notebook-实验",
  builder: build,
);

build(BuildContext context, Pen pen) {
  pen.markdown(r'''
# Notebook 机制-实验状态
''');
  pen.widget((param) => Text(""));
  pen.widget((param) {
    print("object");
    return Text("");
  });
  // 注释语句注释语句
  // ignore: unused_element
  void x() {
    print("1");
    print("2");
  }

  {
    // ignore: unused_element
    void x() {
      print("3");
      print("4");
    }

    print("5");
    pen.markdown(r'''
# Notebook 机制
''');
  }
}
