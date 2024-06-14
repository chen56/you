import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: Form_Radio())));
}

// ignore: camel_case_types
class Form_Radio extends StatelessWidget {
  Form_Radio({super.key});

  final List<TargetPlatform> targets = List.of([TargetPlatform.linux, TargetPlatform.windows, TargetPlatform.macOS]);
  final Value<TargetPlatform?> radioListTile = (null as TargetPlatform?).signal();
  final Value<TargetPlatform?> radio = (null as TargetPlatform?).signal();

  @override
  Widget build(BuildContext context) {
    return Watch(
      builder: (context) {
        return Column(
          children: <Widget>[
            Wrap(
              children: [
                const Text("RadioListTile:"),
                for (var t in targets)
                  RadioListTile<TargetPlatform>(
                    title: Text(t.name),
                    value: t,
                    groupValue: radioListTile.value,
                    toggleable: true,
                    onChanged: (value) => radioListTile.value = value,
                  ),
                const Text("Radio:"),
                for (var t in targets)
                  ListTile(
                    title: Text(t.name),
                    leading: Radio<TargetPlatform>(
                      value: t,
                      groupValue: radio.value,
                      onChanged: (value) => radio.value = value,
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
