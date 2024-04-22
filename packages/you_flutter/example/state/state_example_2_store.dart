import 'dart:math';

import 'package:flutter/material.dart';
import 'package:you_dart/src/state.dart';
import 'package:you_flutter/src/state_widget.dart';

/// just a normal class
class Store {
  Store();

  final dice1 = 0.signal();
  final dice2 = 0.signal();

  // compute value
  int computeSum(){
    return dice1()+dice2();
  }
}

// StreamBuilder?ø
main() {
  runApp(MaterialApp(home: Scaffold(body: HelloStore())));
}

class HelloStore extends StatelessWidget {
  final Store store = Store();

  HelloStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Watch((context) => Text("store.dice1.value:${store.dice1()}")),
        ElevatedButton(
          onPressed: () => store.dice1.value=(Random().nextInt(6)+1),
          child: const Text("store.dice1.value=Random()"),
        ),
        const Divider(),
        Watch((context) => Text("store.dice2():${store.dice2()}")),
        ElevatedButton(
          onPressed: () => store.dice2.value=Random().nextInt(6)+1,
          child: const Text("store.dice2.value=Random()"),
        ),
        const Divider(),
        const Divider(),
        Watch((context) => Text("computeSum():${store.computeSum()}")),
      ],
    );
  }
}
