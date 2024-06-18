import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(home: Scaffold(body: Decorator_Badge())));
}

// ignore: camel_case_types
class Decorator_Badge extends StatelessWidget {
  const Decorator_Badge({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Badge.count(count: 1000, child: const Icon(Icons.mail_outlined)),
      const Badge(child: Icon(Icons.sms_failed_outlined)),
      Badge.count(count: 23, child: ElevatedButton(onPressed: () {}, child: const Text("Button"))),
      const Badge(
        label: Text("2000 ¥"),
        alignment: AlignmentDirectional.bottomCenter,
        child: Card(
          elevation: 4,
          color: Colors.green,
          child: Padding(padding: EdgeInsets.all(20), child: Text('Card')),
        ),
      ),
    ]);
  }
}
