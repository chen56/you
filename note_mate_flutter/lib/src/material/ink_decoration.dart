// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/ink_decoration.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'dart:ui';
import 'package:flutter/src/painting/decoration.dart';
import 'dart:core';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/painting/image_provider.dart';
import 'package:flutter/src/painting/image_stream.dart';
import 'package:flutter/src/painting/box_fit.dart';
import 'package:flutter/src/painting/alignment.dart';
import 'package:flutter/src/painting/decoration_image.dart';
import 'package:flutter/src/material/material.dart';
import 'package:flutter/src/rendering/box.dart';

/// class Ink extends StatefulWidget
class Ink$Mate extends Ink with WidgetMate<Ink$Mate> {
  /// Ink Ink({Key? key, EdgeInsetsGeometry? padding, Color? color, Decoration? decoration, double? width, double? height, Widget? child})
  Ink$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {EdgeInsetsGeometry? padding} , hasDefaultValue:false, defaultValueCode:null
    EdgeInsetsGeometry? padding,

    /// optionalParameters: {Color? color} , hasDefaultValue:false, defaultValueCode:null
    Color? color,

    /// optionalParameters: {Decoration? decoration} , hasDefaultValue:false, defaultValueCode:null
    Decoration? decoration,

    /// optionalParameters: {double? width} , hasDefaultValue:false, defaultValueCode:null
    double? width,

    /// optionalParameters: {double? height} , hasDefaultValue:false, defaultValueCode:null
    double? height,

    /// optionalParameters: {Widget? child} , hasDefaultValue:false, defaultValueCode:null
    Widget? child,
  }) : super(
          key: key,
          padding: padding,
          color: color,
          decoration: decoration,
          width: width,
          height: height,
          child: child,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => Ink$Mate(
        key: p.get('key').value,
        padding: p.get('padding').value,
        color: p.get('color').value,
        decoration: p.get('decoration').value,
        width: p.get('width').value,
        height: p.get('height').value,
        child: p.get('child').value,
      ),
    );
    mateParams.put('key', key);
    mateParams.put('padding', padding);
    mateParams.put('color', color);
    mateParams.put('decoration', decoration);
    mateParams.put('width', width);
    mateParams.put('height', height);
    mateParams.put('child', child);
  }

  /// Ink Ink.image({Key? key, EdgeInsetsGeometry? padding, required ImageProvider<Object> image, void Function(Object, StackTrace?)? onImageError, ColorFilter? colorFilter, BoxFit? fit, AlignmentGeometry alignment = Alignment.center, Rect? centerSlice, ImageRepeat repeat = ImageRepeat.noRepeat, bool matchTextDirection = false, double? width, double? height, Widget? child})
  Ink$Mate.image({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {EdgeInsetsGeometry? padding} , hasDefaultValue:false, defaultValueCode:null
    EdgeInsetsGeometry? padding,

    /// optionalParameters: {required ImageProvider<Object> image} , hasDefaultValue:false, defaultValueCode:null
    required ImageProvider<Object> image,

    /// optionalParameters: {void Function(Object, StackTrace?)? onImageError} , hasDefaultValue:false, defaultValueCode:null
    ImageErrorListener? onImageError,

    /// optionalParameters: {ColorFilter? colorFilter} , hasDefaultValue:false, defaultValueCode:null
    ColorFilter? colorFilter,

    /// optionalParameters: {BoxFit? fit} , hasDefaultValue:false, defaultValueCode:null
    BoxFit? fit,

    /// optionalParameters: {AlignmentGeometry alignment = Alignment.center} , hasDefaultValue:true, defaultValueCode:Alignment.center
    required AlignmentGeometry alignment,

    /// optionalParameters: {Rect? centerSlice} , hasDefaultValue:false, defaultValueCode:null
    Rect? centerSlice,

    /// optionalParameters: {ImageRepeat repeat = ImageRepeat.noRepeat} , hasDefaultValue:true, defaultValueCode:ImageRepeat.noRepeat
    required ImageRepeat repeat,

    /// optionalParameters: {bool matchTextDirection = false} , hasDefaultValue:true, defaultValueCode:false
    required bool matchTextDirection,

    /// optionalParameters: {double? width} , hasDefaultValue:false, defaultValueCode:null
    double? width,

    /// optionalParameters: {double? height} , hasDefaultValue:false, defaultValueCode:null
    double? height,

    /// optionalParameters: {Widget? child} , hasDefaultValue:false, defaultValueCode:null
    Widget? child,
  }) : super.image(
          key: key,
          padding: padding,
          image: image,
          onImageError: onImageError,
          colorFilter: colorFilter,
          fit: fit,
          alignment: alignment,
          centerSlice: centerSlice,
          repeat: repeat,
          matchTextDirection: matchTextDirection,
          width: width,
          height: height,
          child: child,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => Ink$Mate.image(
        key: p.get('key').value,
        padding: p.get('padding').value,
        image: p.get('image').value,
        onImageError: p.get('onImageError').value,
        colorFilter: p.get('colorFilter').value,
        fit: p.get('fit').value,
        alignment: p.get('alignment').value,
        centerSlice: p.get('centerSlice').value,
        repeat: p.get('repeat').value,
        matchTextDirection: p.get('matchTextDirection').value,
        width: p.get('width').value,
        height: p.get('height').value,
        child: p.get('child').value,
      ),
    );
    mateParams.put('key', key);
    mateParams.put('padding', padding);
    mateParams.put('image', image);
    mateParams.put('onImageError', onImageError);
    mateParams.put('colorFilter', colorFilter);
    mateParams.put('fit', fit);
    mateParams.put('alignment', alignment);
    mateParams.put('centerSlice', centerSlice);
    mateParams.put('repeat', repeat);
    mateParams.put('matchTextDirection', matchTextDirection);
    mateParams.put('width', width);
    mateParams.put('height', height);
    mateParams.put('child', child);
  }
}

/// class InkDecoration extends InkFeature
class InkDecoration$Mate extends InkDecoration with Mate<InkDecoration$Mate> {
  /// InkDecoration InkDecoration({required Decoration? decoration, required ImageConfiguration configuration, required MaterialInkController controller, required RenderBox referenceBox, void Function()? onRemoved})
  InkDecoration$Mate({
    /// optionalParameters: {required Decoration? decoration} , hasDefaultValue:false, defaultValueCode:null
    required Decoration? decoration,

    /// optionalParameters: {required ImageConfiguration configuration} , hasDefaultValue:false, defaultValueCode:null
    required ImageConfiguration configuration,

    /// optionalParameters: {required MaterialInkController controller} , hasDefaultValue:false, defaultValueCode:null
    required MaterialInkController controller,

    /// optionalParameters: {required RenderBox referenceBox} , hasDefaultValue:false, defaultValueCode:null
    required RenderBox referenceBox,

    /// optionalParameters: {void Function()? onRemoved} , hasDefaultValue:false, defaultValueCode:null
    VoidCallback? onRemoved,
  }) : super(
          decoration: decoration,
          configuration: configuration,
          controller: controller,
          referenceBox: referenceBox,
          onRemoved: onRemoved,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => InkDecoration$Mate(
        decoration: p.get('decoration').value,
        configuration: p.get('configuration').value,
        controller: p.get('controller').value,
        referenceBox: p.get('referenceBox').value,
        onRemoved: p.get('onRemoved').value,
      ),
    );
    mateParams.put('decoration', decoration);
    mateParams.put('configuration', configuration);
    mateParams.put('controller', controller);
    mateParams.put('referenceBox', referenceBox);
    mateParams.put('onRemoved', onRemoved);
  }
}
