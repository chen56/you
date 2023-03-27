// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/divider_theme.dart';
import 'package:note/mate.dart';
import 'dart:ui';
import 'dart:core';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

/// class DividerThemeData with Diagnosticable
class DividerThemeData$Mate extends DividerThemeData with Mate {
  /// DividerThemeData DividerThemeData({Color? color, double? space, double? thickness, double? indent, double? endIndent})
  DividerThemeData$Mate({
    /// optionalParameters: {Color? color} , defaultValue:none
    Color? color,

    /// optionalParameters: {double? space} , defaultValue:none
    double? space,

    /// optionalParameters: {double? thickness} , defaultValue:none
    double? thickness,

    /// optionalParameters: {double? indent} , defaultValue:none
    double? indent,

    /// optionalParameters: {double? endIndent} , defaultValue:none
    double? endIndent,
  }) : super(
          color: color,
          space: space,
          thickness: thickness,
          indent: indent,
          endIndent: endIndent,
        ) {
    mateCreateName = 'DividerThemeData';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => DividerThemeData$Mate(
          color: p.get('color').build(),
          space: p.get('space').build(),
          thickness: p.get('thickness').build(),
          indent: p.get('indent').build(),
          endIndent: p.get('endIndent').build(),
        );
    mateUse('color', color, isNamed: true);
    mateUse('space', space, isNamed: true);
    mateUse('thickness', thickness, isNamed: true);
    mateUse('indent', indent, isNamed: true);
    mateUse('endIndent', endIndent, isNamed: true);
  }
}

/// class DividerTheme extends InheritedTheme
class DividerTheme$Mate extends DividerTheme with Mate {
  /// DividerTheme DividerTheme({Key? key, required DividerThemeData data, required Widget child})
  DividerTheme$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required DividerThemeData data} , defaultValue:none
    required DividerThemeData data,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,
  }) : super(
          key: key,
          data: data,
          child: child,
        ) {
    mateCreateName = 'DividerTheme';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => DividerTheme$Mate(
          key: p.get('key').build(),
          data: p.get('data').build(),
          child: p.get('child').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('data', data, isNamed: true);
    mateUse('child', child, isNamed: true);
  }
}
