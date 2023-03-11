import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    var header = DrawerHeader(
      decoration: const BoxDecoration(color: Colors.blue),
      child: Column(
        children: const [Icon(Icons.person), Text("Header默认较高，可以配合其他组件调节.可以配合其他组件调节")],
      ),
    );
    var drawer = Drawer(
      child: ListView(
        children: [
          header,
          //通过其他组件（SizedBox）调节DrawerHeader高度
          SizedBox.fromSize(
            size: const Size.fromHeight(100),
            child: header,
          ),
          ListTile(title: const Text("Home"), onTap: () => {}),
          ListTile(title: const Text("ABout"), onTap: () => {}),
        ],
      ),
    );
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Drawer Sample")),
        drawer: drawer,
        body: Row(children: [
          drawer,
          const Text("Drawer 除了弹出、收起，还可以直接做普通左边栏"),
        ]),
      ),
    );
  }
}
