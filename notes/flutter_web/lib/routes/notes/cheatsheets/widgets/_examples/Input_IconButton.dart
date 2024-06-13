import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(home: Scaffold(body: Input_IconButton())));
}

// ignore: camel_case_types
class Input_IconButton extends StatefulWidget {
  const Input_IconButton({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<Input_IconButton> {
  bool standardSelected = false;
  bool filledSelected = false;
  bool outlinedSelected = false;
  bool tonalSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text("IconButton()"),
            IconButton(
              isSelected: standardSelected,
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              onPressed: () => setState(() => standardSelected = !standardSelected),
            ),
            IconButton(
              isSelected: standardSelected,
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              onPressed: null,
            ),
          ],
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text("IconButton.filled()"),
            IconButton.filled(
              isSelected: filledSelected,
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              onPressed: () {
                setState(() => filledSelected = !filledSelected);
              },
            ),
            IconButton.filled(
              isSelected: filledSelected,
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              onPressed: null,
            ),
          ],
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            const Text("IconButton.filledTonal()"),
            IconButton.filledTonal(
              isSelected: tonalSelected,
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              onPressed: () {
                setState(() => tonalSelected = !tonalSelected);
              },
            ),
            IconButton.filledTonal(
              isSelected: tonalSelected,
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              onPressed: null,
            ),
          ],
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            const Text("IconButton.outlined()"),
            IconButton.outlined(
              isSelected: outlinedSelected,
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              onPressed: () {
                setState(() => outlinedSelected = !outlinedSelected);
              },
            ),
            IconButton.outlined(
              isSelected: outlinedSelected,
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              onPressed: null,
            ),
          ],
        ),
      ],
    );
  }
}
