// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/services/clipboard.dart';
import 'package:note/mate.dart';
import 'dart:core';

/// class ClipboardData
class ClipboardData$Mate extends ClipboardData with Mate {
  /// ClipboardData ClipboardData({String? text})
  ClipboardData$Mate(
      {
      /// optionalParameters: {String? text} , defaultValue:none
      String? text})
      : super(text: text) {
    mateCreateName = 'ClipboardData';
    matePackageUrl = 'package:flutter/services.dart';
    mateBuilder = (p) => ClipboardData$Mate(text: p.get('text').build());
    mateUse('text', text, isNamed: true);
  }
}
