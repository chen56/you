// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/services/keyboard_key.g.dart';
import 'dart:core';
import 'package:note/mate.dart';
export 'package:flutter/foundation.dart' show DiagnosticPropertiesBuilder;

/// class LogicalKeyboardKey extends KeyboardKey
class LogicalKeyboardKey$Mate extends LogicalKeyboardKey with Mate<LogicalKeyboardKey$Mate> {
  /// LogicalKeyboardKey LogicalKeyboardKey(int keyId)
  LogicalKeyboardKey$Mate(

      /// param: int keyId
      int keyId)
      : super(keyId) {
    mateParams = Params(
      init: this,
      builder: (p) => LogicalKeyboardKey$Mate(p.getValue('keyId')),
    );
    mateParams.set(name: 'keyId', init: keyId);
  }
}

/// class PhysicalKeyboardKey extends KeyboardKey
class PhysicalKeyboardKey$Mate extends PhysicalKeyboardKey with Mate<PhysicalKeyboardKey$Mate> {
  /// PhysicalKeyboardKey PhysicalKeyboardKey(int usbHidUsage)
  PhysicalKeyboardKey$Mate(

      /// param: int usbHidUsage
      int usbHidUsage)
      : super(usbHidUsage) {
    mateParams = Params(
      init: this,
      builder: (p) => PhysicalKeyboardKey$Mate(p.getValue('usbHidUsage')),
    );
    mateParams.set(name: 'usbHidUsage', init: usbHidUsage);
  }
}
