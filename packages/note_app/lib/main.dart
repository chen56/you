import 'package:flutter/material.dart';
import 'package:note/log.dart';
import 'package:note_app/note_app.dart';
import 'package:note/navigator_v2.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(NoteApp());
  // runApp(MaterialApp(
  //   home: Scaffold(
  //     appBar: AppBar(title: const Text("Drawer Sample")),
  //     body: Row(children: [
  //       Layouts.defaultLayout()(paths.note_welcome),
  //       // const Text("Drawer 除了弹出、收起，还可以直接做普通左边栏"),
  //     ]),
  //   ),
  // ));
}

Logger logger = Logger();

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Note',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      routerConfig: NavigatorV2.config(
        initial: paths.parse(paths.initial.path),
        navigable: paths,
      ),
    );
  }
}
