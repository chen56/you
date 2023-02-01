import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class Rules {
  static final List<RouteRule> rules = List.empty(growable: true);

  static final home = rule("/home", const HomeScreen());
  static final about = rule("/about", const AbortScreen());

  static RouteRule rule(String path, Widget toScreen) {
    var result = RouteRule(path: path, widget: toScreen);
    rules.add(result);
    return result;
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("/home")),
      body: ElevatedButton(
        child: const Text("NavigatorV2.push(context, Rules.about)"),
        onPressed: () {
          NavigatorV2.pushNamed(context, Rules.about.path);
        },
      ),
    );
  }
}

class AbortScreen extends StatelessWidget {
  const AbortScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("/about")),
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
          first: Rules.home,
          rules: Rules.rules.toList(),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////
// 以下是封装后的NavigatorV2高级Api
////////////////////////////////////////////////

class RouteRule {
  RouteRule({
    required this.path,
    required this.widget,
  });

  final Widget widget;
  final String path;

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
