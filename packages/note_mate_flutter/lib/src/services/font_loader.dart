// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/services/font_loader.dart';
import 'package:note/mate.dart';
import 'dart:core';

/// class FontLoader
class FontLoader$Mate extends FontLoader with Mate {
  /// FontLoader FontLoader(String family)
  FontLoader$Mate(

      /// requiredParameters: String family
      String family)
      : super(family) {
    mateCreateName = 'FontLoader';
    matePackageUrl = 'package:flutter/services.dart';
    mateBuilder = (p) => FontLoader$Mate(p.get('family').value);
    mateUse('family', family, isNamed: false);
  }
}
