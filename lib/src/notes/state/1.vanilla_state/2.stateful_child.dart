import 'package:flutter/material.dart';

main() {
  runApp(const App());
}

/*
父组件维护状态，子组件使用状态
----------------------------------------------------------
AppState(StatefulWidget)  : 父组件，state 数据在这里,提供读写方法，在此setState更新组件树
  ChildRead(StatelessWidget)  : 读数据，通过构造器参数传递父组件状态
  ChildWrite(StatelessWidget) : 写数据，通过BuildContext.findAncestorStateOfType()获取祖先状态
----------------------------------------------------------
*/
// ignore: camel_case_types
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  static const double defaultSize = 24;
  double _size = defaultSize;

  double get size => _size;

  set size(double size) => setState(() => _size = size); //state

  @override
  Widget build(BuildContext context) {
    var body = Row(children: [
      ChildWrite(), // findAncestorStateOfType
      ChildRead(size: _size), //参数传递
    ]);
    return MaterialApp(home: Scaffold(body: body));
  }

  static AppState of(BuildContext context) {
    return context.findAncestorStateOfType<AppState>()!;
  }
}

class ChildRead extends StatelessWidget {
  final double size;

  // ignore: prefer_const_constructors_in_immutables
  ChildRead({super.key, this.size = AppState.defaultSize});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.blur_off, size: size);
  }
}

class ChildWrite extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  ChildWrite({super.key});

  @override
  Widget build(BuildContext context) {
    AppState state = AppState.of(context);
    return ElevatedButton(
        child: Text("大大大！【size=${state.size}】"), onPressed: () => state.size += 10);
  }
}
