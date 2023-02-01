import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class Rules {
  static final List<RouteRule> _rules = List.empty(growable: true);

  final home = _rule("/home", const HomeScreen());
  final help = _rule("/help", const HelpScreen());

  Rules._();

  static RouteRule _rule(String path, Widget toScreen) {
    var result = RouteRule(path: path, widget: toScreen);
    _rules.add(result);
    return result;
  }
}

Rules rules = Rules._();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(rules.home.path)),
      body: ElevatedButton(
        child: const Text("Navigator.push(context, Rules.help)"),
        onPressed: () {
          Navigator.pushNamed(context, rules.help.path);
        },
      ),
    );
  }
}

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(rules.help.path)),
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
        return Rules._rules.firstWhere((element) => element.path == settings.name).buildRoute();
      },
      home: Scaffold(
        body: rules.home.widget,
      ),
    );
  }
}

class RouteRule {
  const RouteRule({
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
