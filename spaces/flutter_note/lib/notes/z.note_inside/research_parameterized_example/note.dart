import 'package:flutter/material.dart';
import 'package:mate/mate_note.dart';
import 'package:note/note.dart';
import 'package:code_builder/code_builder.dart';

build(BuildContext context, Pen print) {
  print.$____________________________________________________________________();
  print.markdown('''
# 参数化范例

## 可调参范例

学习flutter/dart这类UI技术，如果有好的范例讲解展示，会极大加速学习。

> 🔔  王道范例三要素，和一项必备条件：要快不要龟。
> - 范例可展示，讲解UI技术，不展示出来，贴个图或半天显示不出来急死人
> - 参数可调整，范例width:200,我改2000会不会报错
> - 代码可同步，调参后的代码要能动态同步

官网及很多github范例库并不具备以上要素，要么一堆范例代码无讲解，无展示，要么一堆可展示，半天找不到代码，
还有官网大量DartPad范例，完美体现了dart编译速度慢这种语言特点，龟速一样，查阅UI文档，就是想快速
纵览其外观形状，结果等半天，长啥样都出不来，急死人，在耐心丧失前的加载成功率为13% o(一︿一+)o

本note中的UI范例，支持参数调节，可快速展示实验。

### num参数

请您点击开下面范例小箭头，修改Container.height，观察范例展示及代码的变化：
  ''');

  print.$____________________________________________________________________();
  print(WidgetContent(Container(
    height: 100,
    child: Text("请修改height,调节高度"),
  )));

  print.$____________________________________________________________________();
  print.markdown('''
### String参数
  ''');

  print.$____________________________________________________________________();
  print(WidgetContent(Text("我是Text.data,修改我")));

  print.$____________________________________________________________________();
  print.markdown('''
### Color参数

TODO 暂时只能显示，还不能编辑
  ''');

  print.$____________________________________________________________________();
  print(WidgetContent(Container(
    width: 200,
    height: 100,
    color: Colors.green.shade400,
    clipBehavior: Clip.none,
    child: Center(
      child: Container(
        width: 100,
        height: 50,
        color: Colors.red.shade400,
        clipBehavior: Clip.none,
      ),
    ),
  )));

  print.$____________________________________________________________________();
  print.markdown('''
### bool参数
  ''');

  print.$____________________________________________________________________();
  print(WidgetContent(Container(
    width: 100,
    // height: 100,
    color: Colors.blue.shade100,
    child: Text("修改Text.softWrap: 自动换行", softWrap: true),
  )));

  print.$____________________________________________________________________();
  print.markdown(r'''
### 枚举参数

修改下mainAxisAlignment：
  ''');

  print.$____________________________________________________________________();
  print(WidgetContent(Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        width: 100,
        height: 100,
        color: Colors.blue,
      ),
      Container(
        width: 100,
        height: 100,
        color: Colors.green,
      ),
    ],
  )));

  print.$____________________________________________________________________();
  print.markdown(r'''
## 其他特性

### 按cell模版生成范例代码

我们的范例代码生成机制虽然看起来还不错，但有个小问题，函数代码较难处理，目前的做法是：提取
Notebook 当前cell的代码作为模版，配合代码生成一起，可以解决此疑难，您可以观察下cell本身的代码
和范例生成的代码的异同：
  ''');

  print.$____________________________________________________________________();
  showAbout() {
    showAboutDialog(
      context: context,
      applicationName: 'MenuBar Sample',
      applicationVersion: '1.0.0',
    );
  }

  // 包含MateSample调用的语句会被范例代码擦除
  print(
    WidgetContent(
      ElevatedButton(
          onPressed: showAbout..sampleCode = refer("showAbout"),
          child: const Text("Button1")),
    ),
  );

  print.$____________________________________________________________________();
  print.markdown(r'''
### 用循环一次性构造一组范例
  ''');

  print.$____________________________________________________________________();
  for (var mainAxisAlignment in MainAxisAlignment.values) {
    print(WidgetContent(Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        ElevatedButton(
            onPressed: () {}..sampleCodeStr = "(){}",
            child: Text("${mainAxisAlignment.name}:Button1")),
        ElevatedButton(
            onPressed: () {}..sampleCodeStr = "(){}",
            child: Text("${mainAxisAlignment.name}:Button2")),
      ],
    )));
  }
}
