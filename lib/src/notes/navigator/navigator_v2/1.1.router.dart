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
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: myRouter);
  }
}

var myRouter = MyRouter(
  notFound: MyRoute(path: "/404", builder: (context) => const Text("404!")),
  routes: [
    MyRoute(path: "/", builder: (context) => const Text("Home")),
    MyRoute(path: "/about", builder: (context) => const Text("About")),
    MyRoute(path: "/help", builder: (context) => const Text("Help")),
  ],
);

// ------------------------------
// 以下可以作为通用路由器使用
// ------------------------------
class MyRouter extends RouterConfig<String> {
  MyRouter({
    required this.notFound,
    required this.routes,
  }) : super(
          routerDelegate: MyRouterDelegate(),
          routeInformationParser: MyRouteInformationParser(),
          routeInformationProvider: MyPlatformRouteInformationProvider(
            initialRouteInformation: const RouteInformation(location: "/"),
          ),
        );

  final MyRoute notFound;
  final List<MyRoute> routes;
}

class MyRoute {
  MyRoute({
    required this.path,
    required this.builder,
  });

  final WidgetBuilder builder;
  final String path;
}

class MyRouteInformationParser extends RouteInformationParser<String> {
  @override
  Future<String> parseRouteInformationWithDependencies(
      RouteInformation routeInformation, BuildContext context) {
    return SynchronousFuture(routeInformation.location!);
  }

  @override
  RouteInformation? restoreRouteInformation(String configuration) {
    return RouteInformation(location: configuration);
  }
}

class MyRouterDelegate extends RouterDelegate<String>
    with PopNavigatorRouterDelegateMixin<String>, ChangeNotifier {
  static MyRouterDelegate of(BuildContext context) {
    return Router.of(context).routerDelegate as MyRouterDelegate;
  }

  final List<String> _history = List.empty(growable: true);

  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(String configuration) {
    log(this, 'setNewRoutePath: configuration:$configuration _history: $_history');
    _history.add(configuration);
    return SynchronousFuture<void>(null);
  }

  @override
  Future<void> setRestoredRoutePath(String configuration) {
    log(this, 'setRestoredRoutePath: configuration:$configuration _history: $_history');
    return super.setRestoredRoutePath(configuration);
  }

  @override
  Future<bool> popRoute() {
    log(this, 'popRoute _history: $_history');
    return super.popRoute();
  }

  @override
  String? get currentConfiguration {
    return _history.isEmpty ? null : _history.last;
  }

  @override
  Widget build(BuildContext context) {
    log(this, "build _history: $_history");
    int i = 0;

    if (_history.isEmpty) {
      _history.add("/");
    }
    var pages = _history.map((e) => MapEntry(i++, e)).map((e) {
      String path = e.value;

      MyRoute route = myRouter.routes.firstWhere(
        (element) => path == element.path,
        orElse: () => myRouter.notFound,
      );
      return MaterialPage(
        // key: ValueKey(i),
        name: path,
        child: Builder(
          builder: (context) {
            var drawer = Drawer(
              child: ListView(
                children: [
                  ListTile(title: const Text("About"), onTap: () => onTap("/")),
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
                Expanded(child: route.builder(context)),
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
        log(this, 'build.onPopPage: route:${route.settings.name} _history: $_history');
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

  onTap(String path) {
    setState(() => _history.add(path));
  }

  void setState(void Function() callback) {
    callback();
    notifyListeners();
  }
}

class MyPlatformRouteInformationProvider extends PlatformRouteInformationProvider {
  MyPlatformRouteInformationProvider({required super.initialRouteInformation});

  @override
  void routerReportsNewRouteInformation(RouteInformation routeInformation,
      {RouteInformationReportingType type = RouteInformationReportingType.none}) {
    log(this,
        "routerReportsNewRouteInformation route.location:${routeInformation.location} type:$type");
    super.routerReportsNewRouteInformation(routeInformation, type: type);
  }

  @override
  Future<bool> didPopRoute() {
    log(this, "didPopRoute");
    return super.didPopRoute();
  }
}

void log(Object logOwner, Object? message) {
  if (kDebugMode) {
    print("log - ${logOwner.runtimeType}(id:${identityHashCode(logOwner)}) - $message ");
  }
}
