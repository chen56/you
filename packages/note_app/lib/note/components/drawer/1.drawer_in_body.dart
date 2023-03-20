import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    var drawer = Drawer(
      child: ListView(
        children: [
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
          const Text("Drawer 既可以弹出、收起，还可以直接放到body里"),
        ]),
      ),
    );
  }
}
