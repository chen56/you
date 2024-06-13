import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(home: Scaffold(body: Navigation_Menu())));
}

// ignore: camel_case_types
class Navigation_Menu extends StatelessWidget {
  const Navigation_Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder: (context, controller, child) {
        return FilledButton.tonal(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          child: const Text('Show menu'),
        );
      },
      menuChildren: [
        MenuItemButton(leadingIcon: const Icon(Icons.people_alt_outlined), child: const Text('Item 1'), onPressed: () {}),
        MenuItemButton(leadingIcon: const Icon(Icons.remove_red_eye_outlined), child: const Text('Item 2'), onPressed: () {}),
        MenuItemButton(leadingIcon: const Icon(Icons.refresh), child: const Text('Item 3'), onPressed: () {}),
      ],
    );
  }
}
