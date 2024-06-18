import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: Form_showDatePicker())));
}

// ignore: camel_case_types
class Form_showDatePicker extends StatelessWidget {
  Form_showDatePicker({super.key});

  final Value<DateTime?> date = (null as DateTime?).signal();

  @override
  Widget build(BuildContext context) {
    return Watch(
      builder: (context) {
        return Column(
          children: <Widget>[
            Text("date: ${date.value}"),
            TextButton.icon(
              onPressed: () async {
                DateTime? selected = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year - 1),
                  lastDate: DateTime(DateTime.now().year + 1),
                );
                date.value = selected;
              },
              icon: const Icon(Icons.calendar_month),
              label: const Text('showDatePicker dialog'),
            ),
          ],
        );
      },
    );
  }
}
