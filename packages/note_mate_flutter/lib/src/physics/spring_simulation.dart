// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/physics/spring_simulation.dart';
import 'package:note/mate.dart';
import 'dart:core';
import 'package:flutter/src/physics/tolerance.dart';
import 'package:flutter/physics.dart';

/// class SpringDescription
class SpringDescription$Mate extends SpringDescription with Mate {
  /// SpringDescription SpringDescription({required double mass, required double stiffness, required double damping})
  SpringDescription$Mate({
    /// optionalParameters: {required double mass} , defaultValue:none
    required double mass,

    /// optionalParameters: {required double stiffness} , defaultValue:none
    required double stiffness,

    /// optionalParameters: {required double damping} , defaultValue:none
    required double damping,
  }) : super(
          mass: mass,
          stiffness: stiffness,
          damping: damping,
        ) {
    mateCreateName = 'SpringDescription';
    matePackageUrl = 'package:flutter/animation.dart';
    mateBuilder = (p) => SpringDescription$Mate(
          mass: p.get('mass').build(),
          stiffness: p.get('stiffness').build(),
          damping: p.get('damping').build(),
        );
    mateUse('mass', mass, isNamed: true);
    mateUse('stiffness', stiffness, isNamed: true);
    mateUse('damping', damping, isNamed: true);
  }

  /// SpringDescription SpringDescription.withDampingRatio({required double mass, required double stiffness, double ratio = 1.0})
  SpringDescription$Mate.withDampingRatio({
    /// optionalParameters: {required double mass} , defaultValue:none
    required double mass,

    /// optionalParameters: {required double stiffness} , defaultValue:none
    required double stiffness,

    /// optionalParameters: {double ratio = 1.0} , defaultValue:Literal
    double ratio = 1.0,
  }) : super.withDampingRatio(
          mass: mass,
          stiffness: stiffness,
          ratio: ratio,
        ) {
    mateCreateName = 'SpringDescription.withDampingRatio';
    matePackageUrl = 'package:flutter/animation.dart';
    mateBuilder = (p) => SpringDescription$Mate.withDampingRatio(
          mass: p.get('mass').build(),
          stiffness: p.get('stiffness').build(),
          ratio: p.get('ratio').build(),
        );
    mateUse('mass', mass, isNamed: true);
    mateUse('stiffness', stiffness, isNamed: true);
    mateUse('ratio', ratio, isNamed: true);
  }
}

/// class SpringSimulation extends Simulation
class SpringSimulation$Mate extends SpringSimulation with Mate {
  /// SpringSimulation SpringSimulation(SpringDescription spring, double start, double end, double velocity, {Tolerance tolerance = Tolerance.defaultTolerance})
  SpringSimulation$Mate(
    /// requiredParameters: SpringDescription spring
    SpringDescription spring,

    /// requiredParameters: double start
    double start,

    /// requiredParameters: double end
    double end,

    /// requiredParameters: double velocity
    double velocity, {
    /// optionalParameters: {Tolerance tolerance = Tolerance.defaultTolerance} , defaultValue:PrefixedIdentifier
    Tolerance tolerance = Tolerance.defaultTolerance,
  }) : super(
          spring,
          start,
          end,
          velocity,
          tolerance: tolerance,
        ) {
    mateCreateName = 'SpringSimulation';
    matePackageUrl = 'package:flutter/physics.dart';
    mateBuilder = (p) => SpringSimulation$Mate(
          p.get('spring').value,
          p.get('start').value,
          p.get('end').value,
          p.get('velocity').value,
          tolerance: p.get('tolerance').build(),
        );
    mateUse('spring', spring, isNamed: false);
    mateUse('start', start, isNamed: false);
    mateUse('end', end, isNamed: false);
    mateUse('velocity', velocity, isNamed: false);
    mateUse('tolerance', tolerance, isNamed: true);
  }
}

/// class ScrollSpringSimulation extends SpringSimulation
class ScrollSpringSimulation$Mate extends ScrollSpringSimulation with Mate {
  /// ScrollSpringSimulation ScrollSpringSimulation(SpringDescription spring, double start, double end, double velocity, {Tolerance tolerance = Tolerance.defaultTolerance})
  ScrollSpringSimulation$Mate(
    /// requiredParameters: SpringDescription spring
    SpringDescription spring,

    /// requiredParameters: double start
    double start,

    /// requiredParameters: double end
    double end,

    /// requiredParameters: double velocity
    double velocity, {
    /// optionalParameters: {Tolerance tolerance = Tolerance.defaultTolerance} , defaultValue:PrefixedIdentifier
    Tolerance tolerance = Tolerance.defaultTolerance,
  }) : super(
          spring,
          start,
          end,
          velocity,
          tolerance: tolerance,
        ) {
    mateCreateName = 'ScrollSpringSimulation';
    matePackageUrl = 'package:flutter/physics.dart';
    mateBuilder = (p) => ScrollSpringSimulation$Mate(
          p.get('spring').value,
          p.get('start').value,
          p.get('end').value,
          p.get('velocity').value,
          tolerance: p.get('tolerance').build(),
        );
    mateUse('spring', spring, isNamed: false);
    mateUse('start', start, isNamed: false);
    mateUse('end', end, isNamed: false);
    mateUse('velocity', velocity, isNamed: false);
    mateUse('tolerance', tolerance, isNamed: true);
  }
}
