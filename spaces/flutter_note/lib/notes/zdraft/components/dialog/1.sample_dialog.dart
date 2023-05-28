import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(const App());

// https://api.flutter-io.cn/flutter/material/SimpleDialog-class.html
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Sample(),
      ),
    );
  }
}

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<StatefulWidget> createState() {
    return SampleState();
  }
}

class SampleState extends State<Sample> {
  String? answer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          child: const Text("吃啥?"),
          onPressed: () async {
            answer = await eatWhat(context);
            setState(() {});
          },
        ),
        if (answer != null) Text("$answer!")
      ],
    );
  }

  Future<String?> eatWhat(BuildContext context) async {
    option(String answer) {
      return SimpleDialogOption(
        onPressed: () => Navigator.pop(context, answer),
        child: Text(answer),
      );
    }

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(title: const Text("选择："), children: [
          option("吃面"),
          option("吃米"),
        ]);
      },
    );
  }
}
