// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/elevated_button_theme.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/material/button_style.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

/// class ElevatedButtonThemeData with Diagnosticable
class ElevatedButtonThemeData$Mate extends ElevatedButtonThemeData with Mate {
  /// ElevatedButtonThemeData ElevatedButtonThemeData({ButtonStyle? style})
  ElevatedButtonThemeData$Mate(
      {
      /// optionalParameters: {ButtonStyle? style} , defaultValue:none
      ButtonStyle? style})
      : super(style: style) {
    mateCreateName = 'ElevatedButtonThemeData';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => ElevatedButtonThemeData$Mate(style: p.get('style').build());
    mateUse('style', style);
  }
}

/// class ElevatedButtonTheme extends InheritedTheme
class ElevatedButtonTheme$Mate extends ElevatedButtonTheme with Mate {
  /// ElevatedButtonTheme ElevatedButtonTheme({Key? key, required ElevatedButtonThemeData data, required Widget child})
  ElevatedButtonTheme$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required ElevatedButtonThemeData data} , defaultValue:none
    required ElevatedButtonThemeData data,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,
  }) : super(
          key: key,
          data: data,
          child: child,
        ) {
    mateCreateName = 'ElevatedButtonTheme';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => ElevatedButtonTheme$Mate(
          key: p.get('key').build(),
          data: p.get('data').build(),
          child: p.get('child').build(),
        );
    mateUse('key', key);
    mateUse('data', data);
    mateUse('child', child);
  }
}
