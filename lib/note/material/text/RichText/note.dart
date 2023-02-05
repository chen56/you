import 'package:flutter/widgets.dart';
import 'package:learn_flutter/note/@common/note.dart';

NoteMeta note = NoteMeta(
  title: "RichText",
  builder: build,
);

build(Note note ,BuildContext context) {
  note.markdown(r'''
## 范例1 普通文本

RichText.new()

  ''');
}
