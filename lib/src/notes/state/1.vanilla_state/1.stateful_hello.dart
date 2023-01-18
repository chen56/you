import 'package:flutter/material.dart';

main() {
  runApp(const HelloStatefulApp());
}

class HelloStatefulApp extends StatefulWidget {
  const HelloStatefulApp({super.key});

  @override
  State<HelloStatefulApp> createState() => HelloStatefulAppState();
}

class HelloStatefulAppState extends State<HelloStatefulApp> {
  double _size = 24; //state

  @override
  Widget build(BuildContext context) {
    var body = Row(children: [
      ElevatedButton(child: const Text("-"), onPressed: () => setState(() => _size += 10)),
      Icon(Icons.accessibility, size: _size),
      ElevatedButton(child: const Text("-"), onPressed: () => setState(() => _size -= 10)),
    ]);
    return MaterialApp(home: Scaffold(body: body));
  }
}
