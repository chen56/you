import 'package:flutter/material.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "Components",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
# Components️

>  **📣Tip:**
> Components are interactive building blocks for creating a user interface. They can be organized into five categories based on their purpose: Action, containment, navigation, selection, and text input.
> <https://m3.material.io/components>
> <https://api.flutter.dev/flutter/material/ThemeData/useMaterial3.html>
> [catalog of layout widgets : https://flutter.dev/widgets/layout/ ](https://flutter.dev/widgets/layout/)

flutter 一切皆Widget的理念，确实很灵活，但也造成了Widget爆炸，
比如[Title]这种设置操作系统标题的功能，都能独立出一个Widget.
成百上千的Widget，如何分类、选用、认识都是难题。

## 索引

尝试按以下分类认识flutter：

- Top级容器：
  - App
  - Scaffold
  - Dialogs: Dialog, AlertDialog
  - BottomSheet  
- 通用容器，可包含在任意位置的其他容器中，用以包含主内容、数据、输入等其他组件
  - Card
  - ListView：ListTile (和ListBody的区别)
  - Container
  - Flex相关: Column、Row、Flexible、Expanded、[Spacer]
  - Align：Center
  - Padding
  - Wrap
  - SizedBox
  - Placeholder
  - SingleChildScrollView, whose documentation discusses some ways to use a Column inside a scrolling container.
  - 可展开容器
    - ExpansionPanelList
    - ExpansionTile
- 辅助容器，为主内容区做辅助服务的容器，比如菜单、各种Bar工具栏、状态栏
  - 各类Bar
    - AppBar
    - BottomAppBar
    - NavigationBar  (new, replacing BottomNavigationBar)
    - NavigationRail
    - TabBar: TabBar+Tab+TabBarView
    - SnackBar
  - Drawer 抽屉
    - Drawer 不导航
    - NavigationDrawer 可导航
  - 各类Menu
    - MenuBar
    - DropdownMenu
- 功能组件：较为独立的、主要不是用来做通用容器的，具有特殊功能性，一般比较小，也有例外，比如编辑器等
  - Buttons
  - Text RichText
  - Badges [api-Badges](https://api.flutter.dev/flutter/material/Badge-class.html)
  - Divider:VerticalDivider
  - Progress indicators: CircularProgressIndicator, LinearProgressIndicator
  - SafeArea
  - inputs
    - TextField
    - Checkbox、CheckboxListTile
    - Switch、SwitchListTile
    - Chips：Chip、ActionChip、FilterChip、ChoiceChip、InputChip  
    - Radio button: Radio、RadioListTile  
    - Slider：Used to select from a range of values.
- 其他
  - Material
  - InkResponse：InkWell 


## bar

  ''');
}
