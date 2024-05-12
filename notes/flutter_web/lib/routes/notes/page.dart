import 'package:flutter/widgets.dart';
import 'package:you_flutter/note.dart';

@NoteAnnotation(label: "笔记")
void build(BuildContext context, Cell print) {
  print(const MD(r'''
# flutter 笔记

可选择左侧笔记阅读

  '''));
}
