import 'package:flutter/material.dart';
import 'package:note/page_core.dart';
import 'package:note_mate_flutter/material.dart';

PageMeta page = PageMeta(
  shortTitle: "按钮",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
# button

<https://m3.material.io/components/buttons/overview>, an overview of each of 
the Material Design button types and how they should be used in designs.

## 按钮概览

### 主要按钮

以下几种主要Button都继承自[ButtonStyleButton]
  ''');

  pen.sampleMate(
    Wrap$Mate(
      children: [
        ElevatedButton$Mate(onPressed: () {}, child: Text$Mate("ElevatedButton")),
        FilledButton$Mate(onPressed: () {}, child: Text$Mate('FilledButton')),
        FilledButton$Mate.tonal(onPressed: () {}, child: Text$Mate('FilledButton.tonal')),
        OutlinedButton$Mate(onPressed: () {}, child: Text$Mate('OutlinedButton')),
        TextButton$Mate(onPressed: () {}, child: Text$Mate('TextButton')),
      ],
    ),
  );

  pen.markdown(r'''
### IconButton

图标按钮。

  ''');

  pen.sampleMate(
    Row$Mate(
      children: [
        IconButton$Mate(onPressed: () {}, tooltip: "IconButton", icon: Icon$Mate(Icons.wifi)),
        IconButton$Mate(onPressed: () {}, tooltip: "IconButton", icon: Icon$Mate(Icons.add)),
        IconButton$Mate(onPressed: () {}, tooltip: "IconButton", icon: Icon$Mate(Icons.ac_unit)),
      ],
    ),
  );

  pen.markdown(r'''
### FloatingActionButton

浮动按钮，常见于[Scaffold]右下角的浮动按钮。
  ''');

  pen.sampleMate(
    Row$Mate(
      children: [
        FloatingActionButton$Mate(
          onPressed: () {},
          heroTag: null,
          tooltip: "FloatingActionButton",
          child: Text$Mate("缺省构造器"),
        ),
        FloatingActionButton$Mate.small(
          // isExtended: false,
          onPressed: () {},
          heroTag: null,
          child: Text$Mate("small"),
        ),
        FloatingActionButton$Mate.large(
          // isExtended: false,
          onPressed: () {},
          heroTag: null,
          child: Text$Mate("large"),
        ),
        FloatingActionButton$Mate.extended(
          // isExtended: false,
          onPressed: () {},
          label: Text$Mate('extended'),
          icon: Icon$Mate(Icons.thumb_up),
          heroTag: null,
        ),
      ],
    ),
  );

  pen.markdown(r'''
### 几个特殊的系统Button

继承关系：
- [StatelessWidget]
  - [_ActionButton] 
    - [BackButton] A Material Design back icon button
    - [CloseButton] A Material Design close icon button
    - [DrawerButton] A Material Design drawer icon button
    - [EndDrawerButton] A Material Design drawer icon button
  ''');

  pen.sampleMate(
    Row$Mate(
      children: [
        BackButton$Mate(),
        CloseButton$Mate(),
        DrawerButton$Mate(),
        EndDrawerButton$Mate(),
      ],
    ),
  );

  pen.markdown(r'''

### ToggleButtons

  ''');

  pen.sampleMate(
    Row$Mate(
      children: [
        ToggleButtons$Mate(
          onPressed: (int index) {},
          isSelected: [true, false, true],
          children: const <Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.call),
            Icon(Icons.cake),
          ],
        ),
      ],
    ),
  );

  pen.markdown(r'''
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
  // pen.sampleMate(GestureDetector$Mate(
  //   // todo default value：这种变量型的是不是可以弄一下  kDefaultTrackpadScrollToScaleFactor
  //   trackpadScrollToScaleFactor: kDefaultTrackpadScrollToScaleFactor,
  //   child: const Text("文本变按钮"),
  //   onTap: () {/**todo UI log，显示到控制台便于一般性的事件展示**/},
  // ));

  // todo InkWell 模仿button
  pen.markdown(r'''
### Ink*组件

可被用来模仿Button。

InkWell/InkResponse = GestureDetector + Material风格的动态效果 。

继承关系：
- StatelessWidget
  - InkResponse
    - InkWell
    
您在下面三种不同的文本上点点看区别：
  ''');

  pen.sampleMate(Column$Mate(
    children: [
      Text$Mate("1.普通Text"),
      InkWell$Mate(
        onTap: () {},
        child: Text$Mate("2.裹了层InkWell的Text"),
      ),
      InkResponse$Mate(
        onTap: () {},
        child: Text$Mate("3.裹了层InkResponse的Text"),
      )
    ],
  ));

  pen.markdown(r'''
### ButtonBar 

按钮的布局容器，可以按内容的实际宽度在行或列之间调整，您把下面范例中父容器Container.width调小些看看：

  ''');

  pen.sampleMate(
    Container$Mate(
      width: 800,
      color: Colors.lime.shade50,
      child: ButtonBar$Mate(
        children: [
          ElevatedButton$Mate(onPressed: () {}, child: Text$Mate("ElevatedButton")),
          OutlinedButton$Mate(onPressed: () {}, child: Text$Mate('OutlinedButton')),
          CheckboxMenuButton$Mate(
              value: true, onChanged: (bool? value) {}, child: Text$Mate('CheckboxMenuButton')),
        ],
      ),
    ),
  );
}

void testss(String s, Function()) {}
