// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/painting/text_painter.dart';
import 'dart:ui';
import 'dart:core';
import 'package:note/mate.dart';
import 'package:flutter/src/painting/inline_span.dart';
import 'package:flutter/src/painting/strut_style.dart';

/// class PlaceholderDimensions
class PlaceholderDimensions$Mate extends PlaceholderDimensions with Mate<PlaceholderDimensions$Mate> {
  /// PlaceholderDimensions PlaceholderDimensions({required Size size, required PlaceholderAlignment alignment, TextBaseline? baseline, double? baselineOffset})
  PlaceholderDimensions$Mate({
    /// optionalParameters: {required Size size} , hasDefaultValue:false, defaultValueCode:null
    required Size size,

    /// optionalParameters: {required PlaceholderAlignment alignment} , hasDefaultValue:false, defaultValueCode:null
    required PlaceholderAlignment alignment,

    /// optionalParameters: {TextBaseline? baseline} , hasDefaultValue:false, defaultValueCode:null
    TextBaseline? baseline,

    /// optionalParameters: {double? baselineOffset} , hasDefaultValue:false, defaultValueCode:null
    double? baselineOffset,
  }) : super(
          size: size,
          alignment: alignment,
          baseline: baseline,
          baselineOffset: baselineOffset,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => PlaceholderDimensions$Mate(
        size: p.getValue('size'),
        alignment: p.getValue('alignment'),
        baseline: p.getValue('baseline'),
        baselineOffset: p.getValue('baselineOffset'),
      ),
    );
    mateParams.set(name: 'size', init: size);
    mateParams.set(name: 'alignment', init: alignment);
    mateParams.set(name: 'baseline', init: baseline);
    mateParams.set(name: 'baselineOffset', init: baselineOffset);
  }
}

/// class TextPainter
class TextPainter$Mate extends TextPainter with Mate<TextPainter$Mate> {
  /// TextPainter TextPainter({InlineSpan? text, TextAlign textAlign = TextAlign.start, TextDirection? textDirection, double textScaleFactor = 1.0, int? maxLines, String? ellipsis, Locale? locale, StrutStyle? strutStyle, TextWidthBasis textWidthBasis = TextWidthBasis.parent, TextHeightBehavior? textHeightBehavior})
  TextPainter$Mate({
    /// optionalParameters: {InlineSpan? text} , hasDefaultValue:false, defaultValueCode:null
    InlineSpan? text,

    /// optionalParameters: {TextAlign textAlign = TextAlign.start} , hasDefaultValue:true, defaultValueCode:TextAlign.start
    required TextAlign textAlign,

    /// optionalParameters: {TextDirection? textDirection} , hasDefaultValue:false, defaultValueCode:null
    TextDirection? textDirection,

    /// optionalParameters: {double textScaleFactor = 1.0} , hasDefaultValue:true, defaultValueCode:1.0
    required double textScaleFactor,

    /// optionalParameters: {int? maxLines} , hasDefaultValue:false, defaultValueCode:null
    int? maxLines,

    /// optionalParameters: {String? ellipsis} , hasDefaultValue:false, defaultValueCode:null
    String? ellipsis,

    /// optionalParameters: {Locale? locale} , hasDefaultValue:false, defaultValueCode:null
    Locale? locale,

    /// optionalParameters: {StrutStyle? strutStyle} , hasDefaultValue:false, defaultValueCode:null
    StrutStyle? strutStyle,

    /// optionalParameters: {TextWidthBasis textWidthBasis = TextWidthBasis.parent} , hasDefaultValue:true, defaultValueCode:TextWidthBasis.parent
    required TextWidthBasis textWidthBasis,

    /// optionalParameters: {TextHeightBehavior? textHeightBehavior} , hasDefaultValue:false, defaultValueCode:null
    TextHeightBehavior? textHeightBehavior,
  }) : super(
          text: text,
          textAlign: textAlign,
          textDirection: textDirection,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          ellipsis: ellipsis,
          locale: locale,
          strutStyle: strutStyle,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => TextPainter$Mate(
        text: p.getValue('text'),
        textAlign: p.getValue('textAlign'),
        textDirection: p.getValue('textDirection'),
        textScaleFactor: p.getValue('textScaleFactor'),
        maxLines: p.getValue('maxLines'),
        ellipsis: p.getValue('ellipsis'),
        locale: p.getValue('locale'),
        strutStyle: p.getValue('strutStyle'),
        textWidthBasis: p.getValue('textWidthBasis'),
        textHeightBehavior: p.getValue('textHeightBehavior'),
      ),
    );
    mateParams.set(name: 'text', init: text);
    mateParams.set(name: 'textAlign', init: textAlign);
    mateParams.set(name: 'textDirection', init: textDirection);
    mateParams.set(name: 'textScaleFactor', init: textScaleFactor);
    mateParams.set(name: 'maxLines', init: maxLines);
    mateParams.set(name: 'ellipsis', init: ellipsis);
    mateParams.set(name: 'locale', init: locale);
    mateParams.set(name: 'strutStyle', init: strutStyle);
    mateParams.set(name: 'textWidthBasis', init: textWidthBasis);
    mateParams.set(name: 'textHeightBehavior', init: textHeightBehavior);
  }
}
