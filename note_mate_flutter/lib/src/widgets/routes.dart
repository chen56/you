// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/routes.dart';
import 'dart:ui';
import 'dart:core';
import 'package:note/mate.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:flutter/src/widgets/focus_traversal.dart';

/// class LocalHistoryEntry
class LocalHistoryEntry$Mate extends LocalHistoryEntry with Mate<LocalHistoryEntry$Mate> {
  /// LocalHistoryEntry LocalHistoryEntry({void Function()? onRemove, bool impliesAppBarDismissal = true})
  LocalHistoryEntry$Mate({
    /// optionalParameters: {void Function()? onRemove} , hasDefaultValue:false, defaultValueCode:null
    VoidCallback? onRemove,

    /// optionalParameters: {bool impliesAppBarDismissal = true} , hasDefaultValue:true, defaultValueCode:true
    required bool impliesAppBarDismissal,
  }) : super(
          onRemove: onRemove,
          impliesAppBarDismissal: impliesAppBarDismissal,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => LocalHistoryEntry$Mate(
        onRemove: p.get('onRemove').value,
        impliesAppBarDismissal: p.get('impliesAppBarDismissal').value,
      ),
    );
    mateParams.put('onRemove', onRemove);
    mateParams.put('impliesAppBarDismissal', impliesAppBarDismissal);
  }
}

/// class RawDialogRoute<T> extends PopupRoute<T>
class RawDialogRoute$Mate<T> extends RawDialogRoute<T> with Mate<RawDialogRoute$Mate> {
  /// RawDialogRoute<T> RawDialogRoute({required Widget Function(BuildContext, Animation<double>, Animation<double>) pageBuilder, bool barrierDismissible = true, Color? barrierColor = const Color(0x80000000), String? barrierLabel, Duration transitionDuration = const Duration(milliseconds: 200), Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transitionBuilder, RouteSettings? settings, Offset? anchorPoint, TraversalEdgeBehavior? traversalEdgeBehavior})
  RawDialogRoute$Mate({
    /// optionalParameters: {required Widget Function(BuildContext, Animation<double>, Animation<double>) pageBuilder} , hasDefaultValue:false, defaultValueCode:null
    required RoutePageBuilder pageBuilder,

    /// optionalParameters: {bool barrierDismissible = true} , hasDefaultValue:true, defaultValueCode:true
    required bool barrierDismissible,

    /// optionalParameters: {Color? barrierColor = const Color(0x80000000)} , hasDefaultValue:true, defaultValueCode:const Color(0x80000000)
    Color? barrierColor,

    /// optionalParameters: {String? barrierLabel} , hasDefaultValue:false, defaultValueCode:null
    String? barrierLabel,

    /// optionalParameters: {Duration transitionDuration = const Duration(milliseconds: 200)} , hasDefaultValue:true, defaultValueCode:const Duration(milliseconds: 200)
    required Duration transitionDuration,

    /// optionalParameters: {Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transitionBuilder} , hasDefaultValue:false, defaultValueCode:null
    RouteTransitionsBuilder? transitionBuilder,

    /// optionalParameters: {RouteSettings? settings} , hasDefaultValue:false, defaultValueCode:null
    RouteSettings? settings,

    /// optionalParameters: {Offset? anchorPoint} , hasDefaultValue:false, defaultValueCode:null
    Offset? anchorPoint,

    /// optionalParameters: {TraversalEdgeBehavior? traversalEdgeBehavior} , hasDefaultValue:false, defaultValueCode:null
    TraversalEdgeBehavior? traversalEdgeBehavior,
  }) : super(
          pageBuilder: pageBuilder,
          barrierDismissible: barrierDismissible,
          barrierColor: barrierColor,
          barrierLabel: barrierLabel,
          transitionDuration: transitionDuration,
          transitionBuilder: transitionBuilder,
          settings: settings,
          anchorPoint: anchorPoint,
          traversalEdgeBehavior: traversalEdgeBehavior,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => RawDialogRoute$Mate(
        pageBuilder: p.get('pageBuilder').value,
        barrierDismissible: p.get('barrierDismissible').value,
        barrierColor: p.get('barrierColor').value,
        barrierLabel: p.get('barrierLabel').value,
        transitionDuration: p.get('transitionDuration').value,
        transitionBuilder: p.get('transitionBuilder').value,
        settings: p.get('settings').value,
        anchorPoint: p.get('anchorPoint').value,
        traversalEdgeBehavior: p.get('traversalEdgeBehavior').value,
      ),
    );
    mateParams.put('pageBuilder', pageBuilder);
    mateParams.put('barrierDismissible', barrierDismissible);
    mateParams.put('barrierColor', barrierColor);
    mateParams.put('barrierLabel', barrierLabel);
    mateParams.put('transitionDuration', transitionDuration);
    mateParams.put('transitionBuilder', transitionBuilder);
    mateParams.put('settings', settings);
    mateParams.put('anchorPoint', anchorPoint);
    mateParams.put('traversalEdgeBehavior', traversalEdgeBehavior);
  }
}
