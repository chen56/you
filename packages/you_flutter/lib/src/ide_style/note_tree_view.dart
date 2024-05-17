import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:you_flutter/router.dart';
import 'package:you_flutter/src/better_ui.dart';
import 'package:you_flutter/src/note/note.dart';
import 'package:you_flutter/state.dart';

@experimental
class NoteTreeView extends StatefulWidget {
  const NoteTreeView({super.key, required this.view, required this.noteRoot});

  final Value<String> view;
  final ToNote noteRoot;

  @override
  State<StatefulWidget> createState() {
    return _NoteTreeViewState();
  }
}

class _NoteTreeViewState extends State<NoteTreeView> {
  final Value<bool> includeDraft = false.signal();
  final Value<To?> selected = (null as To?).signal();

  ToNote get noteRoot => widget.noteRoot;

  Widget _noteItem(BuildContext context, ToNote node, RouteContext route) {
    final colors = Theme.of(context).colorScheme;
    final rootNoteLevel = noteRoot.level + 1;

    click() {
      if (node.isLeafPage) {
        route.to(node.toUri());
        selected.value = node;
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
    title = title.padLeft(((node.level - rootNoteLevel) * 2) + title.length);
    return ListTile(
      title: Text(title),
      contentPadding: const EdgeInsets.only(left: 8),
      horizontalTitleGap: 8,
      minTileHeight: 36,
      minVerticalPadding: 6,
      minLeadingWidth: 0,
      selected: selected.value == node,
      selectedTileColor: colors.surfaceContainerHighest,
      onTap: click,
    ).paddingOnly$(left: 8);
  }

  @override
  Widget build(BuildContext context) {
    noteRoot.expandTree(true);
    return Watch((context) {
      final route = YouRouter.of(context);

      final colors = Theme.of(context).colorScheme;
      final notes = noteRoot.toList(includeThis: false).cast<ToNote>().where((e) {
        return e.containsPage() && e.parent.expand && (includeDraft.value || e.containsPublishNode(includeThis: true));
      });
      return Column(
        children: [
          Container(
            color: colors.surfaceContainerHighest,
            child: OverflowBar(alignment: MainAxisAlignment.end, children: [
              IconButton(tooltip: "Expand all", icon: const Icon(Icons.expand, size: 24), iconSize: 24, onPressed: () => notes.forEach((i) => i.expandTree(true))),
              IconButton(tooltip: "Collapse all", icon: const Icon(Icons.compress), iconSize: 24, onPressed: () => notes.forEach((i) => i.expandTree(false))),
              IconButton(tooltip: "Include draft", icon: const Icon(Icons.filter_alt), iconSize: 24, selectedIcon: const Icon(Icons.filter_alt_off), isSelected: includeDraft.value, onPressed: () => includeDraft.value = !includeDraft.value),
              IconButton(tooltip: "Hidden", icon: const Icon(Icons.horizontal_rule), iconSize: 24, onPressed: () => widget.view.value = ""),
            ]),
          ),
          const Divider(height: 1),
          Material(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [...notes.map((e) => _noteItem(context, e, route)).toList()],
            ),
          ).expanded$(),
        ],
      ).constrainedBox$(
        constraints: const BoxConstraints.tightFor(width: 280),
      );
    });
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
