import 'package:flutter/widgets.dart';
import 'package:learn_flutter/note/note.dart';

import '1.elevated_button.dart';

NoteMeta widgetElevatedButtonNote = NoteMeta(
  title: "ElevatedButton",
  builder: build,
);

build(NotePen note, BuildContext context) {
  note.markdown(r'''
## 范例1 button 


  ''');

  note.sample(const Sample1());
}
