import 'package:flutter/material.dart';
import 'package:learn_flutter/navigator.dart';
import 'screens.dart';

class NotFoundScreen extends StatelessWidget with Screen<void, void> {
  final Uri unknown;

  NotFoundScreen({super.key, required this.unknown});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(rules.notFound.path)),
      body: Text("404 not found: $unknown"),
    );
  }

  @override
  Uri get uri => Uri(path: rules.notFound.path);
}
