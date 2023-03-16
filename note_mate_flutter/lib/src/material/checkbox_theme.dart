// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/checkbox_theme.dart';
import 'package:flutter/src/material/material_state.dart';
import 'package:flutter/src/services/mouse_cursor.dart';
import 'dart:ui';
import 'dart:core';
import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter/src/painting/borders.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

/// class CheckboxThemeData with Diagnosticable
class CheckboxThemeData$Mate extends CheckboxThemeData with Mate<CheckboxThemeData$Mate> {
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
    mateParams = ObjectParam(
      init: this,
      builder: (p) => CheckboxThemeData$Mate(
        mouseCursor: p.get('mouseCursor').value,
        fillColor: p.get('fillColor').value,
        checkColor: p.get('checkColor').value,
        overlayColor: p.get('overlayColor').value,
        splashRadius: p.get('splashRadius').value,
        materialTapTargetSize: p.get('materialTapTargetSize').value,
        visualDensity: p.get('visualDensity').value,
        shape: p.get('shape').value,
        side: p.get('side').value,
      ),
    );
    mateParams.put('mouseCursor', mouseCursor);
    mateParams.put('fillColor', fillColor);
    mateParams.put('checkColor', checkColor);
    mateParams.put('overlayColor', overlayColor);
    mateParams.put('splashRadius', splashRadius);
    mateParams.put('materialTapTargetSize', materialTapTargetSize);
    mateParams.put('visualDensity', visualDensity);
    mateParams.put('shape', shape);
    mateParams.put('side', side);
  }
}

/// class CheckboxTheme extends InheritedWidget
class CheckboxTheme$Mate extends CheckboxTheme with WidgetMate<CheckboxTheme$Mate> {
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
    mateParams = ObjectParam(
      init: this,
      builder: (p) => CheckboxTheme$Mate(
        key: p.get('key').value,
        data: p.get('data').value,
        child: p.get('child').value,
      ),
    );
    mateParams.put('key', key);
    mateParams.put('data', data);
    mateParams.put('child', child);
  }
}
