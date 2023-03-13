// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/material/drawer_header.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/painting/decoration.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'dart:core';
import 'package:flutter/src/animation/curves.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note/mate.dart';

/// class DrawerHeader extends StatelessWidget
class DrawerHeader$Mate extends DrawerHeader with WidgetMate<DrawerHeader$Mate> {
  /// DrawerHeader DrawerHeader({Key? key, Decoration? decoration, EdgeInsetsGeometry? margin = const EdgeInsets.only(bottom: 8.0), EdgeInsetsGeometry padding = const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0), Duration duration = const Duration(milliseconds: 250), Curve curve = Curves.fastOutSlowIn, required Widget? child})
  DrawerHeader$Mate({
    /// param: {Key? key}
    Key? key,

    /// param: {Decoration? decoration}
    Decoration? decoration,

    /// param: {EdgeInsetsGeometry? margin = const EdgeInsets.only(bottom: 8.0)}
    EdgeInsetsGeometry? margin,

    /// param: {EdgeInsetsGeometry padding = const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0)}
    required EdgeInsetsGeometry padding,

    /// param: {Duration duration = const Duration(milliseconds: 250)}
    required Duration duration,

    /// param: {Curve curve = Curves.fastOutSlowIn}
    required Curve curve,

    /// param: {required Widget? child}
    required Widget? child,
  }) : super(
          key: key,
          decoration: decoration,
          margin: margin,
          padding: padding,
          duration: duration,
          curve: curve,
          child: child,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => DrawerHeader$Mate(
        key: p.getValue('key'),
        decoration: p.getValue('decoration'),
        margin: p.getValue('margin'),
        padding: p.getValue('padding'),
        duration: p.getValue('duration'),
        curve: p.getValue('curve'),
        child: p.getValue('child'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'decoration', init: decoration);
    mateParams.set(name: 'margin', init: margin);
    mateParams.set(name: 'padding', init: padding);
    mateParams.set(name: 'duration', init: duration);
    mateParams.set(name: 'curve', init: curve);
    mateParams.set(name: 'child', init: child);
  }
}