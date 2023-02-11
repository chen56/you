import 'package:flutter/material.dart';
import 'package:learn_flutter/log.dart';
import 'package:learn_flutter/root_tree.dart';

import 'navigator_v2.dart';

void main() {
  runApp(const App());
}

Logger logger = Logger();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Note',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      routerDelegate: LoggableRouterDelegate(
          logger: logger,
          delegate: MyRouterDelegate(
            first: paths.home,
            notFound: paths.notFound,
            rules: root.toList(),
          )),
      routeInformationParser: Parser(rules: root.toList()),
    );
  }
}
