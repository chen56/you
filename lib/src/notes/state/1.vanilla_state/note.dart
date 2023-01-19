import 'package:learn_flutter/src/note/note.dart';
import '1.stateful_hello.dart' as stateful_hello ;

Note note = Note(
  "最原始的状态管理",
);

build() {
  note.markdown(r'''
## 范例1 普通文本 

State

  ''');

  note.sample(const stateful_hello.App());

  note.markdown(r'''
## 范例1 普通文本 

  ''');

}
