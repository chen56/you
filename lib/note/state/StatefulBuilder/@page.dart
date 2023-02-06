import 'package:flutter/widgets.dart';
import 'package:learn_flutter/note/note.dart';

NoteMeta widgetStatefulBuilderNote = NoteMeta(
  title: "StatefulBuilder",
  builder: build,
);

build(NotePen note ,BuildContext context) {
  note.markdown(r'''
## 范例1   


  ''');

  // note.sample(const Sample1());
}
