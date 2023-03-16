// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/painting/strut_style.dart';
import 'dart:core';
import 'dart:ui';
import 'package:note/mate.dart';
import 'package:flutter/src/painting/text_style.dart';

/// class StrutStyle with Diagnosticable
class StrutStyle$Mate extends StrutStyle with Mate<StrutStyle$Mate> {
  /// StrutStyle StrutStyle({String? fontFamily, List<String>? fontFamilyFallback, double? fontSize, double? height, TextLeadingDistribution? leadingDistribution, double? leading, FontWeight? fontWeight, FontStyle? fontStyle, bool? forceStrutHeight, String? debugLabel, String? package})
  StrutStyle$Mate({
    /// optionalParameters: {String? fontFamily} , hasDefaultValue:false, defaultValueCode:null
    String? fontFamily,

    /// optionalParameters: {List<String>? fontFamilyFallback} , hasDefaultValue:false, defaultValueCode:null
    List<String>? fontFamilyFallback,

    /// optionalParameters: {double? fontSize} , hasDefaultValue:false, defaultValueCode:null
    double? fontSize,

    /// optionalParameters: {double? height} , hasDefaultValue:false, defaultValueCode:null
    double? height,

    /// optionalParameters: {TextLeadingDistribution? leadingDistribution} , hasDefaultValue:false, defaultValueCode:null
    TextLeadingDistribution? leadingDistribution,

    /// optionalParameters: {double? leading} , hasDefaultValue:false, defaultValueCode:null
    double? leading,

    /// optionalParameters: {FontWeight? fontWeight} , hasDefaultValue:false, defaultValueCode:null
    FontWeight? fontWeight,

    /// optionalParameters: {FontStyle? fontStyle} , hasDefaultValue:false, defaultValueCode:null
    FontStyle? fontStyle,

    /// optionalParameters: {bool? forceStrutHeight} , hasDefaultValue:false, defaultValueCode:null
    bool? forceStrutHeight,

    /// optionalParameters: {String? debugLabel} , hasDefaultValue:false, defaultValueCode:null
    String? debugLabel,

    /// optionalParameters: {String? package} , hasDefaultValue:false, defaultValueCode:null
    String? package,
  }) : super(
          fontFamily: fontFamily,
          fontFamilyFallback: fontFamilyFallback,
          fontSize: fontSize,
          height: height,
          leadingDistribution: leadingDistribution,
          leading: leading,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          forceStrutHeight: forceStrutHeight,
          debugLabel: debugLabel,
          package: package,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => StrutStyle$Mate(
        fontFamily: p.get('fontFamily').value,
        fontFamilyFallback: p.get('fontFamilyFallback').value,
        fontSize: p.get('fontSize').value,
        height: p.get('height').value,
        leadingDistribution: p.get('leadingDistribution').value,
        leading: p.get('leading').value,
        fontWeight: p.get('fontWeight').value,
        fontStyle: p.get('fontStyle').value,
        forceStrutHeight: p.get('forceStrutHeight').value,
        debugLabel: p.get('debugLabel').value,
        package: p.get('package').value,
      ),
    );
    mateParams.put('fontFamily', fontFamily);
    mateParams.putList('fontFamilyFallback', fontFamilyFallback);
    mateParams.put('fontSize', fontSize);
    mateParams.put('height', height);
    mateParams.put('leadingDistribution', leadingDistribution);
    mateParams.put('leading', leading);
    mateParams.put('fontWeight', fontWeight);
    mateParams.put('fontStyle', fontStyle);
    mateParams.put('forceStrutHeight', forceStrutHeight);
    mateParams.put('debugLabel', debugLabel);
    mateParams.put('package', package);
  }

  /// StrutStyle StrutStyle.fromTextStyle(TextStyle textStyle, {String? fontFamily, List<String>? fontFamilyFallback, double? fontSize, double? height, TextLeadingDistribution? leadingDistribution, double? leading, FontWeight? fontWeight, FontStyle? fontStyle, bool? forceStrutHeight, String? debugLabel, String? package})
  StrutStyle$Mate.fromTextStyle(
    /// requiredParameters: TextStyle textStyle
    TextStyle textStyle, {
    /// optionalParameters: {String? fontFamily} , hasDefaultValue:false, defaultValueCode:null
    String? fontFamily,

    /// optionalParameters: {List<String>? fontFamilyFallback} , hasDefaultValue:false, defaultValueCode:null
    List<String>? fontFamilyFallback,

    /// optionalParameters: {double? fontSize} , hasDefaultValue:false, defaultValueCode:null
    double? fontSize,

    /// optionalParameters: {double? height} , hasDefaultValue:false, defaultValueCode:null
    double? height,

    /// optionalParameters: {TextLeadingDistribution? leadingDistribution} , hasDefaultValue:false, defaultValueCode:null
    TextLeadingDistribution? leadingDistribution,

    /// optionalParameters: {double? leading} , hasDefaultValue:false, defaultValueCode:null
    double? leading,

    /// optionalParameters: {FontWeight? fontWeight} , hasDefaultValue:false, defaultValueCode:null
    FontWeight? fontWeight,

    /// optionalParameters: {FontStyle? fontStyle} , hasDefaultValue:false, defaultValueCode:null
    FontStyle? fontStyle,

    /// optionalParameters: {bool? forceStrutHeight} , hasDefaultValue:false, defaultValueCode:null
    bool? forceStrutHeight,

    /// optionalParameters: {String? debugLabel} , hasDefaultValue:false, defaultValueCode:null
    String? debugLabel,

    /// optionalParameters: {String? package} , hasDefaultValue:false, defaultValueCode:null
    String? package,
  }) : super.fromTextStyle(
          textStyle,
          fontFamily: fontFamily,
          fontFamilyFallback: fontFamilyFallback,
          fontSize: fontSize,
          height: height,
          leadingDistribution: leadingDistribution,
          leading: leading,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          forceStrutHeight: forceStrutHeight,
          debugLabel: debugLabel,
          package: package,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => StrutStyle$Mate.fromTextStyle(
        p.get('textStyle').value,
        fontFamily: p.get('fontFamily').value,
        fontFamilyFallback: p.get('fontFamilyFallback').value,
        fontSize: p.get('fontSize').value,
        height: p.get('height').value,
        leadingDistribution: p.get('leadingDistribution').value,
        leading: p.get('leading').value,
        fontWeight: p.get('fontWeight').value,
        fontStyle: p.get('fontStyle').value,
        forceStrutHeight: p.get('forceStrutHeight').value,
        debugLabel: p.get('debugLabel').value,
        package: p.get('package').value,
      ),
    );
    mateParams.put('textStyle', textStyle);
    mateParams.put('fontFamily', fontFamily);
    mateParams.putList('fontFamilyFallback', fontFamilyFallback);
    mateParams.put('fontSize', fontSize);
    mateParams.put('height', height);
    mateParams.put('leadingDistribution', leadingDistribution);
    mateParams.put('leading', leading);
    mateParams.put('fontWeight', fontWeight);
    mateParams.put('fontStyle', fontStyle);
    mateParams.put('forceStrutHeight', forceStrutHeight);
    mateParams.put('debugLabel', debugLabel);
    mateParams.put('package', package);
  }
}
