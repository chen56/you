// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/scroll_simulation.dart';
import 'dart:core';
import 'package:flutter/src/physics/spring_simulation.dart';
import 'package:flutter/src/physics/tolerance.dart';
import 'package:note/mate.dart';

/// class BouncingScrollSimulation extends Simulation
class BouncingScrollSimulation$Mate extends BouncingScrollSimulation with Mate<BouncingScrollSimulation$Mate> {
  /// BouncingScrollSimulation BouncingScrollSimulation({required double position, required double velocity, required double leadingExtent, required double trailingExtent, required SpringDescription spring, double constantDeceleration = 0, Tolerance tolerance = Tolerance.defaultTolerance})
  BouncingScrollSimulation$Mate({
    /// optionalParameters: {required double position} , hasDefaultValue:false, defaultValueCode:null
    required double position,

    /// optionalParameters: {required double velocity} , hasDefaultValue:false, defaultValueCode:null
    required double velocity,

    /// optionalParameters: {required double leadingExtent} , hasDefaultValue:false, defaultValueCode:null
    required double leadingExtent,

    /// optionalParameters: {required double trailingExtent} , hasDefaultValue:false, defaultValueCode:null
    required double trailingExtent,

    /// optionalParameters: {required SpringDescription spring} , hasDefaultValue:false, defaultValueCode:null
    required SpringDescription spring,

    /// optionalParameters: {double constantDeceleration = 0} , hasDefaultValue:true, defaultValueCode:0
    required double constantDeceleration,

    /// optionalParameters: {Tolerance tolerance = Tolerance.defaultTolerance} , hasDefaultValue:true, defaultValueCode:Tolerance.defaultTolerance
    required Tolerance tolerance,
  }) : super(
          position: position,
          velocity: velocity,
          leadingExtent: leadingExtent,
          trailingExtent: trailingExtent,
          spring: spring,
          constantDeceleration: constantDeceleration,
          tolerance: tolerance,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => BouncingScrollSimulation$Mate(
        position: p.get('position').value,
        velocity: p.get('velocity').value,
        leadingExtent: p.get('leadingExtent').value,
        trailingExtent: p.get('trailingExtent').value,
        spring: p.get('spring').value,
        constantDeceleration: p.get('constantDeceleration').value,
        tolerance: p.get('tolerance').value,
      ),
    );
    mateParams.put('position', position);
    mateParams.put('velocity', velocity);
    mateParams.put('leadingExtent', leadingExtent);
    mateParams.put('trailingExtent', trailingExtent);
    mateParams.put('spring', spring);
    mateParams.put('constantDeceleration', constantDeceleration);
    mateParams.put('tolerance', tolerance);
  }
}

/// class ClampingScrollSimulation extends Simulation
class ClampingScrollSimulation$Mate extends ClampingScrollSimulation with Mate<ClampingScrollSimulation$Mate> {
  /// ClampingScrollSimulation ClampingScrollSimulation({required double position, required double velocity, double friction = 0.015, Tolerance tolerance = Tolerance.defaultTolerance})
  ClampingScrollSimulation$Mate({
    /// optionalParameters: {required double position} , hasDefaultValue:false, defaultValueCode:null
    required double position,

    /// optionalParameters: {required double velocity} , hasDefaultValue:false, defaultValueCode:null
    required double velocity,

    /// optionalParameters: {double friction = 0.015} , hasDefaultValue:true, defaultValueCode:0.015
    required double friction,

    /// optionalParameters: {Tolerance tolerance = Tolerance.defaultTolerance} , hasDefaultValue:true, defaultValueCode:Tolerance.defaultTolerance
    required Tolerance tolerance,
  }) : super(
          position: position,
          velocity: velocity,
          friction: friction,
          tolerance: tolerance,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => ClampingScrollSimulation$Mate(
        position: p.get('position').value,
        velocity: p.get('velocity').value,
        friction: p.get('friction').value,
        tolerance: p.get('tolerance').value,
      ),
    );
    mateParams.put('position', position);
    mateParams.put('velocity', velocity);
    mateParams.put('friction', friction);
    mateParams.put('tolerance', tolerance);
  }
}
