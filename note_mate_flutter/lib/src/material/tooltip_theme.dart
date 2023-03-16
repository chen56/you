// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/tooltip_theme.dart';
import 'dart:core';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:flutter/src/painting/decoration.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'dart:ui';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

/// class TooltipThemeData with Diagnosticable
class TooltipThemeData$Mate extends TooltipThemeData with Mate<TooltipThemeData$Mate> {
  /// TooltipThemeData TooltipThemeData({double? height, EdgeInsetsGeometry? padding, EdgeInsetsGeometry? margin, double? verticalOffset, bool? preferBelow, bool? excludeFromSemantics, Decoration? decoration, TextStyle? textStyle, TextAlign? textAlign, Duration? waitDuration, Duration? showDuration, TooltipTriggerMode? triggerMode, bool? enableFeedback})
  TooltipThemeData$Mate({
    /// optionalParameters: {double? height} , hasDefaultValue:false, defaultValueCode:null
    double? height,

    /// optionalParameters: {EdgeInsetsGeometry? padding} , hasDefaultValue:false, defaultValueCode:null
    EdgeInsetsGeometry? padding,

    /// optionalParameters: {EdgeInsetsGeometry? margin} , hasDefaultValue:false, defaultValueCode:null
    EdgeInsetsGeometry? margin,

    /// optionalParameters: {double? verticalOffset} , hasDefaultValue:false, defaultValueCode:null
    double? verticalOffset,

    /// optionalParameters: {bool? preferBelow} , hasDefaultValue:false, defaultValueCode:null
    bool? preferBelow,

    /// optionalParameters: {bool? excludeFromSemantics} , hasDefaultValue:false, defaultValueCode:null
    bool? excludeFromSemantics,

    /// optionalParameters: {Decoration? decoration} , hasDefaultValue:false, defaultValueCode:null
    Decoration? decoration,

    /// optionalParameters: {TextStyle? textStyle} , hasDefaultValue:false, defaultValueCode:null
    TextStyle? textStyle,

    /// optionalParameters: {TextAlign? textAlign} , hasDefaultValue:false, defaultValueCode:null
    TextAlign? textAlign,

    /// optionalParameters: {Duration? waitDuration} , hasDefaultValue:false, defaultValueCode:null
    Duration? waitDuration,

    /// optionalParameters: {Duration? showDuration} , hasDefaultValue:false, defaultValueCode:null
    Duration? showDuration,

    /// optionalParameters: {TooltipTriggerMode? triggerMode} , hasDefaultValue:false, defaultValueCode:null
    TooltipTriggerMode? triggerMode,

    /// optionalParameters: {bool? enableFeedback} , hasDefaultValue:false, defaultValueCode:null
    bool? enableFeedback,
  }) : super(
          height: height,
          padding: padding,
          margin: margin,
          verticalOffset: verticalOffset,
          preferBelow: preferBelow,
          excludeFromSemantics: excludeFromSemantics,
          decoration: decoration,
          textStyle: textStyle,
          textAlign: textAlign,
          waitDuration: waitDuration,
          showDuration: showDuration,
          triggerMode: triggerMode,
          enableFeedback: enableFeedback,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => TooltipThemeData$Mate(
        height: p.get('height').value,
        padding: p.get('padding').value,
        margin: p.get('margin').value,
        verticalOffset: p.get('verticalOffset').value,
        preferBelow: p.get('preferBelow').value,
        excludeFromSemantics: p.get('excludeFromSemantics').value,
        decoration: p.get('decoration').value,
        textStyle: p.get('textStyle').value,
        textAlign: p.get('textAlign').value,
        waitDuration: p.get('waitDuration').value,
        showDuration: p.get('showDuration').value,
        triggerMode: p.get('triggerMode').value,
        enableFeedback: p.get('enableFeedback').value,
      ),
    );
    mateParams.put('height', height);
    mateParams.put('padding', padding);
    mateParams.put('margin', margin);
    mateParams.put('verticalOffset', verticalOffset);
    mateParams.put('preferBelow', preferBelow);
    mateParams.put('excludeFromSemantics', excludeFromSemantics);
    mateParams.put('decoration', decoration);
    mateParams.put('textStyle', textStyle);
    mateParams.put('textAlign', textAlign);
    mateParams.put('waitDuration', waitDuration);
    mateParams.put('showDuration', showDuration);
    mateParams.put('triggerMode', triggerMode);
    mateParams.put('enableFeedback', enableFeedback);
  }
}

/// class TooltipTheme extends InheritedTheme
class TooltipTheme$Mate extends TooltipTheme with WidgetMate<TooltipTheme$Mate> {
  /// TooltipTheme TooltipTheme({Key? key, required TooltipThemeData data, required Widget child})
  TooltipTheme$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required TooltipThemeData data} , hasDefaultValue:false, defaultValueCode:null
    required TooltipThemeData data,

    /// optionalParameters: {required Widget child} , hasDefaultValue:false, defaultValueCode:null
    required Widget child,
  }) : super(
          key: key,
          data: data,
          child: child,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => TooltipTheme$Mate(
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
