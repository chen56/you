import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: Form_ActionChip())));
}

// ignore: camel_case_types
class Form_ActionChip extends StatelessWidget {
  Form_ActionChip({super.key});

  final Value<bool> favorite = false.signal();

  @override
  Widget build(BuildContext context) {
    return Watch(builder: (context) {
      return Column(children: <Widget>[
        Wrap(children: [
          ActionChip(
            avatar: Icon(favorite.value ? Icons.favorite : Icons.favorite_border),
            label: const Text("favorite"),
            onPressed: () => favorite.value = !favorite.value,
          ),
        ]),
      ]);
    });
  }
}
