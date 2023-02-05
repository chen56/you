import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/note/@common/includes/include_log.dart';
import 'package:learn_flutter/note/@common/includes/include_log_router_delegate.dart';

Logger logger = Logger();

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  MyRouterDelegate delegate =
      MyRouterDelegate(rules: rules.list, first: rules.home, notFound: rules.notFound);

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: LoggableRouterDelegate(delegate: delegate, logger: logger),
      routeInformationParser: Parser(rules: rules.list),
    );
  }
}

class Paths {
  static final List<Path> _list = List.empty(growable: true);

  final root = _rule<void, void>("/", (_) => HomeScreen());
  final home = _rule<void, void>("/home", (_) => HomeScreen());
  final help = _rule<String, String>("/help", (uri) => HelpScreen.parse(uri));
  final notFound = _rule<void, void>("/404", (uri) => NotFoundScreen(unknown: uri));

  List<Path> get list => List.unmodifiable(_list);

  Paths._();

  static Path<A, R> _rule<A, R>(String name, Screen<A, R>? Function(Uri a) parse) {
    var result = Path<A, R>(path: name, parse: parse);
    _list.add(result);
    return result;
  }
}

// 单例
Paths rules = Paths._();

class HomeScreen extends StatelessWidget with Screen<void, void> {
  HomeScreen({super.key});

  @override
  Uri get uri => Uri(path: rules.home.path);

  @override
  Widget build(BuildContext context) {
    ScaffoldMessengerState sms = ScaffoldMessenger.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text("HomeScreen navigator v2")),
      body: Column(children: [
        ElevatedButton(
          child: const Text(
              """String answer=await HelpScreen(question: "how about v2?").push(context)"""),
          onPressed: () async {
            String? answer = await HelpScreen(question: "how about v2?").push(context);
            sms.showSnackBar(SnackBar(
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

class HelpScreen extends StatelessWidget with Screen<String, String> {
  final String question;

  HelpScreen({super.key, required this.question});

  static Screen<String, String>? parse(Uri uri) {
    String? question = uri.queryParameters["question"];
    return question == null ? null : HelpScreen(question: question);
  }

  @override
  Uri get uri => Uri(path: rules.help.path, queryParameters: {"question": question});

  @override
  Widget build(BuildContext context) {
    option(String answer) => ElevatedButton(
        child: Text('''completer.complete("$answer")'''),
        onPressed: () => completer.complete(answer));
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

class NotFoundScreen extends StatelessWidget with Screen<void, void> {
  final Uri unknown;

  NotFoundScreen({super.key, required this.unknown});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(rules.notFound.path)),
      body: Text("404 not found: $unknown"),
    );
  }

  @override
  Uri get uri => Uri(path: rules.notFound.path);
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
        if (!page.screen.completer.isCompleted) {
          page.screen.completer.complete(null);
        }
        notifyListeners();
        return true;
      },
      //!!! toList()非常重要! 如果传入的pages是同一个ref，flutter会认为无变化
      pages: pages.toList(),
    );
  }

  Future<R?> push<A, R>(Screen<A, R> screen) {
    return _routerDelegate._push(screen);
  }
}

class Parser extends RouteInformationParser<RouteInformation> {
  Parser({required this.rules});

  final List<Path> rules;

  @override
  Future<RouteInformation> parseRouteInformation(RouteInformation routeInformation) {
    return SynchronousFuture(routeInformation);
  }

  @override
  RouteInformation? restoreRouteInformation(RouteInformation configuration) {
    return configuration;
  }
}

class MyRouterDelegate extends RouterDelegate<RouteInformation>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteInformation> {
  MyRouterDelegate({
    required this.first,
    required this.rules,
    required this.notFound,
  }) : _pages = List.from([first.parse(Uri(path: first.path))!.createPage()], growable: true);
  final Path<void, void> first;
  final Path<void, void> notFound;
  final List<MyPage> _pages;
  final List<Path> rules;

  @override
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "myNavigator");

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
    var uri = Uri.parse(configuration.location ?? "/");
    var p = rules.lastWhere((element) => uri.path == element.path, orElse: () => notFound);
    Screen? screen = p.parse(uri);
    screen ??= notFound.parse(uri)!;
    _push(screen);
    return SynchronousFuture(null);
  }

  Future<R?> _push<A, R>(Screen<A, R> screen) {
    var page = screen.createPage();
    //把completer的完成指责放权给各Screen后，框架需监听其完成后删除Page
    //并在onPopPage后
    screen.completer.future.whenComplete(() {
      logger.log("MyRouterDelegate.push.whenComplete - page:${page.name}  ");
      _pages.remove(page);
      notifyListeners();
    });
    _pages.add(page);
    notifyListeners();
    return screen.completer.future;
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
class MyPage<A, R> extends MaterialPage<R> {
  MyPage({
    required this.screen,
  }) : super(
          child: screen,
          name: screen.uri.toString(),
          key: ValueKey(keyGen++), //key的临时用法
        );
  static int keyGen = 0;
  final Screen<A, R> screen;
}

typedef ScreenBuilder<A, R> = Screen<A, R> Function(Uri a);

/// A: Screen参数类型，R: push返回值类型
mixin Screen<A, R> on Widget {
  @protected
  final Completer<R?> completer = Completer();

  @protected
  void log(Object? message) {
    if (kDebugMode) {
      print("$runtimeType(id:${identityHashCode(this)}) - $message ");
    }
  }

  MyPage<A, R> createPage() => MyPage(screen: this);

  @protected
  Uri get uri;

  Future<R?> push(BuildContext context) {
    logger.log("$this.push");
    return NavigatorV2.of(context).push<A, R>(this);
  }

  @override
  String toStringShort() {
    return "Screen(uri:${uri.toString()})";
  }
}

class DebugPagesLog extends StatelessWidget {
  const DebugPagesLog({super.key});

  @override
  Widget build(BuildContext context) {
    var screens = NavigatorV2.of(context).pages.map((e) => e.screen).toList();
    return Expanded(
      child: ListView(children: [
        const Center(child: Text("-----debug:pages-----")),
        for (int i = screens.length - 1; i >= 0; i--)
          ListTile(title: Text("  pages[$i]: ${screens[i]})")),
      ]),
    );
  }
}

/// 范型A： 参数类型, R:结果类型
class Path<A, R> {
  Path({
    required this.path,
    required this.parse,
  });

  final Screen<A, R>? Function(Uri uri) parse;
  final String path;

  @override
  String toString() {
    return path;
  }
}
