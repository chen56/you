import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web/app.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Input_ButtonStyleButton.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Input_FloatingActionButton.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_AppBar.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_BottomAppBar.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_Menu.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_NavigationBar.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_NavigationDrawer.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_NavigationRail.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_SliverAppBar.dart';
import 'package:flutter_web/routes/notes/cheatsheets/widgets/_examples/Navigation_TabBar.dart';
import 'package:flutter_web/views/cell_layouts.dart';
import 'package:you_flutter/note.dart';
import 'package:you_flutter/state.dart';

@NoteAnnotation(label: "Widgets", publish: true)
void build(BuildContext context, Cell print) {
  SpacerAndDivider spacerAndDivider = SpacerAndDivider();
  LayoutCore layoutCore = LayoutCore();
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
        FlutterExample(title: "SliverAppBar",height: 200, source: assets.lib_routes_notes_cheatsheets_widgets__examples_Navigation_SliverAppBar_dart, child: Navigation_SliverAppBar()),
      ]),
      Level1MasonryLayout(title: "分割、填充、留白", cellWidth: 300, children: [
        FlutterExample(title: "Divider", child: spacerAndDivider.divider()),
        FlutterExample(title: "Spacer", child: spacerAndDivider.spacer()),
        FlutterExample(title: "Placeholder", child: spacerAndDivider.placeholder()),
      ]),
      Level1MasonryLayout(title: "布局,Layout", cellWidth: 500, children: [
        FlutterExample(title: "Container", child: layoutCore.containerCell()),
      ]),
      Level1MasonryLayout(title: "button&input&form", cellWidth: 500, children: [
        FlutterExample(title: "ButtonStyleButton", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Input_ButtonStyleButton_dart, child: const Input_ButtonStyleButtonExample()),
        FlutterExample(title: "FloatingActionButton", source: assets.lib_routes_notes_cheatsheets_widgets__examples_Input_FloatingActionButton_dart, child: const Input_FloatingActionButton()),
        FlutterExample(title: "IconButton", child: buttonAndInput.iconButtonCell()),
        FlutterExample(title: "SearchAnchor", child: buttonAndInput.search()),
        FlutterExample(title: "segmentButton", child: buttonAndInput.segmentButtonCell()),
        FlutterExample(title: "Checkbox", child: buttonAndInput.checkbox()),
        FlutterExample(title: "CheckboxListTile", child: buttonAndInput.checkboxListTile()),
        FlutterExample(title: "Chip", child: buttonAndInput.chip()),
        FlutterExample(title: "ActionChip", child: buttonAndInput.actionChip()),
        FlutterExample(title: "ChoiceChip", child: buttonAndInput.choiceChip()),
        FlutterExample(title: "FilterChip", child: buttonAndInput.filterChip()),
        FlutterExample(title: "InputChip", child: buttonAndInput.inputChip()),
        FlutterExample(title: "datePicker", child: buttonAndInput.datePicker()),
        FlutterExample(title: "dateRangePicker", child: buttonAndInput.dateRangePicker()),
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
  Widget iconButtonCell() {
    bool standardSelected = false;
    bool filledSelected = false;
    bool outlinedSelected = false;
    bool tonalSelected = false;
    return StatefulBuilder(builder: (context, setState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Text("IconButton()"),
              IconButton(
                isSelected: standardSelected,
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
                onPressed: () => setState(() => standardSelected = !standardSelected),
              ),
              IconButton(
                isSelected: standardSelected,
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
                onPressed: null,
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Text("IconButton.filled()"),
              IconButton.filled(
                isSelected: filledSelected,
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
                onPressed: () {
                  setState(() => filledSelected = !filledSelected);
                },
              ),
              IconButton.filled(
                isSelected: filledSelected,
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
                onPressed: null,
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              const Text("IconButton.filledTonal()"),
              IconButton.filledTonal(
                isSelected: tonalSelected,
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
                onPressed: () {
                  setState(() => tonalSelected = !tonalSelected);
                },
              ),
              IconButton.filledTonal(
                isSelected: tonalSelected,
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
                onPressed: null,
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              const Text("IconButton.outlined()"),
              IconButton.outlined(
                isSelected: outlinedSelected,
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
                onPressed: () {
                  setState(() => outlinedSelected = !outlinedSelected);
                },
              ),
              IconButton.outlined(
                isSelected: outlinedSelected,
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
                onPressed: null,
              ),
            ],
          ),
        ],
      );
    });
  }

  Widget segmentButtonCell() {
    Value<ThemeMode> themeMode = ThemeMode.system.signal();
    Set<TargetPlatform> targetPlatforms = <TargetPlatform>{TargetPlatform.macOS, TargetPlatform.linux}.signal();

    return Watch(builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SegmentedButton<ThemeMode>(
            multiSelectionEnabled: false,
            segments: const <ButtonSegment<ThemeMode>>[
              ButtonSegment<ThemeMode>(value: ThemeMode.light, label: Text('Light'), icon: Icon(Icons.sunny)),
              ButtonSegment<ThemeMode>(value: ThemeMode.system, label: Text('System'), icon: Icon(Icons.brightness_auto)),
              ButtonSegment<ThemeMode>(value: ThemeMode.dark, label: Text('Dark'), icon: Icon(Icons.dark_mode)),
            ],
            selected: <ThemeMode>{themeMode.value},
            onSelectionChanged: (newSelection) {
              themeMode.value = newSelection.first;
            },
          ),
          const SizedBox(height: 10),
          SegmentedButton<TargetPlatform>(
            segments: const <ButtonSegment<TargetPlatform>>[
              ButtonSegment<TargetPlatform>(value: TargetPlatform.android, label: Text('android')),
              ButtonSegment<TargetPlatform>(value: TargetPlatform.fuchsia, label: Text('fuchsia')),
              ButtonSegment<TargetPlatform>(value: TargetPlatform.iOS, label: Text('iOS')),
              ButtonSegment<TargetPlatform>(value: TargetPlatform.linux, label: Text('linux')),
              ButtonSegment<TargetPlatform>(value: TargetPlatform.macOS, label: Text('macOS')),
              ButtonSegment<TargetPlatform>(value: TargetPlatform.windows, label: Text('windows')),
            ],
            selected: targetPlatforms,
            onSelectionChanged: (newSelection) {
              targetPlatforms.clear();
              targetPlatforms.addAll(newSelection);
            },
            multiSelectionEnabled: true,
          ),
        ],
      );
    });
  }

  Widget search() {
    List<String> searchWords = [
      "中国 China",
      "你好 Hello",
      "世界 World",
      "谢谢 Thanks",
      "不 No",
      "是 Yes",
      "对不起 Sorry",
      "没关系 It's okay",
      "再见 Goodbye",
      "爱 Love",
      "喜欢 Like",
      "朋友 Friend",
      "家庭 Family",
      "工作 Work",
      "学习 Study",
      "音乐 Music",
      "电影 Film",
      "书籍 Book",
      "食物 Food",
      "水 Water",
      "太阳 Sun",
      "月亮 Moon",
      "星星 Star",
      "红色 Red",
      "蓝色 Blue",
      "绿色 Green",
      "黄色 Yellow",
      "黑色 Black",
      "白色 White",
      "快乐 Happy",
      "悲伤 Sad",
      "生气 Angry",
      "惊讶 Surprised",
      "思考 Think",
      "梦想 Dream",
      "希望 Hope",
      "和平 Peace",
      "美丽 Beautiful",
      "伟大 Great",
      "小 Small",
      "大 Big",
      "快 Fast",
      "慢 Slow",
      "热 Hot",
      "冷 Cold",
      "年轻 Young",
      "老 Old",
      "男人 Man",
      "女人 Woman",
      "孩子 Child",
      "动物 Animal",
      "自然 Nature",
      "城市 City",
      "国家 Country",
      "地球 Earth",
      "生活 Life",
      "旅行 Travel",
      "运动 Sport",
      "科技 Technology",
      "互联网 Internet",
      "游戏 Game",
      "健康 Health",
      "自由 Freedom",
      "真相 Truth",
      "艺术 Art",
      "历史 History",
      "未来 Future",
      "过去 Past",
      "现在 Present",
      "勇敢 Brave",
    ];
    List<String> searchHistory = <String>[].signal();
    final random = Random();
    Iterable<Widget> getSuggests(SearchController controller, StateSetter setState) {
      List<({String value, String type, IconData typeIcon})> suggests = [];
      if (controller.text.isNotEmpty) {
        suggests = searchWords.where((e) => e.contains(controller.text)).map((e) => (value: e, type: "search", typeIcon: Icons.search)).toList();
      } else {
        int randomSuggestStart = random.nextInt(searchWords.length - 5);
        var randomSuggests = searchWords.sublist(randomSuggestStart, randomSuggestStart + 5);
        suggests.addAll(searchHistory.map((e) => (value: e, type: "history", typeIcon: Icons.history)));
        suggests.addAll(randomSuggests.map((e) => (value: e, type: "suggest", typeIcon: Icons.recommend_outlined)));
      }

      return suggests.map((item) => ListTile(
            leading: Icon(item.typeIcon),
            title: Text(item.value),
            subtitle: Text(item.type),
            trailing: IconButton(
                icon: const Icon(Icons.call_missed),
                onPressed: () {
                  controller.text = item.value;
                  controller.selection = TextSelection.collapsed(offset: controller.text.length);
                  controller.closeView(item.value);
                }),
            onTap: () {
              setState(() {
                controller.closeView(item.value);
                if (searchHistory.length >= 5) {
                  searchHistory.removeLast();
                }
                searchHistory.insert(0, item.value);
                var set = searchHistory.toSet();
                searchHistory.clear();
                searchHistory.addAll(set);
              });
            },
          ));
    }

    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: [
            SearchAnchor.bar(
              barHintText: 'Search words',
              onSubmitted: (text) {
                debugPrint("onSubmitted $text, should : controller.closeView");
              },
              suggestionsBuilder: (context, controller) => getSuggests(controller, setState),
            )
          ],
        );
      },
    );
  }

  Widget checkboxListTile() {
    final Value<bool?> checkboxListTile1 = (null as bool?).signal();
    final Value<bool> checkboxListTile2 = false.signal();
    return Watch(
      builder: (context) {
        return Column(
          children: <Widget>[
            CheckboxListTile(tristate: true, value: checkboxListTile1.value, title: const Text('tristate: true'), onChanged: (value) => checkboxListTile1.value = value),
            CheckboxListTile(tristate: false, value: checkboxListTile2.value, title: const Text('tristate: false'), onChanged: (value) => checkboxListTile2.value = value!),
          ],
        );
      },
    );
  }

  Widget checkbox() {
    final Value<bool?> checkbox1 = (null as bool?).signal();
    final Value<bool> checkbox2 = false.signal();
    return Watch(
      builder: (context) {
        return Column(
          children: <Widget>[
            Row(
              children: [
                const Text('tristate: true'),
                Checkbox(tristate: true, checkColor: Colors.white, value: checkbox1.value, onChanged: (value) => checkbox1.value = value),
              ],
            ),
            Row(
              children: [
                const Text('tristate: false'),
                Checkbox(tristate: false, checkColor: Colors.white, value: checkbox2.value, onChanged: (value) => checkbox2.value = value!),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget chip() {
    final Set<TargetPlatform> targets = Set.of(TargetPlatform.values).signal();

    return Watch(builder: (context) {
      return Column(children: <Widget>[
        Wrap(
          children: [
            for (var target in targets)
              Chip(
                avatar: CircleAvatar(child: Text(target.name[0])),
                label: Text(target.name),
                onDeleted: () => targets.remove(target),
              )
          ],
        ),
        FilledButton(
            onPressed: () {
              targets.clear();
              targets.addAll(TargetPlatform.values);
            },
            child: const Text("Reset")),
      ]);
    });
  }

  Widget actionChip() {
    final Value<bool> favorite = false.signal();
    return Watch(builder: (context) {
      return Column(children: <Widget>[
        Wrap(children: [
          ActionChip(
            avatar: Icon(favorite.value ? Icons.favorite : Icons.favorite_border),
            label: const Text("favorite"),
            onPressed: () => favorite.value = !favorite.value,
          ),
        ]),
      ]);
    });
  }

  Widget filterChip() {
    final Set<String> selected = <String>{}.signal();
    return Watch(
      builder: (context) {
        return Column(
          children: <Widget>[
            Wrap(
              children: [
                for (var t in TargetPlatform.values)
                  FilterChip(
                    label: Text(t.name),
                    selected: selected.contains(t.name),
                    onSelected: (bool value) {
                      if (value) {
                        selected.add(t.name);
                      } else {
                        selected.remove(t.name);
                      }
                    },
                  )
              ],
            ),
            FilledButton(onPressed: () => selected.clear(), child: const Text("Reset")),
          ],
        );
      },
    );
  }

  Widget choiceChip() {
    final Value<TargetPlatform?> selected = (null as TargetPlatform?).signal();
    return Watch(
      builder: (context) {
        return Column(
          children: <Widget>[
            Wrap(
              children: [
                for (var t in TargetPlatform.values)
                  ChoiceChip(
                      label: Text(t.name),
                      selected: selected.value == t,
                      onSelected: (bool value) {
                        selected.value = value ? t : null;
                      }),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget inputChip() {
    final TextEditingController controller = TextEditingController();
    final List<String> tags = <String>[].signal();

    return Watch(
      watchListenable: controller,
      onDispose: () {
        controller.dispose();
      },
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.add),
                hintText: 'Write a tag, enter to add',
              ),
              onSubmitted: (_) {
                if (controller.text.isNotEmpty) {
                  if (!tags.contains(controller.text)) {
                    tags.add(controller.text);
                  }
                  controller.clear(); // 清空TextField
                }
              },
            ),
            Wrap(
              spacing: 8.0,
              children: tags.map((tag) {
                return InputChip(
                  avatar: const Icon(Icons.tag),
                  label: Text(tag),
                  onDeleted: () => tags.remove(tag),
                  deleteIcon: const Icon(Icons.cancel),
                );
              }).toList(),
            )
          ],
        );
      },
    );
  }

  Widget datePicker() {
    final Value<DateTime?> date = (null as DateTime?).signal();
    return Watch(
      builder: (context) {
        return Column(
          children: <Widget>[
            Text("date: ${date.value}"),
            CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(DateTime.now().year - 1),
              lastDate: DateTime(DateTime.now().year + 1),
              onDateChanged: (value) => date.value = value,
            ),
            TextButton.icon(
              onPressed: () async {
                DateTime? selected = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year - 1),
                  lastDate: DateTime(DateTime.now().year + 1),
                );
                date.value = selected;
              },
              icon: const Icon(Icons.calendar_month),
              label: const Text('showDatePicker dialog'),
            ),
          ],
        );
      },
    );
  }

  Widget dateRangePicker() {
    final Value<DateTimeRange?> dateRange = (null as DateTimeRange?).signal();
    return Watch(
      builder: (context) {
        return Column(
          children: <Widget>[
            Text("date: ${dateRange.value}"),
            TextButton.icon(
              onPressed: () async {
                DateTimeRange? selected = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(DateTime.now().year - 1),
                  lastDate: DateTime(DateTime.now().year + 1),
                );
                dateRange.value = selected;
              },
              icon: const Icon(Icons.date_range),
              label: const Text('showDateRangePicker dialog'),
            ),
          ],
        );
      },
    );
  }

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

class LayoutCore {
  Widget containerCell() {
    return Builder(builder: (context) {
      var colors = Theme.of(context).colorScheme;
      return Wrap(children: [
        Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: colors.surface, borderRadius: BorderRadius.circular(4.0), boxShadow: [
              BoxShadow(color: colors.shadow.withOpacity(0.2), spreadRadius: 2, blurRadius: 2, offset: const Offset(2, 1)),
            ]),
            child: const Text("模仿Card\nImitate Card"))
      ]);
    });
  }
}

class SpacerAndDivider {
  Widget divider() {
    return const Column(children: [
      SizedBox(
        child: Column(children: [
          Text('Divider'),
          Divider(),
          Text('Divider'),
        ]),
      ),
      SizedBox(
        height: 100,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('VerticalDivider'),
          VerticalDivider(),
          Text('VerticalDivider'),
        ]),
      )
    ]);
  }

  Widget spacer() {
    return const Column(children: [
      Row(children: [
        Text('Row left'),
        Spacer(),
        Text('Row right'),
      ]),
    ]);
  }

  Widget placeholder() {
    return const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Placeholder(fallbackWidth: 100, fallbackHeight: 100),
      Placeholder(
        fallbackWidth: 100,
        fallbackHeight: 100,
        child: SizedBox(width: 100, height: 100, child: Text("带child的")),
      ),
    ]);
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
