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
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(debugLabel: "sssssssss");
  final List<Page> _history = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    var drawer = Drawer(
      child: ListView(
        children: [
          ListTile(title: const Text("Home"), onTap: () => {}),
          ListTile(
              title: const Text("ABout"),
              onTap: () =>
                  {Navigator.push(context, MaterialPageRoute(builder: (c) => Text("About")))}),
        ],
      ),
    );
    var page = buildPage();
    // MaterialPageRoute(builder: (c)=>Text("About"));

    _history.add(page);
    var navigator = Navigator(
      key: navigatorKey,
      // initialRoute: "/",
      onPopPage: (route, result) {
        log("onPopPage:$route:$result: ${_history.map((e) => e.name)}");
        if (_history.isNotEmpty) {
          _history.removeLast();
          setState(() {});
        }
        return route.didPop(result);
      },
      pages: _history,
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Drawer Sample")),
        body: navigator,
      ),
    );
  }

  MaterialPage<dynamic> buildPage() {
    Scaffold scaffold=Scaffold(
      appBar: AppBar(title: const Text("Drawer Sample")),
      body: Builder(builder: (context) {
        return ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Text("About")));
          },
          child: Text("about"),
        );
      }),
    );
    return MaterialPage(
      key: ValueKey("/s"),
      name: "/s",
      child: scaffold,
    );
  }

  void log(Object? message) {
    if (kDebugMode) {
      print("$runtimeType(id:${identityHashCode(this)}) - $message ");
    }
  }
}
