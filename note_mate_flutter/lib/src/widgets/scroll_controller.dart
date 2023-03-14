// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/scroll_controller.dart';
import 'dart:core';
import 'package:note/mate.dart';

/// class ScrollController extends ChangeNotifier
class ScrollController$Mate extends ScrollController with Mate<ScrollController$Mate> {
  /// ScrollController ScrollController({double initialScrollOffset = 0.0, bool keepScrollOffset = true, String? debugLabel})
  ScrollController$Mate({
    /// optionalParameters: {double initialScrollOffset = 0.0} , hasDefaultValue:true, defaultValueCode:0.0
    required double initialScrollOffset,

    /// optionalParameters: {bool keepScrollOffset = true} , hasDefaultValue:true, defaultValueCode:true
    required bool keepScrollOffset,

    /// optionalParameters: {String? debugLabel} , hasDefaultValue:false, defaultValueCode:null
    String? debugLabel,
  }) : super(
          initialScrollOffset: initialScrollOffset,
          keepScrollOffset: keepScrollOffset,
          debugLabel: debugLabel,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ScrollController$Mate(
        initialScrollOffset: p.getValue('initialScrollOffset'),
        keepScrollOffset: p.getValue('keepScrollOffset'),
        debugLabel: p.getValue('debugLabel'),
      ),
    );
    mateParams.set(name: 'initialScrollOffset', init: initialScrollOffset);
    mateParams.set(name: 'keepScrollOffset', init: keepScrollOffset);
    mateParams.set(name: 'debugLabel', init: debugLabel);
  }
}

/// class TrackingScrollController extends ScrollController
class TrackingScrollController$Mate extends TrackingScrollController with Mate<TrackingScrollController$Mate> {
  /// TrackingScrollController TrackingScrollController({double initialScrollOffset = 0.0, bool keepScrollOffset = true, String? debugLabel})
  TrackingScrollController$Mate({
    /// optionalParameters: {double initialScrollOffset = 0.0} , hasDefaultValue:true, defaultValueCode:0.0
    required double initialScrollOffset,

    /// optionalParameters: {bool keepScrollOffset = true} , hasDefaultValue:true, defaultValueCode:true
    required bool keepScrollOffset,

    /// optionalParameters: {String? debugLabel} , hasDefaultValue:false, defaultValueCode:null
    String? debugLabel,
  }) : super(
          initialScrollOffset: initialScrollOffset,
          keepScrollOffset: keepScrollOffset,
          debugLabel: debugLabel,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => TrackingScrollController$Mate(
        initialScrollOffset: p.getValue('initialScrollOffset'),
        keepScrollOffset: p.getValue('keepScrollOffset'),
        debugLabel: p.getValue('debugLabel'),
      ),
    );
    mateParams.set(name: 'initialScrollOffset', init: initialScrollOffset);
    mateParams.set(name: 'keepScrollOffset', init: keepScrollOffset);
    mateParams.set(name: 'debugLabel', init: debugLabel);
  }
}
