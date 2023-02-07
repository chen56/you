import 'package:flutter/widgets.dart';
import 'package:learn_flutter/note.dart';

import 'frame.dart';

PageMeta notePage = PageMeta(
  title: "note",
  builder: build,
  frameBuilder: <T>(N<T> note) => NoteFrame<T>(note),
);

build(Pen note, BuildContext context) {
  note.markdown(r'''
## flutter Note
  ''');
}
