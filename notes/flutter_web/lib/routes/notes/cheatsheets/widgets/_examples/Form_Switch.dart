import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: Form_Switch())));
}

// ignore: camel_case_types
class Form_Switch extends StatelessWidget {
  Form_Switch({super.key});

  final Value<bool> switch1 = false.signal();
  final Value<bool> switchListTile1 = false.signal();

  @override
  Widget build(BuildContext context) {
    return Watch(
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text("Switch"),
            Switch(value: switch1.value, onChanged: (value) => switch1.value = value),
            Switch(value: switch1.value, onChanged: null),
            const Divider(),
            const Text("SwitchListTile"),
            SwitchListTile(title: const Text("enable"), value: switchListTile1.value, onChanged: (value) => switchListTile1.value = value),
            SwitchListTile(title: const Text("disable"), value: switchListTile1.value, onChanged: null),
          ],
        );
      },
    );
  }
}
