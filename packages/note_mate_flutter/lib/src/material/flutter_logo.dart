// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/flutter_logo.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/src/painting/flutter_logo.dart';
import 'package:flutter/src/animation/curves.dart';

/// class FlutterLogo extends StatelessWidget
class FlutterLogo$Mate extends FlutterLogo with Mate {
  /// FlutterLogo FlutterLogo({Key? key, double? size, Color textColor = const Color(0xFF757575), FlutterLogoStyle style = FlutterLogoStyle.markOnly, Duration duration = const Duration(milliseconds: 750), Curve curve = Curves.fastOutSlowIn})
  FlutterLogo$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {double? size} , defaultValue:none
    double? size,

    /// optionalParameters: {Color textColor = const Color(0xFF757575)} , defaultValue:unprocessed
    required Color textColor,

    /// optionalParameters: {FlutterLogoStyle style = FlutterLogoStyle.markOnly} , defaultValue:unprocessed
    required FlutterLogoStyle style,

    /// optionalParameters: {Duration duration = const Duration(milliseconds: 750)} , defaultValue:unprocessed
    required Duration duration,

    /// optionalParameters: {Curve curve = Curves.fastOutSlowIn} , defaultValue:unprocessed
    required Curve curve,
  }) : super(
          key: key,
          size: size,
          textColor: textColor,
          style: style,
          duration: duration,
          curve: curve,
        ) {
    mateCreateName = 'FlutterLogo';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => FlutterLogo$Mate(
          key: p.get('key').build(),
          size: p.get('size').build(),
          textColor: p.get('textColor').build(),
          style: p.get('style').build(),
          duration: p.get('duration').build(),
          curve: p.get('curve').build(),
        );
    mateUse('key', key);
    mateUse('size', size);
    mateUse('textColor', textColor);
    mateUse('style', style);
    mateUse('duration', duration);
    mateUse('curve', curve);
  }
}
