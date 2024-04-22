import 'package:flutter/material.dart';

main() {
  runApp(const App());
}

/*
父组件维护状态，子组件使用状态
----------------------------------------------------------
AppState     : StatefulWidget，父组件，state 数据在这里,提供读写方法，在此setState更新组件树
  ChildRead  : StatelessWidget，读数据，通过构造器参数传递父组件状态
  ChildWrite : StatelessWidget，写数据，通过BuildContext.findAncestorStateOfType()获取祖先状态
----------------------------------------------------------
*/
// ignore: camel_case_types
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();

  static AppState of(BuildContext context) {
    return context.findAncestorStateOfType<AppState>()!;
  }
}

class AppState extends State<App> {
  bool _wifiOn = false;

  bool get wifiOn => _wifiOn;

  set wifiOn(bool wifiOn) => setState(() => _wifiOn = wifiOn); //state

  @override
  Widget build(BuildContext context) {
    var body = Row(children: [
      ChildWrite(), // findAncestorStateOfType
      ChildRead(wifiOn: wifiOn), //参数传递
    ]);
    return MaterialApp(home: Scaffold(body: body));
  }
}

class ChildRead extends StatelessWidget {
  final bool wifiOn;

  // ignore: prefer_const_constructors_in_immutables
  ChildRead({super.key, this.wifiOn = false});

  @override
  Widget build(BuildContext context) {
    var icon = wifiOn ? Icons.sentiment_very_satisfied : Icons.sentiment_very_dissatisfied;
    var text = wifiOn ? const Text("wifi一开笑口常开") : const Text("wifi一断肝肠寸断");
    return Row(
      children: [
        text,
        ...List.generate(10, (index) => Icon(icon)),
      ],
    );
  }
}

class ChildWrite extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  ChildWrite({super.key});

  @override
  Widget build(BuildContext context) {
    AppState state = App.of(context);
    return TextButton(
      child: Icon(Icons.wifi, color: state.wifiOn ? Colors.blue : Colors.grey),
      onPressed: () => state.wifiOn = !(state.wifiOn),
    );
  }
}
