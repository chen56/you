import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class HomeScreen extends StatelessWidget with Screen<void, void> {
  @override
  final void args = null;

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScaffoldMessengerState sms = ScaffoldMessenger.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text("HomeScreen navigator v2")),
      body: Column(children: [
        ElevatedButton(
          child: const Text(
              """String answer=await HelpScreen(args: "how to use navigator v2?").push(context)"""),
          onPressed: () async {
            String? answer = await HelpScreen(question: "how to use navigator v2?").push(context);
            sms.showSnackBar(SnackBar(
              duration: const Duration(milliseconds: 2000),
              content: Text('answer: ${answer ?? "null(可能点了系统返回按钮)"}'),
            ));
          },
        ),
        const ShowPages(),
      ]),
    );
  }
}

class HelpScreen extends StatelessWidget with Screen<String, String> {
  final String question;

  HelpScreen({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    option(String answer) => ElevatedButton(
        child: Text('''completer.complete("$answer")'''),
        onPressed: () => completer.complete(answer));
    return Scaffold(
      appBar: AppBar(title: const Text("HelpScreen")),
      body: Column(
        children: [
          Text("question:$question "),
          option("我们有开发过v2吗？"),
          option("你说的v2被另一只狗吓跑了！"),
          const ShowPages(),
        ],
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: NavigatorV2(
          first: HomeScreen(),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////
// 上面是应用代码，下面是封装后的NavigatorV2高级Api
////////////////////////////////////////////////
/// 范型A： 参数类型, R:结果类型
class NavigatorV2 extends StatefulWidget {
  static NavigatorV2State of(BuildContext context) {
    return context.findAncestorStateOfType<NavigatorV2State>()!;
  }

  const NavigatorV2({
    super.key,
    required this.first,
  });

  final Screen<void, void> first;

  @override
  State<StatefulWidget> createState() {
    return NavigatorV2State();
  }
}

class NavigatorV2State extends State<NavigatorV2> {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "myNavigator");

  late final List<MyPage> _pages = List.from([widget.first.createPage()], growable: true);

  @override
  Widget build(BuildContext context) {
    log("build");
    var navigator = Navigator(
      key: navigatorKey,
      onPopPage: (route, result) {
        log("build.onPopPage - route:${route.settings.name}, result:$result");
        if (!route.didPop(result)) {
          return false;
        }
        if (_pages.isEmpty) {
          return true;
        }
        setState(() {
          var page = _pages.removeLast();
          //把completer的完成指责放权给各Screen自己后，
          //如果由系统back button触发onPopPage，框架应使completer完成，要不会泄露Future
          if (!page.screen.completer.isCompleted) {
            page.screen.completer.complete(null);
          }
        });
        return true;
      },
      //!!! toList()非常重要! 如果传入的pages是同一个ref，flutter会认为无变化
      pages: _pages.toList(),
    );
    return navigator;
  }

  void log(Object? message) {
    if (kDebugMode) {
      var pageLog = _pages.map((e) => "${e.screen})").toList();
      print("$runtimeType(id:${identityHashCode(this)}) - $message - pages:$pageLog");
    }
  }

  Future<R?> push<A, R>(Screen<A, R> screen) {
    var page = screen.createPage();
    //把completer的完成指责放权给各Screen自己后，框架需监听其完成后删除Page
    screen.completer.future.whenComplete(() {
      setState(() {
        _pages.remove(page);
      });
    });
    setState(() {
      _pages.add(page);
    });
    return screen.completer.future;
  }
}

/// A: Screen参数类型，R: push返回值类型
class MyPage<A, R> extends MaterialPage<R> {
  MyPage({
    // super.key,
    // super.name,
    required this.screen,
  }) : super(
          child: screen,
          name: screen.runtimeType.toString(),
          key: ValueKey(screen.runtimeType.toString()), //key的临时用法
        );
  Screen<A, R> screen;
}

/// A: Screen参数类型，R: push返回值类型
mixin Screen<A, R> on Widget {
  @protected
  final Completer<R?> completer = Completer();

  @protected
  void log(Object? message) {
    if (kDebugMode) {
      print("$runtimeType(id:${identityHashCode(this)}) - $message ");
    }
  }

  MyPage<A, R> createPage() => MyPage(screen: this);

  Future<R?> push(BuildContext context) {
    return NavigatorV2.of(context).push<A, R>(this);
  }

  @override
  String toStringShort() {
    return "Screen()";
  }
}

class ShowPages extends StatelessWidget {
  const ShowPages({super.key});

  @override
  Widget build(BuildContext context) {
    var screens = NavigatorV2.of(context)._pages.map((e) => e.screen).toList();
    return Expanded(
      child: ListView(children: [
        const Divider(thickness: 2),
        const Center(child: Text("--- debug: pages ---")),
        for (int i = screens.length - 1; i >= 0; i--)
          ListTile(title: Text("  pages[$i]: ${screens[i]})")),
        const Divider(thickness: 2),
      ]),
    );
  }
}
