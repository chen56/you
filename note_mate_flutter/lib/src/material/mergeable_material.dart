// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/mergeable_material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:ui';
import 'package:note/mate.dart';
import 'dart:core';
import 'package:flutter/src/painting/basic_types.dart';

/// class MaterialSlice extends MergeableMaterialItem
class MaterialSlice$Mate extends MaterialSlice with Mate<MaterialSlice$Mate> {
  /// MaterialSlice MaterialSlice({required LocalKey key, required Widget child, Color? color})
  MaterialSlice$Mate({
    /// optionalParameters: {required LocalKey key} , hasDefaultValue:false, defaultValueCode:null
    required LocalKey key,

    /// optionalParameters: {required Widget child} , hasDefaultValue:false, defaultValueCode:null
    required Widget child,

    /// optionalParameters: {Color? color} , hasDefaultValue:false, defaultValueCode:null
    Color? color,
  }) : super(
          key: key,
          child: child,
          color: color,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => MaterialSlice$Mate(
        key: p.getValue('key'),
        child: p.getValue('child'),
        color: p.getValue('color'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'child', init: child);
    mateParams.set(name: 'color', init: color);
  }
}

/// class MaterialGap extends MergeableMaterialItem
class MaterialGap$Mate extends MaterialGap with Mate<MaterialGap$Mate> {
  /// MaterialGap MaterialGap({required LocalKey key, double size = 16.0})
  MaterialGap$Mate({
    /// optionalParameters: {required LocalKey key} , hasDefaultValue:false, defaultValueCode:null
    required LocalKey key,

    /// optionalParameters: {double size = 16.0} , hasDefaultValue:true, defaultValueCode:16.0
    required double size,
  }) : super(
          key: key,
          size: size,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => MaterialGap$Mate(
        key: p.getValue('key'),
        size: p.getValue('size'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'size', init: size);
  }
}

/// class MergeableMaterial extends StatefulWidget
class MergeableMaterial$Mate extends MergeableMaterial with WidgetMate<MergeableMaterial$Mate> {
  /// MergeableMaterial MergeableMaterial({Key? key, Axis mainAxis = Axis.vertical, double elevation = 2, bool hasDividers = false, List<MergeableMaterialItem> children = const <MergeableMaterialItem>[], Color? dividerColor})
  MergeableMaterial$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {Axis mainAxis = Axis.vertical} , hasDefaultValue:true, defaultValueCode:Axis.vertical
    required Axis mainAxis,

    /// optionalParameters: {double elevation = 2} , hasDefaultValue:true, defaultValueCode:2
    required double elevation,

    /// optionalParameters: {bool hasDividers = false} , hasDefaultValue:true, defaultValueCode:false
    required bool hasDividers,

    /// optionalParameters: {List<MergeableMaterialItem> children = const <MergeableMaterialItem>[]} , hasDefaultValue:true, defaultValueCode:const <MergeableMaterialItem>[]
    required List<MergeableMaterialItem> children,

    /// optionalParameters: {Color? dividerColor} , hasDefaultValue:false, defaultValueCode:null
    Color? dividerColor,
  }) : super(
          key: key,
          mainAxis: mainAxis,
          elevation: elevation,
          hasDividers: hasDividers,
          children: children,
          dividerColor: dividerColor,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => MergeableMaterial$Mate(
        key: p.getValue('key'),
        mainAxis: p.getValue('mainAxis'),
        elevation: p.getValue('elevation'),
        hasDividers: p.getValue('hasDividers'),
        children: p.getValue('children'),
        dividerColor: p.getValue('dividerColor'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'mainAxis', init: mainAxis);
    mateParams.set(name: 'elevation', init: elevation);
    mateParams.set(name: 'hasDividers', init: hasDividers);
    mateParams.set(name: 'children', init: children);
    mateParams.set(name: 'dividerColor', init: dividerColor);
  }
}
