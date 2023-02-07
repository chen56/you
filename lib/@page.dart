import 'package:flutter/widgets.dart';
import 'package:learn_flutter/note.dart';

import 'note/frame.dart';

PageMeta rootPage = PageMeta(
  title: "home",
  builder: build,
  frameBuilder: <T>(N<T> note) => NoteFrame<T>(note),

);

build(Pen note, BuildContext context) {
  note.markdown(r'''
## 欢迎来到flutter世界 


  ''');
}
