import 'package:flutter/widgets.dart';
import 'package:learn_flutter/page.dart';

import '1.elevated_button.dart';

Meta widgetElevatedButtonNote = Meta(
  title: "ElevatedButton",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen. markdown(r'''
## 范例1 button 


  ''');

  pen.sample(const Sample1());
}
