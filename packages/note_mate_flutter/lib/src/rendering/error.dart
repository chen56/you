// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/rendering/error.dart';
import 'package:note/mate.dart';
import 'dart:core';

/// class RenderErrorBox extends RenderBox
class RenderErrorBox$Mate extends RenderErrorBox with Mate {
  /// RenderErrorBox RenderErrorBox([String message = ''])
  RenderErrorBox$Mate(

      /// requiredParameters: [String message = '']
      String message)
      : super(message) {
    mateCreateName = 'RenderErrorBox';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => RenderErrorBox$Mate(p.get('message').value);
    mateUse('message', message);
  }
}
