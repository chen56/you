import 'package:learn_flutter/src/note/note.dart';
import '1.stateful_hello.dart';

Note note = Note(
  "最原始的状态管理",
);

build() {
  note.markdown(r'''
## 范例1 普通文本 

State

  ''');

  note.sample(const HelloStatefulApp());
}
