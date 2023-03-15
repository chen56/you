import 'package:flutter/material.dart';
import 'package:note/page_core.dart';
import 'package:note/mate.dart';
import 'package:note_mate_flutter/material.dart';

PageMeta page = PageMeta(
  shortTitle: "Note机制试验田",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
# note 机制【实验阶段】

## 可拖动组件，快速实验

```dart
  pen.widgetMate(
    ContainerMate(
      width: 100,
      height: 100,
      color: Colors.green,
    )..widthMate.value = 1,
  );
```
  ''');

  pen.markdown(r'''
## xxx
  ''');

  pen.widgetMate(Container$Mate(
    height: 50,
    color: Colors.green,
    clipBehavior: Clip.none,
  ));

  pen.markdown(r'''
## xxx
  ''');

  // root
  //   Container.new
  //     width
  //     child: Container.new
  //       width
  // 这里可以放一些比较复杂的共享MateNode的场景，比如多个组件同width
  pen.widgetSnippet((params) {
    Param<double> width = params.put("width", init: 200.0);
    Param<double> height = params.put("height", init: 200.0);

    return Container$Mate(
      width: width.value,
      height: height.value,
      color: Colors.green,
      clipBehavior: Clip.none,
      child: Container$Mate(
        width: width.value,
        height: height.value,
        color: Colors.green,
        clipBehavior: Clip.none,
      ),
    );
  });
}

// class y {}
//
// class x extends y with String {}
