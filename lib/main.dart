import 'package:flutter/material.dart';
import 'package:learn_flutter/src/note/note.dart';
import 'package:learn_flutter/src/notes/material/text/Text/text_rich.dart' as text_hello;
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
              text_hello.RichTextSample(),
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

class NoteDrawer extends StatelessWidget {
  final Note root;

  const NoteDrawer(
    this.root, {
    Key? key,
  }) : super(key: key);

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
          children: root
              .toList(includeThis: false)
              .map((e) => ListTile(
                    leading: Icon(
                      e.isLeaf ? Icons.remove : Icons.keyboard_arrow_down,
                      // size: e.isLeaf ? 10 : null,
                    ),
                    trailing: Icon(
                      e.isLeaf ? Icons.open_in_new : null,
                      size: e.isLeaf ? 20 : null,
                    ),
                    title: Row(
                      children: [
                        // Icon(
                        //   e.isLeaf ? Icons.remove : Icons.keyboard_arrow_down,
                        //   // size: e.isLeaf ? 15 : null,
                        // ),
                        Text(e.title),
                      ],
                    ),
                    dense: true,
                    //更紧凑布局
                    visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                    contentPadding: EdgeInsets.only(left: 20 * (e.level - 1).toDouble()),
                    enabled: true,
                    minLeadingWidth: 0,
                    onTap: () {
                      print("onTap");
                    },
                    // 长按事件回调
                    onLongPress: () {
                      print("onLongPress");
                    },
                    // 是否选中
                    selected: false,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
