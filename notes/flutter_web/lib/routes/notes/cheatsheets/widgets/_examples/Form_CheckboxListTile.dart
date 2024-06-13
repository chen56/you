import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: Form_CheckboxListTile())));
}

// ignore: camel_case_types
class Form_CheckboxListTile extends StatelessWidget {
  Form_CheckboxListTile({super.key});

  final Value<bool?> checkboxListTile1 = (null as bool?).signal();
  final Value<bool> checkboxListTile2 = false.signal();

  @override
  Widget build(BuildContext context) {
    return Watch(
      builder: (context) {
        return Column(
          children: <Widget>[
            CheckboxListTile(tristate: true, value: checkboxListTile1.value, title: const Text('tristate: true'), onChanged: (value) => checkboxListTile1.value = value),
            CheckboxListTile(tristate: false, value: checkboxListTile2.value, title: const Text('tristate: false'), onChanged: (value) => checkboxListTile2.value = value!),
          ],
        );
      },
    );
  }
}
