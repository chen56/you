// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/safe_area.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:core';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note/mate.dart';

/// class SafeArea extends StatelessWidget
class SafeArea$Mate extends SafeArea with WidgetMate<SafeArea$Mate> {
  /// SafeArea SafeArea({Key? key, bool left = true, bool top = true, bool right = true, bool bottom = true, EdgeInsets minimum = EdgeInsets.zero, bool maintainBottomViewPadding = false, required Widget child})
  SafeArea$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {bool left = true} , hasDefaultValue:true, defaultValueCode:true
    required bool left,

    /// optionalParameters: {bool top = true} , hasDefaultValue:true, defaultValueCode:true
    required bool top,

    /// optionalParameters: {bool right = true} , hasDefaultValue:true, defaultValueCode:true
    required bool right,

    /// optionalParameters: {bool bottom = true} , hasDefaultValue:true, defaultValueCode:true
    required bool bottom,

    /// optionalParameters: {EdgeInsets minimum = EdgeInsets.zero} , hasDefaultValue:true, defaultValueCode:EdgeInsets.zero
    required EdgeInsets minimum,

    /// optionalParameters: {bool maintainBottomViewPadding = false} , hasDefaultValue:true, defaultValueCode:false
    required bool maintainBottomViewPadding,

    /// optionalParameters: {required Widget child} , hasDefaultValue:false, defaultValueCode:null
    required Widget child,
  }) : super(
          key: key,
          left: left,
          top: top,
          right: right,
          bottom: bottom,
          minimum: minimum,
          maintainBottomViewPadding: maintainBottomViewPadding,
          child: child,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => SafeArea$Mate(
        key: p.getValue('key'),
        left: p.getValue('left'),
        top: p.getValue('top'),
        right: p.getValue('right'),
        bottom: p.getValue('bottom'),
        minimum: p.getValue('minimum'),
        maintainBottomViewPadding: p.getValue('maintainBottomViewPadding'),
        child: p.getValue('child'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'left', init: left);
    mateParams.set(name: 'top', init: top);
    mateParams.set(name: 'right', init: right);
    mateParams.set(name: 'bottom', init: bottom);
    mateParams.set(name: 'minimum', init: minimum);
    mateParams.set(name: 'maintainBottomViewPadding', init: maintainBottomViewPadding);
    mateParams.set(name: 'child', init: child);
  }
}

/// class SliverSafeArea extends StatelessWidget
class SliverSafeArea$Mate extends SliverSafeArea with WidgetMate<SliverSafeArea$Mate> {
  /// SliverSafeArea SliverSafeArea({Key? key, bool left = true, bool top = true, bool right = true, bool bottom = true, EdgeInsets minimum = EdgeInsets.zero, required Widget sliver})
  SliverSafeArea$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {bool left = true} , hasDefaultValue:true, defaultValueCode:true
    required bool left,

    /// optionalParameters: {bool top = true} , hasDefaultValue:true, defaultValueCode:true
    required bool top,

    /// optionalParameters: {bool right = true} , hasDefaultValue:true, defaultValueCode:true
    required bool right,

    /// optionalParameters: {bool bottom = true} , hasDefaultValue:true, defaultValueCode:true
    required bool bottom,

    /// optionalParameters: {EdgeInsets minimum = EdgeInsets.zero} , hasDefaultValue:true, defaultValueCode:EdgeInsets.zero
    required EdgeInsets minimum,

    /// optionalParameters: {required Widget sliver} , hasDefaultValue:false, defaultValueCode:null
    required Widget sliver,
  }) : super(
          key: key,
          left: left,
          top: top,
          right: right,
          bottom: bottom,
          minimum: minimum,
          sliver: sliver,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => SliverSafeArea$Mate(
        key: p.getValue('key'),
        left: p.getValue('left'),
        top: p.getValue('top'),
        right: p.getValue('right'),
        bottom: p.getValue('bottom'),
        minimum: p.getValue('minimum'),
        sliver: p.getValue('sliver'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'left', init: left);
    mateParams.set(name: 'top', init: top);
    mateParams.set(name: 'right', init: right);
    mateParams.set(name: 'bottom', init: bottom);
    mateParams.set(name: 'minimum', init: minimum);
    mateParams.set(name: 'sliver', init: sliver);
  }
}
