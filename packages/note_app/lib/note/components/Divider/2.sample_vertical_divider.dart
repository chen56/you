import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// https://api.flutter-io.cn/flutter/material/VerticalDivider-class.html
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var divider = const VerticalDivider(
      width: 0,
      thickness: 5,
      indent: 0,
      endIndent: 0,
      color: Colors.green,
    );

    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: divider,
        ),
      ),
    );
  }
}
