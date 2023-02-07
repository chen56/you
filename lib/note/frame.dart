import 'package:flutter/material.dart';
import 'package:learn_flutter/navigator_v2.dart';
import 'package:learn_flutter/page.dart';
import 'package:learn_flutter/root_tree.dart';

class NoteLayout<T> extends StatelessWidget with Screen<T> , Layout<T> {
  final N<T> note;

  NoteLayout(this.note, {super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pageContent = note.build(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Note")),
      drawer: _NoteTreeView(root),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // SizedBox(width: 200, child: NoteDrawerPart(root)),
            Expanded(
                child: ListView(
              children: [...pageContent],
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget link(N note) {
      return ListTile(
        trailing: Icon(
          note.isLeaf ? Icons.open_in_new : null,
          size: note.isLeaf ? 20 : null,
        ),
        title: Row(
          children: [
            Icon(
              note.isLeaf ? Icons.remove : Icons.keyboard_arrow_down,
              // size: e.isLeaf ? 15 : null,
            ),
            Text(note.name),
          ],
        ),
        dense: true,
        //更紧凑布局
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        contentPadding: EdgeInsets.only(left: 20 * (note.level - 1).toDouble()),
        enabled: true,
        minLeadingWidth: 0,
        onTap:  !note.hasPage?null: () {
          note.extend = !note.extend;
          NavigatorV2.of(context).push(note.path);
        },
        // 是否选中
        selected: false,
      );
    }

    return Drawer(
      child: ListView(
        shrinkWrap: false,
        padding: const EdgeInsets.all(20),
        children: widget.root.toList(includeThis: false).map((e) => link(e)).toList(),
      ),
    );
  }
}

// 在Note上扩展出UI相关的字段，比如目录树的点开状态`extend`
extension _TreeViewNote on N {
  static const _extendAttrName = "catalog.TreeViewNote.extend";

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
