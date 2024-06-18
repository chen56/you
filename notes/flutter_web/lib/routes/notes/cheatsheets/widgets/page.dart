import 'package:flutter/material.dart';
import 'package:flutter_web/app.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Decorator_Badge.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Decorator_Card.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Decorator_CircleAvatar.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Feedback_ProgressIndicator.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Feedback_RefreshIndicator.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Feedback_SnackBar.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_ActionChip.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_ButtonStyleButton.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_CalendarDatePicker.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_Checkbox.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_CheckboxListTile.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_Chip.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_ChoiceChip.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_DropdownMenu.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_FilterChip.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_FloatingActionButton.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_IconButton.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_InputChip.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_SearchAnchor.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_SegmentButton.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_Radio.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_Slider.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_Switch.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_TextField.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_showDatePicker.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_showDateRangePicker.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_showTimePicker.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/LayoutCore_ContainerCell.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_AppBar.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_BottomAppBar.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_Menu.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_NavigationBar.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_NavigationDrawer.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_NavigationRail.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_SliverAppBar.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_TabBar.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Overlays_BottomSheet.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Overlays_Dialog.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Spacer_Divider.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Spacer_Placeholder.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Spacer_Spacer.dart';
import 'package:flutter_web/views/cell_layouts.dart';
import 'package:you_flutter/note.dart';

@NoteAnnotation(label: "Widgets", publish: true)
void build(BuildContext context, Cell print) {
  var all = Column(
    children: [
      Level1MasonryLayout(title: "导航与页面", cellWidth: 350, children: [
        FlutterExample(title: "BottomAppBar", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Navigation_BottomAppBar_dart, child: const Navigation_BottomAppBar()),
        FlutterExample(title: "NavigationBar", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Navigation_NavigationBar_dart, child: Navigation_NavigationBar()),
        FlutterExample(title: "NavigationDrawer", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Navigation_NavigationDrawer_dart, child: Navigation_NavigationDrawer()),
        FlutterExample(title: "NavigationRail", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Navigation_NavigationRail_dart, child: Navigation_NavigationRail()),
        FlutterExample(title: "TabBar", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Navigation_TabBar_dart, child: const Navigation_TabBar()),
        FlutterExample(title: "MenuCell", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Navigation_Menu_dart, child: const Navigation_Menu()),
        FlutterExample(title: "AppBar", height: 150, source: assets.lib_routes_notes_cheatsheets_widgets__examples_Navigation_AppBar_dart, child: Navigation_AppBar()),
        FlutterExample(title: "SliverAppBar", height: 200, source: assets.lib_routes_notes_cheatsheets_widgets__examples_Navigation_SliverAppBar_dart, child: Navigation_SliverAppBar()),
      ]),
      Level1MasonryLayout(title: "分割、填充、留白", cellWidth: 300, children: [
        FlutterExample(title: "Divider", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Spacer_Divider_dart, child: const Spacer_Divider()),
        FlutterExample(title: "Spacer", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Spacer_Spacer_dart, child: const Spacer_Spacer()),
        FlutterExample(title: "Placeholder", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Spacer_Placeholder_dart, child: const Spacer_Placeholder()),
      ]),
      Level1MasonryLayout(title: "布局,Layout", cellWidth: 500, children: [
        FlutterExample(title: "Container", source: assets.lib_routes_notes_cheatsheets_widgets__examples_LayoutCore_ContainerCell_dart, child: const LayoutCore_ContainerCell()),
      ]),
      Level1MasonryLayout(title: "form&button&input", cellWidth: 500, children: [
        FlutterExample(title: "ButtonStyleButton", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Form_ButtonStyleButton_dart, child: const Form_ButtonStyleButtonExample()),
        FlutterExample(title: "FloatingActionButton", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Form_FloatingActionButton_dart, child: const Form_FloatingActionButton()),
        FlutterExample(title: "IconButton", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Form_IconButton_dart, child: const Form_IconButton()),
        FlutterExample(title: "SearchAnchor", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Form_SearchAnchor_dart, child: const Form_SearchAnchor()),
        FlutterExample(title: "SegmentButton", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Form_SegmentButton_dart, child: const Form_SegmentButton()),
        FlutterExample(title: "Checkbox", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Form_Checkbox_dart, child: const Form_Checkbox()),
        FlutterExample(title: "CheckboxListTile", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Form_CheckboxListTile_dart, child: Form_CheckboxListTile()),
        FlutterExample(title: "Chip", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Form_Chip_dart, child: Form_Chip()),
        FlutterExample(title: "ActionChip", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Form_ActionChip_dart, child: Form_ActionChip()),
        FlutterExample(title: "ChoiceChip", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Form_ChoiceChip_dart, child: Form_ChoiceChip()),
        FlutterExample(title: "FilterChip", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Form_FilterChip_dart, child: Form_FilterChip()),
        FlutterExample(title: "InputChip", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Form_InputChip_dart, child: Form_InputChip()),
        FlutterExample(title: "showDateRangePicker", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Form_showDateRangePicker_dart, child: Form_showDateRangePicker()),
        FlutterExample(title: "showDatePicker", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Form_showDatePicker_dart, child: Form_showDatePicker()),
        FlutterExample(title: "CalendarDatePicker", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Form_CalendarDatePicker_dart, child: Form_CalendarDatePicker()),
        FlutterExample(title: "showTimePicker", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Form_showTimePicker_dart, child: Form_showTimePicker()),
        FlutterExample(title: "Radio", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Form_Radio_dart, child: Form_Radio()),
        FlutterExample(title: "DropdownMenu", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Form_DropdownMenu_dart, child: const Form_DropdownMenu()),
        FlutterExample(title: "Slider", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Form_Slider_dart, child: Form_Slider()),
        FlutterExample(title: "Switch", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Form_Switch_dart, child: Form_Switch()),
        FlutterExample(title: "TextField", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Form_TextField_dart, child: Form_TextField()),
      ]),
      Level1MasonryLayout(title: "Feedback", cellWidth: 300, children: [
        FlutterExample(title: "ProgressIndicator", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Feedback_ProgressIndicator_dart, child: Feedback_ProgressIndicator()),
        FlutterExample(title: "RefreshIndicator", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Feedback_RefreshIndicator_dart, child: Feedback_RefreshIndicator()),
        FlutterExample(title: "SnackBar", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Feedback_SnackBar_dart, child: const Feedback_SnackBar()),
      ]),
      Level1MasonryLayout(title: "Overlays", cellWidth: 500, children: [
        FlutterExample(title: "dialog", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Overlays_Dialog_dart, child: const Overlays_Dialog()),
        FlutterExample(title: "BottomSheet", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Overlays_BottomSheet_dart, child: Overlays_BottomSheet()),
      ]),
      Level1MasonryLayout(title: "装饰器,Decorator", cellWidth: 500, children: [
        FlutterExample(title: "Card", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Decorator_Card_dart, child: const Decorator_Card()),
        FlutterExample(title: "Badge", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Decorator_Badge_dart, child: const Decorator_Badge()),
        FlutterExample(title: "CircleAvatar", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Decorator_CircleAvatar_dart, child: const Decorator_CircleAvatar()),
      ]),
    ],
  );

  print(all);
}
