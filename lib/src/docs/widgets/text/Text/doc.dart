import 'package:learn_flutter/src/notebook/notebook.dart';

import 'text_normal.dart';
import 'text_rich.dart';

Doc doc = Doc(
  title: "Text",
);
notebook() {
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
