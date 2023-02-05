import 'package:flutter/material.dart';
import 'package:learn_flutter/navigator.dart';
import 'screens.dart';

class HomeScreen extends StatelessWidget with Screen<void, void> {
  HomeScreen({super.key});

  @override
  Uri get uri => Uri(path: rules.home.path);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HomeScreen navigator v2")),
      body: Column(children: [
        ElevatedButton(
          child: const Text(
              """String answer=await HelpScreen(question: "how about v2?").push(context)"""),
          onPressed: () async {},
        ),
        const DebugPagesLog(),
      ]),
    );
  }
}
