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

## 索引
- Top级容器：
  - App
  - Scaffold
  - Dialogs: Dialog, AlertDialog
  - BottomSheet  
- 通用容器，可包含在任意位置的其他容器中，用以包含主内容、数据、输入等其他组件
  - Card
  - ListView：ListTile
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
- 辅助容器，为主内容区做辅助服务的容器，比如导航，状态栏、菜单、工具栏、各种Bar
  - AppBar
  - BottomAppBar
  - NavigationBar  (new, replacing BottomNavigationBar)
  - BottomNavigationBar
  - TabBar: TabBar+Tab+TabBarView
  - SnackBar
  - NavigationDrawer
  - NavigationRail
  - MenuBar
  - DropdownMenu
- 功能组件：较为独立的、主要不是用来做容器的功能组件，通常功能单一，比较小，也有例外，比如编辑器
  - Buttons
  - Badges [api-Badges](https://api.flutter.dev/flutter/material/Badge-class.html)
  - Divider
  - Progress indicators: CircularProgressIndicator, LinearProgressIndicator
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
