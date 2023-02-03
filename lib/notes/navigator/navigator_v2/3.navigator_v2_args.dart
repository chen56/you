import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class Rules {
  static final List<RouteRule> _rules = List.empty(growable: true);

  final home = _rule<void, void>("/home", (_) => const HomeScreen());
  final help = _rule<HelpArgs, String>("/help", (question) => HelpScreen(args: question));
  final notFound = _rule<void, void>("/404", (_) => const Text("404 not found"));

  Rules._();

  static RouteRule<A, R> _rule<A, R>(String path, Widget Function(A a) builder) {
    var result = RouteRule<A, R>(path: path, builder: builder);
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
    ScaffoldMessengerState sms = ScaffoldMessenger.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(rules.home.path)),
      body: ElevatedButton(
        child: const Text(
            """String answer = rules.help.push(context, args: HelpArgs("how to use navigator v2?")"""),
        onPressed: () async {
          String answer =
              await rules.help.push(context, args: HelpArgs("how to use navigator v2?"));
          sms.showSnackBar(SnackBar(
            duration: const Duration(milliseconds: 2000),
            content: Text('answer: $answer'),
          ));
        },
      ),
    );
  }
}

class HelpArgs {
  HelpArgs(this.question);

  final String question;
}

class HelpScreen extends StatelessWidget {
  final HelpArgs args;

  const HelpScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(rules.help.path)),
      body: Column(
        children: [
          Text("question:${args.question} "),
          ElevatedButton(
            child: const Text('''rules.help.pop(context,"我们有开发过v2吗？") '''),
            onPressed: () {
              rules.help.pop(context, "我们有开发过v2吗？");
            },
          ),
          ElevatedButton(
            child: const Text('''rules.help.pop(context,"你说的v2被另一只狗吓跑了") '''),
            onPressed: () {
              rules.help.pop(context, "你说的v2被另一只狗吓跑了");
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
          notFound: rules.notFound,
          rules: Rules._rules.toList(),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////
// 上面是应用代码，下面是封装后的NavigatorV2高级Api
////////////////////////////////////////////////
/// 范型A： 参数类型, R:结果类型
class RouteRule<A, R> {
  RouteRule({
    required this.path,
    required this.builder,
  });

  final Widget Function(A a) builder;
  final String path;

  MyPage<R> buildPage({required A args}) {
    return MyPage(name: path, child: builder(args));
  }

  @override
  String toString() {
    return path;
  }

  Future<R> push(BuildContext context, {required A args}) {
    return NavigatorV2.pushNamed<A, R>(context, this.path, args: args);
  }

  void pop(BuildContext context, R result) {
    NavigatorV2.pop(context, result);
  }
}

class NavigatorV2 extends StatefulWidget {
  static NavigatorV2State of(BuildContext context) {
    return context.findAncestorStateOfType<NavigatorV2State>()!;
  }

  const NavigatorV2({
    super.key,
    required this.first,
    required this.notFound,
    required this.rules,
  });

  final RouteRule<void, void> first;
  final RouteRule<void, void> notFound;
  final List<RouteRule> rules;

  @override
  State<StatefulWidget> createState() {
    return NavigatorV2State();
  }

  @optionalTypeArgs
  static void pop<R>(BuildContext context, [R? result]) {
    of(context).pop<R>(result);
  }

  static Future<R> pushNamed<A, R>(BuildContext context, String path, {required A args}) {
    var state = of(context);
    RouteRule<A, R> find = state.widget.rules.firstWhere((element) => element.path == path,
        orElse: () => state.widget.notFound) as RouteRule<A, R>;
    return state.push<A, R>(find, args: args);
  }
}

class NavigatorV2State extends State<NavigatorV2> {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "myNavigator");

  late final List<MyPage> _pages = List.from([widget.first.buildPage(args: null)], growable: true);

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

  Future<R> push<A, R>(RouteRule<A, R> rule, {required A args}) {
    log("push - rule:$rule");
    MyPage<R> page = rule.buildPage(args: args);
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
    super.name,
    required super.child,
  });

  final Completer<R> _completer = Completer();

  Future<R> get poped => _completer.future;
}
