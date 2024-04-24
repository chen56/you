import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
// https://api.flutter-io.cn/flutter/material/Divider-class.html
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('Divider Sample')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: <Widget>[
            card("1"),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
              color: Colors.green,
            ),
            card("2"),
          ]),
        ),
      ),
    );
  }
}

Expanded card(String text) {
  return Expanded(
    child: Card(
      child: SizedBox.expand(child: Center(child: Text(text))),
    ),
  );
}
