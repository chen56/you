import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(home: Scaffold(body: Form_DropdownMenu())));
}

// ignore: camel_case_types
class Form_DropdownMenu extends StatelessWidget {
  const Form_DropdownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
          const Text("enableFilter: true "),
          DropdownMenu<TargetPlatform>(
            label: const Text('platform'),
            enableFilter: true,
            onSelected: (value) {},
            dropdownMenuEntries: TargetPlatform.values.map((e) {
              return DropdownMenuEntry<TargetPlatform>(value: e, label: e.name);
            }).toList(),
          )
        ]),
        Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
          const Text("enableFilter: false"),
          DropdownMenu<TargetPlatform>(
            label: const Text('platform'),
            enableFilter: false,
            onSelected: (value) {},
            dropdownMenuEntries: TargetPlatform.values.map((e) {
              return DropdownMenuEntry<TargetPlatform>(value: e, label: e.name);
            }).toList(),
          ),
        ]),
      ],
    );
  }
}
