import 'package:flutter/material.dart';

class ObjectContent extends StatelessWidget   {
  final Object? content;

  const ObjectContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text("$content");
  }
}
