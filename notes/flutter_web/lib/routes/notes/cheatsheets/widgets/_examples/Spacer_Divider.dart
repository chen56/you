import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(home: Scaffold(body: Spacer_Divider())));
}

// ignore: camel_case_types
class Spacer_Divider extends StatelessWidget {
  const Spacer_Divider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      SizedBox(
        child: Column(children: [
          Text('Divider'),
          Divider(),
          Text('Divider'),
        ]),
      ),
      SizedBox(
        height: 100,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('VerticalDivider'),
          VerticalDivider(),
          Text('VerticalDivider'),
        ]),
      )
    ]);
  }
}
