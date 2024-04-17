import 'package:flutter/material.dart';

// StatefulWidget好像可以直接在屏幕变化时自动build
class _SizeProvider extends StatefulWidget {
  final Widget child;
  final Function(Size) onChildSize;

  const _SizeProvider({required this.onChildSize, required this.child});

  @override
  _SizeProviderState createState() => _SizeProviderState();
}

class _SizeProviderState extends State<_SizeProvider> {
  @override
  void initState() {
    super.initState();
    _onResize();
  }

  void _onResize() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var box = context.findRenderObject() as RenderBox;
      if (box.hasSize) {
        widget.onChildSize(box.size);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // _onResize();
    return widget.child;
  }
}
