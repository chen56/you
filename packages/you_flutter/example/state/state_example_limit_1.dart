
import 'package:flutter/material.dart';
import 'package:you_dart/src/state.dart';
import 'package:you_flutter/src/state_widget.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: HelloSingleValue())));
}

class HelloSingleValue extends StatelessWidget {
  final counter = 0.signal();

  HelloSingleValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Builder、StatefulBuilder的观测限制", style: Theme.of(context).textTheme.titleLarge),
        const Divider(),
        Watch((context) => Text("✅正常观测:${counter()},Watch下普通组件 ok")),
        Watch((context) => Builder(builder: (context) {
              return Text("✅正常观测:${counter()}, callback直接嵌套一层Builder、StatefulBuilder ok");
            })),
        Watch((context) => Builder(builder: (context) {
              return Builder(builder: (context) {
                return Text("✅正常观测:${counter()}, callback直接嵌套多层Builder、StatefulBuilder ok");
              });
            })),

        /// 包裹在Column等容器后的Builder，Watch无法洞察
        Watch((context) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Builder(builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("🟡callback 间接嵌套Builder、StatefulBuilder"),
                      Text("      💔无法观测:${counter()}"),
                      Watch((context) => Text("      ✅恢复正常:${counter()}, 需重新Watch")),
                    ],
                  );
                })
              ],
            )),
        ElevatedButton(onPressed: () => counter.value++, child: const Text("counter.value++")),
        const Divider(),
        const Text("1. 为啥Builder类组件间接嵌套不起作用?因为Watch在你的callback执行时注册Signal监听器，而间接嵌套的Builder.build，不会在这个callback中直接执行，而是绕过了这个注册过程，这是flutter的机制."),
        const Text("2. 为啥会有这个限制？因为Watch想给予你的程序可观测性状态的同时，又不希望改变你原有的flutter代码惯例，Watch即不需要你的Widget继承某类，"
            "也不需要你与dispose、生命周期做斗争，我相信与其和内存泄漏、生命周期打架，"
            "不如从api层级就采用无生命周期、无干扰的设计，减少dispose、addListener、removeListener这样的api，放心用即可！你可以决定继续用StatefulWidget，也可以完全不用"),
      ],
    );
  }
}
