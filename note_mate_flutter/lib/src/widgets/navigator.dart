// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/widgets/navigator.dart';
import 'dart:core';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/heroes.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:ui';
import 'package:flutter/src/widgets/focus_traversal.dart';

/// class RouteSettings
class RouteSettings$Mate extends RouteSettings with Mate<RouteSettings$Mate> {
  /// RouteSettings RouteSettings({String? name, Object? arguments})
  RouteSettings$Mate({
    /// param: {String? name}
    String? name,

    /// param: {Object? arguments}
    Object? arguments,
  }) : super(
          name: name,
          arguments: arguments,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => RouteSettings$Mate(
        name: p.getValue('name'),
        arguments: p.getValue('arguments'),
      ),
    );
    mateParams.set(name: 'name', init: name);
    mateParams.set(name: 'arguments', init: arguments);
  }
}

/// class HeroControllerScope extends InheritedWidget
class HeroControllerScope$Mate extends HeroControllerScope with WidgetMate<HeroControllerScope$Mate> {
  /// HeroControllerScope HeroControllerScope({Key? key, required HeroController controller, required Widget child})
  HeroControllerScope$Mate({
    /// param: {Key? key}
    Key? key,

    /// param: {required HeroController controller}
    required HeroController controller,

    /// param: {required Widget child}
    required Widget child,
  }) : super(
          key: key,
          controller: controller,
          child: child,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => HeroControllerScope$Mate(
        key: p.getValue('key'),
        controller: p.getValue('controller'),
        child: p.getValue('child'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'controller', init: controller);
    mateParams.set(name: 'child', init: child);
  }

  /// HeroControllerScope HeroControllerScope.none({Key? key, required Widget child})
  HeroControllerScope$Mate.none({
    /// param: {Key? key}
    Key? key,

    /// param: {required Widget child}
    required Widget child,
  }) : super.none(
          key: key,
          child: child,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => HeroControllerScope$Mate.none(
        key: p.getValue('key'),
        child: p.getValue('child'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'child', init: child);
  }
}

/// class Navigator extends StatefulWidget
class Navigator$Mate extends Navigator with WidgetMate<Navigator$Mate> {
  /// Navigator Navigator({Key? key, List<Page<dynamic>> pages = const <Page<dynamic>>[], bool Function(Route<dynamic>, dynamic)? onPopPage, String? initialRoute, List<Route<dynamic>> Function(NavigatorState, String) onGenerateInitialRoutes = Navigator.defaultGenerateInitialRoutes, Route<dynamic>? Function(RouteSettings)? onGenerateRoute, Route<dynamic>? Function(RouteSettings)? onUnknownRoute, TransitionDelegate<dynamic> transitionDelegate = const DefaultTransitionDelegate<dynamic>(), bool reportsRouteUpdateToEngine = false, Clip clipBehavior = Clip.hardEdge, List<NavigatorObserver> observers = const <NavigatorObserver>[], bool requestFocus = true, String? restorationScopeId, TraversalEdgeBehavior routeTraversalEdgeBehavior = kDefaultRouteTraversalEdgeBehavior})
  Navigator$Mate({
    /// param: {Key? key}
    Key? key,

    /// param: {List<Page<dynamic>> pages = const <Page<dynamic>>[]}
    required List<Page<dynamic>> pages,

    /// param: {bool Function(Route<dynamic>, dynamic)? onPopPage}
    PopPageCallback? onPopPage,

    /// param: {String? initialRoute}
    String? initialRoute,

    /// param: {List<Route<dynamic>> Function(NavigatorState, String) onGenerateInitialRoutes = Navigator.defaultGenerateInitialRoutes}
    required RouteListFactory onGenerateInitialRoutes,

    /// param: {Route<dynamic>? Function(RouteSettings)? onGenerateRoute}
    RouteFactory? onGenerateRoute,

    /// param: {Route<dynamic>? Function(RouteSettings)? onUnknownRoute}
    RouteFactory? onUnknownRoute,

    /// param: {TransitionDelegate<dynamic> transitionDelegate = const DefaultTransitionDelegate<dynamic>()}
    required TransitionDelegate<dynamic> transitionDelegate,

    /// param: {bool reportsRouteUpdateToEngine = false}
    required bool reportsRouteUpdateToEngine,

    /// param: {Clip clipBehavior = Clip.hardEdge}
    required Clip clipBehavior,

    /// param: {List<NavigatorObserver> observers = const <NavigatorObserver>[]}
    required List<NavigatorObserver> observers,

    /// param: {bool requestFocus = true}
    required bool requestFocus,

    /// param: {String? restorationScopeId}
    String? restorationScopeId,

    /// param: {TraversalEdgeBehavior routeTraversalEdgeBehavior = kDefaultRouteTraversalEdgeBehavior}
    required TraversalEdgeBehavior routeTraversalEdgeBehavior,
  }) : super(
          key: key,
          pages: pages,
          onPopPage: onPopPage,
          initialRoute: initialRoute,
          onGenerateInitialRoutes: onGenerateInitialRoutes,
          onGenerateRoute: onGenerateRoute,
          onUnknownRoute: onUnknownRoute,
          transitionDelegate: transitionDelegate,
          reportsRouteUpdateToEngine: reportsRouteUpdateToEngine,
          clipBehavior: clipBehavior,
          observers: observers,
          requestFocus: requestFocus,
          restorationScopeId: restorationScopeId,
          routeTraversalEdgeBehavior: routeTraversalEdgeBehavior,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => Navigator$Mate(
        key: p.getValue('key'),
        pages: p.getValue('pages'),
        onPopPage: p.getValue('onPopPage'),
        initialRoute: p.getValue('initialRoute'),
        onGenerateInitialRoutes: p.getValue('onGenerateInitialRoutes'),
        onGenerateRoute: p.getValue('onGenerateRoute'),
        onUnknownRoute: p.getValue('onUnknownRoute'),
        transitionDelegate: p.getValue('transitionDelegate'),
        reportsRouteUpdateToEngine: p.getValue('reportsRouteUpdateToEngine'),
        clipBehavior: p.getValue('clipBehavior'),
        observers: p.getValue('observers'),
        requestFocus: p.getValue('requestFocus'),
        restorationScopeId: p.getValue('restorationScopeId'),
        routeTraversalEdgeBehavior: p.getValue('routeTraversalEdgeBehavior'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'pages', init: pages);
    mateParams.set(name: 'onPopPage', init: onPopPage);
    mateParams.set(name: 'initialRoute', init: initialRoute);
    mateParams.set(name: 'onGenerateInitialRoutes', init: onGenerateInitialRoutes);
    mateParams.set(name: 'onGenerateRoute', init: onGenerateRoute);
    mateParams.set(name: 'onUnknownRoute', init: onUnknownRoute);
    mateParams.set(name: 'transitionDelegate', init: transitionDelegate);
    mateParams.set(name: 'reportsRouteUpdateToEngine', init: reportsRouteUpdateToEngine);
    mateParams.set(name: 'clipBehavior', init: clipBehavior);
    mateParams.set(name: 'observers', init: observers);
    mateParams.set(name: 'requestFocus', init: requestFocus);
    mateParams.set(name: 'restorationScopeId', init: restorationScopeId);
    mateParams.set(name: 'routeTraversalEdgeBehavior', init: routeTraversalEdgeBehavior);
  }
}

/// class RestorableRouteFuture<T> extends RestorableProperty<String?>
class RestorableRouteFuture$Mate<T> extends RestorableRouteFuture<T> with Mate<RestorableRouteFuture$Mate> {
  /// RestorableRouteFuture<T> RestorableRouteFuture({NavigatorState Function(BuildContext) navigatorFinder = _defaultNavigatorFinder, required String Function(NavigatorState, Object?) onPresent, void Function(T)? onComplete})
  RestorableRouteFuture$Mate({
    /// param: {NavigatorState Function(BuildContext) navigatorFinder = _defaultNavigatorFinder}
    required NavigatorFinderCallback navigatorFinder,

    /// param: {required String Function(NavigatorState, Object?) onPresent}
    required RoutePresentationCallback onPresent,

    /// param: {void Function(T)? onComplete}
    RouteCompletionCallback<T>? onComplete,
  }) : super(
          navigatorFinder: navigatorFinder,
          onPresent: onPresent,
          onComplete: onComplete,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => RestorableRouteFuture$Mate(
        navigatorFinder: p.getValue('navigatorFinder'),
        onPresent: p.getValue('onPresent'),
        onComplete: p.getValue('onComplete'),
      ),
    );
    mateParams.set(name: 'navigatorFinder', init: navigatorFinder);
    mateParams.set(name: 'onPresent', init: onPresent);
    mateParams.set(name: 'onComplete', init: onComplete);
  }
}
