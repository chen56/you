import 'package:flutter/material.dart';
import 'package:learn_flutter/page.dart';

PageMeta widgetElevatedButtonNote = PageMeta(
  shortTitle: "Components",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
# Components

> Components are interactive building blocks for creating a user interface. They can be organized into five categories based on their purpose: Action, containment, navigation, selection, and text input.
> https://m3.material.io/components

- a
- b
- c

  ''');

  pen.markdown(r'''
## 范例2 Meta 

  ''');
}
