import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: Navigation_SliverAppBar())));
}

// ignore: camel_case_types
class Navigation_SliverAppBar extends StatelessWidget {
  Navigation_SliverAppBar({super.key});

  final pinned = true.signal();

  @override
  Widget build(BuildContext context) {
    return Watch(builder: (context) {
      return CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: pinned.value,
            expandedHeight: 180.0,
            actions: [
              Row(children: [const Text('pinned'), Switch(onChanged: (newValue) => pinned.value = newValue, value: pinned.value)]),
            ],
            flexibleSpace: const FlexibleSpaceBar(background: FlutterLogo()),
          ),
          const SliverToBoxAdapter(child: Text('Try Scroll to see effect.')),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 50.0,
                  child: Center(
                    child: Text('$index', textScaler: const TextScaler.linear(2)),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      );
    });
  }
}
