import 'package:flutter/widgets.dart';
import 'package:learn_flutter/note/@common/note.dart';

NoteMeta notFoundPage = NoteMeta(
  title: "404",
  builder: build,
);

build(Note note, BuildContext context) {
  note.markdown(r'''
## 404 Not Found 


  ''');
}
