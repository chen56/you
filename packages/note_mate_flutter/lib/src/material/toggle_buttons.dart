// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/toggle_buttons.dart';
import 'package:note/mate.dart';
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

/// class ToggleButtons extends StatelessWidget
class ToggleButtons$Mate extends ToggleButtons with Mate {
  /// ToggleButtons ToggleButtons({Key? key, required List<Widget> children, required List<bool> isSelected, void Function(int)? onPressed, MouseCursor? mouseCursor, MaterialTapTargetSize? tapTargetSize, TextStyle? textStyle, BoxConstraints? constraints, Color? color, Color? selectedColor, Color? disabledColor, Color? fillColor, Color? focusColor, Color? highlightColor, Color? hoverColor, Color? splashColor, List<FocusNode>? focusNodes, bool renderBorder = true, Color? borderColor, Color? selectedBorderColor, Color? disabledBorderColor, BorderRadius? borderRadius, double? borderWidth, Axis direction = Axis.horizontal, VerticalDirection verticalDirection = VerticalDirection.down})
  ToggleButtons$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required List<Widget> children} , defaultValue:none
    required List<Widget> children,

    /// optionalParameters: {required List<bool> isSelected} , defaultValue:none
    required List<bool> isSelected,

    /// optionalParameters: {void Function(int)? onPressed} , defaultValue:none
    void Function(int)? onPressed,

    /// optionalParameters: {MouseCursor? mouseCursor} , defaultValue:none
    MouseCursor? mouseCursor,

    /// optionalParameters: {MaterialTapTargetSize? tapTargetSize} , defaultValue:none
    MaterialTapTargetSize? tapTargetSize,

    /// optionalParameters: {TextStyle? textStyle} , defaultValue:none
    TextStyle? textStyle,

    /// optionalParameters: {BoxConstraints? constraints} , defaultValue:none
    BoxConstraints? constraints,

    /// optionalParameters: {Color? color} , defaultValue:none
    Color? color,

    /// optionalParameters: {Color? selectedColor} , defaultValue:none
    Color? selectedColor,

    /// optionalParameters: {Color? disabledColor} , defaultValue:none
    Color? disabledColor,

    /// optionalParameters: {Color? fillColor} , defaultValue:none
    Color? fillColor,

    /// optionalParameters: {Color? focusColor} , defaultValue:none
    Color? focusColor,

    /// optionalParameters: {Color? highlightColor} , defaultValue:none
    Color? highlightColor,

    /// optionalParameters: {Color? hoverColor} , defaultValue:none
    Color? hoverColor,

    /// optionalParameters: {Color? splashColor} , defaultValue:none
    Color? splashColor,

    /// optionalParameters: {List<FocusNode>? focusNodes} , defaultValue:none
    List<FocusNode>? focusNodes,

    /// optionalParameters: {bool renderBorder = true} , defaultValue:Literal
    bool renderBorder = true,

    /// optionalParameters: {Color? borderColor} , defaultValue:none
    Color? borderColor,

    /// optionalParameters: {Color? selectedBorderColor} , defaultValue:none
    Color? selectedBorderColor,

    /// optionalParameters: {Color? disabledBorderColor} , defaultValue:none
    Color? disabledBorderColor,

    /// optionalParameters: {BorderRadius? borderRadius} , defaultValue:none
    BorderRadius? borderRadius,

    /// optionalParameters: {double? borderWidth} , defaultValue:none
    double? borderWidth,

    /// optionalParameters: {Axis direction = Axis.horizontal} , defaultValue:unprocessed
    required Axis direction,

    /// optionalParameters: {VerticalDirection verticalDirection = VerticalDirection.down} , defaultValue:unprocessed
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
    mateCreateName = 'ToggleButtons';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => ToggleButtons$Mate(
          key: p.get('key').build(),
          children: p.get('children').build(),
          isSelected: p.get('isSelected').build(),
          onPressed: p.get('onPressed').build(),
          mouseCursor: p.get('mouseCursor').build(),
          tapTargetSize: p.get('tapTargetSize').build(),
          textStyle: p.get('textStyle').build(),
          constraints: p.get('constraints').build(),
          color: p.get('color').build(),
          selectedColor: p.get('selectedColor').build(),
          disabledColor: p.get('disabledColor').build(),
          fillColor: p.get('fillColor').build(),
          focusColor: p.get('focusColor').build(),
          highlightColor: p.get('highlightColor').build(),
          hoverColor: p.get('hoverColor').build(),
          splashColor: p.get('splashColor').build(),
          focusNodes: p.get('focusNodes').build(),
          renderBorder: p.get('renderBorder').build(),
          borderColor: p.get('borderColor').build(),
          selectedBorderColor: p.get('selectedBorderColor').build(),
          disabledBorderColor: p.get('disabledBorderColor').build(),
          borderRadius: p.get('borderRadius').build(),
          borderWidth: p.get('borderWidth').build(),
          direction: p.get('direction').build(),
          verticalDirection: p.get('verticalDirection').build(),
        );
    mateUse('key', key);
    mateUse('children', children);
    mateUse('isSelected', isSelected);
    mateUse('onPressed', onPressed);
    mateUse('mouseCursor', mouseCursor);
    mateUse('tapTargetSize', tapTargetSize);
    mateUse('textStyle', textStyle);
    mateUse('constraints', constraints);
    mateUse('color', color);
    mateUse('selectedColor', selectedColor);
    mateUse('disabledColor', disabledColor);
    mateUse('fillColor', fillColor);
    mateUse('focusColor', focusColor);
    mateUse('highlightColor', highlightColor);
    mateUse('hoverColor', hoverColor);
    mateUse('splashColor', splashColor);
    mateUse('focusNodes', focusNodes);
    mateUse('renderBorder', renderBorder);
    mateUse('borderColor', borderColor);
    mateUse('selectedBorderColor', selectedBorderColor);
    mateUse('disabledBorderColor', disabledBorderColor);
    mateUse('borderRadius', borderRadius);
    mateUse('borderWidth', borderWidth);
    mateUse('direction', direction);
    mateUse('verticalDirection', verticalDirection);
  }
}
