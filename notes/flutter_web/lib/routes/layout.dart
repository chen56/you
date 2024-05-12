import 'package:flutter/material.dart';
import 'package:flutter_web/app.dart';
import 'package:you_flutter/better_ui.dart';
import 'package:you_flutter/note.dart';
import 'package:you_flutter/router.dart';
import 'package:you_flutter/state.dart';
import 'package:url_launcher/url_launcher.dart';

/// [LayoutBuilder]
Widget build(BuildContext context, Widget child) {
  // ignore: unnecessary_type_check
  assert(build is PageLayoutBuilder);
  return RootLayout(child: child);
}

class RootLayout extends StatefulWidget {
  const RootLayout({super.key, required this.child});

  final Widget child;

  @override
  State<StatefulWidget> createState() {
    return RootLayoutState();
  }
}

class RootLayoutState extends State<RootLayout> {
  final Value<int> navigationRail = 0.signal();

  @override
  Widget build(BuildContext context) {
    final route = context.route$;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      primary: true,
      appBar: AppBar(toolbarHeight: 38, title: Text("location: ${route.uri}"), foregroundColor: colors.primaryFixed, backgroundColor: colors.onPrimaryFixed, actions: [
        TextButton.icon(
          onPressed: () => _launchUrl(Uri.parse("https://github.com/chen56/you")),
          icon: const Icon(Icons.link),
          label: const Text('github'),
        ),
      ]),
      body: SafeArea(
        child: SelectionArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ViewBar(),
              SingleChildScrollView(
                // children: [widget.child.align$(alignment: Alignment.topLeft)],
                child: widget.child,
              ).expanded$(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 30,
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
        child: Row(
          children: [
            Text("${route.uri}"),
          ],
        ),
      ),
    );
  }
}

class _NoteTreeView extends StatefulWidget {
  const _NoteTreeView({required this.view});

  final Value<String> view;

  @override
  State<StatefulWidget> createState() {
    return _NoteTreeViewState();
  }
}

class _NoteTreeViewState extends State<_NoteTreeView> {
  final Value<bool> includeDraft = false.signal();

  @override
  Widget build(BuildContext context) {
    final route = context.route$;
    final colors = Theme.of(context).colorScheme;
    routes.routes_root.expandTree(true, level: 2);
    return Watch((context) {
      final notes = routes.routes_notes.toList(includeThis: false).cast<ToNote>().where((e) {
        return e.containsPage() && e.parent.expand && (includeDraft.value || e.containsPublishNode(includeThis: true));
      });
//great for ide like layouts
      return Column(
        children: [
          Container(
            color: colors.surfaceContainer,
            child: OverflowBar(alignment: MainAxisAlignment.end, children: [
              IconButton(tooltip: "Expand all", icon: const Icon(Icons.expand, size: 24), iconSize: 24, onPressed: () => notes.forEach((i) => i.expandTree(true))),
              IconButton(tooltip: "Collapse all", icon: const Icon(Icons.compress), iconSize: 24, onPressed: () => notes.forEach((i) => i.expandTree(false))),
              IconButton(tooltip: "Include draft", icon: const Icon(Icons.drafts_outlined), iconSize: 24, selectedIcon: const Icon(Icons.drafts), isSelected: includeDraft.value, onPressed: () => includeDraft.value = !includeDraft.value),
              IconButton(tooltip: "Hidden", icon: const Icon(Icons.horizontal_rule), iconSize: 24, onPressed: () => widget.view.value = ""),
            ]),
          ),
          const Divider(),
          ListView(
            children: notes.map((e) => _noteItem(e, route, includeDraft.value)).toList(),
          ).expanded$(),
        ],
      ).constrainedBox$(
        constraints: const BoxConstraints.tightFor(width: 350),
      );
    });
  }

  static Widget _noteItem(ToNote node, RouteContext route, bool includeDraft) {
    click() {
      if (node.isLeafPage) {
        route.to(node.toUri());
      } else {
        node.expand = !node.expand;
      }
    }

    // 🔹◽️●○◦■□❏✎
    String iconExtend = node.isLeafPage
        ? "❏"
        : node.expand
            ? "▼"
            : "︎︎︎▶";

    String title = "$iconExtend ${node.label}";
    title = title.padLeft((node.level * 2) + title.length);
    String publishLabel = "";
    if (node.isLeafPage) {
      publishLabel = node.isPublish ? "(已发布)" : "(草稿)";
    }
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(onPressed: click, child: Text('$title$publishLabel')),
    );
  }
}

extension _NoteTreeNode on To {
  static Map<To, bool> expands = <To, bool>{}.signal();

  bool get expand {
    var result = expands[this];
    return result ?? false;
  }

  set expand(bool value) {
    expands[this] = value;
  }

  /// 展开层级数
  /// level < 0 ,expand all levels
  void expandTree(bool value, {int level = -1}) {
    if (level == 0) return;

    var nextLevel = level - 1;
    expand = value;

    if (nextLevel == 0) {
      return;
    }

    for (var e in children) {
      e.expandTree(value, level: nextLevel);
    }
  }
}

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

class ViewBar extends StatefulWidget {
  const ViewBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return ViewBarState();
  }
}

class _ThemeView extends StatefulWidget {
  const _ThemeView({required this.view});

  final Value<String> view;

  @override
  State<StatefulWidget> createState() {
    return _ThemeViewState();
  }
}

class _ThemeViewState extends State<_ThemeView> {
  final Value<bool> includeDraft = false.signal();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Watch((context) {
      return Column(
        children: [
          Container(
            color: colors.surfaceContainer,
            child: OverflowBar(alignment: MainAxisAlignment.end, children: [
              IconButton(tooltip: "Hidden", icon: const Icon(Icons.horizontal_rule), iconSize: 24, onPressed: () => widget.view.value = ""),
            ]),
          ),
          const Divider(),

        ],
      ).constrainedBox$(
        constraints: const BoxConstraints.tightFor(width: 350),
      );
    });
  }
}

class ViewBarState extends State<ViewBar> {
  final Value<String> view = "note_tree_view".signal();

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return Watch((context) {
      return Container(
          color: colors.surfaceContainer,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IntrinsicHeight(
                    child: Column(
                      children: [
                        IconButton(
                            icon: const Icon(Icons.folder_outlined),
                            isSelected: view.value == "note_tree_view",
                            selectedIcon: const Icon(Icons.folder_rounded),
                            onPressed: () {
                              view.value = view.value == "note_tree_view" ? "" : "note_tree_view";
                            }),
                        const Text("导航"),
                      ],
                    ),
                  ).flexible$(),
                  IntrinsicHeight(
                    child: Column(
                      children: [
                        IconButton(
                            icon: const Icon(Icons.color_lens_outlined),
                            isSelected: view.value == "theme_view",
                            selectedIcon: const Icon(Icons.color_lens_rounded),
                            onPressed: () {
                              view.value = view.value == "theme_view" ? "" : "theme_view";
                            }),
                        const Text("主题"),
                      ],
                    ),
                  ).flexible$(),
                ],
              ),
              const VerticalDivider(),
              Watch((context) {
                return _NoteTreeView(view: view).offstage$(offstage: view.value != "note_tree_view");
              }),
              Watch((context) {
                return _ThemeView(view: view).offstage$(offstage: view.value != "theme_view");
              }),
            ],
          ));
    });
  }
}
