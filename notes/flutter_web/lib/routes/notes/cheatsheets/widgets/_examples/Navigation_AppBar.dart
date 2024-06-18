import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(MaterialApp(home: Navigation_AppBar()));
}

// ignore: camel_case_types
class Navigation_AppBar extends StatelessWidget {
  Navigation_AppBar({super.key});

  final pinned = true.signal();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(backgroundColor: colors.surfaceContainerHighest, leading: const BackButton(), actions: [
        IconButton(icon: const Icon(Icons.minimize), onPressed: () {}),
        IconButton(icon: const Icon(Icons.filter_alt_off), onPressed: () {}),
      ]),
      body: const Text("Hello\nWorld"),
    );
  }
}
