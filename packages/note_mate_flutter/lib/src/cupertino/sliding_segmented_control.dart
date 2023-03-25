// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/cupertino/sliding_segmented_control.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:core';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/basic_types.dart';
import 'dart:ui';
import 'package:flutter/src/painting/edge_insets.dart';

/// class CupertinoSlidingSegmentedControl<T> extends StatefulWidget
class CupertinoSlidingSegmentedControl$Mate<T> extends CupertinoSlidingSegmentedControl<T> with Mate {
  /// CupertinoSlidingSegmentedControl<T> CupertinoSlidingSegmentedControl({Key? key, required Map<T, Widget> children, required void Function(T?) onValueChanged, T? groupValue, Color thumbColor = _kThumbColor, EdgeInsetsGeometry padding = _kHorizontalItemPadding, Color backgroundColor = CupertinoColors.tertiarySystemFill})
  CupertinoSlidingSegmentedControl$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required Map<T, Widget> children} , hasDefaultValue:false, defaultValueCode:null
    required Map<T, Widget> children,

    /// optionalParameters: {required void Function(T?) onValueChanged} , hasDefaultValue:false, defaultValueCode:null
    required ValueChanged<T?> onValueChanged,

    /// optionalParameters: {T? groupValue} , hasDefaultValue:false, defaultValueCode:null
    T? groupValue,

    /// optionalParameters: {Color thumbColor = _kThumbColor} , hasDefaultValue:true, defaultValueCode:_kThumbColor
    required Color thumbColor,

    /// optionalParameters: {EdgeInsetsGeometry padding = _kHorizontalItemPadding} , hasDefaultValue:true, defaultValueCode:_kHorizontalItemPadding
    required EdgeInsetsGeometry padding,

    /// optionalParameters: {Color backgroundColor = CupertinoColors.tertiarySystemFill} , hasDefaultValue:true, defaultValueCode:CupertinoColors.tertiarySystemFill
    required Color backgroundColor,
  }) : super(
          key: key,
          children: children,
          onValueChanged: onValueChanged,
          groupValue: groupValue,
          thumbColor: thumbColor,
          padding: padding,
          backgroundColor: backgroundColor,
        ) {
    mateBuilder = (p) => CupertinoSlidingSegmentedControl$Mate<T>(
          key: p.get('key').build(),
          children: p.get('children').build(),
          onValueChanged: p.get('onValueChanged').build(),
          groupValue: p.get('groupValue').build(),
          thumbColor: p.get('thumbColor').build(),
          padding: p.get('padding').build(),
          backgroundColor: p.get('backgroundColor').build(),
        );
    matePut('key', key);
    matePut('children', children);
    matePut('onValueChanged', onValueChanged);
    matePut('groupValue', groupValue);
    matePut('thumbColor', thumbColor);
    matePut('padding', padding);
    matePut('backgroundColor', backgroundColor);
  }
}