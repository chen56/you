import 'package:learn_flutter/note/note.dart';

import '1.elevated_button.dart';

Note note = Note(
   "Text",
);

build() {
  note.markdown(r'''
## 范例1 button 


  ''');

  note.sample(const Sample1());
}
