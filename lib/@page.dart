import 'package:flutter/widgets.dart';
import 'package:learn_flutter/note/note.dart';

NoteMeta rootPage = NoteMeta(
  title: "home",
  builder: build,
);

build(NotePen note, BuildContext context) {
  note.markdown(r'''
## 欢迎来到flutter世界 


  ''');
}
