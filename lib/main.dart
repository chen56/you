import 'package:flutter/material.dart';

void main(List<String> arguments) {
  if (arguments.contains('--cli')) {
    // 如果检测到 --cli 参数，则运行命令行模式
    runAsCommandLine(arguments);
  } else {
    // 否则，运行图形用户界面模式
    runApp(MyApp());
  }
}

void runAsCommandLine(List<String> args) {
  // 在这里实现命令行模式的逻辑
  print('Running in command line mode...');
  // 处理命令行参数和执行相应的命令...
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: Scaffold(
        appBar: AppBar(title: Text('My App')),
        body: Center(child: Text('Hello, Flutter World!')),
      ),
    );
  }
}