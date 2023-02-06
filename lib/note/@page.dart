import 'package:flutter/widgets.dart';
import 'package:learn_flutter/note/note.dart';

NoteMeta notePage = NoteMeta(
  title: "note",
  builder: build,
);

build(NotePen note, BuildContext context) {
  note.markdown(r'''
## flutter Note


  ''');
}
