import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  final RouteRules routeRules = RouteRules(
    notFound: RouteRule(location: "/404", builder: (context) => const Text("404!")),
    routes: [
      RouteRule(location: "/", builder: (context) => const Text("Home")),
      RouteRule(location: "/about", builder: (context) => const Text("About")),
      RouteRule(location: "/help", builder: (context) => const Text("Help")),
    ],
  );

  late final MyRouterDelegate _routerDelegate;

  AppState() {
    _routerDelegate = MyRouterDelegate(routeRules);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _routerDelegate,
    );
  }
}

// ------------------------------
// 以下可以作为通用路由器使用
// ------------------------------
class RouteRules {
  RouteRules({
    required this.notFound,
    required this.routes,
  });

  final RouteRule notFound;
  final List<RouteRule> routes;

  RouteRule findBy({required String location}) {
    return routes.firstWhere(
      (element) => location == element.location,
      orElse: () => notFound,
    );
  }
}

class RouteRule {
  RouteRule({
    required this.location,
    required this.builder,
  });

  final WidgetBuilder builder;
  final String location;
}

class MyRouterDelegate extends RouterDelegate<RouteInformation>
    with PopNavigatorRouterDelegateMixin<RouteInformation>, ChangeNotifier {
  final List<RouteInformation> _history = List.empty(growable: true);

  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  RouteRules routeRules;

  MyRouterDelegate(this.routeRules);

  static MyRouterDelegate of(BuildContext context) {
    return Router.of(context).routerDelegate as MyRouterDelegate;
  }

  @override
  Future<void> setNewRoutePath(RouteInformation configuration) {
    log('setNewRoutePath: configuration:${configuration.location}');
    _history.add(configuration);
    return SynchronousFuture<void>(null);
  }

  @override
  Future<void> setRestoredRoutePath(RouteInformation configuration) {
    log('setRestoredRoutePath: configuration:${configuration.location} ');
    return super.setRestoredRoutePath(configuration);
  }

  @override
  Future<bool> popRoute() {
    log('popRoute');
    return super.popRoute();
  }

  @override
  RouteInformation? get currentConfiguration {
    return _history.isEmpty ? null : _history.last;
  }

  @override
  Widget build(BuildContext context) {
    log("build");

    if (_history.isEmpty) {
      _history.add(const RouteInformation(location: "/"));
    }
    var pages = _history.map((e) {
      String location = e.location!;

      RouteRule routeRule = routeRules.findBy(location: location);
      return MaterialPage(
        // key: ValueKey(i),
        name: location,
        child: Builder(
          builder: (context) {
            var drawer = Drawer(
              child: ListView(
                children: [
                  ListTile(title: const Text("Home"), onTap: () => onTap("/")),
                  ListTile(title: const Text("About"), onTap: () => onTap("/about")),
                  ListTile(title: const Text("Help "), onTap: () => onTap("/help")),
                ],
              ),
            );
            var scaffold = Scaffold(
              // drawer: drawer,
              appBar: AppBar(title: const Text(' Samples')),
              body: Row(children: <Widget>[
                drawer,
                Expanded(child: routeRule.builder(context)),
              ]),
            );
            return scaffold;
          },
        ),
      );
    });

    return Navigator(
      key: navigatorKey,
      onPopPage: (Route<dynamic> route, dynamic result) {
        log('build.onPopPage: route:${route.settings.name}');
        if (_history.isEmpty) {
          return false;
        }
        _history.removeLast();
        var didPop = route.didPop(result);
        notifyListeners();
        return didPop;
      },
      pages: pages.toList(),
    );
  }

  onTap(String location) {
    setState(() => _history.add(RouteInformation(location: location)));
  }

  void setState(void Function() callback) {
    callback();
    notifyListeners();
  }

  void log(Object? message) {
    if (kDebugMode) {
      print("$runtimeType(id:${identityHashCode(this)}) - $message ");
      print("    _history:${_history.map((e) => e.location).toList()} ");
    }
  }
}
