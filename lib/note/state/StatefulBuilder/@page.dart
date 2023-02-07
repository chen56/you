import 'package:flutter/widgets.dart';
import 'package:learn_flutter/note.dart';

Meta widgetStatefulBuilderNote = Meta(
  title: "StatefulBuilder",
  builder: build,
);

build(Pen pen ,BuildContext context) {
  pen. markdown(r'''
## 范例1   


  ''');

  // pen.sample(const Sample1());
}
