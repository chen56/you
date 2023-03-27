// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/heroes.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:core';
import 'package:flutter/src/widgets/framework.dart';

/// class Hero extends StatefulWidget
class Hero$Mate extends Hero with Mate {
  /// Hero Hero({Key? key, required Object tag, Tween<Rect?> Function(Rect?, Rect?)? createRectTween, Widget Function(BuildContext, Animation<double>, HeroFlightDirection, BuildContext, BuildContext)? flightShuttleBuilder, Widget Function(BuildContext, Size, Widget)? placeholderBuilder, bool transitionOnUserGestures = false, required Widget child})
  Hero$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required Object tag} , defaultValue:none
    required Object tag,

    /// optionalParameters: {Tween<Rect?> Function(Rect?, Rect?)? createRectTween} , defaultValue:none
    CreateRectTween? createRectTween,

    /// optionalParameters: {Widget Function(BuildContext, Animation<double>, HeroFlightDirection, BuildContext, BuildContext)? flightShuttleBuilder} , defaultValue:none
    HeroFlightShuttleBuilder? flightShuttleBuilder,

    /// optionalParameters: {Widget Function(BuildContext, Size, Widget)? placeholderBuilder} , defaultValue:none
    HeroPlaceholderBuilder? placeholderBuilder,

    /// optionalParameters: {bool transitionOnUserGestures = false} , defaultValue:Literal
    bool transitionOnUserGestures = false,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,
  }) : super(
          key: key,
          tag: tag,
          createRectTween: createRectTween,
          flightShuttleBuilder: flightShuttleBuilder,
          placeholderBuilder: placeholderBuilder,
          transitionOnUserGestures: transitionOnUserGestures,
          child: child,
        ) {
    mateCreateName = 'Hero';
    matePackageUrl = 'package:flutter/widgets.dart';
    mateBuilder = (p) => Hero$Mate(
          key: p.get('key').build(),
          tag: p.get('tag').build(),
          createRectTween: p.get('createRectTween').build(),
          flightShuttleBuilder: p.get('flightShuttleBuilder').build(),
          placeholderBuilder: p.get('placeholderBuilder').build(),
          transitionOnUserGestures: p.get('transitionOnUserGestures').build(),
          child: p.get('child').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('tag', tag, isNamed: true);
    mateUse('createRectTween', createRectTween, isNamed: true);
    mateUse('flightShuttleBuilder', flightShuttleBuilder, isNamed: true);
    mateUse('placeholderBuilder', placeholderBuilder, isNamed: true);
    mateUse('transitionOnUserGestures', transitionOnUserGestures, isNamed: true);
    mateUse('child', child, isNamed: true);
  }
}

/// class HeroController extends NavigatorObserver
class HeroController$Mate extends HeroController with Mate {
  /// HeroController HeroController({Tween<Rect?> Function(Rect?, Rect?)? createRectTween})
  HeroController$Mate(
      {
      /// optionalParameters: {Tween<Rect?> Function(Rect?, Rect?)? createRectTween} , defaultValue:none
      CreateRectTween? createRectTween})
      : super(createRectTween: createRectTween) {
    mateCreateName = 'HeroController';
    matePackageUrl = 'package:flutter/widgets.dart';
    mateBuilder = (p) => HeroController$Mate(createRectTween: p.get('createRectTween').build());
    mateUse('createRectTween', createRectTween, isNamed: true);
  }
}

/// class HeroMode extends StatelessWidget
class HeroMode$Mate extends HeroMode with Mate {
  /// HeroMode HeroMode({Key? key, required Widget child, bool enabled = true})
  HeroMode$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,

    /// optionalParameters: {bool enabled = true} , defaultValue:Literal
    bool enabled = true,
  }) : super(
          key: key,
          child: child,
          enabled: enabled,
        ) {
    mateCreateName = 'HeroMode';
    matePackageUrl = 'package:flutter/widgets.dart';
    mateBuilder = (p) => HeroMode$Mate(
          key: p.get('key').build(),
          child: p.get('child').build(),
          enabled: p.get('enabled').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('child', child, isNamed: true);
    mateUse('enabled', enabled, isNamed: true);
  }
}
