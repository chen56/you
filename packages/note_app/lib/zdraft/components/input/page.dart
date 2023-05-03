import 'package:flutter/material.dart';
import 'package:note/page_core.dart';

NoteBuilder page = NoteBuilder(
  shortTitle: "输入组件",
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown(r'''
# input


  ''');
}
