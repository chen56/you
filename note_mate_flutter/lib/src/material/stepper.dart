// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/material/stepper.dart';
import 'dart:core';
import 'dart:ui';
import 'package:note/mate.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/scroll_physics.dart';
import 'package:flutter/src/foundation/basic_types.dart';
import 'package:flutter/src/painting/edge_insets.dart';

/// class ControlsDetails
class ControlsDetails$Mate extends ControlsDetails with Mate<ControlsDetails$Mate> {
  /// ControlsDetails ControlsDetails({required int currentStep, required int stepIndex, void Function()? onStepCancel, void Function()? onStepContinue})
  ControlsDetails$Mate({
    /// param: {required int currentStep}
    required int currentStep,

    /// param: {required int stepIndex}
    required int stepIndex,

    /// param: {void Function()? onStepCancel}
    VoidCallback? onStepCancel,

    /// param: {void Function()? onStepContinue}
    VoidCallback? onStepContinue,
  }) : super(
          currentStep: currentStep,
          stepIndex: stepIndex,
          onStepCancel: onStepCancel,
          onStepContinue: onStepContinue,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ControlsDetails$Mate(
        currentStep: p.getValue('currentStep'),
        stepIndex: p.getValue('stepIndex'),
        onStepCancel: p.getValue('onStepCancel'),
        onStepContinue: p.getValue('onStepContinue'),
      ),
    );
    mateParams.set(name: 'currentStep', init: currentStep);
    mateParams.set(name: 'stepIndex', init: stepIndex);
    mateParams.set(name: 'onStepCancel', init: onStepCancel);
    mateParams.set(name: 'onStepContinue', init: onStepContinue);
  }
}

/// class Step
class Step$Mate extends Step with Mate<Step$Mate> {
  /// Step Step({required Widget title, Widget? subtitle, required Widget content, StepState state = StepState.indexed, bool isActive = false, Widget? label})
  Step$Mate({
    /// param: {required Widget title}
    required Widget title,

    /// param: {Widget? subtitle}
    Widget? subtitle,

    /// param: {required Widget content}
    required Widget content,

    /// param: {StepState state = StepState.indexed}
    required StepState state,

    /// param: {bool isActive = false}
    required bool isActive,

    /// param: {Widget? label}
    Widget? label,
  }) : super(
          title: title,
          subtitle: subtitle,
          content: content,
          state: state,
          isActive: isActive,
          label: label,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => Step$Mate(
        title: p.getValue('title'),
        subtitle: p.getValue('subtitle'),
        content: p.getValue('content'),
        state: p.getValue('state'),
        isActive: p.getValue('isActive'),
        label: p.getValue('label'),
      ),
    );
    mateParams.set(name: 'title', init: title);
    mateParams.set(name: 'subtitle', init: subtitle);
    mateParams.set(name: 'content', init: content);
    mateParams.set(name: 'state', init: state);
    mateParams.set(name: 'isActive', init: isActive);
    mateParams.set(name: 'label', init: label);
  }
}

/// class Stepper extends StatefulWidget
class Stepper$Mate extends Stepper with WidgetMate<Stepper$Mate> {
  /// Stepper Stepper({Key? key, required List<Step> steps, ScrollPhysics? physics, StepperType type = StepperType.vertical, int currentStep = 0, void Function(int)? onStepTapped, void Function()? onStepContinue, void Function()? onStepCancel, Widget Function(BuildContext, ControlsDetails)? controlsBuilder, double? elevation, EdgeInsetsGeometry? margin})
  Stepper$Mate({
    /// param: {Key? key}
    Key? key,

    /// param: {required List<Step> steps}
    required List<Step> steps,

    /// param: {ScrollPhysics? physics}
    ScrollPhysics? physics,

    /// param: {StepperType type = StepperType.vertical}
    required StepperType type,

    /// param: {int currentStep = 0}
    required int currentStep,

    /// param: {void Function(int)? onStepTapped}
    ValueChanged<int>? onStepTapped,

    /// param: {void Function()? onStepContinue}
    VoidCallback? onStepContinue,

    /// param: {void Function()? onStepCancel}
    VoidCallback? onStepCancel,

    /// param: {Widget Function(BuildContext, ControlsDetails)? controlsBuilder}
    ControlsWidgetBuilder? controlsBuilder,

    /// param: {double? elevation}
    double? elevation,

    /// param: {EdgeInsetsGeometry? margin}
    EdgeInsetsGeometry? margin,
  }) : super(
          key: key,
          steps: steps,
          physics: physics,
          type: type,
          currentStep: currentStep,
          onStepTapped: onStepTapped,
          onStepContinue: onStepContinue,
          onStepCancel: onStepCancel,
          controlsBuilder: controlsBuilder,
          elevation: elevation,
          margin: margin,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => Stepper$Mate(
        key: p.getValue('key'),
        steps: p.getValue('steps'),
        physics: p.getValue('physics'),
        type: p.getValue('type'),
        currentStep: p.getValue('currentStep'),
        onStepTapped: p.getValue('onStepTapped'),
        onStepContinue: p.getValue('onStepContinue'),
        onStepCancel: p.getValue('onStepCancel'),
        controlsBuilder: p.getValue('controlsBuilder'),
        elevation: p.getValue('elevation'),
        margin: p.getValue('margin'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'steps', init: steps);
    mateParams.set(name: 'physics', init: physics);
    mateParams.set(name: 'type', init: type);
    mateParams.set(name: 'currentStep', init: currentStep);
    mateParams.set(name: 'onStepTapped', init: onStepTapped);
    mateParams.set(name: 'onStepContinue', init: onStepContinue);
    mateParams.set(name: 'onStepCancel', init: onStepCancel);
    mateParams.set(name: 'controlsBuilder', init: controlsBuilder);
    mateParams.set(name: 'elevation', init: elevation);
    mateParams.set(name: 'margin', init: margin);
  }
}
