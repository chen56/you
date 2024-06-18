import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(home: Scaffold(body: Spacer_Spacer())));
}

// ignore: camel_case_types
class Spacer_Spacer extends StatelessWidget {
  const Spacer_Spacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Row(children: [
        Text('Row left'),
        Spacer(),
        Text('Row right'),
      ]),
    ]);
  }
}
