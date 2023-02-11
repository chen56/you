import 'package:flutter/material.dart';
import 'package:learn_flutter/navigator_v2.dart';
import 'package:learn_flutter/page.dart';
import 'package:learn_flutter/root_tree.dart';

class NoteLayout<T> extends StatelessWidget with Screen<T>, Layout<T> {
  final N<T> note;

  NoteLayout(this.note, {super.key});

  @override
  Widget build(BuildContext context) {
    var left = _NoteTreeView(root);
    var right = Scaffold(
      appBar: AppBar(title: const Text("Flutter Note")),
      // drawer: _NoteTreeView(root),
      body: ListView(children: [...note.build(context)]),
    );
    return Row(
      children: [left, Expanded(child: right)],
    );
  }

  @override
  String get location => note.path;

  @override
  Rule<T> get rule => note;
}

class _NoteTreeView extends StatefulWidget {
  final N root;

  const _NoteTreeView(
    this.root, {
    Key? key,
  }) : super(key: key);

  @override
  State<_NoteTreeView> createState() => _NoteTreeViewState();
}

class _NoteTreeViewState extends State<_NoteTreeView> {
  _NoteTreeViewState();

  @override
  Widget build(BuildContext context) {
    // 一页一个链接
    Widget link(N note) {
      IconData titleIcon = note.isLeaf ? Icons.remove : Icons.keyboard_arrow_down;
      click() {
        // 还未用上这个展开状态，还没想好怎么让ListView模仿树节点的展开和关闭
        note.extend = !note.extend;
        NavigatorV2.of(context).push(note.path);
      }

      return ListTile(
        trailing: Icon(note.isLeaf ? Icons.open_in_new : null),
        title: Row(children: [Icon(titleIcon), Text(note.name)]),
        onTap: note.hasPage ? click : null,
        // 是否选中
        selected: false,
        //---------------下面是外观调整
        //更紧凑布局
        dense: false,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        contentPadding: EdgeInsets.only(left: 20 * (note.level - 1).toDouble()),
      );
    }

    var notes = widget.root.toList(includeThis: false);
    return Drawer(
      child: ListView(
        shrinkWrap: false,
        padding: const EdgeInsets.all(20),
        children: notes.map((e) => link(e)).toList(),
      ),
    );
  }
}

// 在Note上扩展出UI相关的字段，比如目录树的点开状态`extend`
extension _TreeViewNote on N {
  static const _extendAttrName = "note.layout._TreeViewNote.extend";

  //展开状态
  bool get extend {
    if (isLeaf) {
      return false;
    }
    Object? result = attributes[_extendAttrName];
    return result == null ? false : result as bool;
  }

  set extend(bool extend) {
    if (isLeaf) {
      return;
    }
    attributes[_extendAttrName] = extend;
  }
}
