// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/cupertino/slider.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:core';
import 'package:flutter/src/foundation/basic_types.dart';
import 'dart:ui';

/// class CupertinoSlider extends StatefulWidget
class CupertinoSlider$Mate extends CupertinoSlider with Mate {
  /// CupertinoSlider CupertinoSlider({Key? key, required double value, required void Function(double)? onChanged, void Function(double)? onChangeStart, void Function(double)? onChangeEnd, double min = 0.0, double max = 1.0, int? divisions, Color? activeColor, Color thumbColor = CupertinoColors.white})
  CupertinoSlider$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required double value} , defaultValue:none
    required double value,

    /// optionalParameters: {required void Function(double)? onChanged} , defaultValue:none
    required ValueChanged<double>? onChanged,

    /// optionalParameters: {void Function(double)? onChangeStart} , defaultValue:none
    ValueChanged<double>? onChangeStart,

    /// optionalParameters: {void Function(double)? onChangeEnd} , defaultValue:none
    ValueChanged<double>? onChangeEnd,

    /// optionalParameters: {double min = 0.0} , defaultValue:Literal
    double min = 0.0,

    /// optionalParameters: {double max = 1.0} , defaultValue:Literal
    double max = 1.0,

    /// optionalParameters: {int? divisions} , defaultValue:none
    int? divisions,

    /// optionalParameters: {Color? activeColor} , defaultValue:none
    Color? activeColor,

    /// optionalParameters: {Color thumbColor = CupertinoColors.white} , defaultValue:unprocessed
    required Color thumbColor,
  }) : super(
          key: key,
          value: value,
          onChanged: onChanged,
          onChangeStart: onChangeStart,
          onChangeEnd: onChangeEnd,
          min: min,
          max: max,
          divisions: divisions,
          activeColor: activeColor,
          thumbColor: thumbColor,
        ) {
    mateCreateName = 'CupertinoSlider';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => CupertinoSlider$Mate(
          key: p.get('key').build(),
          value: p.get('value').build(),
          onChanged: p.get('onChanged').build(),
          onChangeStart: p.get('onChangeStart').build(),
          onChangeEnd: p.get('onChangeEnd').build(),
          min: p.get('min').build(),
          max: p.get('max').build(),
          divisions: p.get('divisions').build(),
          activeColor: p.get('activeColor').build(),
          thumbColor: p.get('thumbColor').build(),
        );
    mateUse('key', key);
    mateUse('value', value);
    mateUse('onChanged', onChanged);
    mateUse('onChangeStart', onChangeStart);
    mateUse('onChangeEnd', onChangeEnd);
    mateUse('min', min);
    mateUse('max', max);
    mateUse('divisions', divisions);
    mateUse('activeColor', activeColor);
    mateUse('thumbColor', thumbColor);
  }
}
