import 'package:flutter/material.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "Components",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
# Components🟢🔔⚠️ℹ️**🟢🔔⚠️ℹ️**

>  **📣Tip:**
> Components are interactive building blocks for creating a user interface. They can be organized into five categories based on their purpose: Action, containment, navigation, selection, and text input.
> <https://m3.material.io/components>

  ''');

  pen.markdown(r'''
## 待撰写的笔记 

- Spacer 空间填充
- SizedBox
- Placeholder

  ''');
}
