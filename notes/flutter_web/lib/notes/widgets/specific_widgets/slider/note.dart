import 'package:flutter/widgets.dart';
import 'package:you_note_dart/note.dart';

void build(BuildContext context, Cell print) {
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
