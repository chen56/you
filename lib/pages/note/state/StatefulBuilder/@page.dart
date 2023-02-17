import 'package:flutter/widgets.dart';
import 'package:learn_flutter/page.dart';

PageMeta widgetStatefulBuilderNote = PageMeta(
  title: "StatefulBuilder",
  builder: build,
);

build(Pen pen ,BuildContext context) {
  pen. markdown(r'''
## 范例1   


  ''');

  // pen.sample(const Sample1());
}
