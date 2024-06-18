import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: Navigation_NavigationBar())));
}

// ignore: camel_case_types
class Navigation_NavigationBar extends StatelessWidget {
  Navigation_NavigationBar({super.key});

  final selected = 0.signal();

  @override
  Widget build(BuildContext context) {
    List<({NavigationDestination destination, Widget page})> destinations = [
      (
        destination: const NavigationDestination(icon: Icon(Icons.explore), label: 'Explore'),
        page: Container(width: double.infinity, height: double.infinity, color: Colors.blue.shade100, child: const Text("Explore")),
      ),
      (
        destination: const NavigationDestination(icon: Icon(Icons.commute), label: 'Commute'),
        page: Container(width: double.infinity, height: double.infinity, color: Colors.green.shade100, child: const Text("Commute")),
      ),
    ];
    return Watch(builder: (context) {
      return SizedBox(
        width: double.infinity,
        height: 200,
        child: Scaffold(
          body: destinations[selected.value].page,
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (newSelection) => selected.value = newSelection,
            selectedIndex: selected.value,
            destinations: destinations.map((e) => e.destination).toList(),
          ),
        ),
      );
    });
  }
}
