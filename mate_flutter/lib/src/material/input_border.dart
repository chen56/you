// /// Generated by mat_flutter, please don't edit! Created time: 2023-03-09 00:16:00.075

library;

import 'package:flutter/src/painting/borders.dart';
import 'package:flutter/src/painting/border_radius.dart';
import 'dart:core';

/// abstract class InputBorder extends ShapeBorder
abstract class InputBorderMate {
  /// InputBorder InputBorder({BorderSide borderSide = BorderSide.none})
  InputBorderMate(
      {
// param: {BorderSide borderSide = BorderSide.none}
      required BorderSide borderSide}) {}
}

/// class UnderlineInputBorder extends InputBorder
class UnderlineInputBorderMate {
  /// UnderlineInputBorder UnderlineInputBorder({BorderSide borderSide = const BorderSide(), BorderRadius borderRadius = const BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0))})
  UnderlineInputBorderMate({
// param: {BorderSide borderSide = const BorderSide()}
    required BorderSide borderSide,
// param: {BorderRadius borderRadius = const BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0))}
    required BorderRadius borderRadius,
  }) {}
}

/// class OutlineInputBorder extends InputBorder
class OutlineInputBorderMate {
  /// OutlineInputBorder OutlineInputBorder({BorderSide borderSide = const BorderSide(), BorderRadius borderRadius = const BorderRadius.all(Radius.circular(4.0)), double gapPadding = 4.0})
  OutlineInputBorderMate({
// param: {BorderSide borderSide = const BorderSide()}
    required BorderSide borderSide,
// param: {BorderRadius borderRadius = const BorderRadius.all(Radius.circular(4.0))}
    required BorderRadius borderRadius,
// param: {double gapPadding = 4.0}
    required double gapPadding,
  }) {}
}
