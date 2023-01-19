import 'package:flutter/material.dart';

main() {
  runApp(const App());
}

// ignore: camel_case_types
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  double _size = 24; //state

  @override
  Widget build(BuildContext context) {
    var body = Row(children: [
      ElevatedButton(child: Text("大大大！【size=$_size】"), onPressed: () => setState(() => _size += 10)),
      Icon(Icons.blur_off, size: _size),
    ]);
    return MaterialApp(home: Scaffold(body: body));
  }
}
