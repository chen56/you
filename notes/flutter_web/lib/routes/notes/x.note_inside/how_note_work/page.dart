// ignore_for_file: avoid_print.print

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:you_flutter/note.dart';

void build(BuildContext context, Cell print) {
  print(const MD(r'''
# Notebook机制

## 本项目的基本概念

Notebook的展示模式，是本项目的基础逻辑，类似jupyter或observablehq，
一个note由一系列cell构成，cell 是一段代码加上其运行后的一块界面区域：
'''));

  print.addCell(title:const Text("--------new cell------"));
  print("hello flutter-note , i am a cell. ");
  print("today is ${DateTime.now()}");

  print.addCell(title:const Text("--------new cell------"));
  print(const MD(r'''
notebook的方式来呈现代码和其运行结果的想法很酷啊，以代码块->运行结果->代码块->运行结果这种看待问题的视角，非常适合
文档撰写、实验等工作，因为笔记是线性、顺序执行的思路，代码又可以直接变现到界面上，妙不可言。
比如，你学到一个很酷的Widget ToggleButtons，立刻把它记下来试试：
'''));

  print.addCell(title:const Text("--------new cell------"));
  print(ToggleButtons(
    isSelected: const [true, false, true],
    onPressed: (b) {},
    children: const [Icon(Icons.ac_unit), Icon(Icons.call), Icon(Icons.cake)],
  ));

  print.addCell(title:const Text("--------new cell------"));
  print(const MD(r'''
或者，发现[Timer.periodic]定时器可以玩一些动态效果(记得释放Timer)：
(*todo note框架应提供dispose回调函数,因为flutter可能会多次build，会造成启动多个timer。*)
'''));

  print.addCell(title:const Text("--------new cell------"));
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

  print.addCell(title:const Text("--------new cell------"));
  print(const MD("""
notebook模式的思考方式，很棒，本项目和传统notebook工具jupyter或observablehq等的区别是，
这里并没有一个web版的notebook编辑器，一个cell，一个cell的编辑运行代码，本项目通过代码分析器
从dart代码中自动分割cell，再以一块代码+一块代码产生的UI展示出来，所以cell在界面上是只读的。
之所以这样，只因我感觉最好的编辑器，还是idea、code这些，功能强大，编辑舒适，如果能加以利用现有的编辑器，
并结合notebook的思维模式来撰写代码，应该也还不错。

## 可print的内容类型

### ObjectContent

对标原生print的函数，print输出对象的字符串到stdout，而本项目输出对象的字符串到cell内。
"""));

  print.addCell(title:const Text("--------new cell------"));
  print("hello");
  print(1);
  print(true);
  print(["a", "b", "c"]);

  print.addCell(title:const Text("--------new cell------"));
  print(const MD("""
### MarkdownContent

如果一个cell里全都是MarkdownContent，默认代码是折叠的，点下左边小箭头，可以展开代码
"""));
  print.addCell(title:const Text("--------new cell------"));
  print(const MD("""hello markdown  """));

  print.addCell(title:const Text("--------new cell------"));
  print(const MD("""
### WidgetContent

"""));

  print.addCell(title:const Text("--------new cell------"));
  print(Container(width: 100, height: 100, color: Colors.blue));

  print.addCell(title:const Text("--------new cell------"));
  print(const MD("""
### SampleContent

范例内容：本项目为flutter特殊制作了可调参范例，并生成可执行代码片段，copy到一个dart文件中，一般就能执行。
sample的代码主要要求是完整的，可copy到ide直接能运行的代码，这和cell自己的代码有本质的区别，cell的代码是笔记代码，
sample的代码是独立运行的flutter使用范例代码，实际的其他范例页面中，sample块的笔记代码会被折叠，以避免混乱。
"""));

  print.addCell(title:const Text("--------new cell------"));
  // 形式1：
  print(Container(width: 100, height: 100, color: Colors.deepPurple));
  // 形式2：简化形式，Mate类型的Widget通通认为是范例
  print(Container(width: 100, height: 100, color: Colors.deepPurple));

  print.addCell(title:const Text("--------new cell------"));
  print(const MD("""
## 事件回调的问题

动态的笔记代码中，通常夹杂按钮回调 或Timer回调，但你看，回调的print并不能把内容输出到正确的地方：
"""));

  print.addCell(title:const Text("--------new cell------"));
  {
    int count = 0;
    print(ElevatedButton(
        onPressed: () {
          count++;
          print("事件回调的问题: $count");
        },
        child: const Text("点击回调后，print没有输出在本cell下 ，而是在本页最最最下面")));
  }

  print.addCell(title:const Text("--------new cell------"));
  print(const MD("""
问题原因：onPressed回调是在build方法执行完才被调用的，而最外层的print函数(Pen.call)的实现如下：
```dart
  // Pen类
  void call(Object? object) {
    currentCell.print(object);
  }
```

内部的currentCell等build执行完后的已经指到是最后一个cell。

### 处理方案1

回调中避免使用print，用flutter原始的statefull方案来做动态效果：
"""));
  print.addCell(title:const Text("--------new cell------"));
  int i = 0;
  print(StatefulBuilder(builder: (context, setSate) {
    return ElevatedButton(
      onPressed: () {
        setSate(() => i++);
      },
      child: Text("widget cell: $i"),
    );
  }));

  print.addCell(title:const Text("--------new cell------"));
  print(const MD("""
或用runInCurrentCell函数(与上面同理)来记住currentCell，就可以用print做动态效果：
"""));

  print.addCell(title:const Text("--------new cell------"));
  print(const MD("""
## cell的元信息
"""));

  print.addCell(title:const Text("--------new cell------"));
  // print("源文件中当前cell的index：${print.currentCell.index}");
  // print("源文件中当前cell的起始字符位置：${print.currentCell.source.codeEntity.offset}");
  // print("源文件中当前cell的结束字符位置：${print.currentCell.source.codeEntity.end}");
  // print("源文件中当前cell的代码块：${print.currentCell.source.code}");

  print.addCell(title:const Text("--------new cell------"));
  print(const MD("""
## 结束

上面回调案例会错误的print内容到此处，而不是输出到它自己的cell。
"""));
}
