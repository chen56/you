// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/viewport.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/painting/basic_types.dart';
import 'dart:core';
import 'package:flutter/src/rendering/viewport_offset.dart';
import 'package:flutter/src/rendering/viewport.dart';
import 'dart:ui';
import 'package:flutter/src/widgets/framework.dart';

/// class Viewport extends MultiChildRenderObjectWidget
class Viewport$Mate extends Viewport with Mate {
  /// Viewport Viewport({Key? key, AxisDirection axisDirection = AxisDirection.down, AxisDirection? crossAxisDirection, double anchor = 0.0, required ViewportOffset offset, Key? center, double? cacheExtent, CacheExtentStyle cacheExtentStyle = CacheExtentStyle.pixel, Clip clipBehavior = Clip.hardEdge, List<Widget> slivers = const <Widget>[]})
  Viewport$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {AxisDirection axisDirection = AxisDirection.down} , hasDefaultValue:true, defaultValueCode:AxisDirection.down
    required AxisDirection axisDirection,

    /// optionalParameters: {AxisDirection? crossAxisDirection} , hasDefaultValue:false, defaultValueCode:null
    AxisDirection? crossAxisDirection,

    /// optionalParameters: {double anchor = 0.0} , hasDefaultValue:true, defaultValueCode:0.0
    required double anchor,

    /// optionalParameters: {required ViewportOffset offset} , hasDefaultValue:false, defaultValueCode:null
    required ViewportOffset offset,

    /// optionalParameters: {Key? center} , hasDefaultValue:false, defaultValueCode:null
    Key? center,

    /// optionalParameters: {double? cacheExtent} , hasDefaultValue:false, defaultValueCode:null
    double? cacheExtent,

    /// optionalParameters: {CacheExtentStyle cacheExtentStyle = CacheExtentStyle.pixel} , hasDefaultValue:true, defaultValueCode:CacheExtentStyle.pixel
    required CacheExtentStyle cacheExtentStyle,

    /// optionalParameters: {Clip clipBehavior = Clip.hardEdge} , hasDefaultValue:true, defaultValueCode:Clip.hardEdge
    required Clip clipBehavior,

    /// optionalParameters: {List<Widget> slivers = const <Widget>[]} , hasDefaultValue:true, defaultValueCode:const <Widget>[]
    required List<Widget> slivers,
  }) : super(
          key: key,
          axisDirection: axisDirection,
          crossAxisDirection: crossAxisDirection,
          anchor: anchor,
          offset: offset,
          center: center,
          cacheExtent: cacheExtent,
          cacheExtentStyle: cacheExtentStyle,
          clipBehavior: clipBehavior,
          slivers: slivers,
        ) {
    mateBuilder = (p) => Viewport$Mate(
          key: p.get('key').build(),
          axisDirection: p.get('axisDirection').build(),
          crossAxisDirection: p.get('crossAxisDirection').build(),
          anchor: p.get('anchor').build(),
          offset: p.get('offset').build(),
          center: p.get('center').build(),
          cacheExtent: p.get('cacheExtent').build(),
          cacheExtentStyle: p.get('cacheExtentStyle').build(),
          clipBehavior: p.get('clipBehavior').build(),
          slivers: p.get('slivers').build(),
        );
    matePut('key', key);
    matePut('axisDirection', axisDirection);
    matePut('crossAxisDirection', crossAxisDirection);
    matePut('anchor', anchor);
    matePut('offset', offset);
    matePut('center', center);
    matePut('cacheExtent', cacheExtent);
    matePut('cacheExtentStyle', cacheExtentStyle);
    matePut('clipBehavior', clipBehavior);
    matePut('slivers', slivers);
  }
}

/// class ShrinkWrappingViewport extends MultiChildRenderObjectWidget
class ShrinkWrappingViewport$Mate extends ShrinkWrappingViewport with Mate {
  /// ShrinkWrappingViewport ShrinkWrappingViewport({Key? key, AxisDirection axisDirection = AxisDirection.down, AxisDirection? crossAxisDirection, required ViewportOffset offset, Clip clipBehavior = Clip.hardEdge, List<Widget> slivers = const <Widget>[]})
  ShrinkWrappingViewport$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {AxisDirection axisDirection = AxisDirection.down} , hasDefaultValue:true, defaultValueCode:AxisDirection.down
    required AxisDirection axisDirection,

    /// optionalParameters: {AxisDirection? crossAxisDirection} , hasDefaultValue:false, defaultValueCode:null
    AxisDirection? crossAxisDirection,

    /// optionalParameters: {required ViewportOffset offset} , hasDefaultValue:false, defaultValueCode:null
    required ViewportOffset offset,

    /// optionalParameters: {Clip clipBehavior = Clip.hardEdge} , hasDefaultValue:true, defaultValueCode:Clip.hardEdge
    required Clip clipBehavior,

    /// optionalParameters: {List<Widget> slivers = const <Widget>[]} , hasDefaultValue:true, defaultValueCode:const <Widget>[]
    required List<Widget> slivers,
  }) : super(
          key: key,
          axisDirection: axisDirection,
          crossAxisDirection: crossAxisDirection,
          offset: offset,
          clipBehavior: clipBehavior,
          slivers: slivers,
        ) {
    mateBuilder = (p) => ShrinkWrappingViewport$Mate(
          key: p.get('key').build(),
          axisDirection: p.get('axisDirection').build(),
          crossAxisDirection: p.get('crossAxisDirection').build(),
          offset: p.get('offset').build(),
          clipBehavior: p.get('clipBehavior').build(),
          slivers: p.get('slivers').build(),
        );
    matePut('key', key);
    matePut('axisDirection', axisDirection);
    matePut('crossAxisDirection', crossAxisDirection);
    matePut('offset', offset);
    matePut('clipBehavior', clipBehavior);
    matePut('slivers', slivers);
  }
}