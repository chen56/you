
import 'package:flutter/material.dart';
import 'package:you_dart/src/state.dart';
import 'package:you_flutter/src/state.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: HelloSingleValue())));
}

class HelloSingleValue extends StatelessWidget {
  final counter = 0.signal();

  HelloSingleValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Watch((context) {
          // TODO Watch 回调内目前不能改值，会报错，这是在Widget.build()内，改值会引起Watch.setState
          // 而setState规范是不能在Widget.build内使用，冲突了，应该在callback期间让信号停发通知即可

          // 当前这里会报错：
          counter.value+=1;
          return Text("正常观测:${counter()}");
        }),
      ],
    );
  }
}
