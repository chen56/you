import 'package:flutter/widgets.dart';
import 'package:learn_flutter/note.dart';

PageMeta widgetStatefulBuilderNote = PageMeta(
  title: "StatefulBuilder",
  builder: build,
);

build(Pen note ,BuildContext context) {
  note.markdown(r'''
## 范例1   


  ''');

  // note.sample(const Sample1());
}
