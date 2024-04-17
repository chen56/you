import 'package:flutter/material.dart';

/// todo 貌似有更先进的测量size方案，可以不用刷2次
/// /flutter/examples/api/lib/widgets/framework/build_owner.0.dart
class GetSizeBuilder extends StatelessWidget {
  final ValueNotifier<Size> size = ValueNotifier(const Size(0, 0));
  final ValueWidgetBuilder<Size> builder;
  final Widget? child;

  GetSizeBuilder({
    // ignore: unused_element
    super.key,
    required this.builder,
    // ignore: unused_element
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var box = context.findRenderObject() as RenderBox;
      if (box.hasSize) {
        size.value = (context.findRenderObject() as RenderBox).size;
      }
    });
    return ValueListenableBuilder<Size>(
      valueListenable: size,
      builder: builder,
      child: child,
    );
  }
}
