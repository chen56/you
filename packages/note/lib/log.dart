import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Logger logger = Logger();

class Logger extends ChangeNotifier {
  final List<String> messages = List.empty(growable: true);
  Element? logView;

  log(Object? object) {
    String message = "${DateTime.now()} - $object";
    if (kDebugMode) {
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

class LoggableRouterDelegate<T> implements RouterDelegate<T> {
  final RouterDelegate<T> delegate;
  final Logger logger;

  LoggableRouterDelegate({required this.delegate, required this.logger});

  @override
  void addListener(VoidCallback listener) {
    log("addListener($listener)");
    return delegate.addListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    log("build(${(context as Element).toStringShallow(minLevel: DiagnosticLevel.hidden)})");
    return delegate.build(context);
  }

  @override
  T? get currentConfiguration {
    log("currentConfiguration -> ${_configuration(delegate.currentConfiguration)}");
    return delegate.currentConfiguration;
  }

  String _configuration(T? configuration) {
    var result = configuration;
    var str = result is RouteInformation
        ? "location:${result.location},state:${result.state}"
        : "$result";
    return str;
  }

  @override
  Future<bool> popRoute() {
    log("popRoute()");
    return delegate.popRoute();
  }

  @override
  void removeListener(VoidCallback listener) {
    log("removeListener($listener)");
    return delegate.removeListener(listener);
  }

  @override
  Future<void> setInitialRoutePath(T configuration) {
    log("setInitialRoutePath(configuration:${_configuration(configuration)})");
    return delegate.setInitialRoutePath(configuration);
  }

  @override
  Future<void> setNewRoutePath(T configuration) {
    log("setNewRoutePath(configuration:${_configuration(configuration)})");
    return delegate.setNewRoutePath(configuration);
  }

  @override
  Future<void> setRestoredRoutePath(T configuration) {
    log("setRestoredRoutePath(configuration:${_configuration(configuration)})");
    return delegate.setRestoredRoutePath(configuration);
  }

  log(Object? msg) {
    logger.log("${delegate.runtimeType}(id:${identityHashCode(delegate)}).$msg");
  }
}

class LayoutLog extends StatelessWidget {
  final Widget child;
  final String title;

  const LayoutLog({super.key, this.title = "LayoutLog", this.child = const Text("LayoutLog")});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (kDebugMode) {
          print("LayoutLog-$title:$constraints");
        }
        return child;
      },
    );
  }
}
