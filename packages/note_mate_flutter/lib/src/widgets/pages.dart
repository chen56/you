// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/pages.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:flutter/src/widgets/routes.dart';
import 'dart:core';
import 'dart:ui';

/// class PageRouteBuilder<T> extends PageRoute<T>
class PageRouteBuilder$Mate<T> extends PageRouteBuilder<T> with Mate {
  /// PageRouteBuilder<T> PageRouteBuilder({RouteSettings? settings, required Widget Function(BuildContext, Animation<double>, Animation<double>) pageBuilder, Widget Function(BuildContext, Animation<double>, Animation<double>, Widget) transitionsBuilder = _defaultTransitionsBuilder, Duration transitionDuration = const Duration(milliseconds: 300), Duration reverseTransitionDuration = const Duration(milliseconds: 300), bool opaque = true, bool barrierDismissible = false, Color? barrierColor, String? barrierLabel, bool maintainState = true, bool fullscreenDialog = false, bool allowSnapshotting = true})
  PageRouteBuilder$Mate({
    /// optionalParameters: {RouteSettings? settings} , hasDefaultValue:false, defaultValueCode:null
    RouteSettings? settings,

    /// optionalParameters: {required Widget Function(BuildContext, Animation<double>, Animation<double>) pageBuilder} , hasDefaultValue:false, defaultValueCode:null
    required RoutePageBuilder pageBuilder,

    /// optionalParameters: {Widget Function(BuildContext, Animation<double>, Animation<double>, Widget) transitionsBuilder = _defaultTransitionsBuilder} , hasDefaultValue:true, defaultValueCode:_defaultTransitionsBuilder
    required RouteTransitionsBuilder transitionsBuilder,

    /// optionalParameters: {Duration transitionDuration = const Duration(milliseconds: 300)} , hasDefaultValue:true, defaultValueCode:const Duration(milliseconds: 300)
    required Duration transitionDuration,

    /// optionalParameters: {Duration reverseTransitionDuration = const Duration(milliseconds: 300)} , hasDefaultValue:true, defaultValueCode:const Duration(milliseconds: 300)
    required Duration reverseTransitionDuration,

    /// optionalParameters: {bool opaque = true} , hasDefaultValue:true, defaultValueCode:true
    required bool opaque,

    /// optionalParameters: {bool barrierDismissible = false} , hasDefaultValue:true, defaultValueCode:false
    required bool barrierDismissible,

    /// optionalParameters: {Color? barrierColor} , hasDefaultValue:false, defaultValueCode:null
    Color? barrierColor,

    /// optionalParameters: {String? barrierLabel} , hasDefaultValue:false, defaultValueCode:null
    String? barrierLabel,

    /// optionalParameters: {bool maintainState = true} , hasDefaultValue:true, defaultValueCode:true
    required bool maintainState,

    /// optionalParameters: {bool fullscreenDialog = false} , hasDefaultValue:true, defaultValueCode:false
    required bool fullscreenDialog,

    /// optionalParameters: {bool allowSnapshotting = true} , hasDefaultValue:true, defaultValueCode:true
    required bool allowSnapshotting,
  }) : super(
          settings: settings,
          pageBuilder: pageBuilder,
          transitionsBuilder: transitionsBuilder,
          transitionDuration: transitionDuration,
          reverseTransitionDuration: reverseTransitionDuration,
          opaque: opaque,
          barrierDismissible: barrierDismissible,
          barrierColor: barrierColor,
          barrierLabel: barrierLabel,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          allowSnapshotting: allowSnapshotting,
        ) {
    mateBuilder = (p) => PageRouteBuilder$Mate<T>(
          settings: p.get('settings').build(),
          pageBuilder: p.get('pageBuilder').build(),
          transitionsBuilder: p.get('transitionsBuilder').build(),
          transitionDuration: p.get('transitionDuration').build(),
          reverseTransitionDuration: p.get('reverseTransitionDuration').build(),
          opaque: p.get('opaque').build(),
          barrierDismissible: p.get('barrierDismissible').build(),
          barrierColor: p.get('barrierColor').build(),
          barrierLabel: p.get('barrierLabel').build(),
          maintainState: p.get('maintainState').build(),
          fullscreenDialog: p.get('fullscreenDialog').build(),
          allowSnapshotting: p.get('allowSnapshotting').build(),
        );
    matePut('settings', settings);
    matePut('pageBuilder', pageBuilder);
    matePut('transitionsBuilder', transitionsBuilder);
    matePut('transitionDuration', transitionDuration);
    matePut('reverseTransitionDuration', reverseTransitionDuration);
    matePut('opaque', opaque);
    matePut('barrierDismissible', barrierDismissible);
    matePut('barrierColor', barrierColor);
    matePut('barrierLabel', barrierLabel);
    matePut('maintainState', maintainState);
    matePut('fullscreenDialog', fullscreenDialog);
    matePut('allowSnapshotting', allowSnapshotting);
  }
}