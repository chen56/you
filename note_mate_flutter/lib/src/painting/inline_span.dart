// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/painting/inline_span.dart';
import 'dart:core';
import 'package:note/mate.dart';
import 'dart:ui';
import 'package:flutter/src/gestures/recognizer.dart';

/// class Accumulator
class Accumulator$Mate extends Accumulator with Mate<Accumulator$Mate> {
  /// Accumulator Accumulator([int _value = 0])
  Accumulator$Mate(

      /// param: [int _value = 0]
      int _value)
      : super(_value) {
    mateParams = Params(
      init: this,
      builder: (p) => Accumulator$Mate(p.getValue('_value')),
    );
    mateParams.set(name: '_value', init: _value);
  }
}

/// class InlineSpanSemanticsInformation
class InlineSpanSemanticsInformation$Mate extends InlineSpanSemanticsInformation
    with Mate<InlineSpanSemanticsInformation$Mate> {
  /// InlineSpanSemanticsInformation InlineSpanSemanticsInformation(String text, {bool isPlaceholder = false, String? semanticsLabel, List<StringAttribute> stringAttributes = const <ui.StringAttribute>[], GestureRecognizer? recognizer})
  InlineSpanSemanticsInformation$Mate(
    /// param: String text
    String text, {
    /// param: {bool isPlaceholder = false}
    required bool isPlaceholder,

    /// param: {String? semanticsLabel}
    String? semanticsLabel,

    /// param: {List<StringAttribute> stringAttributes = const <ui.StringAttribute>[]}
    required List<StringAttribute> stringAttributes,

    /// param: {GestureRecognizer? recognizer}
    GestureRecognizer? recognizer,
  }) : super(
          text,
          isPlaceholder: isPlaceholder,
          semanticsLabel: semanticsLabel,
          stringAttributes: stringAttributes,
          recognizer: recognizer,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => InlineSpanSemanticsInformation$Mate(
        p.getValue('text'),
        isPlaceholder: p.getValue('isPlaceholder'),
        semanticsLabel: p.getValue('semanticsLabel'),
        stringAttributes: p.getValue('stringAttributes'),
        recognizer: p.getValue('recognizer'),
      ),
    );
    mateParams.set(name: 'text', init: text);
    mateParams.set(name: 'isPlaceholder', init: isPlaceholder);
    mateParams.set(name: 'semanticsLabel', init: semanticsLabel);
    mateParams.set(name: 'stringAttributes', init: stringAttributes);
    mateParams.set(name: 'recognizer', init: recognizer);
  }
}