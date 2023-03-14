// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/circle_avatar.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:ui';
import 'package:flutter/src/painting/image_provider.dart';
import 'dart:core';
import 'package:flutter/src/painting/image_stream.dart';
import 'package:note/mate.dart';

/// class CircleAvatar extends StatelessWidget
class CircleAvatar$Mate extends CircleAvatar with WidgetMate<CircleAvatar$Mate> {
  /// CircleAvatar CircleAvatar({Key? key, Widget? child, Color? backgroundColor, ImageProvider<Object>? backgroundImage, ImageProvider<Object>? foregroundImage, void Function(Object, StackTrace?)? onBackgroundImageError, void Function(Object, StackTrace?)? onForegroundImageError, Color? foregroundColor, double? radius, double? minRadius, double? maxRadius})
  CircleAvatar$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {Widget? child} , hasDefaultValue:false, defaultValueCode:null
    Widget? child,

    /// optionalParameters: {Color? backgroundColor} , hasDefaultValue:false, defaultValueCode:null
    Color? backgroundColor,

    /// optionalParameters: {ImageProvider<Object>? backgroundImage} , hasDefaultValue:false, defaultValueCode:null
    ImageProvider<Object>? backgroundImage,

    /// optionalParameters: {ImageProvider<Object>? foregroundImage} , hasDefaultValue:false, defaultValueCode:null
    ImageProvider<Object>? foregroundImage,

    /// optionalParameters: {void Function(Object, StackTrace?)? onBackgroundImageError} , hasDefaultValue:false, defaultValueCode:null
    ImageErrorListener? onBackgroundImageError,

    /// optionalParameters: {void Function(Object, StackTrace?)? onForegroundImageError} , hasDefaultValue:false, defaultValueCode:null
    ImageErrorListener? onForegroundImageError,

    /// optionalParameters: {Color? foregroundColor} , hasDefaultValue:false, defaultValueCode:null
    Color? foregroundColor,

    /// optionalParameters: {double? radius} , hasDefaultValue:false, defaultValueCode:null
    double? radius,

    /// optionalParameters: {double? minRadius} , hasDefaultValue:false, defaultValueCode:null
    double? minRadius,

    /// optionalParameters: {double? maxRadius} , hasDefaultValue:false, defaultValueCode:null
    double? maxRadius,
  }) : super(
          key: key,
          child: child,
          backgroundColor: backgroundColor,
          backgroundImage: backgroundImage,
          foregroundImage: foregroundImage,
          onBackgroundImageError: onBackgroundImageError,
          onForegroundImageError: onForegroundImageError,
          foregroundColor: foregroundColor,
          radius: radius,
          minRadius: minRadius,
          maxRadius: maxRadius,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => CircleAvatar$Mate(
        key: p.getValue('key'),
        child: p.getValue('child'),
        backgroundColor: p.getValue('backgroundColor'),
        backgroundImage: p.getValue('backgroundImage'),
        foregroundImage: p.getValue('foregroundImage'),
        onBackgroundImageError: p.getValue('onBackgroundImageError'),
        onForegroundImageError: p.getValue('onForegroundImageError'),
        foregroundColor: p.getValue('foregroundColor'),
        radius: p.getValue('radius'),
        minRadius: p.getValue('minRadius'),
        maxRadius: p.getValue('maxRadius'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'child', init: child);
    mateParams.set(name: 'backgroundColor', init: backgroundColor);
    mateParams.set(name: 'backgroundImage', init: backgroundImage);
    mateParams.set(name: 'foregroundImage', init: foregroundImage);
    mateParams.set(name: 'onBackgroundImageError', init: onBackgroundImageError);
    mateParams.set(name: 'onForegroundImageError', init: onForegroundImageError);
    mateParams.set(name: 'foregroundColor', init: foregroundColor);
    mateParams.set(name: 'radius', init: radius);
    mateParams.set(name: 'minRadius', init: minRadius);
    mateParams.set(name: 'maxRadius', init: maxRadius);
  }
}
