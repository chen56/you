// /// Generated by gen_maters.dart, please don't edit!

import 'dart:core';
import 'package:flutter/src/widgets/annotated_region.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

/// class AnnotatedRegion<T extends Object> extends SingleChildRenderObjectWidget
class AnnotatedRegion$Mate<T extends Object> extends AnnotatedRegion<T> with Mate {
  /// AnnotatedRegion<T> AnnotatedRegion({Key? key, required Widget child, required T value, bool sized = true})
  AnnotatedRegion$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,

    /// optionalParameters: {required T value} , defaultValue:none
    required T value,

    /// optionalParameters: {bool sized = true} , defaultValue:Literal
    bool sized = true,
  }) : super(
          key: key,
          child: child,
          value: value,
          sized: sized,
        ) {
    mateCreateName = 'AnnotatedRegion';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => AnnotatedRegion$Mate<T>(
          key: p.get('key').build(),
          child: p.get('child').build(),
          value: p.get('value').build(),
          sized: p.get('sized').build(),
        );
    mateUse('key', key);
    mateUse('child', child);
    mateUse('value', value);
    mateUse('sized', sized);
  }
}
