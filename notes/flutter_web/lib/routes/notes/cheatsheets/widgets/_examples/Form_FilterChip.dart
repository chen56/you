import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: Form_FilterChip())));
}

// ignore: camel_case_types
class Form_FilterChip extends StatelessWidget {
  Form_FilterChip({super.key});

  final Set<String> selected = <String>{}.signal();

  @override
  Widget build(BuildContext context) {
    return Watch(
      builder: (context) {
        return Column(
          children: <Widget>[
            Wrap(
              children: [
                for (var t in TargetPlatform.values)
                  FilterChip(
                    label: Text(t.name),
                    selected: selected.contains(t.name),
                    onSelected: (bool value) {
                      if (value) {
                        selected.add(t.name);
                      } else {
                        selected.remove(t.name);
                      }
                    },
                  )
              ],
            ),
            FilledButton(onPressed: () => selected.clear(), child: const Text("Reset")),
          ],
        );
      },
    );
  }
}
