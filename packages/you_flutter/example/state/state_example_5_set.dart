
import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

// StreamBuilder?ø
main() {
  runApp(MaterialApp(home: Scaffold(body: HelloStore())));
}

int buildTimes = 0;
int watchBuildTimes = 0;

class HelloStore extends StatelessWidget {
  final set = <int>{}.signal();

  HelloStore({super.key});

  @override
  Widget build(BuildContext context) {
    buildTimes++;
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => set.add(set.length + 1),
          child: Text("set.add(set.length+1)     ||| watch outer buildTimes:${buildTimes++}"),
        ),
        const Divider(),
        Watch(builder:(context) {
          return Column(
            children: [
              Text("set.length:${set.length}  ||| watch inner BuildTimes:${watchBuildTimes++}"),
              for (var i in set) Text("list item: $i")
            ],
          );
        }),
      ],
    );
  }
}
