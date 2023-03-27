// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/painting/text_span.dart';
import 'package:note/mate.dart';
import 'dart:core';
import 'package:flutter/src/painting/inline_span.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter/src/gestures/recognizer.dart';
import 'package:flutter/src/services/mouse_cursor.dart';
import 'package:flutter/src/services/mouse_tracking.dart';
import 'dart:ui';

/// class TextSpan extends InlineSpan implements HitTestTarget, MouseTrackerAnnotation
class TextSpan$Mate extends TextSpan with Mate {
  /// TextSpan TextSpan({String? text, List<InlineSpan>? children, TextStyle? style, GestureRecognizer? recognizer, MouseCursor? mouseCursor, void Function(PointerEnterEvent)? onEnter, void Function(PointerExitEvent)? onExit, String? semanticsLabel, Locale? locale, bool? spellOut})
  TextSpan$Mate({
    /// optionalParameters: {String? text} , defaultValue:none
    String? text,

    /// optionalParameters: {List<InlineSpan>? children} , defaultValue:none
    List<InlineSpan>? children,

    /// optionalParameters: {TextStyle? style} , defaultValue:none
    TextStyle? style,

    /// optionalParameters: {GestureRecognizer? recognizer} , defaultValue:none
    GestureRecognizer? recognizer,

    /// optionalParameters: {MouseCursor? mouseCursor} , defaultValue:none
    MouseCursor? mouseCursor,

    /// optionalParameters: {void Function(PointerEnterEvent)? onEnter} , defaultValue:none
    PointerEnterEventListener? onEnter,

    /// optionalParameters: {void Function(PointerExitEvent)? onExit} , defaultValue:none
    PointerExitEventListener? onExit,

    /// optionalParameters: {String? semanticsLabel} , defaultValue:none
    String? semanticsLabel,

    /// optionalParameters: {Locale? locale} , defaultValue:none
    Locale? locale,

    /// optionalParameters: {bool? spellOut} , defaultValue:none
    bool? spellOut,
  }) : super(
          text: text,
          children: children,
          style: style,
          recognizer: recognizer,
          mouseCursor: mouseCursor,
          onEnter: onEnter,
          onExit: onExit,
          semanticsLabel: semanticsLabel,
          locale: locale,
          spellOut: spellOut,
        ) {
    mateCreateName = 'TextSpan';
    matePackageUrl = 'package:flutter/painting.dart';
    mateBuilder = (p) => TextSpan$Mate(
          text: p.get('text').build(),
          children: p.get('children').build(),
          style: p.get('style').build(),
          recognizer: p.get('recognizer').build(),
          mouseCursor: p.get('mouseCursor').build(),
          onEnter: p.get('onEnter').build(),
          onExit: p.get('onExit').build(),
          semanticsLabel: p.get('semanticsLabel').build(),
          locale: p.get('locale').build(),
          spellOut: p.get('spellOut').build(),
        );
    mateUse('text', text, isNamed: true);
    mateUseList('children', children, isNamed: true);
    mateUse('style', style, isNamed: true);
    mateUse('recognizer', recognizer, isNamed: true);
    mateUse('mouseCursor', mouseCursor, isNamed: true);
    mateUse('onEnter', onEnter, isNamed: true);
    mateUse('onExit', onExit, isNamed: true);
    mateUse('semanticsLabel', semanticsLabel, isNamed: true);
    mateUse('locale', locale, isNamed: true);
    mateUse('spellOut', spellOut, isNamed: true);
  }
}
