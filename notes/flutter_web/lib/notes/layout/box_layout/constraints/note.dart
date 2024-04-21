// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:you_note_dart/note.dart';

void build(BuildContext context, Pen print) {

  print.markdown(r'''
# flutter layout

## flutter布局(layout)的基本逻辑

> [flutter.cn: 深入理解 Flutter 布局约束](https://flutter.cn/docs/ui/layout/constraints) 的第一段极好的描述了基本概念
> [flutter.dev原文: constraints](https://docs.flutter.dev/ui/layout/constraints)

约束(constraints)指：上级组件对下级组件的限制，用[BoxConstraints]表示。

比如：
  ''');

  print("${BoxConstraints(minWidth: 0, maxWidth: 800, minHeight: 100, maxHeight: 300)}: 儿子，你宽要在0～800之间，高在100～300之间");
  print("${BoxConstraints(minWidth: 800, maxWidth: 800, minHeight: 300, maxHeight: 300)}: 儿子，你宽只能是800，高只能300");

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

${BoxConstraints.tightFor(width: 600, height: 800)}

- 首先，老子（窗口）给儿子（app最外层widget）约束条件: 你必须宽600，高800
- 然后，儿子按老子要求，汇报大小信息：好吧，我宽600，高800
- 最后，老子（窗口）给儿子（app最外层widget）具体坐标位置：窗口在坐标x:0,y:0位置画一个宽600，高800的儿子。

看一个经典错误理解：
  ''');

  print(Container(width: 100, height: 100, color: Colors.red));

  print(LayoutBuilder(builder: (context, constraints) {
    return Text("LayoutBuilder: $constraints");
  }));
  print.markdown(r'''
BoxConstraints的print结果中： w是width,h是height
  ''');

  print(MockupWindow()(
    LayoutBuilder(builder: (context, constraints) {
      return Text("WindowContent: $constraints");
    }),
  ));

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
  BoxConstraints.tightFor(width: 1, height: 2);

}


question01ColumnAddListView(BuildContext context, Pen print) {


  print.markdown(r'''
======== Exception caught by rendering library ===================================================== The following assertion was thrown during performResize(): Vertical viewport was given unbounded height.

Viewports expand in the scrolling direction to fill their container. In this case, a vertical viewport was given an unlimited amount of vertical space in which to expand. This situation typically happens when a scrollable widget is nested inside another scrollable widget.

If this widget is always nested in a scrollable widget there is no need to use a viewport because there will always be enough vertical space for the children. In this case, consider using a Column or Wrap instead. Otherwise, consider using a CustomScrollView to concatenate arbitrary slivers into a single scrollable.

这个错误太常见：

Column布局中嵌套了一个ListView，并且ListView的高度没有被约束，导致渲染引擎无法确定其大小。
ListView本身是可以滚动的，所以在无限高的垂直空间中它会尝试填充所有的内容，从而引发错误。

方案1: 使用Expanded或Flexible包裹ListView：

如果您的场景允许Column中的其他Widget也能够占用一定的空间，并且希望ListView能根据剩余空间自动调整高度，
可以在ListView外面包裹一个Expanded或Flexible控件。这样，ListView就会在其父级Column的可用空间内进行滚动。


```dart
Column(
  children: [
    // 其他 widgets...
    Expanded(
      child: ListView(
        // ...
      ),
    ),
    // 其他 widgets...
  ],
)

方案2:

为ListView设置固定高度或使用 shrinkWrap 属性： 如果您希望ListView具有固定的或自适应内容高度，
可以设置ListView的shrinkWrap属性为true，同时为其提供一个明确的高度，或者将其置于ConstrainedBox中设置最大或最小高度。

shrinkWrap shrinkWrap是一个布尔属性，常见于诸如ListView、GridView等滚动容器组件。
当设置为true时，这些滚动容器会根据其子组件的内容大小自适应其高度或宽度，而不是依赖其父级容器提供的约束。
这样一来，即使它们位于一个不可滚动的父容器（如Column或Row）内部，也能正确显示所有内容而不至于溢出。
但shrinkWrap计算量大可能有性能问题。

```dart
Column(
  children: [
    // 其他 widgets...
    ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 200), // 设置一个最大高度
      child: ListView(
        shrinkWrap: true,
        // ...
      ),
    ),
    // 其他 widgets...
  ],
)
```

方案3

考虑使用CustomScrollView： 当您确实需要在一个可滚动视图中嵌套另一个可滚动视图时，
可以使用CustomScrollView结合SliverList等组件来构建复合滚动视图。

  ''');
}

