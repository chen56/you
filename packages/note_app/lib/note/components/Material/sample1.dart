import 'package:flutter/material.dart';

void main() => runApp(const App());

// how to understand Material class?
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    var material = const Material(
      color: Colors.blue,
      child: Center(
        child: Text(
          'xxxxx',
          // style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
      ),
    );
    return MaterialApp(
      theme: ThemeData.dark().copyWith(useMaterial3: true),
      home: Scaffold(
        body: material,
      ),
    );
  }
}
