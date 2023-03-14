// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/snack_bar_theme.dart';
import 'dart:ui';
import 'package:flutter/src/painting/text_style.dart';
import 'dart:core';
import 'package:flutter/src/painting/borders.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:note/mate.dart';

/// class SnackBarThemeData with Diagnosticable
class SnackBarThemeData$Mate extends SnackBarThemeData with Mate<SnackBarThemeData$Mate> {
  /// SnackBarThemeData SnackBarThemeData({Color? backgroundColor, Color? actionTextColor, Color? disabledActionTextColor, TextStyle? contentTextStyle, double? elevation, ShapeBorder? shape, SnackBarBehavior? behavior, double? width, EdgeInsets? insetPadding, bool? showCloseIcon, Color? closeIconColor})
  SnackBarThemeData$Mate({
    /// optionalParameters: {Color? backgroundColor} , hasDefaultValue:false, defaultValueCode:null
    Color? backgroundColor,

    /// optionalParameters: {Color? actionTextColor} , hasDefaultValue:false, defaultValueCode:null
    Color? actionTextColor,

    /// optionalParameters: {Color? disabledActionTextColor} , hasDefaultValue:false, defaultValueCode:null
    Color? disabledActionTextColor,

    /// optionalParameters: {TextStyle? contentTextStyle} , hasDefaultValue:false, defaultValueCode:null
    TextStyle? contentTextStyle,

    /// optionalParameters: {double? elevation} , hasDefaultValue:false, defaultValueCode:null
    double? elevation,

    /// optionalParameters: {ShapeBorder? shape} , hasDefaultValue:false, defaultValueCode:null
    ShapeBorder? shape,

    /// optionalParameters: {SnackBarBehavior? behavior} , hasDefaultValue:false, defaultValueCode:null
    SnackBarBehavior? behavior,

    /// optionalParameters: {double? width} , hasDefaultValue:false, defaultValueCode:null
    double? width,

    /// optionalParameters: {EdgeInsets? insetPadding} , hasDefaultValue:false, defaultValueCode:null
    EdgeInsets? insetPadding,

    /// optionalParameters: {bool? showCloseIcon} , hasDefaultValue:false, defaultValueCode:null
    bool? showCloseIcon,

    /// optionalParameters: {Color? closeIconColor} , hasDefaultValue:false, defaultValueCode:null
    Color? closeIconColor,
  }) : super(
          backgroundColor: backgroundColor,
          actionTextColor: actionTextColor,
          disabledActionTextColor: disabledActionTextColor,
          contentTextStyle: contentTextStyle,
          elevation: elevation,
          shape: shape,
          behavior: behavior,
          width: width,
          insetPadding: insetPadding,
          showCloseIcon: showCloseIcon,
          closeIconColor: closeIconColor,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => SnackBarThemeData$Mate(
        backgroundColor: p.getValue('backgroundColor'),
        actionTextColor: p.getValue('actionTextColor'),
        disabledActionTextColor: p.getValue('disabledActionTextColor'),
        contentTextStyle: p.getValue('contentTextStyle'),
        elevation: p.getValue('elevation'),
        shape: p.getValue('shape'),
        behavior: p.getValue('behavior'),
        width: p.getValue('width'),
        insetPadding: p.getValue('insetPadding'),
        showCloseIcon: p.getValue('showCloseIcon'),
        closeIconColor: p.getValue('closeIconColor'),
      ),
    );
    mateParams.set(name: 'backgroundColor', init: backgroundColor);
    mateParams.set(name: 'actionTextColor', init: actionTextColor);
    mateParams.set(name: 'disabledActionTextColor', init: disabledActionTextColor);
    mateParams.set(name: 'contentTextStyle', init: contentTextStyle);
    mateParams.set(name: 'elevation', init: elevation);
    mateParams.set(name: 'shape', init: shape);
    mateParams.set(name: 'behavior', init: behavior);
    mateParams.set(name: 'width', init: width);
    mateParams.set(name: 'insetPadding', init: insetPadding);
    mateParams.set(name: 'showCloseIcon', init: showCloseIcon);
    mateParams.set(name: 'closeIconColor', init: closeIconColor);
  }
}
