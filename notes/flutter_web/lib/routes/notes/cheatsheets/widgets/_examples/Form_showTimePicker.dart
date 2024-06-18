import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: Form_showTimePicker())));
}

// ignore: camel_case_types
class Form_showTimePicker extends StatelessWidget {
  Form_showTimePicker({super.key});

  final Value<TimeOfDay?> time = (null as TimeOfDay?).signal();

  @override
  Widget build(BuildContext context) {
    return Watch(
      builder: (context) {
        return Column(
          children: <Widget>[
            Text("date: ${time.value}"),
            TextButton.icon(
              onPressed: () async {
                TimeOfDay? selected = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                time.value = selected;
              },
              icon: const Icon(Icons.timer_outlined),
              label: const Text('showTimePicker dialog'),
            ),
          ],
        );
      },
    );
  }
}
