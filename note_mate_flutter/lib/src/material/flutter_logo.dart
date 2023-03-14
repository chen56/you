// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/flutter_logo.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/src/painting/flutter_logo.dart';
import 'package:flutter/src/animation/curves.dart';
import 'package:note/mate.dart';

/// class FlutterLogo extends StatelessWidget
class FlutterLogo$Mate extends FlutterLogo with WidgetMate<FlutterLogo$Mate> {
  /// FlutterLogo FlutterLogo({Key? key, double? size, Color textColor = const Color(0xFF757575), FlutterLogoStyle style = FlutterLogoStyle.markOnly, Duration duration = const Duration(milliseconds: 750), Curve curve = Curves.fastOutSlowIn})
  FlutterLogo$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {double? size} , hasDefaultValue:false, defaultValueCode:null
    double? size,

    /// optionalParameters: {Color textColor = const Color(0xFF757575)} , hasDefaultValue:true, defaultValueCode:const Color(0xFF757575)
    required Color textColor,

    /// optionalParameters: {FlutterLogoStyle style = FlutterLogoStyle.markOnly} , hasDefaultValue:true, defaultValueCode:FlutterLogoStyle.markOnly
    required FlutterLogoStyle style,

    /// optionalParameters: {Duration duration = const Duration(milliseconds: 750)} , hasDefaultValue:true, defaultValueCode:const Duration(milliseconds: 750)
    required Duration duration,

    /// optionalParameters: {Curve curve = Curves.fastOutSlowIn} , hasDefaultValue:true, defaultValueCode:Curves.fastOutSlowIn
    required Curve curve,
  }) : super(
          key: key,
          size: size,
          textColor: textColor,
          style: style,
          duration: duration,
          curve: curve,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => FlutterLogo$Mate(
        key: p.getValue('key'),
        size: p.getValue('size'),
        textColor: p.getValue('textColor'),
        style: p.getValue('style'),
        duration: p.getValue('duration'),
        curve: p.getValue('curve'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'size', init: size);
    mateParams.set(name: 'textColor', init: textColor);
    mateParams.set(name: 'style', init: style);
    mateParams.set(name: 'duration', init: duration);
    mateParams.set(name: 'curve', init: curve);
  }
}
