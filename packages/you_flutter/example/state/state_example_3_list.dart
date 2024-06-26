
import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

// StreamBuilder?ø
main() {
  runApp(MaterialApp(home: Scaffold(body: HelloStore())));
}

int buildTimes = 0;
int watchBuildTimes = 0;

class HelloStore extends StatelessWidget {
  final List<int> list = <int>[].signal();

  HelloStore({super.key});

  @override
  Widget build(BuildContext context) {
    buildTimes++;
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => list.add(list.length + 1),
          child: Text("list.add(list.length+1)     ||| watch outer buildTimes:${buildTimes++}"),
        ),
        const Divider(),
        Watch(builder:(context) {
          return Column(
            children: [
              Text("list.length:${list.length}  ||| watch inner BuildTimes:${watchBuildTimes++}"),
              for (var i in list) Text("list item: $i")
            ],
          );
        }),
      ],
    );
  }
}
