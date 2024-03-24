// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:note/note.dart';

build(BuildContext context, Pen print) {
  print.markdown(r'''
# flutter layout

## flutter布局(layout)的基本逻辑

> [flutter.cn: 深入理解 Flutter 布局约束](https://flutter.cn/docs/ui/layout/constraints) 的第一段极好的描述了基本概念
> [flutter.dev原文: constraints](https://docs.flutter.dev/ui/layout/constraints)

约束(constraints)指：上级组件对下级组件的限制，用[BoxConstraints]表示。

比如：
  ''');


  print("${BoxConstraints(minWidth: 0,maxWidth: 800,minHeight: 100,maxHeight: 300)}: 儿子，你宽要在0～800之间，高在100～300之间");
  print("${BoxConstraints(minWidth: 800,maxWidth: 800,minHeight: 300,maxHeight: 300)}: 儿子，你宽只能是800，高只能300");

  print.markdown('''
BoxConstraints的print结果中： w是width,h是height

布局(layout)的约束(constraints)流程如下：

- 首先，老子给儿子约束条件；
- 然后，儿子按老子要求，汇报大小信息。
- 最后，老子决定儿子的具体坐标位置，比如按居中、左对齐等，把儿子放到不同的坐标位置，大小按儿子汇报的信息。

###  严格约束 [tight]

> [BoxConstraints] 官方解释：
> When the minimum constraints and the maximum constraint in an axis are the
> same, that axis is _tightly_ constrained. See: [
> BoxConstraints.tightFor], [BoxConstraints.tightForFinite], [tighten],
> [hasTightWidth], [hasTightHeight], [isTight].

说人话，就是，老子给儿子都安排了【固定】宽高，儿子就别想变花样了

场景：App最外层的组件通常由UI窗口限制为固定宽高：

${BoxConstraints.tightFor(width: 600,height: 800)}

- 首先，老子（窗口）给儿子（app最外层widget）约束条件: 你必须宽600，高800
- 然后，儿子按老子要求，汇报大小信息：好吧，我宽600，高800
- 最后，老子（窗口）给儿子（app最外层widget）具体坐标位置：窗口在坐标x:0,y:0位置画一个宽600，高800的儿子。

  ''');

  print(Container(width: 100,height: 100,color: Colors.red));

  print(LayoutBuilder(builder: (context, constraints) {
    debugPrint("${constraints}");
    return Text("LayoutBuilder: ${constraints}");
  }));
  print.markdown(r'''
BoxConstraints的print结果中： w是width,h是height


  ''');


  print.markdown(r'''
```dart
var c = BoxConstraints(minWidth: 0,maxWidth: 800,minHeight: 100,maxHeight: 300);
print(c);
// print: BoxConstraints(0<=w<=800.0, 0<=h<=600);
// w是width,h是height

BoxConstraints(0<=w<=800.0, 0<=h<=600)
```


BoxConstraints(w=1103.0, h=566.0)    // w是width,h是height

首先，上层 widget 向下层 widget 传递约束条件: 你的宽度必须在 100<=width<=200之间，高度必须在100<=height<=200之间
然后，下层 widget 向上层 widget 传递大小信息：好吧我
最后，上层 widget 决定下层 widget 的位置。

## flutter 主要有2种布局

-

## RenderObject的各类属性

  ''');

  print(SizedBox.fromSize(
    size: const Size.fromHeight(50),
    child: ListView(children: [
      LayoutBuilder(builder: (context, constraints) {
        return Text("SizedBox>ListView:${constraints}");
      })
    ]),
  ));

  // print("page: ${context.findRenderObject()?.constraints}");
  // print(SizedBox.fromSize(
  //   size: const Size.fromHeight(100),
  //   child: Builder(builder: (context) {
  //     return Text("SizedBox: ${context.findRenderObject()?.constraints}");
  //   }),
  // ));
  print(LayoutBuilder(builder: (context, constraints) {
    return Text("Page :${constraints}");
  }));

  print(SizedBox.fromSize(
    size: const Size.fromHeight(50),
    child: LayoutBuilder(builder: (context, constraints) {
      return Text("SizedBox:${constraints}");
    }),
  ));
  print(SizedBox.fromSize(
    size: const Size.fromHeight(50),
    child: Container(
        color: Colors.black54,
        child: LayoutBuilder(builder: (context, constraints) {
          return Text("SizedBox>Container:${constraints}");
        })),
  ));
  print(Container(
    color: Colors.black12,
    child: SizedBox.fromSize(
      size: const Size.fromHeight(50),
      child: LayoutBuilder(builder: (context, constraints) {
        return Text("Container>SizedBox:${constraints}");
      }),
    ),
  ));

  print(Align(
    alignment: Alignment.centerLeft,
    child: LayoutBuilder(builder: (context, constraints) {
      return Text("Align:${constraints}");
    }),
  ));
  print(SizedBox.fromSize(
    size: const Size.square(300),
    child: SizedBox.fromSize(
      size: const Size.square(400),
      child: LayoutBuilder(builder: (context, constraints) {
        return Text("SizedBox  >SizedBox  :${constraints}");
      }),
    ),
  ));
  print(SizedBox.fromSize(
    size: const Size.fromHeight(100),
    child: SizedBox.fromSize(
      size: const Size.fromWidth(400),
      child: LayoutBuilder(builder: (context, constraints) {
        return Text("SizedBox  >SizedBox  :${constraints}");
      }),
    ),
  ));

  print(ConstrainedBox(
    constraints: BoxConstraints(minWidth: double.infinity, minHeight: 50.0),
    child: Container(
      width: 0,
      height: 33,
      color: Colors.black26,
      child: DecoratedBox(decoration: BoxDecoration(color: Colors.red)),
    ),
  ));

  print(ConstrainedBox(
      constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0), //父
      child: UnconstrainedBox(
        //“去除”父级限制
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
          child: DecoratedBox(decoration: BoxDecoration(color: Colors.red)),
        ),
      )));
  // SchedulerBinding.instance.addPostFrameCallback((Duration timeStamp) {
  //   var r = context.findRenderObject()!;
  //   // print(" constraints   : ${r.constraints}");
  //   print(" paintBounds   : ${r.paintBounds}");
  //   print(" parentData    : ${r.parentData}");
  //   print(" semanticBounds: ${r.semanticBounds}");
  //   print(" attached      : ${r.attached}");
  //   print(" alwaysNeedsCompositing      : ${r.alwaysNeedsCompositing}");
  //   print(" sizedByParent      : ${r.sizedByParent}");
  // });
}
