import 'package:flutter/widgets.dart';
import 'package:learn_flutter/page.dart';

import '1.elevated_button.dart';

PageMeta widgetElevatedButtonNote = PageMeta(
  title: "ElevatedButton",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen. markdown(r'''
# button
## 范例1 button 

### Sample1

- a
- b
- c

  ''');

  pen.sample(const Sample1());
}
