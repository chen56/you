// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/navigation_drawer_theme.dart';
import 'package:note/mate.dart';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/src/painting/borders.dart';
import 'package:flutter/src/material/material_state.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter/src/widgets/icon_theme_data.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

/// class NavigationDrawerThemeData with Diagnosticable
class NavigationDrawerThemeData$Mate extends NavigationDrawerThemeData with Mate {
  /// NavigationDrawerThemeData NavigationDrawerThemeData({double? tileHeight, Color? backgroundColor, double? elevation, Color? shadowColor, Color? surfaceTintColor, Color? indicatorColor, ShapeBorder? indicatorShape, Size? indicatorSize, MaterialStateProperty<TextStyle?>? labelTextStyle, MaterialStateProperty<IconThemeData?>? iconTheme})
  NavigationDrawerThemeData$Mate({
    /// optionalParameters: {double? tileHeight} , defaultValue:none
    double? tileHeight,

    /// optionalParameters: {Color? backgroundColor} , defaultValue:none
    Color? backgroundColor,

    /// optionalParameters: {double? elevation} , defaultValue:none
    double? elevation,

    /// optionalParameters: {Color? shadowColor} , defaultValue:none
    Color? shadowColor,

    /// optionalParameters: {Color? surfaceTintColor} , defaultValue:none
    Color? surfaceTintColor,

    /// optionalParameters: {Color? indicatorColor} , defaultValue:none
    Color? indicatorColor,

    /// optionalParameters: {ShapeBorder? indicatorShape} , defaultValue:none
    ShapeBorder? indicatorShape,

    /// optionalParameters: {Size? indicatorSize} , defaultValue:none
    Size? indicatorSize,

    /// optionalParameters: {MaterialStateProperty<TextStyle?>? labelTextStyle} , defaultValue:none
    MaterialStateProperty<TextStyle?>? labelTextStyle,

    /// optionalParameters: {MaterialStateProperty<IconThemeData?>? iconTheme} , defaultValue:none
    MaterialStateProperty<IconThemeData?>? iconTheme,
  }) : super(
          tileHeight: tileHeight,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          indicatorColor: indicatorColor,
          indicatorShape: indicatorShape,
          indicatorSize: indicatorSize,
          labelTextStyle: labelTextStyle,
          iconTheme: iconTheme,
        ) {
    mateCreateName = 'NavigationDrawerThemeData';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => NavigationDrawerThemeData$Mate(
          tileHeight: p.get('tileHeight').build(),
          backgroundColor: p.get('backgroundColor').build(),
          elevation: p.get('elevation').build(),
          shadowColor: p.get('shadowColor').build(),
          surfaceTintColor: p.get('surfaceTintColor').build(),
          indicatorColor: p.get('indicatorColor').build(),
          indicatorShape: p.get('indicatorShape').build(),
          indicatorSize: p.get('indicatorSize').build(),
          labelTextStyle: p.get('labelTextStyle').build(),
          iconTheme: p.get('iconTheme').build(),
        );
    mateUse('tileHeight', tileHeight);
    mateUse('backgroundColor', backgroundColor);
    mateUse('elevation', elevation);
    mateUse('shadowColor', shadowColor);
    mateUse('surfaceTintColor', surfaceTintColor);
    mateUse('indicatorColor', indicatorColor);
    mateUse('indicatorShape', indicatorShape);
    mateUse('indicatorSize', indicatorSize);
    mateUse('labelTextStyle', labelTextStyle);
    mateUse('iconTheme', iconTheme);
  }
}

/// class NavigationDrawerTheme extends InheritedTheme
class NavigationDrawerTheme$Mate extends NavigationDrawerTheme with Mate {
  /// NavigationDrawerTheme NavigationDrawerTheme({Key? key, required NavigationDrawerThemeData data, required Widget child})
  NavigationDrawerTheme$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required NavigationDrawerThemeData data} , defaultValue:none
    required NavigationDrawerThemeData data,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,
  }) : super(
          key: key,
          data: data,
          child: child,
        ) {
    mateCreateName = 'NavigationDrawerTheme';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => NavigationDrawerTheme$Mate(
          key: p.get('key').build(),
          data: p.get('data').build(),
          child: p.get('child').build(),
        );
    mateUse('key', key);
    mateUse('data', data);
    mateUse('child', child);
  }
}
