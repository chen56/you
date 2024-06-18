import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(home: Scaffold(body: Feedback_SnackBar())));
}

// ignore: camel_case_types
class Feedback_SnackBar extends StatelessWidget {
  const Feedback_SnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: const Text('SnackBar'),
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {},
          ),
        );

        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: const Text(
        'SnackBar',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
