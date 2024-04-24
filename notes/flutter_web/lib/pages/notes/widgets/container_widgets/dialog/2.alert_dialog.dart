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
          child: const Text("吃了没?"),
          onPressed: () async {
            answer = await _showMyDialog();
            setState(() {});
          },
        ),
        if (answer != null) Text("$answer!")
      ],
    );
  }

  Future<String?> _showMyDialog() async {
    return showDialog<String?>(
      context: context,
      barrierDismissible: false, // user must tap overview!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Title：好友见面'),
          content: const Text('吃了没？'),
          actions: <Widget>[
            TextButton(
              child: const Text('吃了'),
              onPressed: () => Navigator.of(context).pop("吃了"),
            ),
          ],
        );
      },
    );
  }
}
