import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: Form_CalendarDatePicker())));
}

// ignore: camel_case_types
class Form_CalendarDatePicker extends StatelessWidget {
  Form_CalendarDatePicker({super.key});

  final Value<DateTime?> date = (null as DateTime?).signal();

  @override
  Widget build(BuildContext context) {
    return Watch(
      builder: (context) {
        return Column(
          children: <Widget>[
            Text("date: ${date.value}"),
            CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(DateTime.now().year - 1),
              lastDate: DateTime(DateTime.now().year + 1),
              onDateChanged: (value) => date.value = value,
            ),
          ],
        );
      },
    );
  }
}
