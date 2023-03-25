// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/checkbox_theme.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/material/material_state.dart';
import 'package:flutter/src/services/mouse_cursor.dart';
import 'dart:ui';
import 'dart:core';
import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter/src/painting/borders.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

/// class CheckboxThemeData with Diagnosticable
class CheckboxThemeData$Mate extends CheckboxThemeData with Mate {
  /// CheckboxThemeData CheckboxThemeData({MaterialStateProperty<MouseCursor?>? mouseCursor, MaterialStateProperty<Color?>? fillColor, MaterialStateProperty<Color?>? checkColor, MaterialStateProperty<Color?>? overlayColor, double? splashRadius, MaterialTapTargetSize? materialTapTargetSize, VisualDensity? visualDensity, OutlinedBorder? shape, BorderSide? side})
  CheckboxThemeData$Mate({
    /// optionalParameters: {MaterialStateProperty<MouseCursor?>? mouseCursor} , hasDefaultValue:false, defaultValueCode:null
    MaterialStateProperty<MouseCursor?>? mouseCursor,

    /// optionalParameters: {MaterialStateProperty<Color?>? fillColor} , hasDefaultValue:false, defaultValueCode:null
    MaterialStateProperty<Color?>? fillColor,

    /// optionalParameters: {MaterialStateProperty<Color?>? checkColor} , hasDefaultValue:false, defaultValueCode:null
    MaterialStateProperty<Color?>? checkColor,

    /// optionalParameters: {MaterialStateProperty<Color?>? overlayColor} , hasDefaultValue:false, defaultValueCode:null
    MaterialStateProperty<Color?>? overlayColor,

    /// optionalParameters: {double? splashRadius} , hasDefaultValue:false, defaultValueCode:null
    double? splashRadius,

    /// optionalParameters: {MaterialTapTargetSize? materialTapTargetSize} , hasDefaultValue:false, defaultValueCode:null
    MaterialTapTargetSize? materialTapTargetSize,

    /// optionalParameters: {VisualDensity? visualDensity} , hasDefaultValue:false, defaultValueCode:null
    VisualDensity? visualDensity,

    /// optionalParameters: {OutlinedBorder? shape} , hasDefaultValue:false, defaultValueCode:null
    OutlinedBorder? shape,

    /// optionalParameters: {BorderSide? side} , hasDefaultValue:false, defaultValueCode:null
    BorderSide? side,
  }) : super(
          mouseCursor: mouseCursor,
          fillColor: fillColor,
          checkColor: checkColor,
          overlayColor: overlayColor,
          splashRadius: splashRadius,
          materialTapTargetSize: materialTapTargetSize,
          visualDensity: visualDensity,
          shape: shape,
          side: side,
        ) {
    mateBuilder = (p) => CheckboxThemeData$Mate(
          mouseCursor: p.get('mouseCursor').build(),
          fillColor: p.get('fillColor').build(),
          checkColor: p.get('checkColor').build(),
          overlayColor: p.get('overlayColor').build(),
          splashRadius: p.get('splashRadius').build(),
          materialTapTargetSize: p.get('materialTapTargetSize').build(),
          visualDensity: p.get('visualDensity').build(),
          shape: p.get('shape').build(),
          side: p.get('side').build(),
        );
    matePut('mouseCursor', mouseCursor);
    matePut('fillColor', fillColor);
    matePut('checkColor', checkColor);
    matePut('overlayColor', overlayColor);
    matePut('splashRadius', splashRadius);
    matePut('materialTapTargetSize', materialTapTargetSize);
    matePut('visualDensity', visualDensity);
    matePut('shape', shape);
    matePut('side', side);
  }
}

/// class CheckboxTheme extends InheritedWidget
class CheckboxTheme$Mate extends CheckboxTheme with Mate {
  /// CheckboxTheme CheckboxTheme({Key? key, required CheckboxThemeData data, required Widget child})
  CheckboxTheme$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required CheckboxThemeData data} , hasDefaultValue:false, defaultValueCode:null
    required CheckboxThemeData data,

    /// optionalParameters: {required Widget child} , hasDefaultValue:false, defaultValueCode:null
    required Widget child,
  }) : super(
          key: key,
          data: data,
          child: child,
        ) {
    mateBuilder = (p) => CheckboxTheme$Mate(
          key: p.get('key').build(),
          data: p.get('data').build(),
          child: p.get('child').build(),
        );
    matePut('key', key);
    matePut('data', data);
    matePut('child', child);
  }
}