// ignore_for_file: avoid_print.print

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:note/page_core.dart';
import 'package:note_app/note_app.dart';

PageMeta page = PageMeta(
  shortTitle: " Notebook机制",
  builder: build,
  layout: Layouts.defaultLayout(defaultCodeExpand: true),
);

build(BuildContext context, Pen print) {
  print.markdown(r'''
# Notebook机制


## 本项目的基本概念

Notebook的展示模式，是本项目的基础逻辑，类似jupyter或observablehq，
一个note由一系列cell构成，cell 是一段代码加上其运行后的一块界面区域：
''');

  print.nextCell___________________________();
  print("hello flutter-note , i am a cell");
  print("today is ${DateTime.now()}");

  print.nextCell___________________________();
  print.markdown(r'''
notebook的方式来呈现代码和其运行结果的想法很酷啊，以代码块->运行结果->代码块->运行结果这种看待问题的视角，非常适合
文档撰写、实验等工作，因为笔记是线性、顺序执行的思路，代码又可以直接变现到界面上，妙不可言。
比如，你学到一个很酷的Widget ToggleButtons，立刻把它记下来试试：
''');

  print.nextCell___________________________();

  print(ToggleButtons(
    isSelected: const [true, false, true],
    onPressed: (b) {},
    children: const [Icon(Icons.ac_unit), Icon(Icons.call), Icon(Icons.cake)],
  ));

  print.nextCell___________________________();
  print.markdown(r'''
或者，发现[Timer.periodic]定时器可以玩一些动态效果(记得释放Timer)：
*todo 应提供dispose回调函数,因为flutter可能会多次build，会造成启动多个timer。*
''');

  print.nextCell___________________________((context, print) {
    ValueNotifier<int> times = ValueNotifier(0);
    int maxTimes = 600;
    var random = Random(1);

    Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      times.value = times.value + 1;
      if (times.value > maxTimes) timer.cancel();
    });
    print(ListenableBuilder(
      listenable: times,
      builder: (context, child) {
        return Wrap(
          children: [
            Text("${times.value}/$maxTimes"),
            ...List.generate(
                300,
                (index) => Container(
                      width: 30,
                      height: 30,
                      color: Colors.primaries[random.nextInt(Colors.primaries.length)],
                    ))
          ],
        );
      },
    ));
  });

  print.nextCell___________________________();
  print.markdown("""
  
notebook模式的思考方式，很棒，本项目和传统notebook工具jupyter或observablehq等的区别是，
这里并没有一个web版的notebook编辑器，一个cell，一个cell的编辑运行代码，本项目通过代码分析器
从dart代码中自动分割cell，再以一块代码+一块代码产生的UI展示出来，所以cell在界面上是只读的。
之所以这样，只因我感觉最好的编辑器，还是idea、code这些，功能强大，编辑舒适，如果能加以利用现有的编辑器，
并结合notebook的思路，应该也还不错。



///TODO 以下还在草稿阶段，暂时不需要阅读


///   - 一种是代码中用[cell]函数明确指定的cell，是可以单独运行的。（[Pen]级别的方法包括markdown()等都是cell函数）
///   - 另一种是自然cell，即非明确指定的，夹在cell函数之间的代码段，要重新运行这种cell，相当于重新运行整个build函数
/// 自然cell在build函数的最外层，可以用来放置公共变量、函数。
///
/// - implicit cell
/// - explicit cell


- [print.markdown]: 对标print的函数，print输出字符串，write输出widget。
  - write: 全局函数, write("hello") == print.write("hello")
- [print.md]: 输出一个markdown cell, print.md("hello")==write(MarkdownNote("hello")) 
- sample：输出一个特殊的内容，Flutter SampleNote，除cell代码外，每个sample还有独立的范例代码
  - mateSample : flutter的范例cell，由Mate参数化组件构成, 范例代码由Mate生成+mateSample函数体内部分代码组合而成
  - templateSample：flutter的范例cell, 范例代码会包含 templateSample函数体内所有代码

sample的代码主要要求是完整的，可copy到ide直接能运行的代码，这和cell自己的代码有本质的区别，cell的代码是笔记代码，
sample的代码是独立运行代码，默认情况，sample块会隐藏掉cell的代码展示，以避免混乱。



## 各类cell

### markdown cell

你可以看到，markdown cell的代码就是调用：print.md(...)
markdown cell 无法独立运行，只能通过运行全部notebook来重新执行（markdown中有插入变量，可能需要重新运行以更新UI）。

### 两cell间隔自动形成的cell

这种cell 无法独立运行，只能通过运行全部notebook来重新执行，主要用来放置跨cell的公共变量或函数。

如果两cell之间的自动cell内无代码逻辑，则会隐藏。  """);

  print.markdown("""
## cell 内操作
""");

  print.nextCell___________________________();
  {
    int count = 0;
    print(ElevatedButton(
        onPressed: () {
          count++;
          print("click:$count");
        },
        child: Text("click:$count")));
  }

  print.nextCell___________________________((context, print) {
    int i = 0;
    print(StatefulBuilder(builder: (context, setSate) {
      return ElevatedButton(
        onPressed: () {
          setSate(() => i++);
        },
        child: Text("widget cell: $i"),
      );
    }));
  });

  print.nextCell___________________________();
  print.markdown("""
### MateSample cell

普通cell是个代码块，其源码如实反应其cell定义。
  """);
}
