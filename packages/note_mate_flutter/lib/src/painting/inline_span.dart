// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/painting/inline_span.dart';
import 'package:note/mate.dart';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/src/gestures/recognizer.dart';

/// class Accumulator
class Accumulator$Mate extends Accumulator with Mate {
  /// Accumulator Accumulator([int _value = 0])
  Accumulator$Mate(

      /// requiredParameters: [int _value = 0]
      int _value)
      : super(_value) {
    mateCreateName = 'Accumulator';
    matePackageUrl = 'package:flutter/painting.dart';
    mateBuilder = (p) => Accumulator$Mate(p.get('_value').value);
    mateUse('_value', _value, isNamed: false);
  }
}

/// class InlineSpanSemanticsInformation
class InlineSpanSemanticsInformation$Mate extends InlineSpanSemanticsInformation with Mate {
  /// InlineSpanSemanticsInformation InlineSpanSemanticsInformation(String text, {bool isPlaceholder = false, String? semanticsLabel, List<StringAttribute> stringAttributes = const <ui.StringAttribute>[], GestureRecognizer? recognizer})
  InlineSpanSemanticsInformation$Mate(
    /// requiredParameters: String text
    String text, {
    /// optionalParameters: {bool isPlaceholder = false} , defaultValue:Literal
    bool isPlaceholder = false,

    /// optionalParameters: {String? semanticsLabel} , defaultValue:none
    String? semanticsLabel,

    /// optionalParameters: {List<StringAttribute> stringAttributes = const <ui.StringAttribute>[]} , defaultValue:unprocessed
    required List<StringAttribute> stringAttributes,

    /// optionalParameters: {GestureRecognizer? recognizer} , defaultValue:none
    GestureRecognizer? recognizer,
  }) : super(
          text,
          isPlaceholder: isPlaceholder,
          semanticsLabel: semanticsLabel,
          stringAttributes: stringAttributes,
          recognizer: recognizer,
        ) {
    mateCreateName = 'InlineSpanSemanticsInformation';
    matePackageUrl = 'package:flutter/painting.dart';
    mateBuilder = (p) => InlineSpanSemanticsInformation$Mate(
          p.get('text').value,
          isPlaceholder: p.get('isPlaceholder').build(),
          semanticsLabel: p.get('semanticsLabel').build(),
          stringAttributes: p.get('stringAttributes').build(),
          recognizer: p.get('recognizer').build(),
        );
    mateUse('text', text, isNamed: false);
    mateUse('isPlaceholder', isPlaceholder, isNamed: true);
    mateUse('semanticsLabel', semanticsLabel, isNamed: true);
    mateUseList('stringAttributes', stringAttributes, isNamed: true);
    mateUse('recognizer', recognizer, isNamed: true);
  }
}
