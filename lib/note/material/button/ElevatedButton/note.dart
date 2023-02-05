import 'package:flutter/widgets.dart';
import 'package:learn_flutter/note/@common/note.dart';

import '1.elevated_button.dart';

NoteMeta note = NoteMeta(
  title: "ElevatedButton",
  builder: build,
);

build(Note note, BuildContext context) {
  note.markdown(r'''
## 范例1 button 


  ''');

  note.sample(const Sample1());
}
