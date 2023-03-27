// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/snapshot_widget.dart';
import 'package:note/mate.dart';
import 'dart:core';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/widgets/framework.dart';

/// class SnapshotController extends ChangeNotifier
class SnapshotController$Mate extends SnapshotController with Mate {
  /// SnapshotController SnapshotController({bool allowSnapshotting = false})
  SnapshotController$Mate(
      {
      /// optionalParameters: {bool allowSnapshotting = false} , defaultValue:Literal
      bool allowSnapshotting = false})
      : super(allowSnapshotting: allowSnapshotting) {
    mateCreateName = 'SnapshotController';
    matePackageUrl = 'package:flutter/widgets.dart';
    mateBuilder = (p) => SnapshotController$Mate(allowSnapshotting: p.get('allowSnapshotting').build());
    mateUse('allowSnapshotting', allowSnapshotting, isNamed: true);
  }
}

/// class SnapshotWidget extends SingleChildRenderObjectWidget
class SnapshotWidget$Mate extends SnapshotWidget with Mate {
  /// SnapshotWidget SnapshotWidget({Key? key, SnapshotMode mode = SnapshotMode.normal, SnapshotPainter painter = const _DefaultSnapshotPainter(), bool autoresize = false, required SnapshotController controller, required Widget? child})
  SnapshotWidget$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {SnapshotMode mode = SnapshotMode.normal} , defaultValue:PrefixedIdentifier
    SnapshotMode mode = SnapshotMode.normal,

    /// optionalParameters: {SnapshotPainter painter = const _DefaultSnapshotPainter()} , defaultValue:unprocessed
    required SnapshotPainter painter,

    /// optionalParameters: {bool autoresize = false} , defaultValue:Literal
    bool autoresize = false,

    /// optionalParameters: {required SnapshotController controller} , defaultValue:none
    required SnapshotController controller,

    /// optionalParameters: {required Widget? child} , defaultValue:none
    required Widget? child,
  }) : super(
          key: key,
          mode: mode,
          painter: painter,
          autoresize: autoresize,
          controller: controller,
          child: child,
        ) {
    mateCreateName = 'SnapshotWidget';
    matePackageUrl = 'package:flutter/widgets.dart';
    mateBuilder = (p) => SnapshotWidget$Mate(
          key: p.get('key').build(),
          mode: p.get('mode').build(),
          painter: p.get('painter').build(),
          autoresize: p.get('autoresize').build(),
          controller: p.get('controller').build(),
          child: p.get('child').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('mode', mode, isNamed: true);
    mateUse('painter', painter, isNamed: true);
    mateUse('autoresize', autoresize, isNamed: true);
    mateUse('controller', controller, isNamed: true);
    mateUse('child', child, isNamed: true);
  }
}
