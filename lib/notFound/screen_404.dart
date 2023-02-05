import 'package:flutter/material.dart';
import 'package:learn_flutter/navigator.dart';
import 'package:learn_flutter/page.dart';

class NotFoundScreen extends StatelessWidget with Screen<void> {
  final Uri unknown;

  NotFoundScreen({super.key, required this.unknown});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(paths.notFound.path)),
      body: Text("404 not found: $unknown"),
    );
  }

  @override
  Uri get uri => Uri(path: paths.notFound.path);
}
