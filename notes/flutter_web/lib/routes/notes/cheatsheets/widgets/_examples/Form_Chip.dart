import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: Form_Chip())));
}

// ignore: camel_case_types
class Form_Chip extends StatelessWidget {
  Form_Chip({super.key});

  final Set<TargetPlatform> targets = Set.of(TargetPlatform.values).signal();

  @override
  Widget build(BuildContext context) {
    return Watch(builder: (context) {
      return Column(children: <Widget>[
        Wrap(
          children: [
            for (var target in targets)
              Chip(
                avatar: CircleAvatar(child: Text(target.name[0])),
                label: Text(target.name),
                onDeleted: () => targets.remove(target),
              )
          ],
        ),
        FilledButton(
            onPressed: () {
              targets.clear();
              targets.addAll(TargetPlatform.values);
            },
            child: const Text("Reset")),
      ]);
    });
  }
}
