

import 'package:flutter/material.dart';

/// 样机只是展示风格的装饰器吧？应该可以让所有内容都可以配置
/// 在页面上表现一个样机的模样：模仿浏览器、桌面窗口、手机
/// 我们约束child为tight模式，以模仿最外层窗口
/// 参考: https://daisyui.com/components/mockup-window/
class MockupWindow extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final String title;

  const MockupWindow({
    super.key,
    this.title = "样机：固定宽高限制",
    double? width,
    double? height,
    this.child,
  })  : width = (width == null || width == double.infinity) ? 400 : width,
        height = (height == null || height == double.infinity) ? 50 : height;

  /// call() == withChild copy
  MockupWindow call(Widget child) {
    return MockupWindow(
      key: key,
      width: width,
      height: height,
      child: child,
    );
  }

  MockupWindow withChild(Widget child) {
    return MockupWindow(
      key: key,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          AppBar(
            title: Text(title),
            leading: IconButton(icon: const Icon(Icons.fullscreen_exit), onPressed: () {}),
            actions: <Widget>[
              IconButton(icon: const Icon(Icons.fullscreen_exit), onPressed: () {}),
              IconButton(icon: const Icon(Icons.fullscreen), onPressed: () {}),
            ],
          ),
          // Column是无限高，但我们约束child为tight模式，以模仿窗口
          ConstrainedBox(constraints: BoxConstraints.tightFor(width: width, height: height), child: child),
        ],
      ),
    );
  }
}
