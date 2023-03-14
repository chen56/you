// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/bottom_sheet.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/src/painting/borders.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/widgets/inherited_theme.dart';
import 'package:flutter/src/widgets/navigator.dart';

/// class BottomSheet extends StatefulWidget
class BottomSheet$Mate extends BottomSheet with WidgetMate<BottomSheet$Mate> {
  /// BottomSheet BottomSheet({Key? key, AnimationController? animationController, bool enableDrag = true, void Function(DragStartDetails)? onDragStart, void Function(DragEndDetails, {required bool isClosing})? onDragEnd, Color? backgroundColor, double? elevation, ShapeBorder? shape, Clip? clipBehavior, BoxConstraints? constraints, required void Function() onClosing, required Widget Function(BuildContext) builder})
  BottomSheet$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {AnimationController? animationController} , hasDefaultValue:false, defaultValueCode:null
    AnimationController? animationController,

    /// optionalParameters: {bool enableDrag = true} , hasDefaultValue:true, defaultValueCode:true
    required bool enableDrag,

    /// optionalParameters: {void Function(DragStartDetails)? onDragStart} , hasDefaultValue:false, defaultValueCode:null
    BottomSheetDragStartHandler? onDragStart,

    /// optionalParameters: {void Function(DragEndDetails, {required bool isClosing})? onDragEnd} , hasDefaultValue:false, defaultValueCode:null
    BottomSheetDragEndHandler? onDragEnd,

    /// optionalParameters: {Color? backgroundColor} , hasDefaultValue:false, defaultValueCode:null
    Color? backgroundColor,

    /// optionalParameters: {double? elevation} , hasDefaultValue:false, defaultValueCode:null
    double? elevation,

    /// optionalParameters: {ShapeBorder? shape} , hasDefaultValue:false, defaultValueCode:null
    ShapeBorder? shape,

    /// optionalParameters: {Clip? clipBehavior} , hasDefaultValue:false, defaultValueCode:null
    Clip? clipBehavior,

    /// optionalParameters: {BoxConstraints? constraints} , hasDefaultValue:false, defaultValueCode:null
    BoxConstraints? constraints,

    /// optionalParameters: {required void Function() onClosing} , hasDefaultValue:false, defaultValueCode:null
    required VoidCallback onClosing,

    /// optionalParameters: {required Widget Function(BuildContext) builder} , hasDefaultValue:false, defaultValueCode:null
    required WidgetBuilder builder,
  }) : super(
          key: key,
          animationController: animationController,
          enableDrag: enableDrag,
          onDragStart: onDragStart,
          onDragEnd: onDragEnd,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shape: shape,
          clipBehavior: clipBehavior,
          constraints: constraints,
          onClosing: onClosing,
          builder: builder,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => BottomSheet$Mate(
        key: p.getValue('key'),
        animationController: p.getValue('animationController'),
        enableDrag: p.getValue('enableDrag'),
        onDragStart: p.getValue('onDragStart'),
        onDragEnd: p.getValue('onDragEnd'),
        backgroundColor: p.getValue('backgroundColor'),
        elevation: p.getValue('elevation'),
        shape: p.getValue('shape'),
        clipBehavior: p.getValue('clipBehavior'),
        constraints: p.getValue('constraints'),
        onClosing: p.getValue('onClosing'),
        builder: p.getValue('builder'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'animationController', init: animationController);
    mateParams.set(name: 'enableDrag', init: enableDrag);
    mateParams.set(name: 'onDragStart', init: onDragStart);
    mateParams.set(name: 'onDragEnd', init: onDragEnd);
    mateParams.set(name: 'backgroundColor', init: backgroundColor);
    mateParams.set(name: 'elevation', init: elevation);
    mateParams.set(name: 'shape', init: shape);
    mateParams.set(name: 'clipBehavior', init: clipBehavior);
    mateParams.set(name: 'constraints', init: constraints);
    mateParams.set(name: 'onClosing', init: onClosing);
    mateParams.set(name: 'builder', init: builder);
  }
}

/// class ModalBottomSheetRoute<T> extends PopupRoute<T>
class ModalBottomSheetRoute$Mate<T> extends ModalBottomSheetRoute<T> with Mate<ModalBottomSheetRoute$Mate> {
  /// ModalBottomSheetRoute<T> ModalBottomSheetRoute({required Widget Function(BuildContext) builder, CapturedThemes? capturedThemes, String? barrierLabel, String? barrierOnTapHint, Color? backgroundColor, double? elevation, ShapeBorder? shape, Clip? clipBehavior, BoxConstraints? constraints, Color? modalBarrierColor, bool isDismissible = true, bool enableDrag = true, required bool isScrollControlled, RouteSettings? settings, AnimationController? transitionAnimationController, Offset? anchorPoint, bool useSafeArea = false})
  ModalBottomSheetRoute$Mate({
    /// optionalParameters: {required Widget Function(BuildContext) builder} , hasDefaultValue:false, defaultValueCode:null
    required WidgetBuilder builder,

    /// optionalParameters: {CapturedThemes? capturedThemes} , hasDefaultValue:false, defaultValueCode:null
    CapturedThemes? capturedThemes,

    /// optionalParameters: {String? barrierLabel} , hasDefaultValue:false, defaultValueCode:null
    String? barrierLabel,

    /// optionalParameters: {String? barrierOnTapHint} , hasDefaultValue:false, defaultValueCode:null
    String? barrierOnTapHint,

    /// optionalParameters: {Color? backgroundColor} , hasDefaultValue:false, defaultValueCode:null
    Color? backgroundColor,

    /// optionalParameters: {double? elevation} , hasDefaultValue:false, defaultValueCode:null
    double? elevation,

    /// optionalParameters: {ShapeBorder? shape} , hasDefaultValue:false, defaultValueCode:null
    ShapeBorder? shape,

    /// optionalParameters: {Clip? clipBehavior} , hasDefaultValue:false, defaultValueCode:null
    Clip? clipBehavior,

    /// optionalParameters: {BoxConstraints? constraints} , hasDefaultValue:false, defaultValueCode:null
    BoxConstraints? constraints,

    /// optionalParameters: {Color? modalBarrierColor} , hasDefaultValue:false, defaultValueCode:null
    Color? modalBarrierColor,

    /// optionalParameters: {bool isDismissible = true} , hasDefaultValue:true, defaultValueCode:true
    required bool isDismissible,

    /// optionalParameters: {bool enableDrag = true} , hasDefaultValue:true, defaultValueCode:true
    required bool enableDrag,

    /// optionalParameters: {required bool isScrollControlled} , hasDefaultValue:false, defaultValueCode:null
    required bool isScrollControlled,

    /// optionalParameters: {RouteSettings? settings} , hasDefaultValue:false, defaultValueCode:null
    RouteSettings? settings,

    /// optionalParameters: {AnimationController? transitionAnimationController} , hasDefaultValue:false, defaultValueCode:null
    AnimationController? transitionAnimationController,

    /// optionalParameters: {Offset? anchorPoint} , hasDefaultValue:false, defaultValueCode:null
    Offset? anchorPoint,

    /// optionalParameters: {bool useSafeArea = false} , hasDefaultValue:true, defaultValueCode:false
    required bool useSafeArea,
  }) : super(
          builder: builder,
          capturedThemes: capturedThemes,
          barrierLabel: barrierLabel,
          barrierOnTapHint: barrierOnTapHint,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shape: shape,
          clipBehavior: clipBehavior,
          constraints: constraints,
          modalBarrierColor: modalBarrierColor,
          isDismissible: isDismissible,
          enableDrag: enableDrag,
          isScrollControlled: isScrollControlled,
          settings: settings,
          transitionAnimationController: transitionAnimationController,
          anchorPoint: anchorPoint,
          useSafeArea: useSafeArea,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ModalBottomSheetRoute$Mate(
        builder: p.getValue('builder'),
        capturedThemes: p.getValue('capturedThemes'),
        barrierLabel: p.getValue('barrierLabel'),
        barrierOnTapHint: p.getValue('barrierOnTapHint'),
        backgroundColor: p.getValue('backgroundColor'),
        elevation: p.getValue('elevation'),
        shape: p.getValue('shape'),
        clipBehavior: p.getValue('clipBehavior'),
        constraints: p.getValue('constraints'),
        modalBarrierColor: p.getValue('modalBarrierColor'),
        isDismissible: p.getValue('isDismissible'),
        enableDrag: p.getValue('enableDrag'),
        isScrollControlled: p.getValue('isScrollControlled'),
        settings: p.getValue('settings'),
        transitionAnimationController: p.getValue('transitionAnimationController'),
        anchorPoint: p.getValue('anchorPoint'),
        useSafeArea: p.getValue('useSafeArea'),
      ),
    );
    mateParams.set(name: 'builder', init: builder);
    mateParams.set(name: 'capturedThemes', init: capturedThemes);
    mateParams.set(name: 'barrierLabel', init: barrierLabel);
    mateParams.set(name: 'barrierOnTapHint', init: barrierOnTapHint);
    mateParams.set(name: 'backgroundColor', init: backgroundColor);
    mateParams.set(name: 'elevation', init: elevation);
    mateParams.set(name: 'shape', init: shape);
    mateParams.set(name: 'clipBehavior', init: clipBehavior);
    mateParams.set(name: 'constraints', init: constraints);
    mateParams.set(name: 'modalBarrierColor', init: modalBarrierColor);
    mateParams.set(name: 'isDismissible', init: isDismissible);
    mateParams.set(name: 'enableDrag', init: enableDrag);
    mateParams.set(name: 'isScrollControlled', init: isScrollControlled);
    mateParams.set(name: 'settings', init: settings);
    mateParams.set(name: 'transitionAnimationController', init: transitionAnimationController);
    mateParams.set(name: 'anchorPoint', init: anchorPoint);
    mateParams.set(name: 'useSafeArea', init: useSafeArea);
  }
}
