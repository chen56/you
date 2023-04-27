import 'package:flutter/material.dart';
import 'package:note/page_core.dart';
import 'package:note_mate_flutter/material.dart';

PageMeta page = PageMeta(
  shortTitle: "Buttons",
  builder: build,
);

build(BuildContext context, Pen print) {
  print.$____________________________________________________________________();
  print.markdown(r'''
# button

<https://m3.material.io/components/buttons/overview>, an overview of each of 
the Material Design button types and how they should be used in designs.

## 按钮概览

### 主要按钮

以下几种主要Button都继承自[ButtonStyleButton]
  ''');

  print.$____________________________________________________________________();
  print(MateSample(Wrap$Mate(
    children: [
      ElevatedButton$Mate(
          onPressed: () {}..sampleCodeStr = "(){}",
          child: Text$Mate("ElevatedButton")),
      FilledButton$Mate(
          onPressed: () {}..sampleCodeStr = "(){}",
          child: Text$Mate('FilledButton')),
      FilledButton$Mate.tonal(
          onPressed: () {}..sampleCodeStr = "(){}",
          child: Text$Mate('FilledButton.tonal')),
      OutlinedButton$Mate(
          onPressed: () {}..sampleCodeStr = "(){}",
          child: Text$Mate('OutlinedButton')),
      TextButton$Mate(
          onPressed: () {}..sampleCodeStr = "(){}",
          child: Text$Mate('TextButton')),
    ],
  )));

  print.$____________________________________________________________________();
  print.markdown(r'''
### IconButton

图标按钮。
  ''');

  print.$____________________________________________________________________();
  print(MateSample(Row$Mate(
    children: [
      IconButton$Mate(
          onPressed: () {}..sampleCodeStr = "(){}",
          tooltip: "IconButton",
          icon: Icon$Mate(Icons.wifi)),
      IconButton$Mate(
          onPressed: () {}..sampleCodeStr = "(){}",
          tooltip: "IconButton",
          icon: Icon$Mate(Icons.add)),
      IconButton$Mate(
          onPressed: () {}..sampleCodeStr = "(){}",
          tooltip: "IconButton",
          icon: Icon$Mate(Icons.ac_unit)),
    ],
  )));

  print.$____________________________________________________________________();
  print.markdown(r'''
### FloatingActionButton

浮动按钮，常见于[Scaffold]右下角的浮动按钮。
  ''');

  print.$____________________________________________________________________();
  int id = 0;

  print(MateSample(Row$Mate(
    children: [
      FloatingActionButton$Mate(
        onPressed: () {}..sampleCodeStr = "(){}",
        heroTag: "button.FloatingActionButton${id++}",
        tooltip: "FloatingActionButton",
        child: Text$Mate("缺省构造器"),
      ),
      FloatingActionButton$Mate.small(
        // isExtended: false,
        onPressed: () {}..sampleCodeStr = "(){}",
        heroTag: "button.FloatingActionButton${id++}",
        child: Text$Mate("small"),
      ),
      FloatingActionButton$Mate.large(
        // isExtended: false,
        onPressed: () {}..sampleCodeStr = "(){}",
        heroTag: "button.FloatingActionButton${id++}",
        child: Text$Mate("large"),
      ),
      FloatingActionButton$Mate.extended(
        // isExtended: false,
        onPressed: () {}..sampleCodeStr = "(){}",
        label: Text$Mate('extended'),
        icon: Icon$Mate(Icons.thumb_up),
        heroTag: "button.FloatingActionButton${id++}",
      ),
    ],
  )));

  print.$____________________________________________________________________();
  print.markdown(r'''
### 几个特殊的系统Button

继承关系：
- [StatelessWidget]
  - [_ActionButton] 
    - [BackButton] A Material Design back icon button
    - [CloseButton] A Material Design close icon button
    - [DrawerButton] A Material Design drawer icon button
    - [EndDrawerButton] A Material Design drawer icon button
  ''');

  print.$____________________________________________________________________();
  print(MateSample(Row$Mate(
    children: [
      BackButton$Mate(),
      CloseButton$Mate(),
      DrawerButton$Mate(),
      EndDrawerButton$Mate(),
    ],
  )));

  print.$____________________________________________________________________();
  print.markdown(r'''

### ToggleButtons

一组可多选｜单选的按钮组。

> **📣提示**：此组件实现于Material 2，类似于Material 3的[SegmentedButton]。可用[SegmentedButton]替换之。
  ''');

  print.$____________________________________________________________________();
  print(MateSample(Row$Mate(
    children: [
      ToggleButtons$Mate(
        onPressed: (_) {}..sampleCodeStr = "(_){}",
        isSelected: const [true, false, true],
        children: <Widget>[
          Icon$Mate(Icons.ac_unit),
          Icon$Mate(Icons.call),
          Icon$Mate(Icons.cake),
        ],
      ),
    ],
  )));

  print.$____________________________________________________________________();
  print.markdown(r'''
### SegmentedButton

一组可多选｜单选的按钮组。

> **📣提示**：此组件实现于Material 3，类似于Material 2的[ToggleButtons]，可用替换掉[ToggleButtons]。

<https://m3.material.io/components/segmented-buttons>
  ''');

  print.$____________________________________________________________________();
  print(MateSample(Row$Mate(
    children: [
      SegmentedButton$Mate<String>(
        multiSelectionEnabled: true,
        segments: <ButtonSegment<String>>[
          ButtonSegment$Mate<String>(
              value: "Day",
              label: Text$Mate('Day'),
              icon: Icon$Mate(Icons.calendar_view_day)),
          ButtonSegment$Mate<String>(
              value: "Week",
              label: Text$Mate('Week'),
              icon: Icon$Mate(Icons.calendar_view_week)),
          ButtonSegment$Mate<String>(
              value: "Month",
              label: Text$Mate('Month'),
              icon: Icon$Mate(Icons.calendar_view_month)),
          ButtonSegment$Mate<String>(
              value: "Year",
              label: Text$Mate('Year'),
              icon: Icon$Mate(Icons.calendar_today)),
        ],
        selected: <String>{"Month"},
        onSelectionChanged: (_) {}..sampleCodeStr = "(_){}",
      ),
    ],
  )));

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
  // print.sampleMate(GestureDetector$Mate(
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
  print(MateSample(Column$Mate(
    children: [
      Text$Mate("1.普通Text"),
      InkWell$Mate(
        onTap: () {}..sampleCodeStr = "(){}",
        child: Text$Mate("2.裹了层InkWell的Text"),
      ),
      InkResponse$Mate(
        onTap: () {}..sampleCodeStr = "(){}",
        child: Text$Mate("3.裹了层InkResponse的Text"),
      )
    ],
  )));

  print.$____________________________________________________________________();
  print.markdown(r'''
### ButtonBar 

按钮的布局容器，可以按内容的实际宽度在行或列之间调整，您把下面范例中父容器Container.width调小些看看：
  ''');

  print.$____________________________________________________________________();
  print(MateSample(Container$Mate(
    width: 600,
    color: Colors.lime.shade50,
    child: ButtonBar$Mate(
      children: [
        ElevatedButton$Mate(
            onPressed: () {}..sampleCodeStr = "(){}",
            child: Text$Mate("ElevatedButton2")),
        OutlinedButton$Mate(
            onPressed: () {}..sampleCodeStr = "(){}",
            child: Text$Mate('OutlinedButton')),
        CheckboxMenuButton$Mate(
            value: true,
            onChanged: (_) {}..sampleCodeStr = "(_){}",
            child: Text$Mate('CheckboxMenuButton')),
      ],
    ),
  )));
}
