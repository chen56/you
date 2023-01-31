import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator v1',
      home: MainScreen(title: "Welcome", right: const WelcomePart()),
    );
  }
}

class MainScreen extends StatelessWidget {
  final Drawer left = Drawer(
    child: ListView(
      children: [
        _link("Welcome", const WelcomePart()),
        _link("Help", const HelpPart()),
      ],
    ),
  );

  final Widget right;

  final String title;

  MainScreen({
    super.key,
    required this.right,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Row(
        children: [
          SizedBox(width: 200, child: left),
          Expanded(child: right),
        ],
      ),
    );
  }
}

class WelcomePart extends StatelessWidget {
  const WelcomePart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Welcome! ba la ba la.");
  }
}

class HelpPart extends StatelessWidget {
  const HelpPart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Help! ba la ba la.");
  }
}

_link(String title, Widget right) {
  return Builder(
    builder: (context) => ListTile(
      title: Text(title),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(title: title, right: right),
        ),
      ),
    ),
  );
}
