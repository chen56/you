// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/button.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:ui';
import 'package:flutter/src/foundation/basic_types.dart';
import 'dart:core';
import 'package:flutter/src/services/mouse_cursor.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:flutter/src/painting/borders.dart';
import 'package:flutter/src/widgets/focus_manager.dart';
import 'package:flutter/src/widgets/framework.dart';

/// class RawMaterialButton extends StatefulWidget
class RawMaterialButton$Mate extends RawMaterialButton with Mate {
  /// RawMaterialButton RawMaterialButton({Key? key, required void Function()? onPressed, void Function()? onLongPress, void Function(bool)? onHighlightChanged, MouseCursor? mouseCursor, TextStyle? textStyle, Color? fillColor, Color? focusColor, Color? hoverColor, Color? highlightColor, Color? splashColor, double elevation = 2.0, double focusElevation = 4.0, double hoverElevation = 4.0, double highlightElevation = 8.0, double disabledElevation = 0.0, EdgeInsetsGeometry padding = EdgeInsets.zero, VisualDensity visualDensity = VisualDensity.standard, BoxConstraints constraints = const BoxConstraints(minWidth: 88.0, minHeight: 36.0), ShapeBorder shape = const RoundedRectangleBorder(), Duration animationDuration = kThemeChangeDuration, Clip clipBehavior = Clip.none, FocusNode? focusNode, bool autofocus = false, MaterialTapTargetSize? materialTapTargetSize, Widget? child, bool enableFeedback = true})
  RawMaterialButton$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required void Function()? onPressed} , defaultValue:none
    required VoidCallback? onPressed,

    /// optionalParameters: {void Function()? onLongPress} , defaultValue:none
    VoidCallback? onLongPress,

    /// optionalParameters: {void Function(bool)? onHighlightChanged} , defaultValue:none
    ValueChanged<bool>? onHighlightChanged,

    /// optionalParameters: {MouseCursor? mouseCursor} , defaultValue:none
    MouseCursor? mouseCursor,

    /// optionalParameters: {TextStyle? textStyle} , defaultValue:none
    TextStyle? textStyle,

    /// optionalParameters: {Color? fillColor} , defaultValue:none
    Color? fillColor,

    /// optionalParameters: {Color? focusColor} , defaultValue:none
    Color? focusColor,

    /// optionalParameters: {Color? hoverColor} , defaultValue:none
    Color? hoverColor,

    /// optionalParameters: {Color? highlightColor} , defaultValue:none
    Color? highlightColor,

    /// optionalParameters: {Color? splashColor} , defaultValue:none
    Color? splashColor,

    /// optionalParameters: {double elevation = 2.0} , defaultValue:Literal
    double elevation = 2.0,

    /// optionalParameters: {double focusElevation = 4.0} , defaultValue:Literal
    double focusElevation = 4.0,

    /// optionalParameters: {double hoverElevation = 4.0} , defaultValue:Literal
    double hoverElevation = 4.0,

    /// optionalParameters: {double highlightElevation = 8.0} , defaultValue:Literal
    double highlightElevation = 8.0,

    /// optionalParameters: {double disabledElevation = 0.0} , defaultValue:Literal
    double disabledElevation = 0.0,

    /// optionalParameters: {EdgeInsetsGeometry padding = EdgeInsets.zero} , defaultValue:PrefixedIdentifier
    EdgeInsetsGeometry padding = EdgeInsets.zero,

    /// optionalParameters: {VisualDensity visualDensity = VisualDensity.standard} , defaultValue:PrefixedIdentifier
    VisualDensity visualDensity = VisualDensity.standard,

    /// optionalParameters: {BoxConstraints constraints = const BoxConstraints(minWidth: 88.0, minHeight: 36.0)} , defaultValue:unprocessed
    required BoxConstraints constraints,

    /// optionalParameters: {ShapeBorder shape = const RoundedRectangleBorder()} , defaultValue:unprocessed
    required ShapeBorder shape,

    /// optionalParameters: {Duration animationDuration = kThemeChangeDuration} , defaultValue:unprocessed
    required Duration animationDuration,

    /// optionalParameters: {Clip clipBehavior = Clip.none} , defaultValue:PrefixedIdentifier
    Clip clipBehavior = Clip.none,

    /// optionalParameters: {FocusNode? focusNode} , defaultValue:none
    FocusNode? focusNode,

    /// optionalParameters: {bool autofocus = false} , defaultValue:Literal
    bool autofocus = false,

    /// optionalParameters: {MaterialTapTargetSize? materialTapTargetSize} , defaultValue:none
    MaterialTapTargetSize? materialTapTargetSize,

    /// optionalParameters: {Widget? child} , defaultValue:none
    Widget? child,

    /// optionalParameters: {bool enableFeedback = true} , defaultValue:Literal
    bool enableFeedback = true,
  }) : super(
          key: key,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHighlightChanged: onHighlightChanged,
          mouseCursor: mouseCursor,
          textStyle: textStyle,
          fillColor: fillColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          elevation: elevation,
          focusElevation: focusElevation,
          hoverElevation: hoverElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          padding: padding,
          visualDensity: visualDensity,
          constraints: constraints,
          shape: shape,
          animationDuration: animationDuration,
          clipBehavior: clipBehavior,
          focusNode: focusNode,
          autofocus: autofocus,
          materialTapTargetSize: materialTapTargetSize,
          child: child,
          enableFeedback: enableFeedback,
        ) {
    mateCreateName = 'RawMaterialButton';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => RawMaterialButton$Mate(
          key: p.get('key').build(),
          onPressed: p.get('onPressed').build(),
          onLongPress: p.get('onLongPress').build(),
          onHighlightChanged: p.get('onHighlightChanged').build(),
          mouseCursor: p.get('mouseCursor').build(),
          textStyle: p.get('textStyle').build(),
          fillColor: p.get('fillColor').build(),
          focusColor: p.get('focusColor').build(),
          hoverColor: p.get('hoverColor').build(),
          highlightColor: p.get('highlightColor').build(),
          splashColor: p.get('splashColor').build(),
          elevation: p.get('elevation').build(),
          focusElevation: p.get('focusElevation').build(),
          hoverElevation: p.get('hoverElevation').build(),
          highlightElevation: p.get('highlightElevation').build(),
          disabledElevation: p.get('disabledElevation').build(),
          padding: p.get('padding').build(),
          visualDensity: p.get('visualDensity').build(),
          constraints: p.get('constraints').build(),
          shape: p.get('shape').build(),
          animationDuration: p.get('animationDuration').build(),
          clipBehavior: p.get('clipBehavior').build(),
          focusNode: p.get('focusNode').build(),
          autofocus: p.get('autofocus').build(),
          materialTapTargetSize: p.get('materialTapTargetSize').build(),
          child: p.get('child').build(),
          enableFeedback: p.get('enableFeedback').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('onPressed', onPressed, isNamed: true);
    mateUse('onLongPress', onLongPress, isNamed: true);
    mateUse('onHighlightChanged', onHighlightChanged, isNamed: true);
    mateUse('mouseCursor', mouseCursor, isNamed: true);
    mateUse('textStyle', textStyle, isNamed: true);
    mateUse('fillColor', fillColor, isNamed: true);
    mateUse('focusColor', focusColor, isNamed: true);
    mateUse('hoverColor', hoverColor, isNamed: true);
    mateUse('highlightColor', highlightColor, isNamed: true);
    mateUse('splashColor', splashColor, isNamed: true);
    mateUse('elevation', elevation, isNamed: true);
    mateUse('focusElevation', focusElevation, isNamed: true);
    mateUse('hoverElevation', hoverElevation, isNamed: true);
    mateUse('highlightElevation', highlightElevation, isNamed: true);
    mateUse('disabledElevation', disabledElevation, isNamed: true);
    mateUse('padding', padding, isNamed: true);
    mateUse('visualDensity', visualDensity, isNamed: true);
    mateUse('constraints', constraints, isNamed: true);
    mateUse('shape', shape, isNamed: true);
    mateUse('animationDuration', animationDuration, isNamed: true);
    mateUse('clipBehavior', clipBehavior, isNamed: true);
    mateUse('focusNode', focusNode, isNamed: true);
    mateUse('autofocus', autofocus, isNamed: true);
    mateUse('materialTapTargetSize', materialTapTargetSize, isNamed: true);
    mateUse('child', child, isNamed: true);
    mateUse('enableFeedback', enableFeedback, isNamed: true);
  }
}
