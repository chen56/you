import 'package:flutter/widgets.dart';
import 'package:you_note_dart/note.dart';

void build(BuildContext context, CellPrint print) {
  print.markdown(r'''
# home

本页面应该是不暴露的 ,但现在并未做任何限制，通过 / 可以看到

  ''');
}
