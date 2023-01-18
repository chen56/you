import 'package:flutter/material.dart';
import 'package:learn_flutter/src/note/note.dart';
import 'package:learn_flutter/src/notes/material/text/Text/2.text_rich.dart' as text_hello;
import 'package:learn_flutter/src/notes/notes.dart';

void main() {
  runApp(const LearnApp());
}

class LearnApp extends StatelessWidget {
  const LearnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Flutter with Samples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("AppBar.title"),
        ),
        drawer: NoteDrawer(noteRoot),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const text_hello.RichTextSample(),
              text_hello.params.path("text.data").builder(),
              StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) =>
                      text_hello.params.path("text.textAlign").builder()),
              // text_hello.params.path("text.textAlign").builder(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class NoteDrawer extends StatefulWidget {
  final Note root;

  const NoteDrawer(
    this.root, {
    Key? key,
  }) : super(key: key);

  @override
  State<NoteDrawer> createState() => NoteDrawerState();
}

class NoteDrawerState extends State<NoteDrawer> {

  //todo : 实现正确的状态监听器，目前是stub代码
  late Null Function() listener;

  NoteDrawerState() {
    listener = () {
      setState(() {});
    };
  }

  @override
  void initState() {
    super.initState();
    widget.root.addListener(listener);
  }

  @override
  void dispose() {
    widget.root.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: false,
        child: ListView(
          shrinkWrap: false,
          padding: const EdgeInsets.all(10),
          children: widget.root.toList(includeThis: false).map((e) => NoteTreeItem(e)).toList(),
        ),
      ),
    );
  }
}

extension TreeViewNote on Note {
  static const _extendAttrName = "TreeViewNote.extend";

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

class NoteTreeItem extends StatelessWidget {
  final Note note;

  const NoteTreeItem(this.note, {super.key});

  @override
  Widget build(BuildContext context) {
    // (context as Element).updateChild();
    return ListTile(
      leading: Icon(
        note.isLeaf
            ? Icons.remove
            : (note.extend ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right),
        // size: e.isLeaf ? 10 : null,
      ),
      trailing: Icon(
        note.isLeaf ? Icons.open_in_new : null,
        size: note.isLeaf ? 20 : null,
      ),
      title: Row(
        children: [
          // Icon(
          //   e.isLeaf ? Icons.remove : Icons.keyboard_arrow_down,
          //   // size: e.isLeaf ? 15 : null,
          // ),
          Text(note.title),
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
