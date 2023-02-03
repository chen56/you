import 'package:flutter/material.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

// ref: https://flutter.cn/community/tutorials/understanding-navigator-v2
// https://github.com/MeandNi/flutter_navigator_v2/blob/master/lib/pages_example.dart
void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static int _counter = 15;

  // Initial Route: /category/5/item/15
  final List<MyPage> pages = [
    MyPage(
      key: ValueKey('/category/5'),
      name: '/category/5',
      builder: (context) => CategoryScreen(id: 5),
    ),
    MyPage(
      key: ValueKey('/item/15'),
      name: '/item/15',
      builder: (context) => ItemScreen(id: 15),
    ),
    MyPage(
      key: const ValueKey('/'),
      name: '/',
      builder: (context) => HomeScreen(),
    ),
  ];

  void addPage(MyPage page) {
    setState(() => pages.add(page));
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    setState(() => pages.remove(route.settings));
    return route.didPop(result);
  }

  @override
  Widget build(BuildContext context) {
    print('build: $pages');
    var navigator = Navigator(
            key: _navigatorKey,
            onPopPage: _onPopPage,
            pages: List.of(pages),
          );
    var willPopScope = WillPopScope(
          onWillPop: () async => !await _navigatorKey.currentState!.maybePop(),
          child: navigator,
        );
    return MaterialApp(
      theme: ThemeData.dark().copyWith(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text("sssss"),),
        body: willPopScope,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              final int id = ++_counter;
              pages.add(
                MyPage(
                  key: ValueKey('/item/$id'),
                  name: '/item/$id',
                  builder: (context) => ItemScreen(id: id),
                ),
              );
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class MyPage<T> extends Page<T> {
  const MyPage({
    required super.key,
    required super.name,
    required this.builder,
  });

  final WidgetBuilder builder;

  @override
  Route<T> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: builder,
    );
  }

  @override
  String toString() => '$name';
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.red,
      child: Center(
        child: Text(
          'Home',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.green,
      child: Center(
        child: Text(
          'Category $id',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: Center(
        child: Text(
          'Item $id\n${ModalRoute.of(context)!.settings}',
          // style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
