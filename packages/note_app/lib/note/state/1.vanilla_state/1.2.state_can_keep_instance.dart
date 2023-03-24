import 'package:flutter/material.dart';

main() {
  runApp(const Parent());
}

class Parent extends StatefulWidget {
  const Parent({super.key});

  @override
  State<Parent> createState() => ParentState();
}

class ParentState extends State<Parent> {
  double counter = 24; //state

  @override
  Widget build(BuildContext context) {
    var body = ColoredBox(
      color: Colors.white,
      child: Column(children: [
        ElevatedButton(
            child: Text("Parent: counter++, counter:${counter}  hashcode:$hashCode"),
            onPressed: () => setState(() => counter++)),
        Center(
          child: Child(counter),
        ),
      ]),
    );
    return MaterialApp(home: Scaffold(body: body));
  }
}

class Child extends StatefulWidget {
  final double counter;

  const Child(this.counter, {super.key});

  @override
  State<Child> createState() => ChildState();
}

class ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    return Text("Child: counter:${widget.counter} hashcode:$hashCode");
  }
}
