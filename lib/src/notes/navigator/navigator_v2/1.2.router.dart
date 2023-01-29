import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: myRouter,
    );
  }
}

class UserScreen extends StatelessWidget {
  final String userId;

  const UserScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Text("user-$userId ");
  }

  static Widget fromUri(BuildContext context, Uri request) {
    var id = request.queryParameters["id"];
    if (id == null) {
      return NotFoundScreen(message: "user not exits id:'$id'");
    }
    return UserScreen(userId: id);
  }

  static Widget fromArg(BuildContext context, String userId) {
    return UserScreen(userId: userId);
  }
}

class NotFoundScreen extends StatelessWidget {
  final String message;

  const NotFoundScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Text("404 Not Found: $message");
  }
}

var myRouter = MyRouter(
  notFound:
      MyRoute(path: "/404", builder: (context, request) => const NotFoundScreen(message: "404!")),
  routes: [
    MyRoute(path: "/", builder: (context, request) => const Text("Home")),
    MyRoute(
        path: "/user/:userId", builder: (context, request) => UserScreen.fromUri(context, request)),
  ],
);

// ------------------------------
// 以下可以作为通用路由器使用
// ------------------------------
class MyRouter extends RouterConfig<Object> with ChangeNotifier {
  final List<Page<dynamic>> _pages=[];

  final MyRoute notFound;

  static int nextKey=0;

  MyRouter({
    required this.notFound,
    required this.routes,
  }) : super(
          routerDelegate: MyRouterDelegate(),
          routeInformationParser: MyRouteInformationParser(),
          routeInformationProvider: PlatformRouteInformationProvider(
            initialRouteInformation: const RouteInformation(location: "/"),
          ),
        ) {
    (routerDelegate as MyRouterDelegate)._myRouter = this;
  }

  List<MyRoute> routes;

  @override
  String toString() {
    return "MyRouter(routes:$routes)";
  }

  goto(Uri uri) {
    _pages.add(MyPage(key: ValueKey(nextKey++), uri: uri, myRouter: this));
    notifyListeners();
  }
}

class MyRoute {
  MyRoute({
    required this.path,
    required this.builder,
  });

  final Widget Function(BuildContext context, Uri request) builder;
  final String path;
}

class MyRouteInformationParser extends RouteInformationParser<Uri> {
  @override
  Future<Uri> parseRouteInformation(RouteInformation routeInformation) {
    if (kDebugMode) {
      print(
        "MyRouteInformationParser.parseRouteInformation: routeInformation:${routeInformation.location}");
    }
    if (routeInformation.location == null) {
      return SynchronousFuture(Uri(path: "/404"));
    }
    return SynchronousFuture(Uri.parse(routeInformation.location!));
  }

  @override
  RouteInformation? restoreRouteInformation(Uri configuration) {
    if (kDebugMode) {
      print("MyRouteInformationParser.restoreRouteInformation:$configuration");
    }
    return RouteInformation(location: configuration.toString());
  }
}

class MyRouterDelegate extends RouterDelegate<Uri>
    with PopNavigatorRouterDelegateMixin<Uri> implements Listenable {

  late MyRouter _myRouter;

  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(configuration) {
    if (kDebugMode) {
      print('MyRouterDelegate.setNewRoutePath: configuration:$configuration pages: ${_myRouter._pages}');
    }
    _myRouter.goto(configuration);
    return SynchronousFuture<void>(null);
  }

  @override
  Widget build(BuildContext context) {

    if (kDebugMode) {
      print("MyRouterDelegate.build: pages: ${_myRouter._pages} ");
    }

    return Navigator(
      key: navigatorKey,
      onPopPage: (Route<dynamic> route, dynamic result) {
        if (kDebugMode) {
          print('MyRouterDelegate.build.onPopPage: pages: ${_myRouter._pages}');
        }
        // if (_stack.isNotEmpty) {
        //   if (_stack.last == route.settings.name) {
        //     _stack.remove(route.settings.name);
        //     notifyListeners();
        //   }
        // }
        return route.didPop(result);
      },
      pages: _myRouter._pages.toList(),
    );
  }

  @override
  void addListener(VoidCallback listener) {
    _myRouter.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _myRouter.removeListener(listener);
  }
}

class MyPage<T> extends Page<T> {
  MyPage({
    required super.key,
    required this.uri,
    required this.myRouter,
  }) : super(name: uri.toString()) {
    var drawer = Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text("Home"),
            onTap: () {
              myRouter.goto(Uri.parse("/"));
            },
          ),
          const ListTile(title: Text("好友列表")),
          ...List.generate(5, (index) => ListTile(title: Text("  User-$index"), onTap: () => {}))
        ],
      ),
    );

    builder = (context) {
      MyRoute route = myRouter.routes.firstWhere(
        (element) => uri.path == element.path,
        orElse: () => myRouter.notFound,
      );

      var scaffold = Scaffold(
        drawer: drawer,
        appBar: AppBar(title: const Text(' Samples')),
        body: Row(children: <Widget>[
          drawer,
          Expanded(child: route.builder(context, uri)),
        ]),
      );
      return scaffold;
    };
  }

  final Uri uri;
  late final WidgetBuilder builder;
  final MyRouter myRouter;

  @override
  Route<T> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: builder,
    );
  }

  @override
  String toString() {
    return "MyPage(uri:$uri)";
  }
}
