import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class Rules {
  static final List<RouteRule> _rules = List.empty(growable: true);

  final home = _rule("/home", const HomeScreen());
  final help = _rule("/help", const HelpScreen());
  final notFound = _rule("/404", const Text("404 not found"));

  Rules._();

  static RouteRule _rule(String path, Widget toScreen) {
    var result = RouteRule(path: path, widget: toScreen);
    _rules.add(result);
    return result;
  }

  RouteRule find(String path) =>
      _rules.firstWhere((element) => element.path == path, orElse: () => notFound);
}

Rules rules = Rules._();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(rules.home.path)),
      body: ElevatedButton(
        child: const Text("NavigatorV2.push(context, Rules.help)"),
        onPressed: () {
          NavigatorV2.pushNamed(context, rules.help.path);
        },
      ),
    );
  }
}

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(rules.help.path)),
      body: ElevatedButton(
        child: const Text("NavigatorV2.pop(context)"),
        onPressed: () {
          NavigatorV2.pop(context);
        },
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: NavigatorV2(
          first: rules.home,
          rules: Rules._rules.toList(),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////
// 以下是封装后的NavigatorV2高级Api
////////////////////////////////////////////////

class RouteRule {
  const RouteRule({
    required this.path,
    required this.widget,
  });

  final String path;
  final Widget widget;

  MaterialPage buildPage() {
    return MaterialPage(name: path, child: widget);
  }

  @override
  String toString() {
    return path;
  }
}

class NavigatorV2 extends StatefulWidget {
  static NavigatorV2State of(BuildContext context) {
    return context.findAncestorStateOfType<NavigatorV2State>()!;
  }

  const NavigatorV2({
    super.key,
    required this.first,
    required this.rules,
  });

  final RouteRule first;
  final List<RouteRule> rules;

  @override
  State<StatefulWidget> createState() {
    return NavigatorV2State();
  }

  static void pop(BuildContext context) {
    of(context).pop();
  }

  static void pushNamed(BuildContext context, String path) {
    var state = of(context);
    var rule = state.widget.rules.firstWhere((element) => element.path == path);
    state.push(rule);
  }
}

class NavigatorV2State extends State<NavigatorV2> {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "myNavigator");

  late final List<Page> _pages = List.from([widget.first.buildPage()], growable: true);

  @override
  Widget build(BuildContext context) {
    log("build");
    var navigator = Navigator(
      key: navigatorKey,
      onPopPage: (route, result) {
        log("build.onPopPage - route:${route.settings.name}, result:$result");
        if (!route.didPop(result)) {
          return false;
        }
        if (_pages.isNotEmpty) {
          setState(() => _pages.removeLast());
        }
        return true;
      },
      //toList()非常重要! 如果传入的pages是同一个ref，flutter会认为无变化
      pages: _pages.toList(),
    );
    return navigator;
  }

  bool get canGoBack => _pages.length > 1;

  void push(RouteRule rule) {
    log("push - rule:$rule");
    setState(() {
      _pages.add(rule.buildPage());
    });
  }

  pop() {
    log("pop");
    if (_pages.isEmpty) {
      return;
    }
    setState(() {
      _pages.removeLast();
    });
  }

  void log(Object? message) {
    if (kDebugMode) {
      var pageLog = _pages.map((e) => e.name).toList();
      print("$runtimeType(id:${identityHashCode(this)}) - $message - pages:$pageLog");
    }
  }
}
