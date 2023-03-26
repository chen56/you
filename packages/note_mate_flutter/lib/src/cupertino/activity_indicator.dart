// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/cupertino/activity_indicator.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:ui';
import 'dart:core';

/// class CupertinoActivityIndicator extends StatefulWidget
class CupertinoActivityIndicator$Mate extends CupertinoActivityIndicator with Mate {
  /// CupertinoActivityIndicator CupertinoActivityIndicator({Key? key, Color? color, bool animating = true, double radius = _kDefaultIndicatorRadius})
  CupertinoActivityIndicator$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {Color? color} , defaultValue:none
    Color? color,

    /// optionalParameters: {bool animating = true} , defaultValue:Literal
    bool animating = true,

    /// optionalParameters: {double radius = _kDefaultIndicatorRadius} , defaultValue:unprocessed
    required double radius,
  }) : super(
          key: key,
          color: color,
          animating: animating,
          radius: radius,
        ) {
    mateCreateName = 'CupertinoActivityIndicator';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => CupertinoActivityIndicator$Mate(
          key: p.get('key').build(),
          color: p.get('color').build(),
          animating: p.get('animating').build(),
          radius: p.get('radius').build(),
        );
    mateUse('key', key);
    mateUse('color', color);
    mateUse('animating', animating);
    mateUse('radius', radius);
  }

  /// CupertinoActivityIndicator CupertinoActivityIndicator.partiallyRevealed({Key? key, Color? color, double radius = _kDefaultIndicatorRadius, double progress = 1.0})
  CupertinoActivityIndicator$Mate.partiallyRevealed({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {Color? color} , defaultValue:none
    Color? color,

    /// optionalParameters: {double radius = _kDefaultIndicatorRadius} , defaultValue:unprocessed
    required double radius,

    /// optionalParameters: {double progress = 1.0} , defaultValue:Literal
    double progress = 1.0,
  }) : super.partiallyRevealed(
          key: key,
          color: color,
          radius: radius,
          progress: progress,
        ) {
    mateCreateName = 'CupertinoActivityIndicator.partiallyRevealed';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => CupertinoActivityIndicator$Mate.partiallyRevealed(
          key: p.get('key').build(),
          color: p.get('color').build(),
          radius: p.get('radius').build(),
          progress: p.get('progress').build(),
        );
    mateUse('key', key);
    mateUse('color', color);
    mateUse('radius', radius);
    mateUse('progress', progress);
  }
}
