import 'package:flutter/material.dart';
import 'package:you_note_dart/note.dart';

void build(BuildContext context, Pen print) {
  print.$____________________________________________________________________();
  print.markdown(r'''
# overview

<https://m3.material.io/components/buttons/overview>, an overview of each of
the Material Design overview types and how they should be used in designs.

## 按钮概览

### 主要按钮

以下几种主要Button都继承自[ButtonStyleButton]
  ''');

  print.$____________________________________________________________________();
  print(Wrap(
    children: [
      ElevatedButton(onPressed: () {}, child: const Text("ElevatedButton")),
      FilledButton(onPressed: () {}, child: const Text('FilledButton')),
      FilledButton.tonal(onPressed: () {}, child: const Text('FilledButton.tonal')),
      OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton')),
      TextButton(onPressed: () {}, child: const Text('TextButton')),
    ],
  ));

  print.$____________________________________________________________________();
  print.markdown(r'''
### IconButton

图标按钮。
  ''');

  print.$____________________________________________________________________();
  print(Row(
    children: [
      IconButton(onPressed: () {}, tooltip: "IconButton", icon: const Icon(Icons.wifi)),
      IconButton(onPressed: () {}, tooltip: "IconButton", icon: const Icon(Icons.add)),
      IconButton(onPressed: () {}, tooltip: "IconButton", icon: const Icon(Icons.ac_unit)),
    ],
  ));

  print.$____________________________________________________________________();
  print.markdown(r'''
### FloatingActionButton

浮动按钮，常见于[Scaffold]右下角的浮动按钮。
  ''');

  print.$____________________________________________________________________();
  int id = 0;

  print(Row(
    children: [
      FloatingActionButton(
        onPressed: () {},
        heroTag: "overview.FloatingActionButton${id++}",
        tooltip: "FloatingActionButton",
        child: const Text("缺省构造器"),
      ),
      FloatingActionButton.small(
        // isExtended: false,
        onPressed: () {},
        heroTag: "overview.FloatingActionButton${id++}",
        child: const Text("small"),
      ),
      FloatingActionButton.large(
        // isExtended: false,
        onPressed: () {},
        heroTag: "overview.FloatingActionButton${id++}",
        child: const Text("large"),
      ),
      FloatingActionButton.extended(
        // isExtended: false,
        onPressed: () {},
        label: const Text('extended'),
        icon: const Icon(Icons.thumb_up),
        heroTag: "overview.FloatingActionButton${id++}",
      ),
    ],
  ));

  print.$____________________________________________________________________();
  print.markdown(r'''
### 几个特殊的系统Button

继承关系：
- [StatelessWidget]
  - [_ActionButton]
    - [BackButton] A Material Design back icon overview
    - [CloseButton] A Material Design close icon overview
    - [DrawerButton] A Material Design drawer icon overview
    - [EndDrawerButton] A Material Design drawer icon overview
  ''');

  print.$____________________________________________________________________();
  print(const Row(
    children: [
      BackButton(),
      CloseButton(),
      DrawerButton(),
      EndDrawerButton(),
    ],
  ));

  print.$____________________________________________________________________();
  print.markdown(r'''

### ToggleButtons

一组可多选｜单选的按钮组。

> **📣提示**：此组件实现于Material 2，类似于Material 3的[SegmentedButton]。可用[SegmentedButton]替换之。
  ''');

  print.$____________________________________________________________________();
  print(Row(
    children: [
      ToggleButtons(
        onPressed: (_) {},
        isSelected: const [true, false, true],
        children: const <Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.call),
          Icon(Icons.cake),
        ],
      ),
    ],
  ));

  print.$____________________________________________________________________();
  print.markdown(r'''
### SegmentedButton

一组可多选｜单选的按钮组。

> **📣提示**：此组件实现于Material 3，类似于Material 2的[ToggleButtons]，可用替换掉[ToggleButtons]。

<https://m3.material.io/components/segmented-buttons>
  ''');

  print.$____________________________________________________________________();
  print(Row(
    children: [
      SegmentedButton<String>(
        multiSelectionEnabled: true,
        segments: const <ButtonSegment<String>>[
          ButtonSegment<String>(value: "Day", label: Text('Day'), icon: Icon(Icons.calendar_view_day)),
          ButtonSegment<String>(value: "Week", label: Text('Week'), icon: Icon(Icons.calendar_view_week)),
          ButtonSegment<String>(value: "Month", label: Text('Month'), icon: Icon(Icons.calendar_view_month)),
          ButtonSegment<String>(value: "Year", label: Text('Year'), icon: Icon(Icons.calendar_today)),
        ],
        selected: const <String>{"Month"},
        onSelectionChanged: (_) {},
      ),
    ],
  ));

  print.$____________________________________________________________________();
  print.markdown(r'''
## 相关组件

### GestureDetector

事件侦测器，flutter的套路是组件组合，如果套上GestureDetector，其他组件也可以处理点击事件，模仿按钮行为。

```flutter
GestureDetector(
  onTap: () {/*点击事件*/}),
  child: Text("文本变按钮"),
)
```
  ''');

  // todo 增加GestureDetector范例
  // print.sampleMate(GestureDetector(
  //   // todo default value：这种变量型的是不是可以弄一下  kDefaultTrackpadScrollToScaleFactor
  //   trackpadScrollToScaleFactor: kDefaultTrackpadScrollToScaleFactor,
  //   child: const Text("文本变按钮"),
  //   onTap: () {/**todo UI log，显示到控制台便于一般性的事件展示**/},
  // ));

  print.$____________________________________________________________________();
  print.markdown(r'''
### Ink*组件

可被用来模仿Button。

InkWell/InkResponse = GestureDetector + Material风格的动态效果 。

继承关系：
- StatelessWidget
  - InkResponse
    - InkWell

您在下面三种不同的文本上点点看区别：
  ''');

  print.$____________________________________________________________________();
  print(Column(
    children: [
      const Text("1.普通Text"),
      InkWell(
        onTap: () {},
        child: const Text("2.裹了层InkWell的Text"),
      ),
      InkResponse(
        onTap: () {},
        child: const Text("3.裹了层InkResponse的Text"),
      )
    ],
  ));

  print.$____________________________________________________________________();
  print.markdown(r'''
### ButtonBar

按钮的布局容器，可以按内容的实际宽度在行或列之间调整，您把下面范例中父容器Container.width调小些看看：
  ''');

  print.$____________________________________________________________________();
  print(Container(
    width: 600,
    color: Colors.lime.shade50,
    child: ButtonBar(
      children: [
        ElevatedButton(onPressed: () {}, child: const Text("ElevatedButton2")),
        OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton')),
        CheckboxMenuButton(value: true, onChanged: (_) {}, child: const Text('CheckboxMenuButton')),
      ],
    ),
  ));
}
