import 'package:flutter/material.dart';
import 'package:learn_flutter/page.dart';

import 'navigator.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Note',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      routerDelegate: NRouterDelegate(
        first: paths.notFound,
        notFound: paths.notFound,
        rules: rootPage.toList(),
      ),
    );
  }
}
