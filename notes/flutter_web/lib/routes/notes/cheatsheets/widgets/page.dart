import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web/app.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_ActionChip.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_ButtonStyleButton.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_CalendarDatePicker.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_Checkbox.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_CheckboxListTile.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_Chip.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_ChoiceChip.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_FilterChip.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_FloatingActionButton.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_IconButton.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_InputChip.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_SearchAnchor.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_SegmentButton.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_showDatePicker.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Form_showDateRangePicker.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/LayoutCore_ContainerCell.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_AppBar.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_BottomAppBar.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_Menu.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_NavigationBar.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_NavigationDrawer.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_NavigationRail.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_SliverAppBar.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_TabBar.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Spacer_Divider.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Spacer_Placeholder.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Spacer_Spacer.dart';
import 'package:flutter_web/views/cell_layouts.dart';
import 'package:you_flutter/note.dart';
import 'package:you_flutter/state.dart';

@NoteAnnotation(label: "Widgets", publish: true)
void build(BuildContext context, Cell print) {
  ButtonAndInput buttonAndInput = ButtonAndInput();
  TextAndInfoAndTip textAndInfoAndTip = TextAndInfoAndTip();
  AdvancedTemplateContainer advancedTemplateContainer = AdvancedTemplateContainer();
  Decorator decorator = Decorator();

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
        FlutterExample(title: "timePicker", child: buttonAndInput.timePicker()),
        FlutterExample(title: "DropdownMenu", child: buttonAndInput.dropdownMenu()),
        FlutterExample(title: "Radio", child: buttonAndInput.radio()),
        FlutterExample(title: "Slider", child: buttonAndInput.slider()),
        FlutterExample(title: "Switch", child: buttonAndInput.switchs()),
        FlutterExample(title: "TextField", child: buttonAndInput.textField()),
      ]),
      Level1MasonryLayout(title: "text&info&tip", cellWidth: 300, children: [
        FlutterExample(title: "Badge", child: textAndInfoAndTip.badgesCell()),
        FlutterExample(title: "ProgressIndicator", child: textAndInfoAndTip.progressIndicatorCell()),
        FlutterExample(title: "ProgressIndicator2", child: textAndInfoAndTip.progressIndicator2Cell()),
        FlutterExample(title: "CircleAvatar", child: textAndInfoAndTip.circleAvatar()),
      ]),
      Level1MasonryLayout(title: "高级模版容器,Advanced template container", cellWidth: 500, children: [
        FlutterExample(title: "SnackBar", child: advancedTemplateContainer.snackBarCell()),
        FlutterExample(title: "dialog", child: advancedTemplateContainer.dialog()),
        FlutterExample(title: "bottomSheet", child: advancedTemplateContainer.bottomSheetCell()),
      ]),
      Level1MasonryLayout(title: "装饰器,Decorator", cellWidth: 500, children: [
        FlutterExample(title: "Card", child: decorator.cardCell()),
      ]),
    ],
  );

  print(all);
}

class ButtonAndInput {
  Widget timePicker() {
    final Value<TimeOfDay?> time = (null as TimeOfDay?).signal();
    return Watch(
      builder: (context) {
        return Column(
          children: <Widget>[
            Text("date: ${time.value}"),
            TextButton.icon(
              onPressed: () async {
                TimeOfDay? selected = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                time.value = selected;
              },
              icon: const Icon(Icons.timer_outlined),
              label: const Text('showTimePicker dialog'),
            ),
          ],
        );
      },
    );
  }

  Widget dropdownMenu() {
    return Column(
      children: [
        Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
          const Text("enableFilter: true "),
          DropdownMenu<TargetPlatform>(
            label: const Text('platform'),
            enableFilter: true,
            onSelected: (value) {},
            dropdownMenuEntries: TargetPlatform.values.map((e) {
              return DropdownMenuEntry<TargetPlatform>(value: e, label: e.name);
            }).toList(),
          )
        ]),
        Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
          const Text("enableFilter: false"),
          DropdownMenu<TargetPlatform>(
            label: const Text('platform'),
            enableFilter: false,
            onSelected: (value) {},
            dropdownMenuEntries: TargetPlatform.values.map((e) {
              return DropdownMenuEntry<TargetPlatform>(value: e, label: e.name);
            }).toList(),
          ),
        ]),
      ],
    );
  }

  Widget radio() {
    List<TargetPlatform> targets = List.of([TargetPlatform.linux, TargetPlatform.windows, TargetPlatform.macOS]);
    final Value<TargetPlatform?> radioListTile = (null as TargetPlatform?).signal();
    final Value<TargetPlatform?> radio = (null as TargetPlatform?).signal();
    return Watch(
      builder: (context) {
        return Column(
          children: <Widget>[
            Wrap(
              children: [
                const Text("RadioListTile:"),
                for (var t in targets)
                  RadioListTile<TargetPlatform>(
                    title: Text(t.name),
                    value: t,
                    groupValue: radioListTile.value,
                    toggleable: true,
                    onChanged: (value) => radioListTile.value = value,
                  ),
                const Text("Radio:"),
                for (var t in targets)
                  ListTile(
                    title: Text(t.name),
                    leading: Radio<TargetPlatform>(
                      value: t,
                      groupValue: radio.value,
                      onChanged: (value) => radio.value = value,
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget slider() {
    final Value<double> slider1 = 0.0.signal();
    final Value<double> slider2 = 0.0.signal();
    return Watch(
      builder: (context) {
        return Column(
          children: <Widget>[
            Slider(
              max: 100,
              value: slider1.value,
              onChanged: (value) {
                slider1.value = value;
              },
            ),
            Text(slider1.value.toStringAsFixed(2)),
            Slider(
              max: 100,
              divisions: 5,
              secondaryTrackValue: 42,
              value: slider2.value,
              label: slider2.value.toString(),
              onChanged: (value) {
                slider2.value = value;
              },
            ),
            Text("${slider2.value}"),
          ],
        );
      },
    );
  }

  Widget switchs() {
    final Value<bool> switch1 = false.signal();
    final Value<bool> switchListTile1 = false.signal();
    return Watch(
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text("Switch"),
            Switch(value: switch1.value, onChanged: (value) => switch1.value = value),
            Switch(value: switch1.value, onChanged: null),
            const Divider(),
            const Text("SwitchListTile"),
            SwitchListTile(title: const Text("enable"), value: switchListTile1.value, onChanged: (value) => switchListTile1.value = value),
            SwitchListTile(title: const Text("disable"), value: switchListTile1.value, onChanged: null),
          ],
        );
      },
    );
  }

  Widget textField() {
    return Watch(
      builder: (context) {
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              obscureText: true,
              decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Password'),
            ),
            SizedBox(height: 10),
            TextField(
              maxLength: 10,
              maxLengthEnforcement: MaxLengthEnforcement.none,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '手机号/Phone',
                errorText: '手机号不能为空/phone should not empty',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'disable ',
                enabled: false,
              ),
            ),
          ],
        );
      },
    );
  }
}

class TextAndInfoAndTip {
  Widget circleAvatar() {
    return const Row(children: [
      CircleAvatar(child: Text('C')),
      CircleAvatar(child: Icon(Icons.account_box)),
      CircleAvatar(backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/2039742')),
      CircleAvatar(backgroundImage: NetworkImage('https://img2.baidu.com/it/u=3784833129,896943374&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500')),
    ]);
  }

  Widget badgesCell() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Badge.count(count: 1000, child: const Icon(Icons.mail_outlined)),
      const Badge(child: Icon(Icons.sms_failed_outlined)),
      Badge.count(count: 23, child: ElevatedButton(onPressed: () {}, child: const Text("Button"))),
      const Badge(
        label: Text("2000 ¥"),
        alignment: AlignmentDirectional.bottomCenter,
        child: Card(
          elevation: 4,
          color: Colors.green,
          child: Padding(padding: EdgeInsets.all(20), child: Text('Card')),
        ),
      ),
    ]);
  }

  Widget progressIndicatorCell() {
    final selected = false.signal();
    return Watch(builder: (context) {
      return Row(children: [
        IconButton(
          isSelected: selected.value,
          selectedIcon: const Icon(Icons.pause),
          icon: const Icon(Icons.play_arrow),
          onPressed: () {
            selected.value = !selected.value;
          },
        ),
        CircularProgressIndicator(value: selected.value ? null : 0.9),
        Expanded(
          child: LinearProgressIndicator(value: selected.value ? null : 0.9),
        ),
      ]);
    });
  }

  Widget progressIndicator2Cell() {
    final selected = false.signal();
    return Watch(
      builder: (context) {
        return Column(children: [
          const Text("RefreshIndicator 下拉刷新(Pull down to refresh)"),
          SizedBox(
            height: 200,
            child: RefreshIndicator(
              onRefresh: () async {
                selected.value = true;
                await Future.delayed(const Duration(seconds: 3)); // mock delay
                selected.value = false;
              },
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 5, // 示例数据数量
                itemBuilder: (context, index) {
                  return ListTile(title: Text('Item ${index + 1}/5'));
                },
              ),
            ),
          ),
        ]);
      },
    );
  }
}

class AdvancedTemplateContainer {
  Widget snackBarCell() {
    return Builder(
        builder: (context) => TextButton(
              onPressed: () {
                final snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: const Text('SnackBar'),
                  action: SnackBarAction(
                    label: 'Close',
                    onPressed: () {},
                  ),
                );

                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text(
                'SnackBar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ));
  }

  Widget bottomSheetCell() {
    Value<PersistentBottomSheetController?> bottomSheetController = (null as PersistentBottomSheetController?).signal();

    final bar = NavigationBar(
      selectedIndex: 0,
      destinations: [
        NavigationDestination(icon: Badge.count(count: 1000, child: const Icon(Icons.mail_outlined)), label: 'Mail'),
        const NavigationDestination(icon: Badge(label: Text('10'), child: Icon(Icons.chat_bubble_outline)), label: 'Chat'),
        const NavigationDestination(icon: Badge(child: Icon(Icons.group_outlined)), label: 'Rooms'),
        NavigationDestination(icon: Badge.count(count: 3, child: const Icon(Icons.videocam_outlined)), label: 'Meet'),
      ],
    );
    return Watch(builder: (context) {
      return Wrap(
        alignment: WrapAlignment.spaceEvenly,
        children: [
          TextButton(
            child: const Text('modal bottom sheet'),
            onPressed: () {
              showModalBottomSheet<void>(showDragHandle: true, context: context, builder: (context) => bar);
            },
          ),
          TextButton(
            child: Text(bottomSheetController.value == null ? 'open bottom sheet' : 'close bottom sheet'),
            onPressed: () {
              if (bottomSheetController.value != null) {
                bottomSheetController.value?.close();
                bottomSheetController.value = null;
                return;
              }
              bottomSheetController.value = showBottomSheet(context: context, builder: (context) => bar);
            },
          ),
        ],
      );
    });
  }

  Widget dialog() {
    return Builder(builder: (context) {
      return Wrap(
        alignment: WrapAlignment.spaceEvenly,
        children: [
          TextButton(
            child: const Text('dialog'),
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('''AlertDialog'''),
                  content: const Text('''
A Material Design alert dialog.
An alert dialog (also known as a basic dialog) informs the user about
situations that require acknowledgment. An alert dialog has an optional
title and an optional list of actions. The title is displayed above the
content and the actions are displayed below the content.'''),
                  actions: <Widget>[
                    FilledButton(child: const Text('Ok'), onPressed: () => Navigator.of(context).pop()),
                  ],
                ),
              );
            },
          ),
          TextButton(
            child: const Text('Dialog.fullscreen'),
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (context) => Dialog.fullscreen(
                  child: AppBar(
                    title: const Text('Dialog.fullscreen'),
                    centerTitle: false,
                    leading: IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.of(context).pop()),
                  ),
                ),
              );
            },
          ),
        ],
      );
    });
  }
}

class Decorator {
  Widget cardCell() {
    return Builder(builder: (context) {
      var colors = Theme.of(context).colorScheme;
      return Wrap(
        children: [
          Card(
            elevation: 4,
            child: Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
              child: const Text('Elevated'),
            ),
          ),
          Card(
            elevation: 0,
            color: colors.surfaceDim,
            child: Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              child: const Text('Filled'),
            ),
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: colors.outlineVariant),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              child: const Text('Border'),
            ),
          ),
        ],
      );
    });
  }
}
