import 'package:learn_flutter/note/@common/note.dart';


Pag note = Pag(
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
