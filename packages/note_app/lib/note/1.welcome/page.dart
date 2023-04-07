import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';
import 'package:note_mate_flutter/material.dart';

PageMeta page = PageMeta(
  shortTitle: "welcome flutter note",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
# flutter note项目

>  **🚫Tip:**
> 本笔记项目当前主要目标：动态可视化的flutter速查表 。
> 主要是为像我一样学了点dart/flutter基础，避免被flutter几百个Widget搞晕劝退服务的，后面会陆续增加一些其他主题。

自2022年12月开始接触flutter几个月下来，发现flutter非常适合后端程序员搞UI，完全没有css、各种js脚手架等的麻烦问题，
而且关键是，一门技术跑各端，还跑的贼快，如果您是一名独立开发者，那就更合适了，web版、桌面版、手机版都可以搞，妙啊。

## flutter_note项目介绍

### DartPad很棒但是很慢

官网大量DartPad范例，但很难跑起来，等半天都不知道Widget长啥样，查阅UI文档，就是想快速，但其编译后显示的范例模型，
造成其加载龟速，加上某些你懂的原因，等半天都不一定能跑出结果，我用肉眼大数据统计了一下，在耐心丧失前的加载成功率为13% o(一︿一+)o ，急死人。

### 于是我想重塑范例程序

如果用flutter写笔记，那笔记中的范例，不就可以立刻展示出来了吗，look：
''');
  pen.sampleMate(
      Row$Mate(
        children: <Widget>[
          ...List.generate(3, (index) {
            return Expanded$Mate(
                child: Container$Mate(
              height: 100,
              color: Colors.primaries[index % Colors.primaries.length],
            ));
          })
        ],
      ),
      isShowEidtors: false);

  pen.markdown(r'''
如果只是实验性的摆弄几下长宽高或者对齐方式的枚举参数，你还需要等待编译，那等试玩几个枚举，茶都凉了。

所以，我觉得应该像下面一样，你点下mainAxisAlignment换个枚举值看看效果：
''');
  pen.sampleMate(Row$Mate(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      ...List.generate(3, (index) {
        return Container$Mate(
          width: 100,
          height: 100,
          color: Colors.primaries[index + 5 % Colors.primaries.length],
        );
      })
    ],
  ));

  pen.markdown(r'''
暂时不支持代码编辑，因为要编译的，对吧，那是Dartpad的活儿，以后flutter_note的范例可能会加一个Dartpad的链接。
  
### flutter一切皆widget妙啊

学习flutter的过程中，发现flutter万物皆widget的概念非常棒，通过组合就能完成很多框架需要各类定制的功能，
比如想让一个普通组件拥有Material3设计风格，套个马甲[InkResponse]就行了，look:
''');

  pen.sampleMate(Column$Mate(
    children: [
      Text$Mate("1.普通Text,点我"),
      InkResponse$Mate(
        onTap: () {},
        child: Text$Mate("2.包Ink的Text,点我"),
      ),
    ],
  ));

  pen.markdown(r'''

组件组合是不是很棒！

### 但是有几百个组件

但是，当我看到flutter组件库几百个组件时（到现在还没数清），就蒙了，组件爆炸啊，因为基于组合的设计思想，导致flutter团队倾向于
把一些很小的功能也拆出来作为一个独立组件，比如[Title]这种设置操作系统标题的功能，都能独立出一个Widget.
成百上千的Widget，如何学习、选用都是难题。官网及很多github范例库并没有让人更省心。

### 如果有个速查表多好

速查表，所见即所得的速查表，并且好好分分类，是的，这就是本项目目标。你在左边导航[Cheat sheet]下看看，比如【按钮】，已经在写了，

### 深入的主题文章较少

还有官网和一些flutter书籍、文章中，核心概念介绍的不尽如人意，比如状态管理，导航管理等。flutter还在爆发期，
学习资源赶不上技术进步。所以，我还想撰写一些核心概念的专题文章，来印证我对flutter的理解，帮助后面踩坑的同学们。

## flutter_note纲要计划

>  **🚫Tip:**
> 暂不打算写Cupertino相关笔记，看看flutter/src/cupertino目录中的代码数量，很少啊，是认真在搞吗？我们还是学好material相关吧。


下面内容为flutter_note项目的提供一个全局视图，后续会逐步填充各个主题页面。

## Flutter cheatsheet计划

Widget无数，内容太多，先分个大类：

- 组件Component
  - 容器： 放东西用的
  - 独立组件： 特定功用的较独立的组件
- Theme 主题
- 国际化
- ...

因为Widget数量太多了，所以Widget自己要分分类，从中分离出Compoent的概念，这是UI开发的核心，
material.io对Compoent的定义如下：

>  **📣Tip:**
> Components are interactive building blocks for creating a user interface. 
> They can be organized into five categories based on their purpose: Action, containment, 
> navigation, selection, and text input.
> <https://m3.material.io/components>
> <https://api.flutter.dev/flutter/material/ThemeData/useMaterial3.html>
> [catalog of layout widgets : https://flutter.dev/widgets/layout/ ](https://flutter.dev/widgets/layout/)

一般UI框架都会提供几十个核心Components，比如[antd](https://ant.design/components)、[MUI](https://mui.com/material-ui/)等，
也是以Components为核心概念。

组件中，需要区分容器组件和非容器组件：

- 容器组件：不像MenuBar\AppBar\Column这种，它们本身没啥具体功能，你里面放啥，就能干啥，这种就是容器组件。
- 非容器组件：有特殊功能比如[ElevatedButton]，虽然也能塞其他Widget到child里，但其主要是为点击服务的，

容器组件就像田地，内容组件是田里种的稻子，田里不光能种稻子，还能养猪，种稻子是农业，养猪就是畜牧业了，而稻子你再改良
，它还是稻子，所以容器本身一般没有具体具体内容和意义，只有放进去东西了才有了内容和意义，而非内容的独立组件自己就有一定的意义或承载某方面内容。

这样分类后，挑选组件时，又减负一次。

有些组件，尤其是容器相关组件，围绕它存在的一些小的附属组件，比如MenuBar相关的CheckboxMenuButton、SubmenuButton等，
我们就不单独归类了，直接归为所依附的MenuBar组件群中。

除了组件概念外，还有一些非常明确的主题分类，比如国际化、Layout等，我们分类的原则是，要么不分类，要分类就不要产生混淆。
加上这些，本flutter_note项目的速查细目分类如下：

### 放其他组件的容器

- [ ] APP级框架组件：App的大框框，学习和使用都要整体考虑的组件。
  - App
  - Scaffold
  - Dialogs: Dialog, AlertDialog
- [ ] 各类Bar
  - AppBar
  - BottomAppBar
  - NavigationBar  (new, replacing BottomNavigationBar)
  - NavigationRail
  - TabBar: TabBar+Tab+TabBarView
  - SnackBar
- [ ] 各类Menu
  - MenuBar
  - DropdownMenu  
- [ ] Drawer 抽屉
  - Drawer 不导航
  - NavigationDrawer 可导航
- [ ] BottomSheet  
- [ ] 可展开容器
  - ExpansionPanelList
  - ExpansionTile
- [ ] 增加Material特效的
  - Material
  - InkResponse：InkWell 
- [ ] 通用容器：通用容器、万金油，无特定位置限制，放哪都不嫌，放啥都可以，和其他组件是拼凑组合关系，用以包含内容、数据、输入、动作、导航等其他组件
  - Card
  - ListTile
  - ListView： (和ListBody的区别)
  - DataTable
  - GridView
  - Container
  - Stack
  - Flex相关: Column、Row、Flexible、Expanded、[Spacer]
  - Align：Center
  - Padding
  - Wrap
  - SizedBox
  - Placeholder
  - SingleChildScrollView, whose documentation discusses some ways to use a Column inside a scrolling container.
  - Stepper    
  - Sliver系列
  
### 比较独立的组件

较为独立的、主要目的不是用来做容器（虽然可能赛其他Widget到child），而是特定功用的，比如为呈现某些信息，录入信息等，
这种组件，一般比较小，也有例外，比如编辑器等：

- [x] Buttons
- [ ] 文本内容
  - Text 
  - RichText
  - Markdown
- [ ] 图片、图标多媒体组件
  - Icon
  - Image
- [ ] 进度条Progress indicators
  - CircularProgressIndicator
  - LinearProgressIndicator
- [ ] inputs
  - TextField
  - Checkbox、CheckboxListTile
  - Switch、SwitchListTile
  - Chips：Chip、ActionChip、FilterChip、ChoiceChip、InputChip  
  - Radio button: Radio、RadioListTile  
  - Slider：Used to select from a range of values.
  - CalendarDatePicker
- [ ] Badges [api-Badges](https://api.flutter.dev/flutter/material/Badge-class.html)
- [ ] Divider:VerticalDivider
- [ ] SafeArea
- [ ] Tooltip

### 主题Theme

### 国际化

### 布局

## 综合专题计划

### 如何选用合适的布局

### 状态管理的十八般武艺

### Navigation v1 vs v2

### 动画的艺术

### 主题Theme

### 性能之殇

### dev踩坑

  ''');
}
