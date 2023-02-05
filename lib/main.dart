import 'package:flutter/material.dart';
import 'package:learn_flutter/note/material/text/Text/2.text_rich.dart' as text_hello;
import 'package:learn_flutter/page.dart';

import 'catalog.dart';
import 'navigator.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //   title: 'Learn Flutter with Samples',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //     useMaterial3: true,
    //   ),
    //     routeInformationParser:NRouterDelegate(),
    // );
    return MaterialApp(
      title: 'Learn Flutter with Samples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("AppBar.title")),
        // drawer: NoteDrawerPart(noteRoot),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 200, child: NoteDrawerPart(rootPage)),
              // const text_hello.RichTextSample(),
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
