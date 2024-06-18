import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: Form_ChoiceChip())));
}

// ignore: camel_case_types
class Form_ChoiceChip extends StatelessWidget {
  Form_ChoiceChip({super.key});

  final Value<TargetPlatform?> selected = (null as TargetPlatform?).signal();

  @override
  Widget build(BuildContext context) {
    return Watch(
      builder: (context) {
        return Column(
          children: <Widget>[
            Wrap(
              children: [
                for (var t in TargetPlatform.values)
                  ChoiceChip(
                      label: Text(t.name),
                      selected: selected.value == t,
                      onSelected: (bool value) {
                        selected.value = value ? t : null;
                      }),
              ],
            ),
          ],
        );
      },
    );
  }
}
