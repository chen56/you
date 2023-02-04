import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///本包终于要辅助notes中的范例做极简的日志，最终会把本包的某些代码动态插入到范例中

class Logger extends ChangeNotifier {
  final List<String> messages = List.empty(growable: true);
  Element? logView;

  log(Object? object) {
    String message="${DateTime.now()} - $object";
    if(kDebugMode){
      print(message);
    }
    messages.add(message);
    if (logView?.mounted ?? false) logView!.markNeedsBuild();
  }
}

class LogView extends StatelessWidget {
  final Logger logger;

  const LogView({super.key, required this.logger});

  @override
  Widget build(BuildContext context) {
    logger.logView = context as Element;
    return ListView(children: [
      const Center(child: Text("--- debug: log ---")),
      for (var m in logger.messages) ListTile(title: Text(m)),
    ]);
  }
}
