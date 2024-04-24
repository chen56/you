import 'package:flutter/material.dart';

// 最佳实践
main() {
  // ignore: unused_local_variable
  var x = const Column(key: ValueKey("key"))([
    const Text("s"),
    const Row(),
  ]);
  Row(crossAxisAlignment: CrossAxisAlignment.baseline, children: [
    FilledButton(onPressed: () => {}, child: const Text("ss")),
    Container(color: Colors.amber)(
      const Row(),
    ),
  ]);
  const StyledWidget(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
  )(
    Row(crossAxisAlignment: CrossAxisAlignment.baseline, children: [
      FilledButton(onPressed: () => {}, child: const Text("ss")),
      Container(color: Colors.amber)(
        Row(children: [
          const StyledWidget(alignment: Alignment.center)(
            Row(crossAxisAlignment: CrossAxisAlignment.baseline, children: [
              FilledButton(onPressed: () => {}, child: const Text("ss")),
            ]),
          )
        ]),
      ),
    ]),
  );
}

class StyledWidget extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;
  final AlignmentGeometry? alignment;
  final Widget? child;

  const StyledWidget({
    super.key,
    this.padding,
    this.decoration,
    this.alignment,
  }) : child = null;

  StyledWidget call(Widget child) {
    return StyledWidget._copyWithChild(
      padding: padding,
      decoration: decoration,
      alignment: alignment,
      child: child,
    );
  }

  const StyledWidget._copyWithChild({
    this.padding,
    this.decoration,
    this.alignment,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: child,
    );
  }
}

extension XXX on Column {
  Column call(List<Widget> children) {
    return Column(
      children: children,
    );
  }
}

extension XXX2 on Container {
  Container call(Widget child) {
    return Container(
      child: child,
    );
  }
}
