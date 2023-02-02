import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class Rules {
  static final List<RouteRule> _rules = List.empty(growable: true);

  final home = _rule<void>("/home", const HomeScreen());
  final help = _rule<String>("/help", const HelpScreen());

  Rules._();

  static RouteRule<R> _rule<R>(String path, Widget toScreen) {
    var result = RouteRule<R>(path: path, widget: toScreen);
    _rules.add(result);
    return result;
  }
}

Rules rules = Rules._();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScaffoldMessengerState sms = ScaffoldMessenger.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(rules.home.path)),
      body: ElevatedButton(
        child: const Text("NavigatorV2s.push(context, Rules.help)"),
        onPressed: () async {
          String result = await NavigatorV2.push(context, rules.help);
          sms.showSnackBar(SnackBar(
            duration: const Duration(milliseconds: 1000),
            content: Text('help result: $result'),
          ));
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
      body: Column(
        children: [
          ElevatedButton(
            child: const Text("NavigatorV2.pop(context,'已解决')"),
            onPressed: () {
              NavigatorV2.pop(context, "已解决");
            },
          ),
          ElevatedButton(
            child: const Text("NavigatorV2.pop(context，'未解决')"),
            onPressed: () {
              NavigatorV2.pop(context, "未解决");
            },
          )
        ],
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
// 上面是应用代码，下面是封装后的NavigatorV2高级Api
////////////////////////////////////////////////

class RouteRule<R> {
  RouteRule({
    required this.path,
    required this.widget,
  });

  final Widget widget;
  final String path;

  MyPage<R> buildPage() {
    return MyPage(rule: this);
  }

  @override
  String toString() {
    return path;
  }

  Future<R> push(BuildContext context) {
    return NavigatorV2.push<R>(context, this);
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

  final RouteRule<void> first;
  final List<RouteRule> rules;

  @override
  State<StatefulWidget> createState() {
    return NavigatorV2State();
  }

  @optionalTypeArgs
  static void pop<R>(BuildContext context, [R? result]) {
    of(context).pop<R>(result);
  }

  static Future<R> push<R>(BuildContext context, RouteRule<R> rule) {
    return of(context).push<R>(rule);
  }
}

class NavigatorV2State extends State<NavigatorV2> {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "myNavigator");

  late final List<MyPage> _pages = List.from([widget.first.buildPage()], growable: true);

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

  Future<R> push<R>(RouteRule<R> rule) {
    log("push - rule:$rule");
    MyPage<R> page = rule.buildPage();
    setState(() {
      _pages.add(page);
    });
    return page.poped;
  }

  @optionalTypeArgs
  void pop<R>([R? result]) {
    log("pop");
    if (_pages.isEmpty) {
      return;
    }
    setState(() {
      var page = _pages.removeLast();
      page._completer.complete(result);
    });
  }

  void log(Object? message) {
    if (kDebugMode) {
      var pageLog = _pages.map((e) => e.name).toList();
      print("$runtimeType(id:${identityHashCode(this)}) - $message - pages:$pageLog");
    }
  }
}

class MyPage<R> extends MaterialPage<R> {
  MyPage({
    super.key,
    required RouteRule rule,
  }) : super(name: rule.path, child: rule.widget);

  final Completer<R> _completer = Completer();

  Future<R> get poped => _completer.future;
}
