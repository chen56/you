import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:you_flutter/note.dart';
import 'package:you_flutter/state.dart';

@NoteAnnotation(label: "Widgets cheatsheets", publish: true)
void build(BuildContext context, Cell print) {
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

    return Watch((context) {
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
    return Watch(
      (context) {
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
      },
    );
  }

  Widget progressIndicator2Cell(BuildContext context) {
    final selected = false.signal();
    return Watch(
      (context) {
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
    return Watch((context) {
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

  Widget bottomAppBarCell() {
    return SizedBox(
      width: 300,
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
    List<(NavigationDestination, Widget)> destinations = [
      (
        const NavigationDestination(icon: Icon(Icons.explore), label: 'Explore'),
        Container(width: double.infinity, height: double.infinity, color: Colors.blue.shade100, child: const Text("Explore")),
      ),
      (
        const NavigationDestination(icon: Icon(Icons.commute), label: 'Commute'),
        Container(width: double.infinity, height: double.infinity, color: Colors.green.shade100, child: const Text("Commute")),
      ),
    ];
    return Watch((context) {
      return SizedBox(
        width: 300,
        height: 200,
        child: Scaffold(
          body: destinations[selected.value].$2,
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (newSelection) => selected.value = newSelection,
            selectedIndex: selected.value,
            destinations: destinations.map((e) => e.$1).toList(),
          ),
        ),
      );
    });
  }

  Widget navigationDrawerCell() {
    final selected = 0.signal();

    Widget drawer() {
      return NavigationDrawer(
        tilePadding: EdgeInsets.zero,
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

    return Watch((context) {
      return SizedBox(
        width: 500,
        height: 500,
        child: Scaffold(
          body: drawer(),
          endDrawer: drawer(),
          bottomNavigationBar: BottomAppBar(
            child: Builder(builder: (context) {
              return IconButton(tooltip: 'openDrawer', icon: const Icon(Icons.menu), onPressed: () => Scaffold.of(context).openEndDrawer());
            }),
          ),
        ),
      );
    });
  }

  var all = Column(
    children: [
      Level1MasonryLayout(title: "分割、填充、留白", cellWidth: 300, children: [
        CellView(title: "Divider", child: dividerCell()),
        CellView(title: "Spacer", child: spacerCell()),
        CellView(title: "Placeholder", child: placeholderCell()),
      ]),
      Level1MasonryLayout(title: "布局,Layout", cellWidth: 500, children: [
        CellView(title: "Container", child: containerCell(context)),
      ]),
      Level1MasonryLayout(title: "button&input&form", cellWidth: 500, children: [
        CellView(title: "ButtonStyleButton", child: buttonStyleButtonCell(context)),
        CellView(title: "FloatingActionButton", child: floatingActionButtonCell(context)),
        CellView(title: "IconButton", child: iconButtonCell(context)),
        CellView(title: "segmentButton", child: segmentButtonCell(context)),
      ]),
      Level1MasonryLayout(title: "button&input&form", cellWidth: 400, children: [
        CellView(title: "Badge", child: badgesCell(context)),
        CellView(title: "ProgressIndicator", child: progressIndicatorCell(context)),
        CellView(title: "ProgressIndicator2", child: progressIndicator2Cell(context)),
      ]),
      Level1MasonryLayout(title: "高级模版容器,Advanced template container", cellWidth: 500, children: [
        CellView(title: "SnackBar", child: snackBarCell(context)),
        CellView(title: "dialog", child: dialogCell()),
        CellView(title: "bottomSheet", child: bottomSheetCell(context)),
      ]),
      Level1MasonryLayout(title: "装饰器,Decorator", cellWidth: 500, children: [
        CellView(title: "Card", child: cardCell(context)),
      ]),
      Level1MasonryLayout(title: "导航与页面", cellWidth: 400, children: [
        CellView(title: "BottomAppBar", child: bottomAppBarCell()),
        CellView(title: "NavigationBar", child: navigationBarCell()),
        CellView(title: "NavigationDrawer", child: navigationDrawerCell()),
      ])
    ],
  );

  print(all);
}

class CellView extends StatelessWidget {
  final String title;
  final Widget child;
  final BoxConstraints? constraints;

  const CellView({
    super.key,
    required this.title,
    this.constraints,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var textStyle = Theme.of(context).textTheme;
    return Container(
      constraints: constraints,
      decoration: BoxDecoration(color: colors.surfaceContainer, borderRadius: BorderRadius.circular(8.0), border: Border.all(width: 1, color: colors.outlineVariant)),
      child: Column(
        children: [
          Container(
            height: 36,
            color: colors.surfaceContainerHigh,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 10),
                Text(title, style: textStyle.titleMedium),
                const Spacer(),
                IconButton(icon: const Icon(size: 24, Icons.code), onPressed: () {}),
                IconButton(icon: const Icon(size: 24, Icons.fullscreen), onPressed: () {}),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: child,
          ),
        ],
      ),
    );
  }
}

class Level1GridLayout extends StatelessWidget {
  final String title;
  final List<CellView> children;
  final double? cellWidth;

  const Level1GridLayout({super.key, required this.title, this.cellWidth, required this.children});

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(builder: (context, constraints) {
      var crossAxisCount = cellWidth == null ? 1 : (constraints.maxWidth / cellWidth!).toInt();
      crossAxisCount = crossAxisCount <= 1 ? 1 : crossAxisCount;

      return Column(
        children: [
          Text(title, style: textTheme.headlineLarge),
          Container(
            padding: const EdgeInsets.all(12),
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              color: colors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              // to disable GridView's scrolling
              shrinkWrap: true,
              // You won't see infinite size erro
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: crossAxisCount,
              children: <Widget>[
                ...children,
              ],
            ),
          ),
        ],
      );
    });
  }
}

class Level1MasonryLayout extends StatelessWidget {
  final String title;
  final List<CellView> children;
  final double? cellWidth;

  const Level1MasonryLayout({super.key, required this.title, this.cellWidth, required this.children});

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(builder: (context, constraints) {
      var crossAxisCount = cellWidth == null ? 1 : (constraints.maxWidth / cellWidth!).toInt();
      crossAxisCount = crossAxisCount <= 1 ? 1 : crossAxisCount;
      return Column(
        children: [
          Text(title, style: textTheme.headlineLarge),
          Container(
            padding: const EdgeInsets.all(12),
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              color: colors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: MasonryGridView.count(
              physics: const NeverScrollableScrollPhysics(),
              // to disable GridView's scrolling
              shrinkWrap: true,
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16,
              itemBuilder: (context, index) => children[index],
              itemCount: children.length,
            ),
          ),
        ],
      );
    });
  }
}
