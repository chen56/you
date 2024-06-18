import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: Navigation_NavigationRail())));
}

// ignore: camel_case_types
class Navigation_NavigationRail extends StatelessWidget {
  Navigation_NavigationRail({super.key});

  final selected = 0.signal();

  @override
  Widget build(BuildContext context) {
    List<({NavigationRailDestination distination, Widget page})> destinations = [
      (
        distination: const NavigationRailDestination(icon: Icon(Icons.explore), label: Text('Explore')),
        page: Container(width: double.infinity, height: double.infinity, color: Colors.blue.shade100, child: const Text("Explore")),
      ),
      (
        distination: const NavigationRailDestination(icon: Icon(Icons.commute), label: Text('Commute')),
        page: Container(width: double.infinity, height: double.infinity, color: Colors.green.shade100, child: const Text("Commute")),
      ),
    ];
    return Watch(builder: (context) {
      return SizedBox(
        width: double.infinity,
        height: 300,
        child: Scaffold(
          body: Row(
            children: [
              NavigationRail(
                selectedIndex: selected.value,
                groupAlignment: 1,
                onDestinationSelected: (newSelection) => selected.value = newSelection,
                labelType: NavigationRailLabelType.all,
                leading: IconButton(onPressed: () {}, icon: const Icon(Icons.access_time), tooltip: "NavigationRail.leading"),
                trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.exit_to_app), tooltip: "NavigationRail.trailing"),
                destinations: destinations.map((e) => e.distination).toList(),
              ),
              Expanded(child: destinations[selected.value].page),
            ],
          ),
        ),
      );
    });
  }
}
