import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: Navigation_NavigationDrawer())));
}

// ignore: camel_case_types
class Navigation_NavigationDrawer extends StatelessWidget {
  Navigation_NavigationDrawer({super.key});

  final selected = 0.signal();

  @override
  Widget build(BuildContext context) {
    Widget drawer() {
      return NavigationDrawer(
        onDestinationSelected: (selectedIndex) {
          selected.value = selectedIndex;
        },
        selectedIndex: selected.value,
        children: const <Widget>[
          NavigationDrawerDestination(label: Text('Inbox'), icon: Icon(Icons.inbox_outlined), selectedIcon: Icon(Icons.inbox)),
          NavigationDrawerDestination(label: Text('Outbox'), icon: Icon(Icons.send_outlined), selectedIcon: Icon(Icons.send)),
          NavigationDrawerDestination(label: Text('Favorites'), icon: Icon(Icons.favorite_outline), selectedIcon: Icon(Icons.favorite)),
          NavigationDrawerDestination(label: Text('Trash'), icon: Icon(Icons.delete_outline), selectedIcon: Icon(Icons.delete)),
        ],
      );
    }

    return Watch(builder: (context) {
      return SizedBox(
        width: 500,
        height: 300,
        child: Scaffold(
          appBar: AppBar(actions: [
            Builder(builder: (context) {
              return TextButton.icon(label: const Text("openEndDrawer"), icon: const Icon(Icons.menu), onPressed: () => Scaffold.of(context).openEndDrawer());
            }),
          ]),
          body: drawer(),
          endDrawer: drawer(),
        ),
      );
    });
  }
}
