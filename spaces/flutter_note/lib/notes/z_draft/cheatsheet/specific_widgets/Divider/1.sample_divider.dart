import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// https://api.flutter-io.cn/flutter/material/Divider-class.html
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var divider = const Divider(
      height: 20,
      thickness: 5,
      indent: 20,
      endIndent: 20,
      color: Colors.green,
    );

    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: divider,
        ),
      ),
    );
  }
}
