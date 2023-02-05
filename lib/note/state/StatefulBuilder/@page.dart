import 'package:flutter/widgets.dart';
import 'package:learn_flutter/note/@common/note.dart';

NoteMeta widgetStatefulBuilderNote = NoteMeta(
  title: "StatefulBuilder",
  builder: build,
);

build(Note note ,BuildContext context) {
  note.markdown(r'''
## 范例1   


  ''');

  // note.sample(const Sample1());
}
