import 'package:flutter/widgets.dart';
import 'package:you_flutter/note.dart';

@NoteAnnotation(label: "完善应用的技术")
void build(BuildContext context, Cell print) {
  print(const MD(r'''
# 完善应用
速查表 cheatsheet
基本理解flutter后, 就是要完善方方面面，才能成为一个完整的应用。
  '''));
}
