// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

main() {
  runApp(App());
}

/*

继承关系：
- interface Listenable
  - ChangeNotifier implement Listenable
  - interface ValueListenable extends Listenable
    - ValueNotifier implement ValueListenable


父组件维护状态，子组件使用状态,父组件可以是StatelessWidget，因为状态变化由各
子组件的ValueListenableBuilder完成，父组件已不需要setState了。
----------------------------------------------------------
App                      : StatelessWidget，state 数据在这里,提供读写方法
  ValueListenableBuilder : StatefulWidget，监听App.size
    ChildRead            : StatelessWidget，读数据
  ValueListenableBuilder : StatefulWidget，监听App.size
    ChildWrite           : StatelessWidget，写数据
----------------------------------------------------------
*/
class App extends StatelessWidget {
  static const double defaultSize = 24;
  final ValueNotifier<double> size = ValueNotifier(defaultSize);

  App({super.key});

  @override
  Widget build(BuildContext context) {
    var body = Column(children: [
      Text("App:【size=${size.value}】,无监听所以无变化"),
      ChildRead(),
      ChildWrite(),
    ]);
    return MaterialApp(home: Scaffold(body: body));
  }

  static App of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<App>()!;
  }
}

class ChildRead extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  ChildRead({super.key});

  @override
  Widget build(BuildContext context) {
    App state = App.of(context);
    return ValueListenableBuilder(
      valueListenable: state.size,
      builder: (context, value, child) => Icon(Icons.blur_off, size: value),
    );
  }
}

class ChildWrite extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  ChildWrite({super.key});

  @override
  Widget build(BuildContext context) {
    App state = App.of(context);
    return ValueListenableBuilder(
      valueListenable: state.size,
      builder: (context, value, child) => ElevatedButton(
          child: Text("大大大！【size=${state.size.value}】无变化"),
          onPressed: () {
            state.size.value += 10;

            log(WidgetInspectorService.instance.getRootWidgetSummaryTree("groupName"));
          }),
    );
  }

  void log(Object? o) {
    // ignore: avoid_print
    print("log: $o");
  }
}
