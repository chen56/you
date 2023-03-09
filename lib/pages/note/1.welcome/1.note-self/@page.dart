import 'package:flutter/material.dart';
import 'package:flutter_note/experiments/experiment_param_widget.dart';
import 'package:flutter_note/page.dart';

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
    ContainerMate(
      width: 100,
      height: 100,
      color: Colors.green,
    )..widthMate.value = 1,
  );

  // 这种形式比较好清理代码
  pen.widgetMate(
    ContainerMate(
      width: 100,
      height: 100,
      color: Colors.green,
    ).configMate(config: (self) {
      // 可配置mate 编辑器等参数
      self.widthMate.value = 1;
    }),
  );

  // 这种形式比较好清理代码
  pen.widgetMate(
    ContainerMate(
      width: 100,
      height: 100,
      color: Colors.green,
    ),
  );
  // 这里可以放一些比较复杂的共享MateNode的场景，比如多个组件同width
  pen.widgetSnippet((mate) {
    Nullable<double> width = mate.set_(editor: Double(name: "width"));
    Nullable<double> height = mate.set_(editor: Double(name: "height"));

    return ContainerMate(
      width: width.value,
      height: height.value,
      color: Colors.green,
      child: ContainerMate(
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
