// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/toggle_buttons.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:core';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/services/mouse_cursor.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter/src/rendering/box.dart';
import 'dart:ui';
import 'package:flutter/src/widgets/focus_manager.dart';
import 'package:flutter/src/painting/border_radius.dart';
import 'package:flutter/src/painting/basic_types.dart';
import 'package:note/mate.dart';

/// class ToggleButtons extends StatelessWidget
class ToggleButtons$Mate extends ToggleButtons with WidgetMate<ToggleButtons$Mate> {
  /// ToggleButtons ToggleButtons({Key? key, required List<Widget> children, required List<bool> isSelected, void Function(int)? onPressed, MouseCursor? mouseCursor, MaterialTapTargetSize? tapTargetSize, TextStyle? textStyle, BoxConstraints? constraints, Color? color, Color? selectedColor, Color? disabledColor, Color? fillColor, Color? focusColor, Color? highlightColor, Color? hoverColor, Color? splashColor, List<FocusNode>? focusNodes, bool renderBorder = true, Color? borderColor, Color? selectedBorderColor, Color? disabledBorderColor, BorderRadius? borderRadius, double? borderWidth, Axis direction = Axis.horizontal, VerticalDirection verticalDirection = VerticalDirection.down})
  ToggleButtons$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required List<Widget> children} , hasDefaultValue:false, defaultValueCode:null
    required List<Widget> children,

    /// optionalParameters: {required List<bool> isSelected} , hasDefaultValue:false, defaultValueCode:null
    required List<bool> isSelected,

    /// optionalParameters: {void Function(int)? onPressed} , hasDefaultValue:false, defaultValueCode:null
    void Function(int)? onPressed,

    /// optionalParameters: {MouseCursor? mouseCursor} , hasDefaultValue:false, defaultValueCode:null
    MouseCursor? mouseCursor,

    /// optionalParameters: {MaterialTapTargetSize? tapTargetSize} , hasDefaultValue:false, defaultValueCode:null
    MaterialTapTargetSize? tapTargetSize,

    /// optionalParameters: {TextStyle? textStyle} , hasDefaultValue:false, defaultValueCode:null
    TextStyle? textStyle,

    /// optionalParameters: {BoxConstraints? constraints} , hasDefaultValue:false, defaultValueCode:null
    BoxConstraints? constraints,

    /// optionalParameters: {Color? color} , hasDefaultValue:false, defaultValueCode:null
    Color? color,

    /// optionalParameters: {Color? selectedColor} , hasDefaultValue:false, defaultValueCode:null
    Color? selectedColor,

    /// optionalParameters: {Color? disabledColor} , hasDefaultValue:false, defaultValueCode:null
    Color? disabledColor,

    /// optionalParameters: {Color? fillColor} , hasDefaultValue:false, defaultValueCode:null
    Color? fillColor,

    /// optionalParameters: {Color? focusColor} , hasDefaultValue:false, defaultValueCode:null
    Color? focusColor,

    /// optionalParameters: {Color? highlightColor} , hasDefaultValue:false, defaultValueCode:null
    Color? highlightColor,

    /// optionalParameters: {Color? hoverColor} , hasDefaultValue:false, defaultValueCode:null
    Color? hoverColor,

    /// optionalParameters: {Color? splashColor} , hasDefaultValue:false, defaultValueCode:null
    Color? splashColor,

    /// optionalParameters: {List<FocusNode>? focusNodes} , hasDefaultValue:false, defaultValueCode:null
    List<FocusNode>? focusNodes,

    /// optionalParameters: {bool renderBorder = true} , hasDefaultValue:true, defaultValueCode:true
    required bool renderBorder,

    /// optionalParameters: {Color? borderColor} , hasDefaultValue:false, defaultValueCode:null
    Color? borderColor,

    /// optionalParameters: {Color? selectedBorderColor} , hasDefaultValue:false, defaultValueCode:null
    Color? selectedBorderColor,

    /// optionalParameters: {Color? disabledBorderColor} , hasDefaultValue:false, defaultValueCode:null
    Color? disabledBorderColor,

    /// optionalParameters: {BorderRadius? borderRadius} , hasDefaultValue:false, defaultValueCode:null
    BorderRadius? borderRadius,

    /// optionalParameters: {double? borderWidth} , hasDefaultValue:false, defaultValueCode:null
    double? borderWidth,

    /// optionalParameters: {Axis direction = Axis.horizontal} , hasDefaultValue:true, defaultValueCode:Axis.horizontal
    required Axis direction,

    /// optionalParameters: {VerticalDirection verticalDirection = VerticalDirection.down} , hasDefaultValue:true, defaultValueCode:VerticalDirection.down
    required VerticalDirection verticalDirection,
  }) : super(
          key: key,
          children: children,
          isSelected: isSelected,
          onPressed: onPressed,
          mouseCursor: mouseCursor,
          tapTargetSize: tapTargetSize,
          textStyle: textStyle,
          constraints: constraints,
          color: color,
          selectedColor: selectedColor,
          disabledColor: disabledColor,
          fillColor: fillColor,
          focusColor: focusColor,
          highlightColor: highlightColor,
          hoverColor: hoverColor,
          splashColor: splashColor,
          focusNodes: focusNodes,
          renderBorder: renderBorder,
          borderColor: borderColor,
          selectedBorderColor: selectedBorderColor,
          disabledBorderColor: disabledBorderColor,
          borderRadius: borderRadius,
          borderWidth: borderWidth,
          direction: direction,
          verticalDirection: verticalDirection,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ToggleButtons$Mate(
        key: p.getValue('key'),
        children: p.getValue('children'),
        isSelected: p.getValue('isSelected'),
        onPressed: p.getValue('onPressed'),
        mouseCursor: p.getValue('mouseCursor'),
        tapTargetSize: p.getValue('tapTargetSize'),
        textStyle: p.getValue('textStyle'),
        constraints: p.getValue('constraints'),
        color: p.getValue('color'),
        selectedColor: p.getValue('selectedColor'),
        disabledColor: p.getValue('disabledColor'),
        fillColor: p.getValue('fillColor'),
        focusColor: p.getValue('focusColor'),
        highlightColor: p.getValue('highlightColor'),
        hoverColor: p.getValue('hoverColor'),
        splashColor: p.getValue('splashColor'),
        focusNodes: p.getValue('focusNodes'),
        renderBorder: p.getValue('renderBorder'),
        borderColor: p.getValue('borderColor'),
        selectedBorderColor: p.getValue('selectedBorderColor'),
        disabledBorderColor: p.getValue('disabledBorderColor'),
        borderRadius: p.getValue('borderRadius'),
        borderWidth: p.getValue('borderWidth'),
        direction: p.getValue('direction'),
        verticalDirection: p.getValue('verticalDirection'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'children', init: children);
    mateParams.set(name: 'isSelected', init: isSelected);
    mateParams.set(name: 'onPressed', init: onPressed);
    mateParams.set(name: 'mouseCursor', init: mouseCursor);
    mateParams.set(name: 'tapTargetSize', init: tapTargetSize);
    mateParams.set(name: 'textStyle', init: textStyle);
    mateParams.set(name: 'constraints', init: constraints);
    mateParams.set(name: 'color', init: color);
    mateParams.set(name: 'selectedColor', init: selectedColor);
    mateParams.set(name: 'disabledColor', init: disabledColor);
    mateParams.set(name: 'fillColor', init: fillColor);
    mateParams.set(name: 'focusColor', init: focusColor);
    mateParams.set(name: 'highlightColor', init: highlightColor);
    mateParams.set(name: 'hoverColor', init: hoverColor);
    mateParams.set(name: 'splashColor', init: splashColor);
    mateParams.set(name: 'focusNodes', init: focusNodes);
    mateParams.set(name: 'renderBorder', init: renderBorder);
    mateParams.set(name: 'borderColor', init: borderColor);
    mateParams.set(name: 'selectedBorderColor', init: selectedBorderColor);
    mateParams.set(name: 'disabledBorderColor', init: disabledBorderColor);
    mateParams.set(name: 'borderRadius', init: borderRadius);
    mateParams.set(name: 'borderWidth', init: borderWidth);
    mateParams.set(name: 'direction', init: direction);
    mateParams.set(name: 'verticalDirection', init: verticalDirection);
  }
}
