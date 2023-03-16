// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/material_button.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:ui';
import 'package:flutter/src/foundation/basic_types.dart';
import 'dart:core';
import 'package:flutter/src/services/mouse_cursor.dart';
import 'package:flutter/src/material/button_theme.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter/src/painting/borders.dart';
import 'package:flutter/src/widgets/focus_manager.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note/mate.dart';

/// class MaterialButton extends StatelessWidget
class MaterialButton$Mate extends MaterialButton with WidgetMate<MaterialButton$Mate> {
  /// MaterialButton MaterialButton({Key? key, required void Function()? onPressed, void Function()? onLongPress, void Function(bool)? onHighlightChanged, MouseCursor? mouseCursor, ButtonTextTheme? textTheme, Color? textColor, Color? disabledTextColor, Color? color, Color? disabledColor, Color? focusColor, Color? hoverColor, Color? highlightColor, Color? splashColor, Brightness? colorBrightness, double? elevation, double? focusElevation, double? hoverElevation, double? highlightElevation, double? disabledElevation, EdgeInsetsGeometry? padding, VisualDensity? visualDensity, ShapeBorder? shape, Clip clipBehavior = Clip.none, FocusNode? focusNode, bool autofocus = false, MaterialTapTargetSize? materialTapTargetSize, Duration? animationDuration, double? minWidth, double? height, bool enableFeedback = true, Widget? child})
  MaterialButton$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required void Function()? onPressed} , hasDefaultValue:false, defaultValueCode:null
    required VoidCallback? onPressed,

    /// optionalParameters: {void Function()? onLongPress} , hasDefaultValue:false, defaultValueCode:null
    VoidCallback? onLongPress,

    /// optionalParameters: {void Function(bool)? onHighlightChanged} , hasDefaultValue:false, defaultValueCode:null
    ValueChanged<bool>? onHighlightChanged,

    /// optionalParameters: {MouseCursor? mouseCursor} , hasDefaultValue:false, defaultValueCode:null
    MouseCursor? mouseCursor,

    /// optionalParameters: {ButtonTextTheme? textTheme} , hasDefaultValue:false, defaultValueCode:null
    ButtonTextTheme? textTheme,

    /// optionalParameters: {Color? textColor} , hasDefaultValue:false, defaultValueCode:null
    Color? textColor,

    /// optionalParameters: {Color? disabledTextColor} , hasDefaultValue:false, defaultValueCode:null
    Color? disabledTextColor,

    /// optionalParameters: {Color? color} , hasDefaultValue:false, defaultValueCode:null
    Color? color,

    /// optionalParameters: {Color? disabledColor} , hasDefaultValue:false, defaultValueCode:null
    Color? disabledColor,

    /// optionalParameters: {Color? focusColor} , hasDefaultValue:false, defaultValueCode:null
    Color? focusColor,

    /// optionalParameters: {Color? hoverColor} , hasDefaultValue:false, defaultValueCode:null
    Color? hoverColor,

    /// optionalParameters: {Color? highlightColor} , hasDefaultValue:false, defaultValueCode:null
    Color? highlightColor,

    /// optionalParameters: {Color? splashColor} , hasDefaultValue:false, defaultValueCode:null
    Color? splashColor,

    /// optionalParameters: {Brightness? colorBrightness} , hasDefaultValue:false, defaultValueCode:null
    Brightness? colorBrightness,

    /// optionalParameters: {double? elevation} , hasDefaultValue:false, defaultValueCode:null
    double? elevation,

    /// optionalParameters: {double? focusElevation} , hasDefaultValue:false, defaultValueCode:null
    double? focusElevation,

    /// optionalParameters: {double? hoverElevation} , hasDefaultValue:false, defaultValueCode:null
    double? hoverElevation,

    /// optionalParameters: {double? highlightElevation} , hasDefaultValue:false, defaultValueCode:null
    double? highlightElevation,

    /// optionalParameters: {double? disabledElevation} , hasDefaultValue:false, defaultValueCode:null
    double? disabledElevation,

    /// optionalParameters: {EdgeInsetsGeometry? padding} , hasDefaultValue:false, defaultValueCode:null
    EdgeInsetsGeometry? padding,

    /// optionalParameters: {VisualDensity? visualDensity} , hasDefaultValue:false, defaultValueCode:null
    VisualDensity? visualDensity,

    /// optionalParameters: {ShapeBorder? shape} , hasDefaultValue:false, defaultValueCode:null
    ShapeBorder? shape,

    /// optionalParameters: {Clip clipBehavior = Clip.none} , hasDefaultValue:true, defaultValueCode:Clip.none
    required Clip clipBehavior,

    /// optionalParameters: {FocusNode? focusNode} , hasDefaultValue:false, defaultValueCode:null
    FocusNode? focusNode,

    /// optionalParameters: {bool autofocus = false} , hasDefaultValue:true, defaultValueCode:false
    required bool autofocus,

    /// optionalParameters: {MaterialTapTargetSize? materialTapTargetSize} , hasDefaultValue:false, defaultValueCode:null
    MaterialTapTargetSize? materialTapTargetSize,

    /// optionalParameters: {Duration? animationDuration} , hasDefaultValue:false, defaultValueCode:null
    Duration? animationDuration,

    /// optionalParameters: {double? minWidth} , hasDefaultValue:false, defaultValueCode:null
    double? minWidth,

    /// optionalParameters: {double? height} , hasDefaultValue:false, defaultValueCode:null
    double? height,

    /// optionalParameters: {bool enableFeedback = true} , hasDefaultValue:true, defaultValueCode:true
    required bool enableFeedback,

    /// optionalParameters: {Widget? child} , hasDefaultValue:false, defaultValueCode:null
    Widget? child,
  }) : super(
          key: key,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHighlightChanged: onHighlightChanged,
          mouseCursor: mouseCursor,
          textTheme: textTheme,
          textColor: textColor,
          disabledTextColor: disabledTextColor,
          color: color,
          disabledColor: disabledColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          colorBrightness: colorBrightness,
          elevation: elevation,
          focusElevation: focusElevation,
          hoverElevation: hoverElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          padding: padding,
          visualDensity: visualDensity,
          shape: shape,
          clipBehavior: clipBehavior,
          focusNode: focusNode,
          autofocus: autofocus,
          materialTapTargetSize: materialTapTargetSize,
          animationDuration: animationDuration,
          minWidth: minWidth,
          height: height,
          enableFeedback: enableFeedback,
          child: child,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => MaterialButton$Mate(
        key: p.get('key').value,
        onPressed: p.get('onPressed').value,
        onLongPress: p.get('onLongPress').value,
        onHighlightChanged: p.get('onHighlightChanged').value,
        mouseCursor: p.get('mouseCursor').value,
        textTheme: p.get('textTheme').value,
        textColor: p.get('textColor').value,
        disabledTextColor: p.get('disabledTextColor').value,
        color: p.get('color').value,
        disabledColor: p.get('disabledColor').value,
        focusColor: p.get('focusColor').value,
        hoverColor: p.get('hoverColor').value,
        highlightColor: p.get('highlightColor').value,
        splashColor: p.get('splashColor').value,
        colorBrightness: p.get('colorBrightness').value,
        elevation: p.get('elevation').value,
        focusElevation: p.get('focusElevation').value,
        hoverElevation: p.get('hoverElevation').value,
        highlightElevation: p.get('highlightElevation').value,
        disabledElevation: p.get('disabledElevation').value,
        padding: p.get('padding').value,
        visualDensity: p.get('visualDensity').value,
        shape: p.get('shape').value,
        clipBehavior: p.get('clipBehavior').value,
        focusNode: p.get('focusNode').value,
        autofocus: p.get('autofocus').value,
        materialTapTargetSize: p.get('materialTapTargetSize').value,
        animationDuration: p.get('animationDuration').value,
        minWidth: p.get('minWidth').value,
        height: p.get('height').value,
        enableFeedback: p.get('enableFeedback').value,
        child: p.get('child').value,
      ),
    );
    mateParams.put('key', key);
    mateParams.put('onPressed', onPressed);
    mateParams.put('onLongPress', onLongPress);
    mateParams.put('onHighlightChanged', onHighlightChanged);
    mateParams.put('mouseCursor', mouseCursor);
    mateParams.put('textTheme', textTheme);
    mateParams.put('textColor', textColor);
    mateParams.put('disabledTextColor', disabledTextColor);
    mateParams.put('color', color);
    mateParams.put('disabledColor', disabledColor);
    mateParams.put('focusColor', focusColor);
    mateParams.put('hoverColor', hoverColor);
    mateParams.put('highlightColor', highlightColor);
    mateParams.put('splashColor', splashColor);
    mateParams.put('colorBrightness', colorBrightness);
    mateParams.put('elevation', elevation);
    mateParams.put('focusElevation', focusElevation);
    mateParams.put('hoverElevation', hoverElevation);
    mateParams.put('highlightElevation', highlightElevation);
    mateParams.put('disabledElevation', disabledElevation);
    mateParams.put('padding', padding);
    mateParams.put('visualDensity', visualDensity);
    mateParams.put('shape', shape);
    mateParams.put('clipBehavior', clipBehavior);
    mateParams.put('focusNode', focusNode);
    mateParams.put('autofocus', autofocus);
    mateParams.put('materialTapTargetSize', materialTapTargetSize);
    mateParams.put('animationDuration', animationDuration);
    mateParams.put('minWidth', minWidth);
    mateParams.put('height', height);
    mateParams.put('enableFeedback', enableFeedback);
    mateParams.put('child', child);
  }
}
