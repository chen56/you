import 'package:flutter/widgets.dart';
import 'package:you_note_dart/note.dart';

void build(BuildContext context, Print print) {
  print(const MD(r'''
## 范例1 普通文本

Text.new()

  '''));

  // print.sampleFile(const NormalTextSample());

  print(const MD(r'''
## 范例1 富文本

Text.rich()

  '''));

  // print.sampleFile(const RichTextSample());
}
