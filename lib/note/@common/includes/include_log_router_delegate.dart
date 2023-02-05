import 'package:flutter/widgets.dart';

import 'include_log.dart';

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
    log("build()");
    return delegate.build(context);
  }

  @override
  T? get currentConfiguration {
    log("currentConfiguration -> ${_configuration(delegate.currentConfiguration)}");
    return delegate.currentConfiguration;
  }

  String _configuration(T? configuration) {
    var result = configuration;
    var str = result is RouteInformation ? "${result.location}" : "$result";
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
