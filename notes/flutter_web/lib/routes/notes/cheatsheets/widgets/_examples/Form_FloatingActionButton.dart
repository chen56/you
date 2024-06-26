import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(home: Scaffold(body: Form_FloatingActionButton())));
}

// ignore: camel_case_types
class Form_FloatingActionButton extends StatelessWidget {
  const Form_FloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () {},
          tooltip: "FloatingActionButton()",
          child: const Text("default"),
        ),
        FloatingActionButton.small(
          // isExtended: false,
          onPressed: () {},
          tooltip: "FloatingActionButton.small()",
          child: const Text("small"),
        ),
        FloatingActionButton.large(
          // isExtended: false,
          onPressed: () {},
          tooltip: "FloatingActionButton.large()",
          child: const Text("large"),
        ),
        FloatingActionButton.extended(
          // isExtended: false,
          onPressed: () {},
          tooltip: "FloatingActionButton.extended()",
          label: const Text('extended'),
          icon: const Icon(Icons.thumb_up),
        ),
      ].map((e) => Padding(padding: const EdgeInsets.all(2), child: e)).toList(),
    );
  }
}
