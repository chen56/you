import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'log.dart';

////////////////////////////////////////////////
// 上面是应用代码，下面是封装后的NavigatorV2高级Api
////////////////////////////////////////////////
class NavigatorV2 extends StatelessWidget {
  const NavigatorV2._({
    required this.navigatorKey,
    required this.pages,
    required this.notifyListeners,
    required NRouterDelegate routerDelegate,
  }) : _routerDelegate = routerDelegate;

  final GlobalKey<NavigatorState> navigatorKey;
  final List<NPage> pages;
  final Function() notifyListeners;
  final NRouterDelegate _routerDelegate;

  static NavigatorV2 of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<NavigatorV2>()!;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: (route, result) {
        logger.log(
            "NavigatorV2.build.onPopPage - route:${route.settings.name}, result:$result");
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

  Future<R?> push<R>(Screen<R> screen) {
    return _routerDelegate._push(screen);
  }
}

class NParser extends RouteInformationParser<RouteInformation> {
  NParser({required this.rules});

  final List<Peg> rules;

  @override
  Future<RouteInformation> parseRouteInformation(
      RouteInformation routeInformation) {
    return SynchronousFuture(routeInformation);
  }

  @override
  RouteInformation? restoreRouteInformation(RouteInformation configuration) {
    return configuration;
  }
}

class NRouterDelegate extends RouterDelegate<RouteInformation>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteInformation> {
  NRouterDelegate({
    required this.first,
    required this.rules,
    required this.notFound,
  }) : _pages = List.from([first.parse(Uri(path: first.path))!._createPage()],
            growable: true);
  final Peg<void> first;
  final Peg<void> notFound;
  final List<NPage> _pages;
  final List<Peg> rules;

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
    var p = rules.lastWhere((element) => uri.path == element.path,
        orElse: () => notFound);
    Screen? screen = p.parse(uri);
    screen ??= notFound.parse(uri)!;
    _push(screen);
    return SynchronousFuture(null);
  }

  Future<R?> _push<R>(Screen<R> screen) {
    var page = screen._createPage();
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
class NPage<R> extends MaterialPage<R> {
  NPage({
    required this.screen,
  }) : super(
          child: screen,
          name: screen.uri.toString(),
          key: ValueKey(keyGen++), //key的临时用法
        );
  static int keyGen = 0;
  final Screen<R> screen;
}

typedef ScreenBuilder<R> = Screen<R> Function(Uri a);

/// A: Screen参数类型，R: push返回值类型
mixin Screen<R> on Widget {
  @protected
  final Completer<R?> completer = Completer();

  @protected
  void log(Object? message) {
    if (kDebugMode) {
      print("$runtimeType(id:${identityHashCode(this)}) - $message ");
    }
  }

  NPage<R> _createPage() => NPage(screen: this);

  @protected
  Uri get uri;

  Future<R?> push(BuildContext context) {
    logger.log("$this.push");
    return NavigatorV2.of(context).push<R>(this);
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
class PegImpl<R> implements Peg<R> {
  PegImpl({
    required this.path,
    required this.parse,
  });

  @override
  final Screen<R>? Function(Uri uri) parse;
  final String path;

  @override
  String toString() {
    return path;
  }
}

abstract class Peg<R> {
  Screen<R>? Function(Uri uri) get parse;

  String get path;

  @override
  String toString() {
    return path;
  }
}
