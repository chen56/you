// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/services/raw_keyboard.dart';
import 'package:note/mate.dart';
import 'dart:core';

/// class RawKeyDownEvent extends RawKeyEvent
class RawKeyDownEvent$Mate extends RawKeyDownEvent with Mate {
  /// RawKeyDownEvent RawKeyDownEvent({required RawKeyEventData data, String? character, bool repeat = false})
  RawKeyDownEvent$Mate({
    /// optionalParameters: {required RawKeyEventData data} , defaultValue:none
    required RawKeyEventData data,

    /// optionalParameters: {String? character} , defaultValue:none
    String? character,

    /// optionalParameters: {bool repeat = false} , defaultValue:Literal
    bool repeat = false,
  }) : super(
          data: data,
          character: character,
          repeat: repeat,
        ) {
    mateCreateName = 'RawKeyDownEvent';
    matePackageUrl = 'package:flutter/services.dart';
    mateBuilder = (p) => RawKeyDownEvent$Mate(
          data: p.get('data').build(),
          character: p.get('character').build(),
          repeat: p.get('repeat').build(),
        );
    mateUse('data', data);
    mateUse('character', character);
    mateUse('repeat', repeat);
  }
}

/// class RawKeyUpEvent extends RawKeyEvent
class RawKeyUpEvent$Mate extends RawKeyUpEvent with Mate {
  /// RawKeyUpEvent RawKeyUpEvent({required RawKeyEventData data, String? character})
  RawKeyUpEvent$Mate({
    /// optionalParameters: {required RawKeyEventData data} , defaultValue:none
    required RawKeyEventData data,

    /// optionalParameters: {String? character} , defaultValue:none
    String? character,
  }) : super(
          data: data,
          character: character,
        ) {
    mateCreateName = 'RawKeyUpEvent';
    matePackageUrl = 'package:flutter/services.dart';
    mateBuilder = (p) => RawKeyUpEvent$Mate(
          data: p.get('data').build(),
          character: p.get('character').build(),
        );
    mateUse('data', data);
    mateUse('character', character);
  }
}
