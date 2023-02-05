import 'package:learn_flutter/note/@common/note.dart';

import '1.elevated_button.dart';

Pag note = Pag(
   "Text",
);

build() {
  note.markdown(r'''
## 范例1 button 


  ''');

  note.sample(const Sample1());
}
