import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: Feedback_ProgressIndicator())));
}

// ignore: camel_case_types
class Feedback_ProgressIndicator extends StatelessWidget {
  Feedback_ProgressIndicator({super.key});

  final selected = false.signal();

  @override
  Widget build(BuildContext context) {
    return Watch(builder: (context) {
      return Row(children: [
        IconButton(
          isSelected: selected.value,
          selectedIcon: const Icon(Icons.pause),
          icon: const Icon(Icons.play_arrow),
          onPressed: () {
            selected.value = !selected.value;
          },
        ),
        CircularProgressIndicator(value: selected.value ? null : 0.9),
        Expanded(
          child: LinearProgressIndicator(value: selected.value ? null : 0.9),
        ),
      ]);
    });
  }
}
