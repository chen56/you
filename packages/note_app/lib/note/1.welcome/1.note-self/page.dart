import 'package:flutter/material.dart';
import 'package:note/page_core.dart';
import 'package:note/mate.dart';
import 'package:note_mate_flutter/material.dart';

PageMeta page = PageMeta(
  shortTitle: "Note机制试验田",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown('''
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
  // print("${pen.runtimeType}");
  pen.sampleMate(Container$Mate(
    width: 200,
    height: 100,
    color: Colors.green.shade400,
    clipBehavior: Clip.none,
    child: Center$Mate(
      child: Container$Mate(
        key: ValueKey("s"),
        width: 100,
        height: 100,
        color: Colors.red.shade400,
        clipBehavior: Clip.none,
        // child: const Text("s"),
        child: null,
      ),
    ),
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
  // pen.widget((params) {
  //   Param<double> width = params.put("width", 200.0);
  //   Param<double> height = params.put("height", 200.0);
  //
  //   return Container(
  //     width: width.value,
  //     height: height.value,
  //     color: Colors.green,
  //     clipBehavior: Clip.none,
  //     child: Container(
  //       width: width.value,
  //       height: height.value,
  //       color: Colors.blue,
  //       clipBehavior: Clip.none,
  //     ),
  //   );
  // });
}

// class y {}
//
// class x extends y with String {}
