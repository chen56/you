import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@internal
class ObjectContent extends StatelessWidget   {
  final Object? content;

  const ObjectContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text("$content");
  }
}
