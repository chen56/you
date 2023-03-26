// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/action_chip.dart';
import 'package:note/mate.dart';
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

/// class ActionChip extends StatelessWidget implements ChipAttributes, TappableChipAttributes, DisabledChipAttributes
class ActionChip$Mate extends ActionChip with Mate {
  /// ActionChip ActionChip({Key? key, Widget? avatar, required Widget label, TextStyle? labelStyle, EdgeInsetsGeometry? labelPadding, void Function()? onPressed, double? pressElevation, String? tooltip, BorderSide? side, OutlinedBorder? shape, Clip clipBehavior = Clip.none, FocusNode? focusNode, bool autofocus = false, Color? backgroundColor, Color? disabledColor, EdgeInsetsGeometry? padding, VisualDensity? visualDensity, MaterialTapTargetSize? materialTapTargetSize, double? elevation, Color? shadowColor, Color? surfaceTintColor, IconThemeData? iconTheme})
  ActionChip$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {Widget? avatar} , defaultValue:none
    Widget? avatar,

    /// optionalParameters: {required Widget label} , defaultValue:none
    required Widget label,

    /// optionalParameters: {TextStyle? labelStyle} , defaultValue:none
    TextStyle? labelStyle,

    /// optionalParameters: {EdgeInsetsGeometry? labelPadding} , defaultValue:none
    EdgeInsetsGeometry? labelPadding,

    /// optionalParameters: {void Function()? onPressed} , defaultValue:none
    VoidCallback? onPressed,

    /// optionalParameters: {double? pressElevation} , defaultValue:none
    double? pressElevation,

    /// optionalParameters: {String? tooltip} , defaultValue:none
    String? tooltip,

    /// optionalParameters: {BorderSide? side} , defaultValue:none
    BorderSide? side,

    /// optionalParameters: {OutlinedBorder? shape} , defaultValue:none
    OutlinedBorder? shape,

    /// optionalParameters: {Clip clipBehavior = Clip.none} , defaultValue:unprocessed
    required Clip clipBehavior,

    /// optionalParameters: {FocusNode? focusNode} , defaultValue:none
    FocusNode? focusNode,

    /// optionalParameters: {bool autofocus = false} , defaultValue:Literal
    bool autofocus = false,

    /// optionalParameters: {Color? backgroundColor} , defaultValue:none
    Color? backgroundColor,

    /// optionalParameters: {Color? disabledColor} , defaultValue:none
    Color? disabledColor,

    /// optionalParameters: {EdgeInsetsGeometry? padding} , defaultValue:none
    EdgeInsetsGeometry? padding,

    /// optionalParameters: {VisualDensity? visualDensity} , defaultValue:none
    VisualDensity? visualDensity,

    /// optionalParameters: {MaterialTapTargetSize? materialTapTargetSize} , defaultValue:none
    MaterialTapTargetSize? materialTapTargetSize,

    /// optionalParameters: {double? elevation} , defaultValue:none
    double? elevation,

    /// optionalParameters: {Color? shadowColor} , defaultValue:none
    Color? shadowColor,

    /// optionalParameters: {Color? surfaceTintColor} , defaultValue:none
    Color? surfaceTintColor,

    /// optionalParameters: {IconThemeData? iconTheme} , defaultValue:none
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
    mateCreateName = 'ActionChip';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => ActionChip$Mate(
          key: p.get('key').build(),
          avatar: p.get('avatar').build(),
          label: p.get('label').build(),
          labelStyle: p.get('labelStyle').build(),
          labelPadding: p.get('labelPadding').build(),
          onPressed: p.get('onPressed').build(),
          pressElevation: p.get('pressElevation').build(),
          tooltip: p.get('tooltip').build(),
          side: p.get('side').build(),
          shape: p.get('shape').build(),
          clipBehavior: p.get('clipBehavior').build(),
          focusNode: p.get('focusNode').build(),
          autofocus: p.get('autofocus').build(),
          backgroundColor: p.get('backgroundColor').build(),
          disabledColor: p.get('disabledColor').build(),
          padding: p.get('padding').build(),
          visualDensity: p.get('visualDensity').build(),
          materialTapTargetSize: p.get('materialTapTargetSize').build(),
          elevation: p.get('elevation').build(),
          shadowColor: p.get('shadowColor').build(),
          surfaceTintColor: p.get('surfaceTintColor').build(),
          iconTheme: p.get('iconTheme').build(),
        );
    mateUse('key', key);
    mateUse('avatar', avatar);
    mateUse('label', label);
    mateUse('labelStyle', labelStyle);
    mateUse('labelPadding', labelPadding);
    mateUse('onPressed', onPressed);
    mateUse('pressElevation', pressElevation);
    mateUse('tooltip', tooltip);
    mateUse('side', side);
    mateUse('shape', shape);
    mateUse('clipBehavior', clipBehavior);
    mateUse('focusNode', focusNode);
    mateUse('autofocus', autofocus);
    mateUse('backgroundColor', backgroundColor);
    mateUse('disabledColor', disabledColor);
    mateUse('padding', padding);
    mateUse('visualDensity', visualDensity);
    mateUse('materialTapTargetSize', materialTapTargetSize);
    mateUse('elevation', elevation);
    mateUse('shadowColor', shadowColor);
    mateUse('surfaceTintColor', surfaceTintColor);
    mateUse('iconTheme', iconTheme);
  }
}
