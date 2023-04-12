// ignore_for_file: avoid_pen.print

import 'package:flutter/material.dart';
import 'package:note/page_core.dart';
import 'package:note_app/note_app.dart';

PageMeta page = PageMeta(
  shortTitle: " Notebook-实验",
  builder: build,
  layout: Layouts.defaultLayout(isShowCellCode: true),
);

build(BuildContext context, Pen pen) {
  pen.markdown(r'''
# Notebook 机制-实验状态

类似jupyter或observablehq，一个笔记是由一系列cell 构成的，一个cell是一个代码单元，结构如下：

```text
note
  - cell(代码块)
    - markdown note content : 一项markdown输出
    - widget note content: 一项widget输出
    - ... note content : 一项xxx输出
  - cell ...
    - 一项xxx输出
```

- [Pen.write]: 对标print的函数，print输出字符串，write输出widget。
  - write: 全局函数, write("hello") == pen.write("hello")
- [Pen.md]: 输出一个markdown cell, pen.md("hello")==write(MarkdownNote("hello")) 
- sample：输出一个特殊的内容，Flutter SampleNote，除cell代码外，每个sample还有独立的范例代码
  - mateSample : flutter的范例cell，由Mate参数化组件构成, 范例代码由Mate生成+mateSample函数体内部分代码组合而成
  - templateSample：flutter的范例cell, 范例代码会包含 templateSample函数体内所有代码

sample的代码主要要求是完整的，可copy到ide直接能运行的代码，这和cell自己的代码有本质的区别，cell的代码是笔记代码，
sample的代码是独立运行代码，默认情况，sample块会隐藏掉cell的代码展示，以避免混乱。



## 各类cell

### markdown cell

你可以看到，markdown cell的代码就是调用：pen.md(...)
markdown cell 无法独立运行，只能通过运行全部notebook来重新执行（markdown中有插入变量，可能需要重新运行以更新UI）。

### 两cell间隔自动形成的cell

这种cell 无法独立运行，只能通过运行全部notebook来重新执行，主要用来放置跨cell的公共变量或函数。

如果两cell之间的自动cell内无代码逻辑，则会隐藏。
''');

  // pen.write("hello flutter-note");

  // between cell space is a cell too
  var cellOuter = "out cell";
  // ignore: unused_element
  String outerFunc() {
    return "cell outer func";
  }

  pen.write(cellOuter);
  pen.write(outerFunc());

  pen.markdown("""
### ~~普通cell~~

普通cell是个代码块，其源码如实反应其cell定义，更像jupyter、observablehq 的cell。
  """);

  // pen.cell((context, cell) {
  //   var cellInner = "in cell ";
  //   cell.print("cell outer var: $cellOuter");
  //   cell.print("cell inner  var $cellInner");
  // });

//   pen.markdown("""
// cell 内不能嵌套其他cell，你想啊，一个notebook里的cell都是序列放置的，嵌套算哪门子逻辑呢？
//   """);
  // pen.cell((context, cell) {
  //   // pen.cell((context, cell) {}); // error use
  // });

  // pen.cell((context, cell) {
  //   int size = 1;
  //   onPressed() {
  //     cell.print("click: $size");
  //     size++;
  //     // (context as Element).markNeedsBuild();
  //   }
  //
  //   cell.widget(ElevatedButton(onPressed: onPressed, child: Text("text: $size")));
  // });

  pen.markdown("""
### widget cell

和markdown类似，不能单独重新运行，只能整个文件运行。
  """);
  int i = 0;

  pen.write(StatefulBuilder(builder: (context, setSate) {
    return ElevatedButton(
      onPressed: () {
        setSate(() => i++);
      },
      child: Text("widget cell: $i"),
    );
  }));

  // pen.templateSample2((context, cell) {
  //   return Column(
  //     children: [],
  //   );
  // });
  pen.markdown("""
### MateSample cell

普通cell是个代码块，其源码如实反应其cell定义。
  """);
  // pen.mateSample2((context, cell) {
  //   var cellInner = "in cell ";
  //   return Column$Mate(
  //     children: [],
  //   );
  // });

//   pen.markdown("""
// ## cell 内操作
//
// ### print
//
// cell 内的
//
//   """);
  // pen.cell((context, cell) {
  //   cell.print("hello");
  // });
}
