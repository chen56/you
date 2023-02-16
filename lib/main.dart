import 'package:flutter/material.dart';
import 'package:learn_flutter/log.dart';
import 'package:learn_flutter/page.dart';
import 'package:learn_flutter/pages/root_tree.dart';

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
        brightness: Brightness.light,
      ),
      routerDelegate: LoggableRouterDelegate(
          logger: logger,
          delegate: MyRouterDelegate(
            //todo 这有问题
            first: paths.welcome.parse(paths.welcome.path),
            navigable:PageLocation(root,paths.notFound),
          )),
      routeInformationParser: Parser(rules: root.toList()),
    );
  }
}
class PageLocation extends Navigable{
  N root;
  List<N> rules;

  N notFound;
  PageLocation(this.root, this.notFound) : rules=root.toList();
  @override
  Screen parse(String location) {
    Uri uri = Uri.parse(location);
    N find = rules.lastWhere((element) => uri.path == element.path, orElse: ()=>notFound);
    return find.parse(location);
  }
}