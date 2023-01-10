import 'package:flutter/material.dart';
import 'package:learn_flutter/simple/text/text_hello.dart' as text_hello;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class TextSimple extends StatelessWidget {
  const TextSimple({
    super.key,
    required this.counter,
  });
  final int counter;
  @override
  Widget build(BuildContext context) {
    return buildScaffold(context);
  }

  Widget buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New router:$counter"),
      ),
      body: Center(
        child: Wrap(
          spacing: 8.0, // 主轴(水平)方向间距
          runSpacing: 4.0, // 纵轴（垂直）方向间距
          alignment: WrapAlignment.center, //沿主轴方向居中
          children: const <Widget>[
            Chip(
              avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
              label: Text('sss'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  get child => null;

  @override
  Widget build(BuildContext context) {
    var textSimple1 = TextButton(
      child: const Text("open new text simple"),
      onPressed: () {
        //导航到新路由
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const TextSimple(counter: 1);
            },
            fullscreenDialog: false,
            maintainState: true,
          ),
        );
      },
    );
    var textSimple2 = ElevatedButton(
      child: const Text("Default ElevatedButton"),
      onPressed: () {},
    );

//更多请阅读：https://www.yiibai.com/flutter/flutter-elevatedbutton.html

    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            textSimple1,
            textSimple2,
          ],
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var drawer = const MyDrawer();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: drawer,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            text_hello.TextHelloSample(),
            StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) => text_hello.params.path("text.data").builder()),
            StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) =>
                    text_hello.params.path("text.textAlign").builder()),
            // text_hello.params.path("text.textAlign").builder(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
