import 'package:flutter/material.dart';
import 'package:note/note.dart';

build(BuildContext context, Pen print) {
  print.markdown(r'''
# flutter note项目

>  **🚫Tip:**
> 本笔记项目当前主要目标：
> 1. 动态的、可视化的flutter技术速查表，主要是为像我一样学了点dart/flutter基础，
> 2. 转变flutter多层嵌套（套娃地狱模式）的开发方式为notebook的线性思维模式，便于书写文档、笔记等
>    避免被flutter几百个Widget搞晕劝退服务的，后面会陆续增加一些其他主题。

自2022年12月开始接触flutter几个月下来，发现flutter非常适合后端程序员搞UI，完全没有css、各种js脚手架等的麻烦问题，
而且关键是，一门技术跑各端，还跑的贼快，如果您是一名独立开发者，那就更合适了，web版、桌面版、手机版都可以搞，妙啊。

## flutter_note项目介绍

### DartPad很棒但是很慢

官网大量DartPad范例，但很难跑起来，等半天都不知道Widget长啥样，查阅UI文档，就是想快速，但其编译后显示的范例模型，
造成其加载龟速，加上某些你懂的原因，等半天都不一定能跑出结果，我用肉眼大数据统计了一下，
在耐心丧失前的加载成功率为13% o(一︿一+)o ，急死人。

### 于是我想重塑范例程序

如果用flutter写笔记，那笔记中的范例，不就可以立刻展示出来了吗，look：
''');

  print.$____________________________________________________________________();
  print(
    Row(
      children: <Widget>[
        ...List.generate(3, (index) {
          return Expanded(
              child: Container(
            height: 200,
            color: Colors.primaries[index % Colors.primaries.length],
          ));
        })
      ],
    ),
  );

  print.$____________________________________________________________________();
  print.markdown(r'''
如果只是实验性的摆弄几下长宽高或者对齐方式的枚举参数，你还需要等待编译，那等试玩几个枚举，茶都凉了。

所以，我觉得应该像下面一样，你点下mainAxisAlignment换个枚举值看看效果：
''');

  print.$____________________________________________________________________();
  print(
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        ...List.generate(3, (index) {
          return Container(
            width: 50,
            height: 50,
            color: Colors.primaries[index + 5 % Colors.primaries.length],
          );
        })
      ],
    ),
  );

  print.$____________________________________________________________________();
  print.markdown(r'''
暂时不支持代码编辑，因为要编译的，对吧，那是Dartpad的活儿，以后flutter_note的范例可能会加一个Dartpad的链接。

### flutter一切皆widget妙啊

学习flutter的过程中，发现flutter万物皆widget的概念非常棒，通过组合就能完成很多框架需要各类定制的功能，
比如想让一个普通组件拥有Material3设计风格，套个马甲[InkResponse]就行了，look:
''');

  print.$____________________________________________________________________();
  print(
    Column(
      children: [
        const Text("1.普通Text,点我"),
        InkResponse(
          onTap: () {},
          child: const Text("2.包Ink的Text,点我"),
        ),
      ],
    ),
  );

  print.$____________________________________________________________________();
  print.markdown(r'''

组件组合是不是很棒！

### 但是有几百个组件

但是，当我看到flutter组件库几百个组件时（到现在还没数清），就蒙了，组件爆炸啊，因为基于组合的设计思想，导致flutter团队倾向于
把一些很小的功能也拆出来作为一个独立组件，比如[Title]这种设置操作系统标题的功能，都能独立出一个Widget.
成百上千的Widget，如何学习、选用都是难题。官网及很多github范例库并没有让人更省心。

  ''');
}
