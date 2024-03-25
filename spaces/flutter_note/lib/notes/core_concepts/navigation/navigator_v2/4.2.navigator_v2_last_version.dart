import 'dart:async';
import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Logger logger = Logger();

void main() {
  runApp(App());
}

class Paths {
  static final List<Rule> _list = List.empty(growable: true);

  final root = _rule<void>("/", (location) => HomeScreen());
  final home = _rule<void>("/home", (location) => HomeScreen());
  final help = _rule<String>("/help", (location) => HelpScreen.parse(location));
  final notFound = _rule<void>("/404", (location) => NotFoundScreen(location));

  List<Rule> get list => List.unmodifiable(_list);

  Paths._();

  /// path和location的关系：
  /// - path是常量表示匹配模式,是规则："/help"
  /// - location是变量，表示一次实际访问请求:"/help?question=xxx"
  /// <R>是NavigatorV2.push()的返回结果类型
  static Rule<R> _rule<R>(String path, Screen<R> Function(String location) parse) {
    var result = Rule<R>(path: path, parse: parse);
    _list.add(result);
    return result;
  }
}

Paths rules = Paths._();

class App extends StatelessWidget {
  final MyRouterDelegate delegate = MyRouterDelegate(rules: rules.list, first: rules.home, notFound: rules.notFound);

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: LoggableRouterDelegate(delegate: delegate, logger: logger),
      routeInformationParser: Parser(rules: rules.list),
    );
  }
}

class HomeScreen extends StatelessWidget with Screen<void> {
  HomeScreen({super.key});

  @override
  String get location => rules.home.path;

  @override
  Rule<void> get rule => rules.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HomeScreen navigator v2")),
      body: Column(children: [
        ElevatedButton(
          child: const Text("""String answer=await HelpScreen(question: "how about v2?").push(context)"""),
          onPressed: () async {
            String? answer = await HelpScreen(question: "how about v2?").push(context);
            // ignore: use_build_context_synchronously
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(milliseconds: 2000),
              content: Text('answer: ${answer ?? "null(点了系统返回按钮)"}'),
            ));
          },
        ),
        const DebugPagesLog(),
      ]),
    );
  }
}

class HelpScreen extends StatelessWidget with Screen<String> {
  final String question;

  HelpScreen({super.key, required this.question});

  static Screen<String> parse(String location) {
    Uri uri = Uri.parse(location);
    String? question = uri.queryParameters["question"];
    return HelpScreen(question: question ?? "question?");
  }

  @override
  String get location => Uri(path: rule.path, queryParameters: {"question": question}).toString();

  @override
  Rule<String> get rule => rules.help;

  @override
  Widget build(BuildContext context) {
    option(String answer) => ElevatedButton(child: Text('''completer.complete("$answer")'''), onPressed: () => page.completer.complete(answer));
    return Scaffold(
      appBar: AppBar(title: const Text("HelpScreen")),
      body: Column(
        children: [
          Text("question:$question "),
          option("有v2吗？"),
          option("v2被另一只狗吓跑了！"),
          const DebugPagesLog(),
        ],
      ),
    );
  }
}

class NotFoundScreen extends StatelessWidget with Screen<void> {
  final String from;

  NotFoundScreen(this.from, {super.key});

  @override
  String get location => rules.notFound.path;

  @override
  Rule<void> get rule => rules.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(rules.notFound.path)),
      body: Text("404 not found: $from"),
    );
  }
}

////////////////////////////////////////////////
// 上面是应用代码，下面是封装后的NavigatorV2高级Api
////////////////////////////////////////////////
class NavigatorV2 extends StatelessWidget {
  const NavigatorV2._({
    required this.navigatorKey,
    required this.pages,
    required this.notifyListeners,
    required MyRouterDelegate routerDelegate,
  }) : _routerDelegate = routerDelegate;

  final GlobalKey<NavigatorState> navigatorKey;
  final List<MyPage> pages;
  final Function() notifyListeners;
  final MyRouterDelegate _routerDelegate;

  static NavigatorV2 of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<NavigatorV2>()!;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: (route, result) {
        logger.log("NavigatorV2.build.onPopPage - route:${route.settings.name}, result:$result");
        if (!route.didPop(result)) {
          return false;
        }
        if (pages.isEmpty) {
          return true;
        }
        var page = pages.removeLast();
        //把completer的完成指责放权给各Screen自己后，
        //如果由系统back button触发onPopPage，框架应使completer完成，要不会泄露Future
        if (!page.completer.isCompleted) {
          page.completer.complete(null);
        }
        notifyListeners();
        return true;
      },
      //!!! toList()非常重要! 如果传入的pages是同一个ref，flutter会认为无变化
      pages: pages.toList(),
    );
  }

  Future<R?> push<R>(String location) {
    return _routerDelegate._push<R>(location);
  }
}

class Parser extends RouteInformationParser<RouteInformation> {
  Parser({required this.rules});

  final List<Rule> rules;

  @override
  Future<RouteInformation> parseRouteInformation(RouteInformation routeInformation) {
    return SynchronousFuture(routeInformation);
  }

  @override
  RouteInformation? restoreRouteInformation(RouteInformation configuration) {
    return configuration;
  }
}

class MyRouterDelegate extends RouterDelegate<RouteInformation> with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteInformation> {
  MyRouterDelegate({
    required this.rules,
    required this.first,
    required this.notFound,
  }) : _pages = List.from([], growable: true);
  final Rule<void> first;
  final Rule<void> notFound;
  final List<MyPage> _pages;
  final List<Rule> rules;

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(debugLabel: "myNavigator");

  @override
  Widget build(BuildContext context) {
    return NavigatorV2._(
      routerDelegate: this,
      navigatorKey: navigatorKey,
      pages: _pages,
      notifyListeners: notifyListeners,
    );
  }

  @override
  Future<void> setNewRoutePath(RouteInformation configuration) {
    _push(configuration.location);
    return SynchronousFuture(null);
  }

  Rule match(String location) {
    Uri uri = Uri.parse(location);
    return rules.lastWhere((element) => uri.path == element.path, orElse: () => notFound);
  }

  Future<R?> _push<R>(String location) {
    Rule rule = match(location);
    Screen screen = rule.parse(location);
    MyPage page = screen.page;
    //把completer的完成指责放权给各Screen后，框架需监听其完成后删除Page
    //并在onPopPage后
    page.completer.future.whenComplete(() {
      logger.log("MyRouterDelegate.push.whenComplete - page:${page.name}  ");
      _pages.remove(page);
      notifyListeners();
    });
    _pages.add(page);
    notifyListeners();
    return page.completer.future as Future<R?>;
  }

  @override
  Future<void> setRestoredRoutePath(RouteInformation configuration) {
    return setNewRoutePath(configuration);
  }

  @override
  RouteInformation? get currentConfiguration {
    if (_pages.isEmpty) return null;
    return RouteInformation(location: _pages.last.name);
  }
}

/// A: Screen参数类型，R: push返回值类型
class MyPage<R> extends MaterialPage<R> {
  MyPage({required this.rule, required super.name, required super.child}) : super(key: ValueKey(keyGen++));

  @protected
  final Completer<R?> completer = Completer();

  static int keyGen = 0;

  final Rule<R> rule;
}

/// A: Screen参数类型，R: push返回值类型
mixin Screen<R> on Widget {
  @protected
  late final MyPage<R> page = MyPage(rule: rule, name: location, child: this);

  @protected
  String get location;

  @protected
  Rule<R> get rule;

  @protected
  Future<R?> push(BuildContext context) {
    logger.log("$this.push");
    return NavigatorV2.of(context).push<R>(location.toString());
  }

  @override
  String toStringShort() {
    return "Screen(${page.name})";
  }
}

class DebugPagesLog extends StatelessWidget {
  const DebugPagesLog({super.key});

  @override
  Widget build(BuildContext context) {
    var names = NavigatorV2.of(context).pages.map((e) => e.name).toList();
    return Expanded(
      child: ListView(children: [
        const Center(child: Text("-----debug:pages-----")),
        for (int i = names.length - 1; i >= 0; i--) ListTile(title: Text("  pages[$i]: ${names[i]})")),
      ]),
    );
  }
}

/// 范型A： R:结果类型
class Rule<R> {
  Rule({
    required this.path,
    required this.parse,
  });

  late final Screen<R> Function(String path) parse;
  final String path;

  @override
  String toString() {
    return path;
  }
}

class LoggableRouterDelegate<T> implements RouterDelegate<T> {
  final RouterDelegate<T> delegate;
  final Logger logger;

  LoggableRouterDelegate({required this.delegate, required this.logger});

  @override
  void addListener(VoidCallback listener) {
    log("addListener($listener)");
    return delegate.addListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    log("build()");
    return delegate.build(context);
  }

  @override
  T? get currentConfiguration {
    log("currentConfiguration -> ${_configuration(delegate.currentConfiguration)}");
    return delegate.currentConfiguration;
  }

  String _configuration(T? configuration) {
    var result = configuration;
    var str = result is RouteInformation ? "${result.location}" : "$result";
    return str;
  }

  @override
  Future<bool> popRoute() {
    log("popRoute()");
    return delegate.popRoute();
  }

  @override
  void removeListener(VoidCallback listener) {
    log("removeListener($listener)");
    return delegate.removeListener(listener);
  }

  @override
  Future<void> setInitialRoutePath(T configuration) {
    log("setInitialRoutePath(configuration:${_configuration(configuration)})");
    return delegate.setInitialRoutePath(configuration);
  }

  @override
  Future<void> setNewRoutePath(T configuration) {
    log("setNewRoutePath(configuration:${_configuration(configuration)})");
    return delegate.setNewRoutePath(configuration);
  }

  @override
  Future<void> setRestoredRoutePath(T configuration) {
    log("setRestoredRoutePath(configuration:${_configuration(configuration)})");
    return delegate.setRestoredRoutePath(configuration);
  }

  log(Object? msg) {
    logger.log("${delegate.runtimeType}(id:${identityHashCode(delegate)}).$msg");
  }
}

class Logger extends ChangeNotifier {
  final List<String> messages = List.empty(growable: true);
  Element? logView;

  log(Object? object) {
    String message = "${DateTime.now()} - $object";
    if (kDebugMode) {
      print(message);
    }
    messages.add(message);
    if (logView?.mounted ?? false) logView!.markNeedsBuild();
  }
}

class LogView extends StatelessWidget {
  final Logger logger;

  const LogView({super.key, required this.logger});

  @override
  Widget build(BuildContext context) {
    logger.logView = context as Element;
    return ListView(children: [
      const Center(child: Text("--- debug: log ---")),
      for (var m in logger.messages) ListTile(title: Text(m)),
    ]);
  }
}
