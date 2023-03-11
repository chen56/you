import 'package:flutter/material.dart';
import 'package:flutter_note/page.dart';

import '1.elevated_button.dart';

PageMeta page = PageMeta(
  shortTitle: "ElevatedButton",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
# button
## 范例1 button 

### Sample1

- a
- b
- c

  ''');

  pen.sample(const Sample1());

  pen.markdown(r'''
## 范例2 Meta 

  ''');
}
