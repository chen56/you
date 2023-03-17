// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

main() {
  runApp(const App());
}

/*

继承关系：
- Listenable 接口
  - ChangeNotifier 实现


父组件维护状态，子组件使用状态
----------------------------------------------------------
App                      : StatelessWidget，state 数据在这里,提供读写方法
  ValueListenableBuilder : StatefulWidget，监听App.size
    ChildRead            : StatelessWidget，读数据
  ChildWrite             : StatelessWidget，写数据,无监听无变化
----------------------------------------------------------
*/
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();

  static AppState of(BuildContext context) {
    return context.findAncestorStateOfType<AppState>()!;
  }
}

class AppState extends State<App> {
  static const double defaultSize = 24;
  final ValueNotifier<double> size = ValueNotifier(defaultSize);

  @override
  Widget build(BuildContext context) {
    var body = Row(children: [
      ChildRead(),
      ChildWrite(),
    ]);
    return MaterialApp(home: Scaffold(body: body));
  }
}

class ChildRead extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  ChildRead({super.key});

  @override
  Widget build(BuildContext context) {
    AppState state = App.of(context);
    return ValueListenableBuilder(
        valueListenable: state.size,
        builder: (context, value, child) => Icon(Icons.blur_off, size: value));
  }
}

class ChildWrite extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  ChildWrite({super.key});

  @override
  Widget build(BuildContext context) {
    AppState state = App.of(context);
    return ElevatedButton(
        child: Text("大大大！ 因未监听状态，导致【size=${state.size.value}】无变化"),
        onPressed: () => state.size.value += 10);
  }
}
