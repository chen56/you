// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/material/page.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'dart:core';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';

/// class MaterialPageRoute<T> extends PageRoute<T> with MaterialRouteTransitionMixin<T>
class MaterialPageRoute$Mate<T> extends MaterialPageRoute<T> with Mate<MaterialPageRoute$Mate> {
  /// MaterialPageRoute<T> MaterialPageRoute({required Widget Function(BuildContext) builder, RouteSettings? settings, bool maintainState = true, bool fullscreenDialog = false, bool allowSnapshotting = true})
  MaterialPageRoute$Mate({
    /// param: {required Widget Function(BuildContext) builder}
    required WidgetBuilder builder,

    /// param: {RouteSettings? settings}
    RouteSettings? settings,

    /// param: {bool maintainState = true}
    required bool maintainState,

    /// param: {bool fullscreenDialog = false}
    required bool fullscreenDialog,

    /// param: {bool allowSnapshotting = true}
    required bool allowSnapshotting,
  }) : super(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          allowSnapshotting: allowSnapshotting,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => MaterialPageRoute$Mate(
        builder: p.getValue('builder'),
        settings: p.getValue('settings'),
        maintainState: p.getValue('maintainState'),
        fullscreenDialog: p.getValue('fullscreenDialog'),
        allowSnapshotting: p.getValue('allowSnapshotting'),
      ),
    );
    mateParams.set(name: 'builder', init: builder);
    mateParams.set(name: 'settings', init: settings);
    mateParams.set(name: 'maintainState', init: maintainState);
    mateParams.set(name: 'fullscreenDialog', init: fullscreenDialog);
    mateParams.set(name: 'allowSnapshotting', init: allowSnapshotting);
  }
}

/// class MaterialPage<T> extends Page<T>
class MaterialPage$Mate<T> extends MaterialPage<T> with Mate<MaterialPage$Mate> {
  /// MaterialPage<T> MaterialPage({required Widget child, bool maintainState = true, bool fullscreenDialog = false, bool allowSnapshotting = true, LocalKey? key, String? name, Object? arguments, String? restorationId})
  MaterialPage$Mate({
    /// param: {required Widget child}
    required Widget child,

    /// param: {bool maintainState = true}
    required bool maintainState,

    /// param: {bool fullscreenDialog = false}
    required bool fullscreenDialog,

    /// param: {bool allowSnapshotting = true}
    required bool allowSnapshotting,

    /// param: {LocalKey? key}
    LocalKey? key,

    /// param: {String? name}
    String? name,

    /// param: {Object? arguments}
    Object? arguments,

    /// param: {String? restorationId}
    String? restorationId,
  }) : super(
          child: child,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          allowSnapshotting: allowSnapshotting,
          key: key,
          name: name,
          arguments: arguments,
          restorationId: restorationId,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => MaterialPage$Mate(
        child: p.getValue('child'),
        maintainState: p.getValue('maintainState'),
        fullscreenDialog: p.getValue('fullscreenDialog'),
        allowSnapshotting: p.getValue('allowSnapshotting'),
        key: p.getValue('key'),
        name: p.getValue('name'),
        arguments: p.getValue('arguments'),
        restorationId: p.getValue('restorationId'),
      ),
    );
    mateParams.set(name: 'child', init: child);
    mateParams.set(name: 'maintainState', init: maintainState);
    mateParams.set(name: 'fullscreenDialog', init: fullscreenDialog);
    mateParams.set(name: 'allowSnapshotting', init: allowSnapshotting);
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'name', init: name);
    mateParams.set(name: 'arguments', init: arguments);
    mateParams.set(name: 'restorationId', init: restorationId);
  }
}
