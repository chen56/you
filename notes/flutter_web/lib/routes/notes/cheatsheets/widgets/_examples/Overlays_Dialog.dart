import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(home: Scaffold(body: Overlays_Dialog())));
}

// ignore: camel_case_types
class Overlays_Dialog extends StatelessWidget {
  const Overlays_Dialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: [
        TextButton(
          child: const Text('dialog'),
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('''AlertDialog'''),
                content: const Text('''
A Material Design alert dialog.
An alert dialog (also known as a basic dialog) informs the user about
situations that require acknowledgment. An alert dialog has an optional
title and an optional list of actions. The title is displayed above the
content and the actions are displayed below the content.'''),
                actions: <Widget>[
                  FilledButton(child: const Text('Ok'), onPressed: () => Navigator.of(context).pop()),
                ],
              ),
            );
          },
        ),
        TextButton(
          child: const Text('Dialog.fullscreen'),
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (context) => Dialog.fullscreen(
                child: AppBar(
                  title: const Text('Dialog.fullscreen'),
                  centerTitle: false,
                  leading: IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.of(context).pop()),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
