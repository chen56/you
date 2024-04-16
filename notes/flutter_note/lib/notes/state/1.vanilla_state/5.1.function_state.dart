import 'package:flutter/material.dart';

main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    double scale = 1;
    var body = StatefulBuilder(
      builder: (context, setState) => ElevatedButton(
          child: Text("大！【scale=$scale】", textScaleFactor: scale),
          onPressed: () => setState(() => scale += 1)),
    );
    return MaterialApp(home: Scaffold(body: body));
  }
}
