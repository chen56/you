// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/interactive_viewer.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:ui';
import 'package:flutter/src/painting/edge_insets.dart';
import 'dart:core';
import 'package:flutter/src/gestures/scale.dart';
import 'package:flutter/src/painting/alignment.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note/mate.dart';
import 'package:vector_math/vector_math_64.dart';

/// class InteractiveViewer extends StatefulWidget
class InteractiveViewer$Mate extends InteractiveViewer with WidgetMate<InteractiveViewer$Mate> {
  /// InteractiveViewer InteractiveViewer({Key? key, Clip clipBehavior = Clip.hardEdge, bool alignPanAxis = false, PanAxis panAxis = PanAxis.free, EdgeInsets boundaryMargin = EdgeInsets.zero, bool constrained = true, double maxScale = 2.5, double minScale = 0.8, double interactionEndFrictionCoefficient = _kDrag, void Function(ScaleEndDetails)? onInteractionEnd, void Function(ScaleStartDetails)? onInteractionStart, void Function(ScaleUpdateDetails)? onInteractionUpdate, bool panEnabled = true, bool scaleEnabled = true, double scaleFactor = kDefaultMouseScrollToScaleFactor, TransformationController? transformationController, Alignment? alignment, bool trackpadScrollCausesScale = false, required Widget child})
  InteractiveViewer$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {Clip clipBehavior = Clip.hardEdge} , hasDefaultValue:true, defaultValueCode:Clip.hardEdge
    required Clip clipBehavior,

    /// optionalParameters: {PanAxis panAxis = PanAxis.free} , hasDefaultValue:true, defaultValueCode:PanAxis.free
    required PanAxis panAxis,

    /// optionalParameters: {EdgeInsets boundaryMargin = EdgeInsets.zero} , hasDefaultValue:true, defaultValueCode:EdgeInsets.zero
    required EdgeInsets boundaryMargin,

    /// optionalParameters: {bool constrained = true} , hasDefaultValue:true, defaultValueCode:true
    required bool constrained,

    /// optionalParameters: {double maxScale = 2.5} , hasDefaultValue:true, defaultValueCode:2.5
    required double maxScale,

    /// optionalParameters: {double minScale = 0.8} , hasDefaultValue:true, defaultValueCode:0.8
    required double minScale,

    /// optionalParameters: {double interactionEndFrictionCoefficient = _kDrag} , hasDefaultValue:true, defaultValueCode:_kDrag
    required double interactionEndFrictionCoefficient,

    /// optionalParameters: {void Function(ScaleEndDetails)? onInteractionEnd} , hasDefaultValue:false, defaultValueCode:null
    GestureScaleEndCallback? onInteractionEnd,

    /// optionalParameters: {void Function(ScaleStartDetails)? onInteractionStart} , hasDefaultValue:false, defaultValueCode:null
    GestureScaleStartCallback? onInteractionStart,

    /// optionalParameters: {void Function(ScaleUpdateDetails)? onInteractionUpdate} , hasDefaultValue:false, defaultValueCode:null
    GestureScaleUpdateCallback? onInteractionUpdate,

    /// optionalParameters: {bool panEnabled = true} , hasDefaultValue:true, defaultValueCode:true
    required bool panEnabled,

    /// optionalParameters: {bool scaleEnabled = true} , hasDefaultValue:true, defaultValueCode:true
    required bool scaleEnabled,

    /// optionalParameters: {double scaleFactor = kDefaultMouseScrollToScaleFactor} , hasDefaultValue:true, defaultValueCode:kDefaultMouseScrollToScaleFactor
    required double scaleFactor,

    /// optionalParameters: {TransformationController? transformationController} , hasDefaultValue:false, defaultValueCode:null
    TransformationController? transformationController,

    /// optionalParameters: {Alignment? alignment} , hasDefaultValue:false, defaultValueCode:null
    Alignment? alignment,

    /// optionalParameters: {bool trackpadScrollCausesScale = false} , hasDefaultValue:true, defaultValueCode:false
    required bool trackpadScrollCausesScale,

    /// optionalParameters: {required Widget child} , hasDefaultValue:false, defaultValueCode:null
    required Widget child,
  }) : super(
          key: key,
          clipBehavior: clipBehavior,
          panAxis: panAxis,
          boundaryMargin: boundaryMargin,
          constrained: constrained,
          maxScale: maxScale,
          minScale: minScale,
          interactionEndFrictionCoefficient: interactionEndFrictionCoefficient,
          onInteractionEnd: onInteractionEnd,
          onInteractionStart: onInteractionStart,
          onInteractionUpdate: onInteractionUpdate,
          panEnabled: panEnabled,
          scaleEnabled: scaleEnabled,
          scaleFactor: scaleFactor,
          transformationController: transformationController,
          alignment: alignment,
          trackpadScrollCausesScale: trackpadScrollCausesScale,
          child: child,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => InteractiveViewer$Mate(
        key: p.getValue('key'),
        clipBehavior: p.getValue('clipBehavior'),
        panAxis: p.getValue('panAxis'),
        boundaryMargin: p.getValue('boundaryMargin'),
        constrained: p.getValue('constrained'),
        maxScale: p.getValue('maxScale'),
        minScale: p.getValue('minScale'),
        interactionEndFrictionCoefficient: p.getValue('interactionEndFrictionCoefficient'),
        onInteractionEnd: p.getValue('onInteractionEnd'),
        onInteractionStart: p.getValue('onInteractionStart'),
        onInteractionUpdate: p.getValue('onInteractionUpdate'),
        panEnabled: p.getValue('panEnabled'),
        scaleEnabled: p.getValue('scaleEnabled'),
        scaleFactor: p.getValue('scaleFactor'),
        transformationController: p.getValue('transformationController'),
        alignment: p.getValue('alignment'),
        trackpadScrollCausesScale: p.getValue('trackpadScrollCausesScale'),
        child: p.getValue('child'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'clipBehavior', init: clipBehavior);
    mateParams.set(name: 'panAxis', init: panAxis);
    mateParams.set(name: 'boundaryMargin', init: boundaryMargin);
    mateParams.set(name: 'constrained', init: constrained);
    mateParams.set(name: 'maxScale', init: maxScale);
    mateParams.set(name: 'minScale', init: minScale);
    mateParams.set(name: 'interactionEndFrictionCoefficient', init: interactionEndFrictionCoefficient);
    mateParams.set(name: 'onInteractionEnd', init: onInteractionEnd);
    mateParams.set(name: 'onInteractionStart', init: onInteractionStart);
    mateParams.set(name: 'onInteractionUpdate', init: onInteractionUpdate);
    mateParams.set(name: 'panEnabled', init: panEnabled);
    mateParams.set(name: 'scaleEnabled', init: scaleEnabled);
    mateParams.set(name: 'scaleFactor', init: scaleFactor);
    mateParams.set(name: 'transformationController', init: transformationController);
    mateParams.set(name: 'alignment', init: alignment);
    mateParams.set(name: 'trackpadScrollCausesScale', init: trackpadScrollCausesScale);
    mateParams.set(name: 'child', init: child);
  }

  /// InteractiveViewer InteractiveViewer.builder({Key? key, Clip clipBehavior = Clip.hardEdge, bool alignPanAxis = false, PanAxis panAxis = PanAxis.free, EdgeInsets boundaryMargin = EdgeInsets.zero, double maxScale = 2.5, double minScale = 0.8, double interactionEndFrictionCoefficient = _kDrag, void Function(ScaleEndDetails)? onInteractionEnd, void Function(ScaleStartDetails)? onInteractionStart, void Function(ScaleUpdateDetails)? onInteractionUpdate, bool panEnabled = true, bool scaleEnabled = true, double scaleFactor = 200.0, TransformationController? transformationController, Alignment? alignment, bool trackpadScrollCausesScale = false, required Widget Function(BuildContext, Quad) builder})
  InteractiveViewer$Mate.builder({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {Clip clipBehavior = Clip.hardEdge} , hasDefaultValue:true, defaultValueCode:Clip.hardEdge
    required Clip clipBehavior,

    /// optionalParameters: {PanAxis panAxis = PanAxis.free} , hasDefaultValue:true, defaultValueCode:PanAxis.free
    required PanAxis panAxis,

    /// optionalParameters: {EdgeInsets boundaryMargin = EdgeInsets.zero} , hasDefaultValue:true, defaultValueCode:EdgeInsets.zero
    required EdgeInsets boundaryMargin,

    /// optionalParameters: {double maxScale = 2.5} , hasDefaultValue:true, defaultValueCode:2.5
    required double maxScale,

    /// optionalParameters: {double minScale = 0.8} , hasDefaultValue:true, defaultValueCode:0.8
    required double minScale,

    /// optionalParameters: {double interactionEndFrictionCoefficient = _kDrag} , hasDefaultValue:true, defaultValueCode:_kDrag
    required double interactionEndFrictionCoefficient,

    /// optionalParameters: {void Function(ScaleEndDetails)? onInteractionEnd} , hasDefaultValue:false, defaultValueCode:null
    GestureScaleEndCallback? onInteractionEnd,

    /// optionalParameters: {void Function(ScaleStartDetails)? onInteractionStart} , hasDefaultValue:false, defaultValueCode:null
    GestureScaleStartCallback? onInteractionStart,

    /// optionalParameters: {void Function(ScaleUpdateDetails)? onInteractionUpdate} , hasDefaultValue:false, defaultValueCode:null
    GestureScaleUpdateCallback? onInteractionUpdate,

    /// optionalParameters: {bool panEnabled = true} , hasDefaultValue:true, defaultValueCode:true
    required bool panEnabled,

    /// optionalParameters: {bool scaleEnabled = true} , hasDefaultValue:true, defaultValueCode:true
    required bool scaleEnabled,

    /// optionalParameters: {double scaleFactor = 200.0} , hasDefaultValue:true, defaultValueCode:200.0
    required double scaleFactor,

    /// optionalParameters: {TransformationController? transformationController} , hasDefaultValue:false, defaultValueCode:null
    TransformationController? transformationController,

    /// optionalParameters: {Alignment? alignment} , hasDefaultValue:false, defaultValueCode:null
    Alignment? alignment,

    /// optionalParameters: {bool trackpadScrollCausesScale = false} , hasDefaultValue:true, defaultValueCode:false
    required bool trackpadScrollCausesScale,

    /// optionalParameters: {required Widget Function(BuildContext, Quad) builder} , hasDefaultValue:false, defaultValueCode:null
    required InteractiveViewerWidgetBuilder builder,
  }) : super.builder(
          key: key,
          clipBehavior: clipBehavior,
          panAxis: panAxis,
          boundaryMargin: boundaryMargin,
          maxScale: maxScale,
          minScale: minScale,
          interactionEndFrictionCoefficient: interactionEndFrictionCoefficient,
          onInteractionEnd: onInteractionEnd,
          onInteractionStart: onInteractionStart,
          onInteractionUpdate: onInteractionUpdate,
          panEnabled: panEnabled,
          scaleEnabled: scaleEnabled,
          scaleFactor: scaleFactor,
          transformationController: transformationController,
          alignment: alignment,
          trackpadScrollCausesScale: trackpadScrollCausesScale,
          builder: builder,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => InteractiveViewer$Mate.builder(
        key: p.getValue('key'),
        clipBehavior: p.getValue('clipBehavior'),
        panAxis: p.getValue('panAxis'),
        boundaryMargin: p.getValue('boundaryMargin'),
        maxScale: p.getValue('maxScale'),
        minScale: p.getValue('minScale'),
        interactionEndFrictionCoefficient: p.getValue('interactionEndFrictionCoefficient'),
        onInteractionEnd: p.getValue('onInteractionEnd'),
        onInteractionStart: p.getValue('onInteractionStart'),
        onInteractionUpdate: p.getValue('onInteractionUpdate'),
        panEnabled: p.getValue('panEnabled'),
        scaleEnabled: p.getValue('scaleEnabled'),
        scaleFactor: p.getValue('scaleFactor'),
        transformationController: p.getValue('transformationController'),
        alignment: p.getValue('alignment'),
        trackpadScrollCausesScale: p.getValue('trackpadScrollCausesScale'),
        builder: p.getValue('builder'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'clipBehavior', init: clipBehavior);
    mateParams.set(name: 'panAxis', init: panAxis);
    mateParams.set(name: 'boundaryMargin', init: boundaryMargin);
    mateParams.set(name: 'maxScale', init: maxScale);
    mateParams.set(name: 'minScale', init: minScale);
    mateParams.set(name: 'interactionEndFrictionCoefficient', init: interactionEndFrictionCoefficient);
    mateParams.set(name: 'onInteractionEnd', init: onInteractionEnd);
    mateParams.set(name: 'onInteractionStart', init: onInteractionStart);
    mateParams.set(name: 'onInteractionUpdate', init: onInteractionUpdate);
    mateParams.set(name: 'panEnabled', init: panEnabled);
    mateParams.set(name: 'scaleEnabled', init: scaleEnabled);
    mateParams.set(name: 'scaleFactor', init: scaleFactor);
    mateParams.set(name: 'transformationController', init: transformationController);
    mateParams.set(name: 'alignment', init: alignment);
    mateParams.set(name: 'trackpadScrollCausesScale', init: trackpadScrollCausesScale);
    mateParams.set(name: 'builder', init: builder);
  }
}

/// class TransformationController extends ValueNotifier<Matrix4>
class TransformationController$Mate extends TransformationController with Mate<TransformationController$Mate> {
  /// TransformationController TransformationController([Matrix4? value])
  TransformationController$Mate(

      /// requiredParameters: [Matrix4? value]
      Matrix4? value)
      : super(value) {
    mateParams = Params(
      init: this,
      builder: (p) => TransformationController$Mate(p.getValue('value')),
    );
    mateParams.set(name: 'value', init: value);
  }
}
