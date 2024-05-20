import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:you_dart/state.dart';

/// 类似[WidgetBuilder] [StatefulBuilder]
/// Watch用来build 观测state变化的。
final class Watch extends StatefulWidget {
  final WidgetBuilder builder;
  final VoidCallback? onDispose;
  final Listenable? watchListenable;

  const Watch({
    super.key,
    this.watchListenable,
    this.onDispose,
    required this.builder,
  });

  @override
  State<StatefulWidget> createState() {
    return _WatchState();
  }
}

final class _WatchState extends State<Watch> {
  final Map<Signal, SignalSubscription> _signalConnections = HashMap();

  void _listener() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    widget.watchListenable?.addListener(_listener);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    widget.watchListenable?.removeListener(_listener);

    for (var conn in _signalConnections.values) {
      conn.cancel();
    }
    _signalConnections.clear();

    if (widget.onDispose != null) {
      widget.onDispose!();
    }

    super.dispose();
  }

  // 如果客户程序返回的是Builder、StatefulBuilder 劫持它予以观测，
  // 并递归的看下一层是不是也是Builder、StatefulBuilder
  Widget _recursionHijackBuilder(Widget widget) {
    if (widget is Builder) {
      return Watch(builder: (context) {
        return _recursionHijackBuilder(widget.builder(context));
      });
    }
    if (widget is StatefulBuilder) {
      return StatefulBuilder(
          key: widget.key,
          builder: (context, setState) {
            return Watch(builder: (context) {
              return _recursionHijackBuilder(widget.builder(context, setState));
            });
          });
    }
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return Signal.track(useSignal: () {
      Widget result = widget.builder(context);
      return _recursionHijackBuilder(result);
    }, onChanged: (signal) {
      setState(() {});
    }, onConnected: (conn) {
      var x = _signalConnections[conn.signal];
      if (x != null) {
        x.cancel();
      }
      _signalConnections[conn.signal] = conn;
    });
  }
}
