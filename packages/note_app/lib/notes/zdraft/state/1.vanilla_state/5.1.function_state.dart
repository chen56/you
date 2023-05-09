import 'package:flutter/material.dart';

main() {
  runApp(App());
}

class App extends StatelessWidget {
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
