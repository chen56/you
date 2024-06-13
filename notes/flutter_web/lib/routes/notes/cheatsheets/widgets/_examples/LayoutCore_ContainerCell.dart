import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(home: Scaffold(body: LayoutCore_ContainerCell())));
}

// ignore: camel_case_types
class LayoutCore_ContainerCell extends StatelessWidget {
  const LayoutCore_ContainerCell({super.key});

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return Wrap(children: [
      Container(
          width: 100,
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: colors.surface, borderRadius: BorderRadius.circular(4.0), boxShadow: [
            BoxShadow(color: colors.shadow.withOpacity(0.2), spreadRadius: 2, blurRadius: 2, offset: const Offset(2, 1)),
          ]),
          child: const Text("模仿Card\nImitate Card"))
    ]);
  }
}
