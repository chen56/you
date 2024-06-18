import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: Form_showDateRangePicker())));
}

// ignore: camel_case_types
class Form_showDateRangePicker extends StatelessWidget {
  Form_showDateRangePicker({super.key});

  final Value<DateTimeRange?> dateRange = (null as DateTimeRange?).signal();

  @override
  Widget build(BuildContext context) {
    return Watch(
      builder: (context) {
        return Column(
          children: <Widget>[
            Text("date: ${dateRange.value}"),
            TextButton.icon(
              onPressed: () async {
                DateTimeRange? selected = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(DateTime.now().year - 1),
                  lastDate: DateTime(DateTime.now().year + 1),
                );
                dateRange.value = selected;
              },
              icon: const Icon(Icons.date_range),
              label: const Text('showDateRangePicker dialog'),
            ),
          ],
        );
      },
    );
  }
}
