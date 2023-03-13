// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/widgets/tap_region.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note/mate.dart';
import 'dart:core';
import 'package:flutter/src/rendering/proxy_box.dart';

/// class TapRegionSurface extends SingleChildRenderObjectWidget
class TapRegionSurface$Mate extends TapRegionSurface with WidgetMate<TapRegionSurface$Mate> {
  /// TapRegionSurface TapRegionSurface({Key? key, required Widget child})
  TapRegionSurface$Mate({
    /// param: {Key? key}
    Key? key,

    /// param: {required Widget child}
    required Widget child,
  }) : super(
          key: key,
          child: child,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => TapRegionSurface$Mate(
        key: p.getValue('key'),
        child: p.getValue('child'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'child', init: child);
  }
}

/// class TapRegion extends SingleChildRenderObjectWidget
class TapRegion$Mate extends TapRegion with WidgetMate<TapRegion$Mate> {
  /// TapRegion TapRegion({Key? key, required Widget? child, bool enabled = true, HitTestBehavior behavior = HitTestBehavior.deferToChild, void Function(PointerDownEvent)? onTapOutside, void Function(PointerDownEvent)? onTapInside, Object? groupId, String? debugLabel})
  TapRegion$Mate({
    /// param: {Key? key}
    Key? key,

    /// param: {required Widget? child}
    required Widget? child,

    /// param: {bool enabled = true}
    required bool enabled,

    /// param: {HitTestBehavior behavior = HitTestBehavior.deferToChild}
    required HitTestBehavior behavior,

    /// param: {void Function(PointerDownEvent)? onTapOutside}
    TapRegionCallback? onTapOutside,

    /// param: {void Function(PointerDownEvent)? onTapInside}
    TapRegionCallback? onTapInside,

    /// param: {Object? groupId}
    Object? groupId,

    /// param: {String? debugLabel}
    String? debugLabel,
  }) : super(
          key: key,
          child: child,
          enabled: enabled,
          behavior: behavior,
          onTapOutside: onTapOutside,
          onTapInside: onTapInside,
          groupId: groupId,
          debugLabel: debugLabel,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => TapRegion$Mate(
        key: p.getValue('key'),
        child: p.getValue('child'),
        enabled: p.getValue('enabled'),
        behavior: p.getValue('behavior'),
        onTapOutside: p.getValue('onTapOutside'),
        onTapInside: p.getValue('onTapInside'),
        groupId: p.getValue('groupId'),
        debugLabel: p.getValue('debugLabel'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'child', init: child);
    mateParams.set(name: 'enabled', init: enabled);
    mateParams.set(name: 'behavior', init: behavior);
    mateParams.set(name: 'onTapOutside', init: onTapOutside);
    mateParams.set(name: 'onTapInside', init: onTapInside);
    mateParams.set(name: 'groupId', init: groupId);
    mateParams.set(name: 'debugLabel', init: debugLabel);
  }
}

/// class RenderTapRegion extends RenderProxyBoxWithHitTestBehavior
class RenderTapRegion$Mate extends RenderTapRegion with Mate<RenderTapRegion$Mate> {
  /// RenderTapRegion RenderTapRegion({TapRegionRegistry? registry, bool enabled = true, void Function(PointerDownEvent)? onTapOutside, void Function(PointerDownEvent)? onTapInside, HitTestBehavior behavior = HitTestBehavior.deferToChild, Object? groupId, String? debugLabel})
  RenderTapRegion$Mate({
    /// param: {TapRegionRegistry? registry}
    TapRegionRegistry? registry,

    /// param: {bool enabled = true}
    required bool enabled,

    /// param: {void Function(PointerDownEvent)? onTapOutside}
    TapRegionCallback? onTapOutside,

    /// param: {void Function(PointerDownEvent)? onTapInside}
    TapRegionCallback? onTapInside,

    /// param: {HitTestBehavior behavior = HitTestBehavior.deferToChild}
    required HitTestBehavior behavior,

    /// param: {Object? groupId}
    Object? groupId,

    /// param: {String? debugLabel}
    String? debugLabel,
  }) : super(
          registry: registry,
          enabled: enabled,
          onTapOutside: onTapOutside,
          onTapInside: onTapInside,
          behavior: behavior,
          groupId: groupId,
          debugLabel: debugLabel,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => RenderTapRegion$Mate(
        registry: p.getValue('registry'),
        enabled: p.getValue('enabled'),
        onTapOutside: p.getValue('onTapOutside'),
        onTapInside: p.getValue('onTapInside'),
        behavior: p.getValue('behavior'),
        groupId: p.getValue('groupId'),
        debugLabel: p.getValue('debugLabel'),
      ),
    );
    mateParams.set(name: 'registry', init: registry);
    mateParams.set(name: 'enabled', init: enabled);
    mateParams.set(name: 'onTapOutside', init: onTapOutside);
    mateParams.set(name: 'onTapInside', init: onTapInside);
    mateParams.set(name: 'behavior', init: behavior);
    mateParams.set(name: 'groupId', init: groupId);
    mateParams.set(name: 'debugLabel', init: debugLabel);
  }
}

/// class TextFieldTapRegion extends TapRegion
class TextFieldTapRegion$Mate extends TextFieldTapRegion with WidgetMate<TextFieldTapRegion$Mate> {
  /// TextFieldTapRegion TextFieldTapRegion({Key? key, required Widget? child, bool enabled = true, void Function(PointerDownEvent)? onTapOutside, void Function(PointerDownEvent)? onTapInside, String? debugLabel})
  TextFieldTapRegion$Mate({
    /// param: {Key? key}
    Key? key,

    /// param: {required Widget? child}
    required Widget? child,

    /// param: {bool enabled = true}
    required bool enabled,

    /// param: {void Function(PointerDownEvent)? onTapOutside}
    TapRegionCallback? onTapOutside,

    /// param: {void Function(PointerDownEvent)? onTapInside}
    TapRegionCallback? onTapInside,

    /// param: {String? debugLabel}
    String? debugLabel,
  }) : super(
          key: key,
          child: child,
          enabled: enabled,
          onTapOutside: onTapOutside,
          onTapInside: onTapInside,
          debugLabel: debugLabel,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => TextFieldTapRegion$Mate(
        key: p.getValue('key'),
        child: p.getValue('child'),
        enabled: p.getValue('enabled'),
        onTapOutside: p.getValue('onTapOutside'),
        onTapInside: p.getValue('onTapInside'),
        debugLabel: p.getValue('debugLabel'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'child', init: child);
    mateParams.set(name: 'enabled', init: enabled);
    mateParams.set(name: 'onTapOutside', init: onTapOutside);
    mateParams.set(name: 'onTapInside', init: onTapInside);
    mateParams.set(name: 'debugLabel', init: debugLabel);
  }
}