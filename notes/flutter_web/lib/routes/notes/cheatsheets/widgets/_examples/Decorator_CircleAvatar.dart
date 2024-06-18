import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(home: Scaffold(body: Decorator_CircleAvatar())));
}

// ignore: camel_case_types
class Decorator_CircleAvatar extends StatelessWidget {
  const Decorator_CircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(children: [
      CircleAvatar(child: Text('C')),
      CircleAvatar(child: Icon(Icons.account_box)),
      CircleAvatar(backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/2039742')),
      CircleAvatar(backgroundImage: NetworkImage('https://img2.baidu.com/it/u=3784833129,896943374&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500')),
    ]);
  }
}
