// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/progress_indicator_theme.dart';
import 'package:note/mate.dart';
import 'dart:ui';
import 'dart:core';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

/// class ProgressIndicatorThemeData with Diagnosticable
class ProgressIndicatorThemeData$Mate extends ProgressIndicatorThemeData with Mate {
  /// ProgressIndicatorThemeData ProgressIndicatorThemeData({Color? color, Color? linearTrackColor, double? linearMinHeight, Color? circularTrackColor, Color? refreshBackgroundColor})
  ProgressIndicatorThemeData$Mate({
    /// optionalParameters: {Color? color} , hasDefaultValue:false, defaultValueCode:null
    Color? color,

    /// optionalParameters: {Color? linearTrackColor} , hasDefaultValue:false, defaultValueCode:null
    Color? linearTrackColor,

    /// optionalParameters: {double? linearMinHeight} , hasDefaultValue:false, defaultValueCode:null
    double? linearMinHeight,

    /// optionalParameters: {Color? circularTrackColor} , hasDefaultValue:false, defaultValueCode:null
    Color? circularTrackColor,

    /// optionalParameters: {Color? refreshBackgroundColor} , hasDefaultValue:false, defaultValueCode:null
    Color? refreshBackgroundColor,
  }) : super(
          color: color,
          linearTrackColor: linearTrackColor,
          linearMinHeight: linearMinHeight,
          circularTrackColor: circularTrackColor,
          refreshBackgroundColor: refreshBackgroundColor,
        ) {
    mateBuilder = (p) => ProgressIndicatorThemeData$Mate(
          color: p.get('color').build(),
          linearTrackColor: p.get('linearTrackColor').build(),
          linearMinHeight: p.get('linearMinHeight').build(),
          circularTrackColor: p.get('circularTrackColor').build(),
          refreshBackgroundColor: p.get('refreshBackgroundColor').build(),
        );
    matePut('color', color);
    matePut('linearTrackColor', linearTrackColor);
    matePut('linearMinHeight', linearMinHeight);
    matePut('circularTrackColor', circularTrackColor);
    matePut('refreshBackgroundColor', refreshBackgroundColor);
  }
}

/// class ProgressIndicatorTheme extends InheritedTheme
class ProgressIndicatorTheme$Mate extends ProgressIndicatorTheme with Mate {
  /// ProgressIndicatorTheme ProgressIndicatorTheme({Key? key, required ProgressIndicatorThemeData data, required Widget child})
  ProgressIndicatorTheme$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required ProgressIndicatorThemeData data} , hasDefaultValue:false, defaultValueCode:null
    required ProgressIndicatorThemeData data,

    /// optionalParameters: {required Widget child} , hasDefaultValue:false, defaultValueCode:null
    required Widget child,
  }) : super(
          key: key,
          data: data,
          child: child,
        ) {
    mateBuilder = (p) => ProgressIndicatorTheme$Mate(
          key: p.get('key').build(),
          data: p.get('data').build(),
          child: p.get('child').build(),
        );
    matePut('key', key);
    matePut('data', data);
    matePut('child', child);
  }
}