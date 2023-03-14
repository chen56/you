// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/action_chip.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'dart:ui';
import 'dart:core';
import 'package:flutter/src/painting/borders.dart';
import 'package:flutter/src/widgets/focus_manager.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter/src/widgets/icon_theme_data.dart';
import 'package:note/mate.dart';

/// class ActionChip extends StatelessWidget implements ChipAttributes, TappableChipAttributes, DisabledChipAttributes
class ActionChip$Mate extends ActionChip with WidgetMate<ActionChip$Mate> {
  /// ActionChip ActionChip({Key? key, Widget? avatar, required Widget label, TextStyle? labelStyle, EdgeInsetsGeometry? labelPadding, void Function()? onPressed, double? pressElevation, String? tooltip, BorderSide? side, OutlinedBorder? shape, Clip clipBehavior = Clip.none, FocusNode? focusNode, bool autofocus = false, Color? backgroundColor, Color? disabledColor, EdgeInsetsGeometry? padding, VisualDensity? visualDensity, MaterialTapTargetSize? materialTapTargetSize, double? elevation, Color? shadowColor, Color? surfaceTintColor, IconThemeData? iconTheme})
  ActionChip$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {Widget? avatar} , hasDefaultValue:false, defaultValueCode:null
    Widget? avatar,

    /// optionalParameters: {required Widget label} , hasDefaultValue:false, defaultValueCode:null
    required Widget label,

    /// optionalParameters: {TextStyle? labelStyle} , hasDefaultValue:false, defaultValueCode:null
    TextStyle? labelStyle,

    /// optionalParameters: {EdgeInsetsGeometry? labelPadding} , hasDefaultValue:false, defaultValueCode:null
    EdgeInsetsGeometry? labelPadding,

    /// optionalParameters: {void Function()? onPressed} , hasDefaultValue:false, defaultValueCode:null
    VoidCallback? onPressed,

    /// optionalParameters: {double? pressElevation} , hasDefaultValue:false, defaultValueCode:null
    double? pressElevation,

    /// optionalParameters: {String? tooltip} , hasDefaultValue:false, defaultValueCode:null
    String? tooltip,

    /// optionalParameters: {BorderSide? side} , hasDefaultValue:false, defaultValueCode:null
    BorderSide? side,

    /// optionalParameters: {OutlinedBorder? shape} , hasDefaultValue:false, defaultValueCode:null
    OutlinedBorder? shape,

    /// optionalParameters: {Clip clipBehavior = Clip.none} , hasDefaultValue:true, defaultValueCode:Clip.none
    required Clip clipBehavior,

    /// optionalParameters: {FocusNode? focusNode} , hasDefaultValue:false, defaultValueCode:null
    FocusNode? focusNode,

    /// optionalParameters: {bool autofocus = false} , hasDefaultValue:true, defaultValueCode:false
    required bool autofocus,

    /// optionalParameters: {Color? backgroundColor} , hasDefaultValue:false, defaultValueCode:null
    Color? backgroundColor,

    /// optionalParameters: {Color? disabledColor} , hasDefaultValue:false, defaultValueCode:null
    Color? disabledColor,

    /// optionalParameters: {EdgeInsetsGeometry? padding} , hasDefaultValue:false, defaultValueCode:null
    EdgeInsetsGeometry? padding,

    /// optionalParameters: {VisualDensity? visualDensity} , hasDefaultValue:false, defaultValueCode:null
    VisualDensity? visualDensity,

    /// optionalParameters: {MaterialTapTargetSize? materialTapTargetSize} , hasDefaultValue:false, defaultValueCode:null
    MaterialTapTargetSize? materialTapTargetSize,

    /// optionalParameters: {double? elevation} , hasDefaultValue:false, defaultValueCode:null
    double? elevation,

    /// optionalParameters: {Color? shadowColor} , hasDefaultValue:false, defaultValueCode:null
    Color? shadowColor,

    /// optionalParameters: {Color? surfaceTintColor} , hasDefaultValue:false, defaultValueCode:null
    Color? surfaceTintColor,

    /// optionalParameters: {IconThemeData? iconTheme} , hasDefaultValue:false, defaultValueCode:null
    IconThemeData? iconTheme,
  }) : super(
          key: key,
          avatar: avatar,
          label: label,
          labelStyle: labelStyle,
          labelPadding: labelPadding,
          onPressed: onPressed,
          pressElevation: pressElevation,
          tooltip: tooltip,
          side: side,
          shape: shape,
          clipBehavior: clipBehavior,
          focusNode: focusNode,
          autofocus: autofocus,
          backgroundColor: backgroundColor,
          disabledColor: disabledColor,
          padding: padding,
          visualDensity: visualDensity,
          materialTapTargetSize: materialTapTargetSize,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          iconTheme: iconTheme,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ActionChip$Mate(
        key: p.getValue('key'),
        avatar: p.getValue('avatar'),
        label: p.getValue('label'),
        labelStyle: p.getValue('labelStyle'),
        labelPadding: p.getValue('labelPadding'),
        onPressed: p.getValue('onPressed'),
        pressElevation: p.getValue('pressElevation'),
        tooltip: p.getValue('tooltip'),
        side: p.getValue('side'),
        shape: p.getValue('shape'),
        clipBehavior: p.getValue('clipBehavior'),
        focusNode: p.getValue('focusNode'),
        autofocus: p.getValue('autofocus'),
        backgroundColor: p.getValue('backgroundColor'),
        disabledColor: p.getValue('disabledColor'),
        padding: p.getValue('padding'),
        visualDensity: p.getValue('visualDensity'),
        materialTapTargetSize: p.getValue('materialTapTargetSize'),
        elevation: p.getValue('elevation'),
        shadowColor: p.getValue('shadowColor'),
        surfaceTintColor: p.getValue('surfaceTintColor'),
        iconTheme: p.getValue('iconTheme'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'avatar', init: avatar);
    mateParams.set(name: 'label', init: label);
    mateParams.set(name: 'labelStyle', init: labelStyle);
    mateParams.set(name: 'labelPadding', init: labelPadding);
    mateParams.set(name: 'onPressed', init: onPressed);
    mateParams.set(name: 'pressElevation', init: pressElevation);
    mateParams.set(name: 'tooltip', init: tooltip);
    mateParams.set(name: 'side', init: side);
    mateParams.set(name: 'shape', init: shape);
    mateParams.set(name: 'clipBehavior', init: clipBehavior);
    mateParams.set(name: 'focusNode', init: focusNode);
    mateParams.set(name: 'autofocus', init: autofocus);
    mateParams.set(name: 'backgroundColor', init: backgroundColor);
    mateParams.set(name: 'disabledColor', init: disabledColor);
    mateParams.set(name: 'padding', init: padding);
    mateParams.set(name: 'visualDensity', init: visualDensity);
    mateParams.set(name: 'materialTapTargetSize', init: materialTapTargetSize);
    mateParams.set(name: 'elevation', init: elevation);
    mateParams.set(name: 'shadowColor', init: shadowColor);
    mateParams.set(name: 'surfaceTintColor', init: surfaceTintColor);
    mateParams.set(name: 'iconTheme', init: iconTheme);
  }
}
