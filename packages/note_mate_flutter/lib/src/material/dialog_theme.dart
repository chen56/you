// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/dialog_theme.dart';
import 'package:note/mate.dart';
import 'dart:ui';
import 'dart:core';
import 'package:flutter/src/painting/borders.dart';
import 'package:flutter/src/painting/alignment.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter/src/painting/edge_insets.dart';

/// class DialogTheme with Diagnosticable
class DialogTheme$Mate extends DialogTheme with Mate {
  /// DialogTheme DialogTheme({Color? backgroundColor, double? elevation, Color? shadowColor, Color? surfaceTintColor, ShapeBorder? shape, AlignmentGeometry? alignment, Color? iconColor, TextStyle? titleTextStyle, TextStyle? contentTextStyle, EdgeInsetsGeometry? actionsPadding})
  DialogTheme$Mate({
    /// optionalParameters: {Color? backgroundColor} , defaultValue:none
    Color? backgroundColor,

    /// optionalParameters: {double? elevation} , defaultValue:none
    double? elevation,

    /// optionalParameters: {Color? shadowColor} , defaultValue:none
    Color? shadowColor,

    /// optionalParameters: {Color? surfaceTintColor} , defaultValue:none
    Color? surfaceTintColor,

    /// optionalParameters: {ShapeBorder? shape} , defaultValue:none
    ShapeBorder? shape,

    /// optionalParameters: {AlignmentGeometry? alignment} , defaultValue:none
    AlignmentGeometry? alignment,

    /// optionalParameters: {Color? iconColor} , defaultValue:none
    Color? iconColor,

    /// optionalParameters: {TextStyle? titleTextStyle} , defaultValue:none
    TextStyle? titleTextStyle,

    /// optionalParameters: {TextStyle? contentTextStyle} , defaultValue:none
    TextStyle? contentTextStyle,

    /// optionalParameters: {EdgeInsetsGeometry? actionsPadding} , defaultValue:none
    EdgeInsetsGeometry? actionsPadding,
  }) : super(
          backgroundColor: backgroundColor,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          shape: shape,
          alignment: alignment,
          iconColor: iconColor,
          titleTextStyle: titleTextStyle,
          contentTextStyle: contentTextStyle,
          actionsPadding: actionsPadding,
        ) {
    mateCreateName = 'DialogTheme';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => DialogTheme$Mate(
          backgroundColor: p.get('backgroundColor').build(),
          elevation: p.get('elevation').build(),
          shadowColor: p.get('shadowColor').build(),
          surfaceTintColor: p.get('surfaceTintColor').build(),
          shape: p.get('shape').build(),
          alignment: p.get('alignment').build(),
          iconColor: p.get('iconColor').build(),
          titleTextStyle: p.get('titleTextStyle').build(),
          contentTextStyle: p.get('contentTextStyle').build(),
          actionsPadding: p.get('actionsPadding').build(),
        );
    mateUse('backgroundColor', backgroundColor, isNamed: true);
    mateUse('elevation', elevation, isNamed: true);
    mateUse('shadowColor', shadowColor, isNamed: true);
    mateUse('surfaceTintColor', surfaceTintColor, isNamed: true);
    mateUse('shape', shape, isNamed: true);
    mateUse('alignment', alignment, isNamed: true);
    mateUse('iconColor', iconColor, isNamed: true);
    mateUse('titleTextStyle', titleTextStyle, isNamed: true);
    mateUse('contentTextStyle', contentTextStyle, isNamed: true);
    mateUse('actionsPadding', actionsPadding, isNamed: true);
  }
}
