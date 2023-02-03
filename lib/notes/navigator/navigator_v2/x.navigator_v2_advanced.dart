import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class Rules {
  static final List<RouteRule> rules = List.empty(growable: true);

  static final home = rule("/", const Text("Welcome Home!"));
  static final about = rule("/about", const Text("About!"));
  static final help = rule("/help", const Text("Help!"));

  static RouteRule rule(String path, Widget toScreen) {
    var result = RouteRule(path: path, widget: _embedMainScreen(title: path, right: toScreen));
    rules.add(result);
    return result;
  }

  static _embedMainScreen({required String title, required Widget right}) {
    final left = Builder(
      builder: (context) {
        var pages = App.of(context).rules._pages.reversed.toList();
        bool canGoBack = App.of(context).rules.canGoBack;
        return Drawer(
          child: ListView(
            children: [
              _link("GO Home", home),
              _link("About us", about),
              _link("Help", help),
              ElevatedButton(
                  onPressed: canGoBack ? () => App.of(context).rules.pop(context) : null,
                  child: const Text("< back history")),
              for (int i = 0; i < pages.length; i++)
                ListTile(title: Text("  pages[${pages.length - i - 1}]:${pages[i].name}"))
            ],
          ),
        );
      },
    );

    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(title: Text(title)),
          body: Row(
            children: [left, right],
          ),
        );
      },
    );
  }

  static Widget _link(String linkText, RouteRule rule) {
    return Builder(
      builder: (context) => ListTile(
        title: Text(linkText),
        onTap: () {
          Scaffold.of(context).closeDrawer();
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
  late RouteRules rules = RouteRules(setState: setState, routes: Rules.rules.toList());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: rules.buildNavigator(context)));
  }
}

/////////////////////////////////////////
// 以下是业务无关的工具代码，可以复用
/////////////////////////////////////////
class RouteRules {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "myNavigator");
  final List<Page> _pages = List.empty(growable: true);

  RouteRules({
    required this.routes,
    required this.setState,
  }) {
    log("new");
  }

  final List<RouteRule> routes;
  final void Function(VoidCallback fn) setState;

  Navigator buildNavigator(BuildContext context) {
    if (_pages.isEmpty) {
      _pages.add(Rules.home.buildPage());
    }
    log("build");

    var navigator = Navigator(
      key: navigatorKey,
      onPopPage: (route, result) {
        log("build.onPopPage - route:${route.settings.name}, result:$result");
        if (_pages.isNotEmpty) {
          setState(() => _pages.removeLast());
        }
        return route.didPop(result);
      },
      pages: _pages.toList(), //toList()非常重要, 如果传入的pages是同一个ref，flutter会认为无变化
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

  pop(BuildContext context) {
    if (_pages.isEmpty) {
      return;
    }
    setState(() {
      _pages.removeLast();
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
