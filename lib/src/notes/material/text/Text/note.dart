import 'package:learn_flutter/src/note/note.dart';

import '1.text_normal.dart';
import '2.text_rich.dart';

Note note = Note(
  "Text",
);

build() {
  note.markdown(r'''
## 范例1 普通文本 

Text.new()

  ''');

  note.sample(const NormalTextSample());

  note.markdown(r'''
## 范例1 富文本 

Text.rich()

  ''');

  note.sample(const RichTextSample());
}
