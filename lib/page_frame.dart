import 'package:flutter/material.dart';
import 'package:learn_flutter/navigator.dart';
import 'package:learn_flutter/note/@common/note.dart';
import 'package:learn_flutter/page.dart';

class RootFrame<T> extends StatelessWidget with Screen<T> implements Frame<T> {
  final P<T> note;

  RootFrame(this.note, {super.key}){
    print("RootFrame()");//todo remove

  }

  @override
  Widget build(BuildContext context) {
    print("rootframe");//todo remove
    List<Widget> pageContent = note.build(context);
    return Scaffold(
      appBar: AppBar(title: const Text("AppBar.title")),
      drawer: NoteDrawerPart(root),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // SizedBox(width: 200, child: NoteDrawerPart(root)),
            Column(children: [...pageContent],),
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
  String get location => note.uri;

  @override
  Rule<T> get rule => note;
}

class NoteDrawerPart extends StatefulWidget {
  final P root;

  const NoteDrawerPart(
    this.root, {
    Key? key,
  }) : super(key: key);

  @override
  State<NoteDrawerPart> createState() => NoteDrawerPartState();
}

class NoteDrawerPartState extends State<NoteDrawerPart> {
  NoteDrawerPartState();

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
    return Drawer(
      child: ListView(
        shrinkWrap: false,
        padding: const EdgeInsets.all(20),
        children: widget.root.toList(includeThis: false).map((e) => NoteLink(e)).toList(),
      ),
    );
  }
}

// 在Note上扩展出UI相关的字段，比如目录树的点开状态`extend`
extension TreeViewNote on P {
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

class NoteLink extends StatelessWidget {
  final P note;

  const NoteLink(this.note, {super.key});

  @override
  Widget build(BuildContext context) {
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
      onTap: () {
        note.extend = !note.extend;
      },
      // 是否选中
      selected: false,
    );
  }
}

