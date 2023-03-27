// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/checkbox.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:core';
import 'package:flutter/src/foundation/basic_types.dart';
import 'package:flutter/src/services/mouse_cursor.dart';
import 'dart:ui';
import 'package:flutter/src/material/material_state.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter/src/widgets/focus_manager.dart';
import 'package:flutter/src/painting/borders.dart';

/// class Checkbox extends StatefulWidget
class Checkbox$Mate extends Checkbox with Mate {
  /// Checkbox Checkbox({Key? key, required bool? value, bool tristate = false, required void Function(bool?)? onChanged, MouseCursor? mouseCursor, Color? activeColor, MaterialStateProperty<Color?>? fillColor, Color? checkColor, Color? focusColor, Color? hoverColor, MaterialStateProperty<Color?>? overlayColor, double? splashRadius, MaterialTapTargetSize? materialTapTargetSize, VisualDensity? visualDensity, FocusNode? focusNode, bool autofocus = false, OutlinedBorder? shape, BorderSide? side, bool isError = false})
  Checkbox$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required bool? value} , defaultValue:none
    required bool? value,

    /// optionalParameters: {bool tristate = false} , defaultValue:Literal
    bool tristate = false,

    /// optionalParameters: {required void Function(bool?)? onChanged} , defaultValue:none
    required ValueChanged<bool?>? onChanged,

    /// optionalParameters: {MouseCursor? mouseCursor} , defaultValue:none
    MouseCursor? mouseCursor,

    /// optionalParameters: {Color? activeColor} , defaultValue:none
    Color? activeColor,

    /// optionalParameters: {MaterialStateProperty<Color?>? fillColor} , defaultValue:none
    MaterialStateProperty<Color?>? fillColor,

    /// optionalParameters: {Color? checkColor} , defaultValue:none
    Color? checkColor,

    /// optionalParameters: {Color? focusColor} , defaultValue:none
    Color? focusColor,

    /// optionalParameters: {Color? hoverColor} , defaultValue:none
    Color? hoverColor,

    /// optionalParameters: {MaterialStateProperty<Color?>? overlayColor} , defaultValue:none
    MaterialStateProperty<Color?>? overlayColor,

    /// optionalParameters: {double? splashRadius} , defaultValue:none
    double? splashRadius,

    /// optionalParameters: {MaterialTapTargetSize? materialTapTargetSize} , defaultValue:none
    MaterialTapTargetSize? materialTapTargetSize,

    /// optionalParameters: {VisualDensity? visualDensity} , defaultValue:none
    VisualDensity? visualDensity,

    /// optionalParameters: {FocusNode? focusNode} , defaultValue:none
    FocusNode? focusNode,

    /// optionalParameters: {bool autofocus = false} , defaultValue:Literal
    bool autofocus = false,

    /// optionalParameters: {OutlinedBorder? shape} , defaultValue:none
    OutlinedBorder? shape,

    /// optionalParameters: {BorderSide? side} , defaultValue:none
    BorderSide? side,

    /// optionalParameters: {bool isError = false} , defaultValue:Literal
    bool isError = false,
  }) : super(
          key: key,
          value: value,
          tristate: tristate,
          onChanged: onChanged,
          mouseCursor: mouseCursor,
          activeColor: activeColor,
          fillColor: fillColor,
          checkColor: checkColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          overlayColor: overlayColor,
          splashRadius: splashRadius,
          materialTapTargetSize: materialTapTargetSize,
          visualDensity: visualDensity,
          focusNode: focusNode,
          autofocus: autofocus,
          shape: shape,
          side: side,
          isError: isError,
        ) {
    mateCreateName = 'Checkbox';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => Checkbox$Mate(
          key: p.get('key').build(),
          value: p.get('value').build(),
          tristate: p.get('tristate').build(),
          onChanged: p.get('onChanged').build(),
          mouseCursor: p.get('mouseCursor').build(),
          activeColor: p.get('activeColor').build(),
          fillColor: p.get('fillColor').build(),
          checkColor: p.get('checkColor').build(),
          focusColor: p.get('focusColor').build(),
          hoverColor: p.get('hoverColor').build(),
          overlayColor: p.get('overlayColor').build(),
          splashRadius: p.get('splashRadius').build(),
          materialTapTargetSize: p.get('materialTapTargetSize').build(),
          visualDensity: p.get('visualDensity').build(),
          focusNode: p.get('focusNode').build(),
          autofocus: p.get('autofocus').build(),
          shape: p.get('shape').build(),
          side: p.get('side').build(),
          isError: p.get('isError').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('value', value, isNamed: true);
    mateUse('tristate', tristate, isNamed: true);
    mateUse('onChanged', onChanged, isNamed: true);
    mateUse('mouseCursor', mouseCursor, isNamed: true);
    mateUse('activeColor', activeColor, isNamed: true);
    mateUse('fillColor', fillColor, isNamed: true);
    mateUse('checkColor', checkColor, isNamed: true);
    mateUse('focusColor', focusColor, isNamed: true);
    mateUse('hoverColor', hoverColor, isNamed: true);
    mateUse('overlayColor', overlayColor, isNamed: true);
    mateUse('splashRadius', splashRadius, isNamed: true);
    mateUse('materialTapTargetSize', materialTapTargetSize, isNamed: true);
    mateUse('visualDensity', visualDensity, isNamed: true);
    mateUse('focusNode', focusNode, isNamed: true);
    mateUse('autofocus', autofocus, isNamed: true);
    mateUse('shape', shape, isNamed: true);
    mateUse('side', side, isNamed: true);
    mateUse('isError', isError, isNamed: true);
  }
}
