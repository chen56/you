// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/banner_theme.dart';
import 'package:note/mate.dart';
import 'dart:ui';
import 'package:flutter/src/painting/text_style.dart';
import 'dart:core';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

/// class MaterialBannerThemeData with Diagnosticable
class MaterialBannerThemeData$Mate extends MaterialBannerThemeData with Mate {
  /// MaterialBannerThemeData MaterialBannerThemeData({Color? backgroundColor, Color? surfaceTintColor, Color? shadowColor, Color? dividerColor, TextStyle? contentTextStyle, double? elevation, EdgeInsetsGeometry? padding, EdgeInsetsGeometry? leadingPadding})
  MaterialBannerThemeData$Mate({
    /// optionalParameters: {Color? backgroundColor} , defaultValue:none
    Color? backgroundColor,

    /// optionalParameters: {Color? surfaceTintColor} , defaultValue:none
    Color? surfaceTintColor,

    /// optionalParameters: {Color? shadowColor} , defaultValue:none
    Color? shadowColor,

    /// optionalParameters: {Color? dividerColor} , defaultValue:none
    Color? dividerColor,

    /// optionalParameters: {TextStyle? contentTextStyle} , defaultValue:none
    TextStyle? contentTextStyle,

    /// optionalParameters: {double? elevation} , defaultValue:none
    double? elevation,

    /// optionalParameters: {EdgeInsetsGeometry? padding} , defaultValue:none
    EdgeInsetsGeometry? padding,

    /// optionalParameters: {EdgeInsetsGeometry? leadingPadding} , defaultValue:none
    EdgeInsetsGeometry? leadingPadding,
  }) : super(
          backgroundColor: backgroundColor,
          surfaceTintColor: surfaceTintColor,
          shadowColor: shadowColor,
          dividerColor: dividerColor,
          contentTextStyle: contentTextStyle,
          elevation: elevation,
          padding: padding,
          leadingPadding: leadingPadding,
        ) {
    mateCreateName = 'MaterialBannerThemeData';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => MaterialBannerThemeData$Mate(
          backgroundColor: p.get('backgroundColor').build(),
          surfaceTintColor: p.get('surfaceTintColor').build(),
          shadowColor: p.get('shadowColor').build(),
          dividerColor: p.get('dividerColor').build(),
          contentTextStyle: p.get('contentTextStyle').build(),
          elevation: p.get('elevation').build(),
          padding: p.get('padding').build(),
          leadingPadding: p.get('leadingPadding').build(),
        );
    mateUse('backgroundColor', backgroundColor);
    mateUse('surfaceTintColor', surfaceTintColor);
    mateUse('shadowColor', shadowColor);
    mateUse('dividerColor', dividerColor);
    mateUse('contentTextStyle', contentTextStyle);
    mateUse('elevation', elevation);
    mateUse('padding', padding);
    mateUse('leadingPadding', leadingPadding);
  }
}

/// class MaterialBannerTheme extends InheritedTheme
class MaterialBannerTheme$Mate extends MaterialBannerTheme with Mate {
  /// MaterialBannerTheme MaterialBannerTheme({Key? key, MaterialBannerThemeData? data, required Widget child})
  MaterialBannerTheme$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {MaterialBannerThemeData? data} , defaultValue:none
    MaterialBannerThemeData? data,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,
  }) : super(
          key: key,
          data: data,
          child: child,
        ) {
    mateCreateName = 'MaterialBannerTheme';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => MaterialBannerTheme$Mate(
          key: p.get('key').build(),
          data: p.get('data').build(),
          child: p.get('child').build(),
        );
    mateUse('key', key);
    mateUse('data', data);
    mateUse('child', child);
  }
}
