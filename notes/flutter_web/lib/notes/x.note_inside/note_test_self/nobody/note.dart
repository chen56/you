import 'package:flutter/material.dart';
import 'package:you_note_dart/note.dart';

void build(BuildContext context, Cell print) {
  print.markdown(r'''
# test自测目录

note_dev_gen.dart 生成器目前无法判断build方法是否存在，暂时这样吧。

  ''');
}
