import 'dart:math';

import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

// StreamBuilder?ø
main() {
  runApp(MaterialApp(home: Scaffold(body: HelloStore())));
}

class Player {
  final name = "".signal();
  final dice1 =0.signal();
  final dice2 = 0.signal();

  Player({required String name}) {
    this.name.value = name;
  }

  // compute value
  int computeSum() {
    return dice1() + dice2();
  }

  void play() {
    dice1.value = Random().nextInt(6) + 1;
    dice2.value = Random().nextInt(6) + 1;
  }
}
class Store {
  Store();

  final List<Player> players = <Player>[].signal();
  final List<String> lookers = ["zhao", "qian", "sun", "li", "zhou", "wu", "zheng", "wang"].signal();

  // compute value
  String win() {
    if (players.isEmpty) {
      return "No player!!!!, please click looker join game！！！！！";
    }
    Player winPlayer = players.first;
    for (var player in players) {
      if (player.computeSum() > winPlayer.computeSum()) {
        winPlayer = player;
      }
    }
    return "Winner: Player(${winPlayer.name()}, computeSum: ${winPlayer.computeSum()} )";
  }

  void play() {
    for (var p in players) {
      p.play();
    }
  }

  void join(String peopleName) {
    lookers.remove(peopleName);
    players.add(Player(name: peopleName));
  }

  void quit(Player player) {
    lookers.add(player.name());
    players.remove(player);
  }
}

class HelloStore extends StatelessWidget {
  final store = Store();

  HelloStore({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Text("GAME", style: theme.textTheme.headlineLarge),
        Watch((context) => Text(store.win())),
        ElevatedButton(onPressed: () => store.play(), child: const Text("【【【【【play!!!】】】】】")),
        const Divider(),
        Watch((context) {
          return Column(children: [
            const Text("Lookers"),
            for (var player in store.players)
              ElevatedButton.icon(
                  label: Text("【${player.name()}】 : dice: ${player.computeSum()}, click quit "),
                  icon: const Icon(Icons.tag_faces_sharp),
                  onPressed: () => store.quit(player)),
            const Divider(),
            const Text("Lookers"),
            for (var looker in store.lookers)
              ElevatedButton.icon(
                label: Text("【$looker】 click join"),
                icon: const Icon(Icons.person),
                onPressed: () {
                  store.lookers.remove(looker);
                  store.players.add(Player(name: looker));
                },
              )
          ]);
        }),
      ],
    );
  }
}
