import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(home: Scaffold(body: Input_BottomAppBarExample())));
}

// ignore: camel_case_types
class Input_BottomAppBarExample extends StatelessWidget {
  const Input_BottomAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Scaffold(
        body: const Placeholder(),
        floatingActionButton: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
        bottomNavigationBar: BottomAppBar(
          child: Row(children: <Widget>[
            IconButton(tooltip: 'Open navigation menu', icon: const Icon(Icons.menu), onPressed: () {}),
            const Spacer(),
            IconButton(tooltip: 'Search', icon: const Icon(Icons.search), onPressed: () {}),
            IconButton(tooltip: 'Favorite', icon: const Icon(Icons.favorite), onPressed: () {}),
          ]),
        ),
      ),
    );
  }
}
