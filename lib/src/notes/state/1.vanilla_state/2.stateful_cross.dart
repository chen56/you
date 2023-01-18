// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

main() {
  runApp(const CrossStatefulApp());
}

/*
Parent(StatefulWidget)        : state 数据在这里,提供读写方法
  ChildRead(StatelessWidget)  : 读数据
  ChildWrite(StatelessWidget) : 写数据
*/
class CrossStatefulApp extends StatelessWidget {
  const CrossStatefulApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold(body: ParentWidget()));
  }
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => ParentState();
}

class ParentState extends State<ParentWidget> {
  static const double defaultSize = 24;
  double _size = defaultSize;

  double get size => _size;

  set size(double value) => setState(() => _size = value);

  reset() => setState(() => _size = defaultSize);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ChildRead(),
      ChildWrite(),
    ]);
  }
}

class ChildRead extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  ChildRead({super.key});

  @override
  Widget build(BuildContext context) {
    ParentState state = context.findAncestorStateOfType<ParentState>()!;
    return Icon(Icons.accessibility, size: state.size);
  }
}

class ChildWrite extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  ChildWrite({super.key});

  @override
  Widget build(BuildContext context) {
    ParentState state = context.findAncestorStateOfType<ParentState>()!;
    return Row(children: [
      ElevatedButton(child: const Text("+10"), onPressed: () => state.size += 10),
      ElevatedButton(child: const Text("reset"), onPressed: () => state.reset()),
    ]);
  }
}
