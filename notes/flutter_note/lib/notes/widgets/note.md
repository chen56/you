# cheetsheet 纲要

## flutter_note纲要计划

>  **🚫Tip:**
> 暂不打算写Cupertino相关笔记，看看flutter/src/cupertino目录中的代码数量，很少啊，是认真在搞吗？我们还是学好material相关吧。


下面内容为flutter_note项目的提供一个全局视图，后续会逐步填充各个主题页面。

## Flutter cheatsheet计划

Widget分类：

- 组件Component
  - 布局组件： 专门用来布局
  - 容器： 放其他组件，但又不算特别用来布局的
  - 特定功能组件： 特定功用的较独立的组件
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
- [x] 各类Bar
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
- [ ] OrientationBuilder 根据屏幕方向更新界面


## state 相关

- ValueListenableBuilder

### 主题Theme

### 国际化

### 布局

### 调试和诊断

- diagnostics.dart


## 综合专题计划

### 如何选用合适的布局

### 状态管理的十八般武艺

### Navigation v1 vs v2

### 动画的艺术

### 主题Theme

### 性能之殇

### dev踩坑
