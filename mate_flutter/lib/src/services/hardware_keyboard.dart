// /// Generated by mat_flutter, please don't edit! Created time: 2023-03-09 00:16:00.467958

library;

import 'package:flutter/src/services/keyboard_key.g.dart';
import 'dart:core';
import 'package:flutter/src/services/hardware_keyboard.dart';
import 'package:flutter/src/services/raw_keyboard.dart';
export 'dart:ui' show KeyData;
export 'package:flutter/foundation.dart' show DiagnosticPropertiesBuilder;
export 'keyboard_key.g.dart' show LogicalKeyboardKey, PhysicalKeyboardKey;
export 'raw_keyboard.dart' show RawKeyEvent, RawKeyboard;

/// abstract class KeyEvent with Diagnosticable
abstract class KeyEventMate {
  /// KeyEvent KeyEvent({required PhysicalKeyboardKey physicalKey, required LogicalKeyboardKey logicalKey, String? character, required Duration timeStamp, bool synthesized = false})
  KeyEventMate({
// param: {required PhysicalKeyboardKey physicalKey}
    required PhysicalKeyboardKey physicalKey,
// param: {required LogicalKeyboardKey logicalKey}
    required LogicalKeyboardKey logicalKey,
// param: {String? character}
    String? character,
// param: {required Duration timeStamp}
    required Duration timeStamp,
// param: {bool synthesized = false}
    required bool synthesized,
  }) {}
}

/// class KeyDownEvent extends KeyEvent
class KeyDownEventMate {
  /// KeyDownEvent KeyDownEvent({required PhysicalKeyboardKey physicalKey, required LogicalKeyboardKey logicalKey, String? character, required Duration timeStamp, bool synthesized = false})
  KeyDownEventMate({
// param: {required PhysicalKeyboardKey physicalKey}
    required PhysicalKeyboardKey physicalKey,
// param: {required LogicalKeyboardKey logicalKey}
    required LogicalKeyboardKey logicalKey,
// param: {String? character}
    String? character,
// param: {required Duration timeStamp}
    required Duration timeStamp,
// param: {bool synthesized = false}
    required bool synthesized,
  }) {}
}

/// class KeyUpEvent extends KeyEvent
class KeyUpEventMate {
  /// KeyUpEvent KeyUpEvent({required PhysicalKeyboardKey physicalKey, required LogicalKeyboardKey logicalKey, required Duration timeStamp, bool synthesized = false})
  KeyUpEventMate({
// param: {required PhysicalKeyboardKey physicalKey}
    required PhysicalKeyboardKey physicalKey,
// param: {required LogicalKeyboardKey logicalKey}
    required LogicalKeyboardKey logicalKey,
// param: {required Duration timeStamp}
    required Duration timeStamp,
// param: {bool synthesized = false}
    required bool synthesized,
  }) {}
}

/// class KeyRepeatEvent extends KeyEvent
class KeyRepeatEventMate {
  /// KeyRepeatEvent KeyRepeatEvent({required PhysicalKeyboardKey physicalKey, required LogicalKeyboardKey logicalKey, String? character, required Duration timeStamp})
  KeyRepeatEventMate({
// param: {required PhysicalKeyboardKey physicalKey}
    required PhysicalKeyboardKey physicalKey,
// param: {required LogicalKeyboardKey logicalKey}
    required LogicalKeyboardKey logicalKey,
// param: {String? character}
    String? character,
// param: {required Duration timeStamp}
    required Duration timeStamp,
  }) {}
}

/// class HardwareKeyboard
class HardwareKeyboardMate {
  /// HardwareKeyboard HardwareKeyboard()
  HardwareKeyboardMate() {}
}

/// class KeyMessage
class KeyMessageMate {
  /// KeyMessage KeyMessage(List<KeyEvent> events, RawKeyEvent? rawEvent)
  KeyMessageMate(
// param: List<KeyEvent> events
    List<KeyEvent> events,
// param: RawKeyEvent? rawEvent
    RawKeyEvent? rawEvent,
  ) {}
}

/// class KeyEventManager
class KeyEventManagerMate {
  /// KeyEventManager KeyEventManager(HardwareKeyboard _hardwareKeyboard, RawKeyboard _rawKeyboard)
  KeyEventManagerMate(
// param: HardwareKeyboard _hardwareKeyboard
    HardwareKeyboard _hardwareKeyboard,
// param: RawKeyboard _rawKeyboard
    RawKeyboard _rawKeyboard,
  ) {}
}
