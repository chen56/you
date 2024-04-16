import 'package:flutter/widgets.dart';
import 'package:note_lang_dart/note.dart';

build(BuildContext context, Pen print) {
  print.markdown(r'''
# 进度条

## 范例1 普通文本

Text.new()

  ''');

  print.markdown(r'''
## 范例1 富文本

Text.rich()

  ''');
}
