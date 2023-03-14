// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/progress_indicator_theme.dart';
import 'dart:ui';
import 'dart:core';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

/// class ProgressIndicatorThemeData with Diagnosticable
class ProgressIndicatorThemeData$Mate extends ProgressIndicatorThemeData with Mate<ProgressIndicatorThemeData$Mate> {
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
    mateParams = Params(
      init: this,
      builder: (p) => ProgressIndicatorThemeData$Mate(
        color: p.getValue('color'),
        linearTrackColor: p.getValue('linearTrackColor'),
        linearMinHeight: p.getValue('linearMinHeight'),
        circularTrackColor: p.getValue('circularTrackColor'),
        refreshBackgroundColor: p.getValue('refreshBackgroundColor'),
      ),
    );
    mateParams.set(name: 'color', init: color);
    mateParams.set(name: 'linearTrackColor', init: linearTrackColor);
    mateParams.set(name: 'linearMinHeight', init: linearMinHeight);
    mateParams.set(name: 'circularTrackColor', init: circularTrackColor);
    mateParams.set(name: 'refreshBackgroundColor', init: refreshBackgroundColor);
  }
}

/// class ProgressIndicatorTheme extends InheritedTheme
class ProgressIndicatorTheme$Mate extends ProgressIndicatorTheme with WidgetMate<ProgressIndicatorTheme$Mate> {
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
    mateParams = Params(
      init: this,
      builder: (p) => ProgressIndicatorTheme$Mate(
        key: p.getValue('key'),
        data: p.getValue('data'),
        child: p.getValue('child'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'data', init: data);
    mateParams.set(name: 'child', init: child);
  }
}
