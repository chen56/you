// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/services/raw_keyboard_fuchsia.dart';
import 'dart:core';
import 'package:note/mate.dart';
export 'package:flutter/foundation.dart' show DiagnosticPropertiesBuilder;
export 'keyboard_key.g.dart' show LogicalKeyboardKey, PhysicalKeyboardKey;
export 'raw_keyboard.dart' show KeyboardSide, ModifierKey;

/// class RawKeyEventDataFuchsia extends RawKeyEventData
class RawKeyEventDataFuchsia$Mate extends RawKeyEventDataFuchsia with Mate<RawKeyEventDataFuchsia$Mate> {
  /// RawKeyEventDataFuchsia RawKeyEventDataFuchsia({int hidUsage = 0, int codePoint = 0, int modifiers = 0})
  RawKeyEventDataFuchsia$Mate({
    /// param: {int hidUsage = 0}
    required int hidUsage,

    /// param: {int codePoint = 0}
    required int codePoint,

    /// param: {int modifiers = 0}
    required int modifiers,
  }) : super(
          hidUsage: hidUsage,
          codePoint: codePoint,
          modifiers: modifiers,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => RawKeyEventDataFuchsia$Mate(
        hidUsage: p.getValue('hidUsage'),
        codePoint: p.getValue('codePoint'),
        modifiers: p.getValue('modifiers'),
      ),
    );
    mateParams.set(name: 'hidUsage', init: hidUsage);
    mateParams.set(name: 'codePoint', init: codePoint);
    mateParams.set(name: 'modifiers', init: modifiers);
  }
}
