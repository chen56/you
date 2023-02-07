import 'package:flutter/widgets.dart';
import 'package:learn_flutter/note.dart';

import 'frame.dart';

Meta notePage = Meta(
  title: "note",
  builder: build,
  frameBuilder: <T>(N<T> note) => NoteFrame<T>(note),
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
## flutter Note
  ''');
}
