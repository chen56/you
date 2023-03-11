// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/material/dialog_theme.dart';
import 'dart:ui';
import 'dart:core';
import 'package:flutter/src/painting/borders.dart';
import 'package:flutter/src/painting/alignment.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:note/mate.dart';

/// class DialogTheme with Diagnosticable
class DialogTheme$Mate extends DialogTheme with Mate<DialogTheme$Mate> {
  /// DialogTheme DialogTheme({Color? backgroundColor, double? elevation, Color? shadowColor, Color? surfaceTintColor, ShapeBorder? shape, AlignmentGeometry? alignment, Color? iconColor, TextStyle? titleTextStyle, TextStyle? contentTextStyle, EdgeInsetsGeometry? actionsPadding})
  DialogTheme$Mate({
    /// param: {Color? backgroundColor}
    Color? backgroundColor,

    /// param: {double? elevation}
    double? elevation,

    /// param: {Color? shadowColor}
    Color? shadowColor,

    /// param: {Color? surfaceTintColor}
    Color? surfaceTintColor,

    /// param: {ShapeBorder? shape}
    ShapeBorder? shape,

    /// param: {AlignmentGeometry? alignment}
    AlignmentGeometry? alignment,

    /// param: {Color? iconColor}
    Color? iconColor,

    /// param: {TextStyle? titleTextStyle}
    TextStyle? titleTextStyle,

    /// param: {TextStyle? contentTextStyle}
    TextStyle? contentTextStyle,

    /// param: {EdgeInsetsGeometry? actionsPadding}
    EdgeInsetsGeometry? actionsPadding,
  }) : super(
          backgroundColor: backgroundColor,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          shape: shape,
          alignment: alignment,
          iconColor: iconColor,
          titleTextStyle: titleTextStyle,
          contentTextStyle: contentTextStyle,
          actionsPadding: actionsPadding,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => DialogTheme$Mate(
        backgroundColor: p.getValue('backgroundColor'),
        elevation: p.getValue('elevation'),
        shadowColor: p.getValue('shadowColor'),
        surfaceTintColor: p.getValue('surfaceTintColor'),
        shape: p.getValue('shape'),
        alignment: p.getValue('alignment'),
        iconColor: p.getValue('iconColor'),
        titleTextStyle: p.getValue('titleTextStyle'),
        contentTextStyle: p.getValue('contentTextStyle'),
        actionsPadding: p.getValue('actionsPadding'),
      ),
    );
    mateParams.set(name: 'backgroundColor', init: backgroundColor);
    mateParams.set(name: 'elevation', init: elevation);
    mateParams.set(name: 'shadowColor', init: shadowColor);
    mateParams.set(name: 'surfaceTintColor', init: surfaceTintColor);
    mateParams.set(name: 'shape', init: shape);
    mateParams.set(name: 'alignment', init: alignment);
    mateParams.set(name: 'iconColor', init: iconColor);
    mateParams.set(name: 'titleTextStyle', init: titleTextStyle);
    mateParams.set(name: 'contentTextStyle', init: contentTextStyle);
    mateParams.set(name: 'actionsPadding', init: actionsPadding);
  }
}
