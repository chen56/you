import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(home: Scaffold(body: Navigation_TabBar())));
}

// ignore: camel_case_types
class Navigation_TabBar extends StatelessWidget {
  const Navigation_TabBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<({Tab tab, Widget page})> tabs = [
      (
        tab: const Tab(icon: Icon(Icons.cloud_outlined), iconMargin: EdgeInsets.all(10)),
        page: const Center(child: Text("It's cloudy here")),
      ),
      (
        tab: const Tab(icon: Icon(Icons.beach_access_sharp), iconMargin: EdgeInsets.all(10)),
        page: const Center(child: Text("It's rainy here")),
      ),
      (
        tab: const Tab(icon: Icon(Icons.brightness_5_sharp), iconMargin: EdgeInsets.all(10)),
        page: const Center(child: Text("It's sunny here")),
      ),
    ];

    return DefaultTabController(
      initialIndex: 1,
      length: tabs.length,
      child: Column(children: [
        TabBar(tabs: tabs.map((e) => e.tab).toList()),
        SizedBox(
          height: 100,
          child: TabBarView(children: tabs.map((e) => e.page).toList()),
        )
      ]),
    );
  }
}
