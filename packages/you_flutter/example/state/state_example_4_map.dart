
import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

// StreamBuilder?ø
main() {
  runApp(MaterialApp(home: Scaffold(body: HelloStore())));
}

int buildTimes = 0;
int watchBuildTimes = 0;

class HelloStore extends StatelessWidget {
  final map = <int,String>{}.signal();

  HelloStore({super.key});

  @override
  Widget build(BuildContext context) {
    buildTimes++;
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => map[map.length+1]="item: ${map.length+1}",
          child: Text("map put     ||| watch outer buildTimes:${buildTimes++}"),
        ),
        const Divider(),
        Watch((context) {
          return Column(
            children: [
              Text("map.length:${map.length}  ||| watch inner BuildTimes:${watchBuildTimes++}"),
              for (var key in map.keys) Text("map item:  key:$key, value:${map[key]}  ")
            ],
          );
        }),
      ],
    );
  }
}
