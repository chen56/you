import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class Rules {
  static final List<RouteRule> rules = List.empty(growable: true);

  static final home = rule("/home", const HomeScreen());
  static final about = rule("/about", const AbortScreen());

  static RouteRule rule(String path, Widget toScreen) {
    var result = RouteRule(path: path, widget: toScreen);
    rules.add(result);
    return result;
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("/home")),
      body: ElevatedButton(
        child: const Text("Navigator.push(context, Rules.about)"),
        onPressed: () {
          Navigator.pushNamed(context, Rules.about.path);
        },
      ),
    );
  }
}

class AbortScreen extends StatelessWidget {
  const AbortScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("/about")),
      body: ElevatedButton(
        child: const Text("Navigator.pop(context)"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (RouteSettings settings) {
        return Rules.rules.firstWhere((element) => element.path == settings.name).buildRoute();
      },
      home: const Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}

class RouteRule {
  RouteRule({
    required this.path,
    required this.widget,
  });

  final Widget widget;
  final String path;

  MaterialPageRoute buildRoute() {
    return MaterialPageRoute(builder: (context) => widget);
  }

  @override
  String toString() {
    return path;
  }
}
