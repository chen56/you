import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: Feedback_RefreshIndicator())));
}

// ignore: camel_case_types
class Feedback_RefreshIndicator extends StatelessWidget {
  Feedback_RefreshIndicator({super.key});

  final selected = false.signal();

  @override
  Widget build(BuildContext context) {
    return Watch(
      builder: (context) {
        return Column(children: [
          const Text("RefreshIndicator 下拉刷新(Pull down to refresh)"),
          SizedBox(
            height: 200,
            child: RefreshIndicator(
              onRefresh: () async {
                selected.value = true;
                await Future.delayed(const Duration(seconds: 3)); // mock delay
                selected.value = false;
              },
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 5, // 示例数据数量
                itemBuilder: (context, index) {
                  return ListTile(title: Text('Item ${index + 1}/5'));
                },
              ),
            ),
          ),
        ]);
      },
    );
  }
}
