// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/physics/clamped_simulation.dart';
import 'package:flutter/src/physics/simulation.dart';
import 'dart:core';
import 'package:note/mate.dart';
export 'simulation.dart' show Simulation;

/// class ClampedSimulation extends Simulation
class ClampedSimulation$Mate extends ClampedSimulation with Mate<ClampedSimulation$Mate> {
  /// ClampedSimulation ClampedSimulation(Simulation simulation, {double xMin = double.negativeInfinity, double xMax = double.infinity, double dxMin = double.negativeInfinity, double dxMax = double.infinity})
  ClampedSimulation$Mate(
    /// param: Simulation simulation
    Simulation simulation, {
    /// param: {double xMin = double.negativeInfinity}
    required double xMin,

    /// param: {double xMax = double.infinity}
    required double xMax,

    /// param: {double dxMin = double.negativeInfinity}
    required double dxMin,

    /// param: {double dxMax = double.infinity}
    required double dxMax,
  }) : super(
          simulation,
          xMin: xMin,
          xMax: xMax,
          dxMin: dxMin,
          dxMax: dxMax,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ClampedSimulation$Mate(
        p.getValue('simulation'),
        xMin: p.getValue('xMin'),
        xMax: p.getValue('xMax'),
        dxMin: p.getValue('dxMin'),
        dxMax: p.getValue('dxMax'),
      ),
    );
    mateParams.set(name: 'simulation', init: simulation);
    mateParams.set(name: 'xMin', init: xMin);
    mateParams.set(name: 'xMax', init: xMax);
    mateParams.set(name: 'dxMin', init: dxMin);
    mateParams.set(name: 'dxMax', init: dxMax);
  }
}
