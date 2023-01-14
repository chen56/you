import 'package:flutter/material.dart';
import 'package:learn_flutter/src/docs/widgets/text/Text/text_rich.dart' as text_hello;

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
        drawer: MyDrawer(),
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

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  get child => null;

  @override
  Widget build(BuildContext context) {
    (context as Element).widget == this;
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              child: const Text("Default ElevatedButton"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
