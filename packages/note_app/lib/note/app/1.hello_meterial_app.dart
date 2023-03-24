import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

main() {
  runApp(const MyHomepage());
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Flutter with Samples',
      home: Scaffold(
        appBar: AppBar(title: Text('最简单的原生state管理 ')),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (newIndex) {
            setState(() {
              _index = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "收藏"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
          ],
          // ... items ...
        ),
        body: Container(),
      ),
    );
  }
}
