import 'package:learn_flutter/src/notebook/notebook.dart';

import 'sample_elevated_button.dart';

Doc doc = Doc(
  title: "Text",
);

notebook() {
  doc.markdown(r'''
## 范例1 button 


  ''');

  doc.sample(const Sample1());
}
