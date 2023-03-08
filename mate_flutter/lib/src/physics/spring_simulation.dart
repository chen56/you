// /// Generated by mat_flutter, please don't edit! Created time: 2023-03-09 00:16:01.509648

library;

import 'dart:core';
import 'package:flutter/src/physics/spring_simulation.dart';
import 'package:flutter/src/physics/tolerance.dart';
export 'tolerance.dart' show Tolerance;

/// class SpringDescription
class SpringDescriptionMate {
  /// SpringDescription SpringDescription({required double mass, required double stiffness, required double damping})
  SpringDescriptionMate({
// param: {required double mass}
    required double mass,
// param: {required double stiffness}
    required double stiffness,
// param: {required double damping}
    required double damping,
  }) {}

  /// SpringDescription SpringDescription.withDampingRatio({required double mass, required double stiffness, double ratio = 1.0})
  SpringDescriptionMate.withDampingRatio({
// param: {required double mass}
    required double mass,
// param: {required double stiffness}
    required double stiffness,
// param: {double ratio = 1.0}
    required double ratio,
  }) {}
}

/// class SpringSimulation extends Simulation
class SpringSimulationMate {
  /// SpringSimulation SpringSimulation(SpringDescription spring, double start, double end, double velocity, {Tolerance tolerance = Tolerance.defaultTolerance})
  SpringSimulationMate(
// param: SpringDescription spring
    SpringDescription spring,
// param: double start
    double start,
// param: double end
    double end,
// param: double velocity
    double velocity, {
// param: {Tolerance tolerance = Tolerance.defaultTolerance}
    required Tolerance tolerance,
  }) {}
}

/// class ScrollSpringSimulation extends SpringSimulation
class ScrollSpringSimulationMate {
  /// ScrollSpringSimulation ScrollSpringSimulation(SpringDescription spring, double start, double end, double velocity, {Tolerance tolerance = Tolerance.defaultTolerance})
  ScrollSpringSimulationMate(
// param: SpringDescription spring
    SpringDescription spring,
// param: double start
    double start,
// param: double end
    double end,
// param: double velocity
    double velocity, {
// param: {Tolerance tolerance = Tolerance.defaultTolerance}
    required Tolerance tolerance,
  }) {}
}
