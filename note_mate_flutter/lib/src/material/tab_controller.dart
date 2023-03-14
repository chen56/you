// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/tab_controller.dart';
import 'dart:core';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

/// class TabController extends ChangeNotifier
class TabController$Mate extends TabController with Mate<TabController$Mate> {
  /// TabController TabController({int initialIndex = 0, Duration? animationDuration, required int length, required TickerProvider vsync})
  TabController$Mate({
    /// optionalParameters: {int initialIndex = 0} , hasDefaultValue:true, defaultValueCode:0
    required int initialIndex,

    /// optionalParameters: {Duration? animationDuration} , hasDefaultValue:false, defaultValueCode:null
    Duration? animationDuration,

    /// optionalParameters: {required int length} , hasDefaultValue:false, defaultValueCode:null
    required int length,

    /// optionalParameters: {required TickerProvider vsync} , hasDefaultValue:false, defaultValueCode:null
    required TickerProvider vsync,
  }) : super(
          initialIndex: initialIndex,
          animationDuration: animationDuration,
          length: length,
          vsync: vsync,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => TabController$Mate(
        initialIndex: p.getValue('initialIndex'),
        animationDuration: p.getValue('animationDuration'),
        length: p.getValue('length'),
        vsync: p.getValue('vsync'),
      ),
    );
    mateParams.set(name: 'initialIndex', init: initialIndex);
    mateParams.set(name: 'animationDuration', init: animationDuration);
    mateParams.set(name: 'length', init: length);
    mateParams.set(name: 'vsync', init: vsync);
  }
}

/// class DefaultTabController extends StatefulWidget
class DefaultTabController$Mate extends DefaultTabController with WidgetMate<DefaultTabController$Mate> {
  /// DefaultTabController DefaultTabController({Key? key, required int length, int initialIndex = 0, required Widget child, Duration? animationDuration})
  DefaultTabController$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required int length} , hasDefaultValue:false, defaultValueCode:null
    required int length,

    /// optionalParameters: {int initialIndex = 0} , hasDefaultValue:true, defaultValueCode:0
    required int initialIndex,

    /// optionalParameters: {required Widget child} , hasDefaultValue:false, defaultValueCode:null
    required Widget child,

    /// optionalParameters: {Duration? animationDuration} , hasDefaultValue:false, defaultValueCode:null
    Duration? animationDuration,
  }) : super(
          key: key,
          length: length,
          initialIndex: initialIndex,
          child: child,
          animationDuration: animationDuration,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => DefaultTabController$Mate(
        key: p.getValue('key'),
        length: p.getValue('length'),
        initialIndex: p.getValue('initialIndex'),
        child: p.getValue('child'),
        animationDuration: p.getValue('animationDuration'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'length', init: length);
    mateParams.set(name: 'initialIndex', init: initialIndex);
    mateParams.set(name: 'child', init: child);
    mateParams.set(name: 'animationDuration', init: animationDuration);
  }
}
