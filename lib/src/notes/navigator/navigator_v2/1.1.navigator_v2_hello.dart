import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const App());
}

class Rules {
  static final List<RouteRule> rules = List.empty(growable: true);

  static final notFound = _warpMainScreen("/404", const Text("404!"));
  static final home = _warpMainScreen("/", const Text("Welcome Home!"));
  static final about = _warpMainScreen("/about", const Text("About!"));
  static final help = _warpMainScreen("/help", const Text("Help!"));

  static RouteRule _warpMainScreen(String path, Widget right) {
    final left = Builder(
      builder: (context) => Drawer(
        child: ListView(
          children: [
            _link("GO Home", home),
            _link("About us", about),
            _link("Help", help),
          ],
        ),
      ),
    );

    final warpMainScreen = Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(title: Text(path)),
        body: Row(
          children: [
            SizedBox(width: 200, child: left),
            Expanded(child: right),
          ],
        ),
      ),
    );
    var result = RouteRule(path: path, widget: warpMainScreen);
    rules.add(result);
    return result;
  }

  static Widget _link(String linkText, RouteRule rule) {
    return Builder(
      builder: (context) => ListTile(
        title: Text(linkText),
        onTap: () {
          App.of(context).rules.push(rule);
        },
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }

  static AppState of(BuildContext context) {
    return context.findAncestorStateOfType<AppState>()!;
  }
}

class AppState extends State<App> {
  late RouteRules rules = RouteRules(
      setState: setState, home: Rules.home, notFound: Rules.notFound, routes: Rules.rules.toList());

  @override
  Widget build(BuildContext context) {
    log("build");
    return MaterialApp(home: Scaffold(body: rules.build(context)));
  }

  void log(Object? message) {
    if (kDebugMode) {
      print("$runtimeType(id:${identityHashCode(this)}) - $message");
    }
  }
}

class RouteRules {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "myNavigator");
  final List<Page> _pages = List.empty(growable: true);

  RouteRules({
    required this.home,
    required this.notFound,
    required this.routes,
    required this.setState,
  });

  final RouteRule home;
  final RouteRule notFound;
  final List<RouteRule> routes;
  final void Function(VoidCallback fn) setState;

  @override
  Widget build(BuildContext context) {
    if (_pages.isEmpty) {
      _pages.add(Rules.home.buildPage());
    }
    log("build");

    var navigator = Navigator(
      key: navigatorKey,
      onPopPage: (route, result) {
        log("onPopPage - route:$route, result:$result, ${_pages.map((e) => e.name)}");
        if (_pages.isNotEmpty) {
          setState(() => _pages.removeLast());
        }
        return route.didPop(result);
      },
      pages: _pages.toList(), //toList()非常重要, 如果传入的pages是同一个ref，flutter会认为无变化
    );
    return navigator;
  }

  void push(RouteRule rule) {
    log("push - rule:$rule");

    setState(() {
      _pages.add(rule.buildPage());
    });
  }

  void log(Object? message) {
    if (kDebugMode) {
      var pageLog = _pages.map((e) => e.name);
      print("$runtimeType(id:${identityHashCode(this)}) - $message - pages:$pageLog");
    }
  }
}

class RouteRule {
  RouteRule({
    required this.path,
    required this.widget,
  });

  final Widget widget;
  final String path;

  MaterialPage<dynamic> buildPage() {
    log("buildPage");
    return MaterialPage(name: path, child: widget);
  }

  @override
  String toString() {
    return path;
  }

  void log(Object? message) {
    if (kDebugMode) {
      print("$runtimeType(id:${identityHashCode(this)}) - $message ");
    }
  }
}
