import 'package:flutter/widgets.dart';
import 'package:learn_flutter/note/note.dart';

NoteMeta notFoundPage = NoteMeta(
  title: "404",
  builder: build,
);

build(NotePen note, BuildContext context) {
  note.markdown(r'''
## 404 Not Found 


  ''');
}
