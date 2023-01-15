import 'package:learn_flutter/src/note/note.dart';

import 'sample_elevated_button.dart';

Note doc = Note(
   "Text",
);

note() {
  doc.markdown(r'''
## 范例1 button 


  ''');

  doc.sample(const Sample1());
}
