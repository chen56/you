import 'package:flutter/material.dart';
import 'package:learn_flutter/page.dart';
import 'package:learn_flutter/params/flutter/widgets/container.dart';

PageMeta noteSelfNote = PageMeta(
  shortTitle: "Note机制",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
# note 机制介绍

## 可拖动组件，快速实验


  ''');

  pen.widgetMate(CenterMate(
    key: const ValueKey("center2"),
    child: ContainerMate(
      width: 100,
      height: 100,
      color: Colors.green,
    ),
  ));
}
