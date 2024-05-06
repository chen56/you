import 'package:flutter/material.dart';
import 'package:you_flutter/router.dart';

RootPage build(BuildContext context) {
  // ignore: unnecessary_type_check
  assert(build is PageBodyBuilder);
  return const RootPage();
}

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("/  root page");
  }
}
