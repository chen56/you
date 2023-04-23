import 'package:flutter/material.dart';
import 'package:note/log.dart';
import 'package:note_app/note_app.dart';
import 'package:note/navigator_v2.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(NoteApp());
}

Logger logger = Logger();

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    paths.root.extendTree(true);
    paths.zdraft.extendTree(false);
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
