import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(home: Scaffold(body: Spacer_Placeholder())));
}

// ignore: camel_case_types
class Spacer_Placeholder extends StatelessWidget {
  const Spacer_Placeholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Placeholder(fallbackWidth: 100, fallbackHeight: 100),
      Placeholder(
        fallbackWidth: 100,
        fallbackHeight: 100,
        child: SizedBox(width: 100, height: 100, child: Text("带child的")),
      ),
    ]);
  }
}
