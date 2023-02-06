import 'dart:async';
import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

class MyRouterDelegate extends RouterDelegate<RouteInformation>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteInformation> {
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
    _push(configuration.location ?? "/");
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
  MyPage({required this.rule, required super.name, required super.child})
      : super(key: ValueKey(keyGen++));

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
        for (int i = names.length - 1; i >= 0; i--)
          ListTile(title: Text("  pages[$i]: ${names[i]})")),
      ]),
    );
  }
}

/// 范型A： R:结果类型
abstract class Rule<R> {
  Screen<R> Function(String path) get parse;

  String get path;

  @override
  String toString() {
    return path;
  }
}
