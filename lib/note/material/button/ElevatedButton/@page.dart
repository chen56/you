import 'package:flutter/widgets.dart';
import 'package:learn_flutter/note.dart';

import '1.elevated_button.dart';

PageMeta widgetElevatedButtonNote = PageMeta(
  title: "ElevatedButton",
  builder: build,
);

build(Pen note, BuildContext context) {
  note.markdown(r'''
## 范例1 button 


  ''');

  note.sample(const Sample1());
}
