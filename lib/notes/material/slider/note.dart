import 'package:learn_flutter/note/note.dart';


Note note = Note(
  "Text",
);

build() {
  note.markdown(r'''
## 范例1 普通文本 

Text.new()

  ''');


  note.markdown(r'''
## 范例1 富文本 

Text.rich()

  ''');

}
