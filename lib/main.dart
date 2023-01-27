import 'package:flutter/material.dart';
import 'package:learn_flutter/src/notes/material/text/Text/2.text_rich.dart' as text_hello;
import 'package:learn_flutter/src/notes/notes.dart';

import 'catalog.dart';

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
        appBar: AppBar(title: const Text("AppBar.title")),
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
