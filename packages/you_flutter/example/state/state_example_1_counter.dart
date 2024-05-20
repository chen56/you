import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: HelloSingleValue())));
}

class HelloSingleValue extends StatelessWidget {
  final counter = 0.signal();

  HelloSingleValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Watch(builder:(context) => Text("counter.value:${counter.value}")),
        Watch(builder:(context) => Text("or counter(): ${counter()}")),
        ElevatedButton(onPressed: () => counter.value++, child: const Text("counter.value++")),
        const Divider(),
        const Text("特别注意，counter.value++, 会先调用getter，再调用setter")
      ],
    );
  }
}
