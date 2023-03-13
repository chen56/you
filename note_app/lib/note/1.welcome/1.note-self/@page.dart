import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:note/page.dart';
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
  //这种形式可以配置Mate参数,但Sample不好清理代码
  pen.widgetMate(
    ContainerMate(
      width: 100,
      height: 100,
      color: Colors.green,
    )..widthMate.value = 1,
  );
```
  ''');

  pen.widgetMate(
    Container$Mate(
      width: 100,
      height: 100,
      color: Colors.green,
    ),
  );

  // 这种形式比较好清理代码
  pen.widgetMate(
    Container$Mate(
      width: 100,
      height: 100,
      color: Colors.green,
    ),
  );

  // 这种形式比较好清理代码
  pen.widgetMate(
    Container$Mate(
      width: 100,
      height: 100,
      color: Colors.green,
    ),
  );
  // root
  //   Container.new
  //     width
  //     child: Container.new
  //       width
  // 这里可以放一些比较复杂的共享MateNode的场景，比如多个组件同width
  pen.widgetSnippet((params) {
    Param<double> width = params.set<double>(name: "width", init: 100.0);
    Param<double> height = params.set(name: "height", init: 100.0);

    return Container$Mate(
      width: width.value,
      height: height.value,
      color: Colors.green,
      child: Container$Mate(
        width: width.value,
        height: height.value,
        color: Colors.green,
      ),
    );
  });
}

// class y {}
//
// class x extends y with String {}
