// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/cupertino/thumb_painter.dart';
import 'package:note/mate.dart';
import 'dart:ui';
import 'dart:core';
import 'package:flutter/src/painting/box_shadow.dart';

/// class CupertinoThumbPainter
class CupertinoThumbPainter$Mate extends CupertinoThumbPainter with Mate {
  /// CupertinoThumbPainter CupertinoThumbPainter({Color color = CupertinoColors.white, List<BoxShadow> shadows = _kSliderBoxShadows})
  CupertinoThumbPainter$Mate({
    /// optionalParameters: {Color color = CupertinoColors.white} , hasDefaultValue:true, defaultValueCode:CupertinoColors.white
    required Color color,

    /// optionalParameters: {List<BoxShadow> shadows = _kSliderBoxShadows} , hasDefaultValue:true, defaultValueCode:_kSliderBoxShadows
    required List<BoxShadow> shadows,
  }) : super(
          color: color,
          shadows: shadows,
        ) {
    mateBuilder = (p) => CupertinoThumbPainter$Mate(
          color: p.get('color').build(),
          shadows: p.get('shadows').build(),
        );
    matePut('color', color);
    matePut('shadows', shadows);
  }

  /// CupertinoThumbPainter CupertinoThumbPainter.switchThumb({Color color = CupertinoColors.white, List<BoxShadow> shadows = _kSwitchBoxShadows})
  CupertinoThumbPainter$Mate.switchThumb({
    /// optionalParameters: {Color color = CupertinoColors.white} , hasDefaultValue:true, defaultValueCode:CupertinoColors.white
    required Color color,

    /// optionalParameters: {List<BoxShadow> shadows = _kSwitchBoxShadows} , hasDefaultValue:true, defaultValueCode:_kSwitchBoxShadows
    required List<BoxShadow> shadows,
  }) : super.switchThumb(
          color: color,
          shadows: shadows,
        ) {
    mateBuilder = (p) => CupertinoThumbPainter$Mate.switchThumb(
          color: p.get('color').build(),
          shadows: p.get('shadows').build(),
        );
    matePut('color', color);
    matePut('shadows', shadows);
  }
}