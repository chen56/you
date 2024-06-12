import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(home: Scaffold(body: Input_ButtonStyleButtonExample())));
}

// ignore: camel_case_types
class Input_ButtonStyleButtonExample extends StatelessWidget {
  const Input_ButtonStyleButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text("ElevatedButton")),
              FilledButton(onPressed: () {}, child: const Text('FilledButton')),
              FilledButton.tonal(onPressed: () {}, child: const Text('FilledButton.tonal')),
              OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton')),
              TextButton(onPressed: () {}, child: const Text('TextButton')),
            ].map((e) => Padding(padding: const EdgeInsets.all(2), child: e)).toList(),
          ),
        ),
        IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.image), label: const Text('Add Icon')),
              FilledButton.icon(onPressed: () {}, label: const Text('Add Icon'), icon: const Icon(Icons.image)),
              FilledButton.tonalIcon(onPressed: () {}, label: const Text('Add Icon'), icon: const Icon(Icons.image)),
              OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.image), label: const Text('Add Icon')),
              TextButton.icon(onPressed: () {}, icon: const Icon(Icons.image), label: const Text('Add Icon'))
            ].map((e) => Padding(padding: const EdgeInsets.all(2), child: e)).toList(),
          ),
        ),
        IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ElevatedButton(onPressed: null, child: Text("ElevatedButton")),
              const FilledButton(onPressed: null, child: Text('FilledButton')),
              const FilledButton.tonal(onPressed: null, child: Text('FilledButton.tonal')),
              const OutlinedButton(onPressed: null, child: Text('OutlinedButton')),
              const TextButton(onPressed: null, child: Text('TextButton')),
            ].map((e) => Padding(padding: const EdgeInsets.all(2), child: e)).toList(),
          ),
        ),
      ],
    );
  }
}
