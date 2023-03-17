import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';

import 'package:note_app/note/state/1.vanilla_state/1.1.hello.dart' as stateful_hello;

PageMeta page = PageMeta(
  shortTitle: "最原始的状态管理",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
## 范例1 普通文本 

什么是状态管理？在Flutter UI中，
> UI=f(tate)
> [flutter.cn: 状态管理中的声明式编程思维](https://flutter.cn/docs/development/data-and-backend/state-mgmt/declarative)

## 纯Stateful实现



| 需求                         | 需求范例        | 纯Stateful   | InheritedWidget | 纯变量       |
|-----------------------------|----------------|-------------|-----------------|-----------|
| 单组件状态                    | Wifi开关       | 简单、自然     | 无法实现            | 可实现,简单、自然 |
| 子组件使用父组件的状态，一起更新  | 简单、自然       | 简单、自然     | 可实现，复杂性高        | 可实现,相对简单  |
| 子组件使用父组件的状态，局部更新  | 很难实现        | 很难实现      | 可实现，适合这个场景      | 可实现, 相对简单 |
| 父组件使用子组件的状态，数据向上流 | ？？？         | ？？？       | ？？？             | ？？？       |
| 全局状态                      | 很难实现        | 很难实现      | 可实现，不直观         | 可实现, 相对简单 |

- 单组件状态：按钮被点击次数、按下去
- 跨组件状态：Theme、禁用组件树，SharedAppData
  - 父状态被子使用，全部更新
  - 
- 全局状态：环境变量、联网状态、用户登陆状态等



简单来讲，你点手机的WIFI图标，代码执行`wifiEnable=!wifiEnable`后，WIFI图标从亮变灰，这个过程就是状态管理。

- 一个Wifi按钮，从开启Wifi到关闭Wifi的变化

State
  最简单的StatefulWidget

  ''');

  pen.sample(const stateful_hello.App());

  pen.markdown(r'''
## InheritedWidget有点麻烦 

多个状态管理，需要aspect，或每个状态一个nheritedWidget

觉得自己写注册listener麻烦，怕写错，可以用ListenableBuilder或ValueListenableBuilder替代。

平台中重要的组件使用了InheritedWidget，特点是每个组件只管理一种数据

Theme.of(context)
Localizations.localeOf(context)

，但业务应用可能没必要每种数据都搞一个组件：

UserInheritedWidget
OrderInheritedWidget
ProductInheritedWidget
xxxxInheritedWidget

集中存放是不是更简单：

ParentWidget
   users
   orders
   products
   xxx

  ''');
}
