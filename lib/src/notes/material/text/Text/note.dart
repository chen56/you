import 'package:learn_flutter/src/note/note.dart';

import 'text_normal.dart';
import 'text_rich.dart';

Note doc = Note(
  "Text",
);

note() {
  doc.markdown(r'''
## 范例1 普通文本 

Text.new()

  ''');

  doc.sample(const NormalTextSample());

  doc.markdown(r'''
## 范例1 富文本 

Text.rich()

  ''');

  doc.sample(const RichTextSample());
}
