import 'package:flutter/material.dart';

// navigator v2 有点难，麻烦的很，一会这不对，一会那个报错，暂时放弃
void main() {
  runApp(const App());
}

var navigatorKey = GlobalKey(debugLabel: "navigatorKey");

List<MyPage> links = [
  createPage("/"),
  createPage("/Welcome"),
  createPage("/About"),
];
final List<Page> _pages = [links.first,links.last];

MyPage createPage(String name) {
  return MyPage(
    key: ValueKey(name),
    name: name,
    builder: (context) {
      print("MyPage.builder: ${_pages.map((e) => e.name)}");
      return Material(
        // color: Colors.blue,
        child: Center(
          child: Container(
            padding: const EdgeInsets.only(left: 320),
              alignment:Alignment.topLeft,
            child: ListView(
              children: [
                Text("Page:$name \n-------------------------\n"),
                for (var i = 0; i < _pages.length; i++) Text("$i :${_pages[i]}")
              ],
            ),
          ),
        ),
      );
    },
  );
}

Map<String, MyPage> linksMap = Map.fromEntries(links.map((e) => MapEntry(e.name!, e)));

class MyPage<T> extends Page<T> {
  const MyPage({
    required super.key,
    required super.name,
    required this.builder,
  });

  final WidgetBuilder builder;

  @override
  Route<T> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: builder,
    );
  }

  @override
  String toString() {
    return "MyPage(name:${name!})";
  }
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
    var drawer = Drawer(
      child: Column(
        children: [
          for (var link in links)
            ListTile(
              title: Text(link.name!),
              onTap: () {
                setState(() {
                  _pages.add(links.where((element) => element.name==link.name).first);
                });
              },
            ),
        ],
      ),
    );
    var navigator = Navigator(
      key: navigatorKey = navigatorKey,
      // initialRoute: "/",
      onPopPage: (route, result) {
        print("onPopPage:$route:$result: ${_pages.map((e) => e.name)}");
        if (_pages.isNotEmpty) {
          _pages.removeLast();
          setState(() {});
        }
        return route.didPop(result);
      },
      onGenerateRoute: (RouteSettings settings) {
        print("onGenerateRoute:$settings: ${_pages.map((e) => e.name)}");
        return linksMap[settings.name]!.createRoute(context);
      },
      pages: _pages,
    );
    print("AppState.build: ${_pages.map((e) => e.name)}");

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("sss")),
        drawer: drawer,
        body: navigator,
      ),
    );
  }
}
