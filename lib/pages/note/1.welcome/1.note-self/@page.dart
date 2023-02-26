import 'package:flutter/material.dart';
import 'package:flutter_note/experiments/experiment_param_widget.dart';
import 'package:flutter_note/page.dart';

PageMeta noteSelfNote = PageMeta(
  shortTitle: "Note机制",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
# note 机制介绍

## 可拖动组件，快速实验


  ''');

  pen.widgetMate(ContainerMate(
    key: const ValueKey("center2"),
    height: 50,
    color: Colors.red,
    //
    child: ContainerMate(
      width: 100,
      height: 100,
      color: Colors.green,
    ),
  ));
}
