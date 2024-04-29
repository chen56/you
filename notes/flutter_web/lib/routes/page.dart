// ignore_for_file: non_constant_identifier_names,camel_case_types
import 'package:flutter/material.dart';
import 'package:you_flutter/router.dart';

RootPage build(BuildContext context, ToUri uri) {
  return RootPage(uri: uri);
}

class RootPage extends StatelessWidget {
  final ToUri uri;

  const RootPage({required this.uri, super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("/  root page");
  }
}
