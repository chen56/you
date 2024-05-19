import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web/views/cell_view.dart';
import 'package:you_flutter/note.dart';
import 'package:you_flutter/state.dart';

@NoteAnnotation(label: "Widgets cheatsheets", publish: true)
void build(BuildContext context, Cell print) {
  SpacerAndDivider spacerAndDivider = SpacerAndDivider();
  LayoutCore layoutCore = LayoutCore();
  ButtonAndInput buttonAndInput = ButtonAndInput();
  TextAndInfoAndTip textAndInfoAndTip = TextAndInfoAndTip();
  AdvancedTemplateContainer advancedTemplateContainer = AdvancedTemplateContainer();
  Decorator decorator = Decorator();
  NavigationAndPage navigationAndPage = NavigationAndPage();

  var all = Column(
    children: [
      Level1MasonryLayout(title: "导航与页面", cellWidth: 350, children: [
        CellView(title: "BottomAppBar", child: navigationAndPage.bottomAppBarCell()),
        CellView(title: "NavigationBar", child: navigationAndPage.navigationBarCell()),
        CellView(title: "NavigationDrawer", child: navigationAndPage.navigationDrawerCell()),
        CellView(title: "NavigationRail", child: navigationAndPage.navigationRailCell()),
        CellView(title: "TabBar", child: navigationAndPage.tabBarCell()),
        CellView(title: "MenuCell", child: navigationAndPage.menuCell()),
        CellView(title: "AppBar", height: 150, child: navigationAndPage.appBarCell()),
        CellView(title: "SliverAppBar", height: 250, child: navigationAndPage.sliverAppBarCell()),
      ]),
      Level1MasonryLayout(title: "分割、填充、留白", cellWidth: 300, children: [
        CellView(title: "Divider", child: spacerAndDivider.dividerCell()),
        CellView(title: "Spacer", child: spacerAndDivider.spacerCell()),
        CellView(title: "Placeholder", child: spacerAndDivider.placeholderCell()),
      ]),
      Level1MasonryLayout(title: "布局,Layout", cellWidth: 500, children: [
        CellView(title: "Container", child: layoutCore.containerCell(context)),
      ]),
      Level1MasonryLayout(title: "button&input&form", cellWidth: 500, children: [
        CellView(title: "ButtonStyleButton", child: buttonAndInput.buttonStyleButtonCell(context)),
        CellView(title: "FloatingActionButton", child: buttonAndInput.floatingActionButtonCell(context)),
        CellView(title: "IconButton", child: buttonAndInput.iconButtonCell(context)),
        CellView(title: "SearchAnchor", child: buttonAndInput.searchCell()),
        CellView(title: "segmentButton", child: buttonAndInput.segmentButtonCell(context)),
        CellView(title: "Checkbox", child: buttonAndInput.checkboxCell()),
        CellView(title: "CheckboxListTile", child: buttonAndInput.checkboxListTileCell()),
        CellView(title: "Chip", child: buttonAndInput.chip()),
        CellView(title: "FilterChip", child: buttonAndInput.filterChip()),
      ]),
      Level1MasonryLayout(title: "text&info&tip", cellWidth: 300, children: [
        CellView(title: "Badge", child: textAndInfoAndTip.badgesCell(context)),
        CellView(title: "ProgressIndicator", child: textAndInfoAndTip.progressIndicatorCell(context)),
        CellView(title: "ProgressIndicator2", child: textAndInfoAndTip.progressIndicator2Cell(context)),
        CellView(title: "CircleAvatar", child: textAndInfoAndTip.circleAvatar(context)),
      ]),
      Level1MasonryLayout(title: "高级模版容器,Advanced template container", cellWidth: 500, children: [
        CellView(title: "SnackBar", child: advancedTemplateContainer.snackBarCell(context)),
        CellView(title: "dialog", child: advancedTemplateContainer.dialogCell()),
        CellView(title: "bottomSheet", child: advancedTemplateContainer.bottomSheetCell(context)),
      ]),
      Level1MasonryLayout(title: "装饰器,Decorator", cellWidth: 500, children: [
        CellView(title: "Card", child: decorator.cardCell(context)),
      ]),
    ],
  );

  print(all);
}

class ButtonAndInput {
  Widget buttonStyleButtonCell(BuildContext context) {
    return Wrap(
      children: [
        IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text("ElevatedButton")),
              FilledButton(onPressed: () {}, child: const Text('FilledButton')),
              FilledButton.tonal(onPressed: () {}, child: const Text('FilledButton.tonal')),
              OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton')),
              TextButton(onPressed: () {}, child: const Text('TextButton')),
            ].map((e) => Padding(padding: const EdgeInsets.all(2), child: e)).toList(),
          ),
        ),
        IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.image), label: const Text('Add Icon')),
              FilledButton.icon(onPressed: () {}, label: const Text('Add Icon'), icon: const Icon(Icons.image)),
              FilledButton.tonalIcon(onPressed: () {}, label: const Text('Add Icon'), icon: const Icon(Icons.image)),
              OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.image), label: const Text('Add Icon')),
              TextButton.icon(onPressed: () {}, icon: const Icon(Icons.image), label: const Text('Add Icon'))
            ].map((e) => Padding(padding: const EdgeInsets.all(2), child: e)).toList(),
          ),
        ),
        IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ElevatedButton(onPressed: null, child: Text("ElevatedButton")),
              const FilledButton(onPressed: null, child: Text('FilledButton')),
              const FilledButton.tonal(onPressed: null, child: Text('FilledButton.tonal')),
              const OutlinedButton(onPressed: null, child: Text('OutlinedButton')),
              const TextButton(onPressed: null, child: Text('TextButton')),
            ].map((e) => Padding(padding: const EdgeInsets.all(2), child: e)).toList(),
          ),
        ),
      ],
    );
  }

  Widget floatingActionButtonCell(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () {},
          tooltip: "FloatingActionButton()",
          child: const Text("default"),
        ),
        FloatingActionButton.small(
          // isExtended: false,
          onPressed: () {},
          tooltip: "FloatingActionButton.small()",
          child: const Text("small"),
        ),
        FloatingActionButton.large(
          // isExtended: false,
          onPressed: () {},
          tooltip: "FloatingActionButton.large()",
          child: const Text("large"),
        ),
        FloatingActionButton.extended(
          // isExtended: false,
          onPressed: () {},
          tooltip: "FloatingActionButton.extended()",
          label: const Text('extended'),
          icon: const Icon(Icons.thumb_up),
        ),
      ].map((e) => Padding(padding: const EdgeInsets.all(2), child: e)).toList(),
    );
  }

  Widget iconButtonCell(BuildContext context) {
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

  Widget segmentButtonCell(BuildContext context) {
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

  Widget searchCell() {
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

  Widget checkboxListTileCell() {
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

  Widget checkboxCell() {
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

    return Watch(
      builder: (context) {
        return Column(
          children: <Widget>[
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
          ],
        );
      },
    );
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
}

class LayoutCore {
  Widget containerCell(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return Wrap(
      children: [
        Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colors.surface,
              boxShadow: [
                BoxShadow(
                  color: colors.shadow.withOpacity(0.2), // 阴影颜色
                  spreadRadius: 2, // 阴影扩散范围
                  blurRadius: 2, // 阴影模糊程度
                  offset: const Offset(2, 1), // 阴影偏移量，水平和垂直方向
                ),
              ],
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: const Text("模仿Card\nImitate Card") // Your widget here
            )
      ],
    );
  }
}

class SpacerAndDivider {
  Widget dividerCell() {
    return const Column(
      children: [
        SizedBox(
          child: Column(
            children: [
              Text('Divider'),
              Divider(),
              Text('Divider'),
            ],
          ),
        ),
        SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('VerticalDivider'),
                VerticalDivider(),
                Text('VerticalDivider'),
              ],
            )),
      ],
    );
  }

  Widget spacerCell() {
    return const Column(
      children: [
        Row(
          children: [
            Text('Row left'),
            Spacer(),
            Text('Row right'),
          ],
        ),
      ],
    );
  }

  Widget placeholderCell() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Placeholder(fallbackWidth: 100, fallbackHeight: 100),
        Placeholder(
          fallbackWidth: 100,
          fallbackHeight: 100,
          child: SizedBox(width: 100, height: 100, child: Text("带child的")),
        ),
      ],
    );
  }
}

class TextAndInfoAndTip {
  Widget circleAvatar(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(child: Text('C')),
        CircleAvatar(child: Icon(Icons.account_box)),
        CircleAvatar(backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/2039742')),
        CircleAvatar(backgroundImage: NetworkImage('https://img2.baidu.com/it/u=3784833129,896943374&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500')),
      ],
    );
  }

  Widget badgesCell(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
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
      ],
    );
  }

  Widget progressIndicatorCell(BuildContext context) {
    final selected = false.signal();
    return Watch(builder: (context) {
      return Row(
        children: [
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
        ],
      );
    });
  }

  Widget progressIndicator2Cell(BuildContext context) {
    final selected = false.signal();
    return Watch(
      builder: (context) {
        return Column(
          children: [
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
          ],
        );
      },
    );
  }
}

class AdvancedTemplateContainer {
  Widget snackBarCell(BuildContext context) {
    return TextButton(
      onPressed: () {
        final snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          // width: 800.0,

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
    );
  }

  Widget bottomSheetCell(BuildContext context) {
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

  Widget dialogCell() {
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
  Widget cardCell(BuildContext context) {
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
  }
}

class NavigationAndPage {
  Widget bottomAppBarCell() {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Scaffold(
        body: const Placeholder(),
        floatingActionButton: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: <Widget>[
              IconButton(tooltip: 'Open navigation menu', icon: const Icon(Icons.menu), onPressed: () {}),
              const Spacer(),
              IconButton(tooltip: 'Search', icon: const Icon(Icons.search), onPressed: () {}),
              IconButton(tooltip: 'Favorite', icon: const Icon(Icons.favorite), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget navigationBarCell() {
    final selected = 0.signal();
    List<({NavigationDestination destination, Widget page})> destinations = [
      (
        destination: const NavigationDestination(icon: Icon(Icons.explore), label: 'Explore'),
        page: Container(width: double.infinity, height: double.infinity, color: Colors.blue.shade100, child: const Text("Explore")),
      ),
      (
        destination: const NavigationDestination(icon: Icon(Icons.commute), label: 'Commute'),
        page: Container(width: double.infinity, height: double.infinity, color: Colors.green.shade100, child: const Text("Commute")),
      ),
    ];
    return Watch(builder: (context) {
      return SizedBox(
        width: double.infinity,
        height: 200,
        child: Scaffold(
          body: destinations[selected.value].page,
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (newSelection) => selected.value = newSelection,
            selectedIndex: selected.value,
            destinations: destinations.map((e) => e.destination).toList(),
          ),
        ),
      );
    });
  }

  Widget navigationDrawerCell() {
    final selected = 0.signal();

    Widget drawer() {
      return NavigationDrawer(
        onDestinationSelected: (selectedIndex) {
          selected.value = selectedIndex;
        },
        selectedIndex: selected.value,
        children: const <Widget>[
          NavigationDrawerDestination(label: Text('Inbox'), icon: Icon(Icons.inbox_outlined), selectedIcon: Icon(Icons.inbox)),
          NavigationDrawerDestination(label: Text('Outbox'), icon: Icon(Icons.send_outlined), selectedIcon: Icon(Icons.send)),
          NavigationDrawerDestination(label: Text('Favorites'), icon: Icon(Icons.favorite_outline), selectedIcon: Icon(Icons.favorite)),
          NavigationDrawerDestination(label: Text('Trash'), icon: Icon(Icons.delete_outline), selectedIcon: Icon(Icons.delete)),
        ],
      );
    }

    return Watch(builder: (context) {
      return SizedBox(
        width: 500,
        height: 300,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Builder(builder: (context) {
                return TextButton.icon(label: const Text("openEndDrawer"), icon: const Icon(Icons.menu), onPressed: () => Scaffold.of(context).openEndDrawer());
              }),
            ],
          ),
          body: drawer(),
          endDrawer: drawer(),
        ),
      );
    });
  }

  Widget navigationRailCell() {
    final selected = 0.signal();
    List<({NavigationRailDestination distination, Widget page})> destinations = [
      (
        distination: const NavigationRailDestination(icon: Icon(Icons.explore), label: Text('Explore')),
        page: Container(width: double.infinity, height: double.infinity, color: Colors.blue.shade100, child: const Text("Explore")),
      ),
      (
        distination: const NavigationRailDestination(icon: Icon(Icons.commute), label: Text('Commute')),
        page: Container(width: double.infinity, height: double.infinity, color: Colors.green.shade100, child: const Text("Commute")),
      ),
    ];
    return Watch(builder: (context) {
      return SizedBox(
        width: double.infinity,
        height: 300,
        child: Scaffold(
          body: Row(
            children: [
              NavigationRail(
                selectedIndex: selected.value,
                groupAlignment: 1,
                onDestinationSelected: (newSelection) => selected.value = newSelection,
                labelType: NavigationRailLabelType.all,
                leading: IconButton(onPressed: () {}, icon: const Icon(Icons.access_time), tooltip: "NavigationRail.leading"),
                trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.exit_to_app), tooltip: "NavigationRail.trailing"),
                destinations: destinations.map((e) => e.distination).toList(),
              ),
              Expanded(child: destinations[selected.value].page),
            ],
          ),
        ),
      );
    });
  }

  Widget tabBarCell() {
    List<({Tab tab, Widget page})> tabs = [
      (
        tab: const Tab(icon: Icon(Icons.cloud_outlined), iconMargin: EdgeInsets.all(10)),
        page: const Center(child: Text("It's cloudy here")),
      ),
      (
        tab: const Tab(icon: Icon(Icons.beach_access_sharp), iconMargin: EdgeInsets.all(10)),
        page: const Center(child: Text("It's rainy here")),
      ),
      (
        tab: const Tab(icon: Icon(Icons.brightness_5_sharp), iconMargin: EdgeInsets.all(10)),
        page: const Center(child: Text("It's sunny here")),
      ),
    ];

    return DefaultTabController(
      initialIndex: 1,
      length: tabs.length,
      child: Column(
        children: [
          TabBar(tabs: tabs.map((e) => e.tab).toList()),
          SizedBox(
            height: 100,
            child: TabBarView(children: tabs.map((e) => e.page).toList()),
          )
        ],
      ),
    );
  }

  Widget menuCell() {
    return Builder(builder: (BuildContext context) {
      return MenuAnchor(
        builder: (context, controller, child) {
          return FilledButton.tonal(
            onPressed: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            child: const Text('Show menu'),
          );
        },
        menuChildren: [
          MenuItemButton(
            leadingIcon: const Icon(Icons.people_alt_outlined),
            child: const Text('Item 1'),
            onPressed: () {},
          ),
          MenuItemButton(
            leadingIcon: const Icon(Icons.remove_red_eye_outlined),
            child: const Text('Item 2'),
            onPressed: () {},
          ),
          MenuItemButton(
            leadingIcon: const Icon(Icons.refresh),
            onPressed: () {},
            child: const Text('Item 3'),
          ),
        ],
      );
    });
  }

  Widget appBarCell() {
    return Builder(builder: (context) {
      final colors = Theme.of(context).colorScheme;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: colors.surfaceContainerHighest,
          leading: const BackButton(),
          actions: [
            IconButton(icon: const Icon(Icons.minimize), onPressed: () {}),
            IconButton(icon: const Icon(Icons.filter_alt_off), onPressed: () {}),
            // const Spacer(),
          ],
        ),
        body: const Text("Hello\nWorld"),
      );
    });
  }

  Widget sliverAppBarCell() {
    var pinned = true.signal();
    return Watch(builder: (context) {
      return CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: pinned.value,
            expandedHeight: 180.0,
            actions: [
              Row(children: [const Text('pinned'), Switch(onChanged: (newValue) => pinned.value = newValue, value: pinned.value)]),
            ],
            flexibleSpace: const FlexibleSpaceBar(
              background: FlutterLogo(),
            ),
          ),
          const SliverToBoxAdapter(
            child: Text('Try Scroll to see effect.'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 50.0,
                  child: Center(
                    child: Text('$index', textScaler: const TextScaler.linear(2)),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      );
    });
  }
}
