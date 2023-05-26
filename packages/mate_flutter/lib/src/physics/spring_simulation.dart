// /// Generated by gen_maters.dart, please don't edit!

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/src/physics/spring_simulation.dart' as _i1;
import 'package:mate/mate_core.dart' as _i2;
import 'package:flutter/src/physics/tolerance.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i4;

/// class SpringDescription
class SpringDescription$Mate extends _i1.SpringDescription with _i2.Mate {
  /// SpringDescription SpringDescription({required double mass, required double stiffness, required double damping})
  SpringDescription$Mate({
    /// optionalParameters: {required double mass} , default:none
    required super.mass,

    /// optionalParameters: {required double stiffness} , default:none
    required super.stiffness,

    /// optionalParameters: {required double damping} , default:none
    required super.damping,
  })  : mateParams = {
          'mass': _i2.BuilderArg<double>(
            name: 'mass',
            init: mass,
            isNamed: true,
          ),
          'stiffness': _i2.BuilderArg<double>(
            name: 'stiffness',
            init: stiffness,
            isNamed: true,
          ),
          'damping': _i2.BuilderArg<double>(
            name: 'damping',
            init: damping,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'SpringDescription';
    matePackageUrl = 'package:flutter/animation.dart';
    mateBuilder = (p) => SpringDescription$Mate(
          mass: p.get('mass').build(),
          stiffness: p.get('stiffness').build(),
          damping: p.get('damping').build(),
        );
  }

  /// SpringDescription SpringDescription.withDampingRatio({required double mass, required double stiffness, double ratio = 1.0})
  SpringDescription$Mate.withDampingRatio({
    /// optionalParameters: {required double mass} , default:none
    required super.mass,

    /// optionalParameters: {required double stiffness} , default:none
    required super.stiffness,

    /// optionalParameters: {double ratio = 1.0} , default:processed=DoubleLiteralImpl
    super.ratio,
  })  : mateParams = {
          'mass': _i2.BuilderArg<double>(
            name: 'mass',
            init: mass,
            isNamed: true,
          ),
          'stiffness': _i2.BuilderArg<double>(
            name: 'stiffness',
            init: stiffness,
            isNamed: true,
          ),
          'ratio': _i2.BuilderArg<double>(
            name: 'ratio',
            init: ratio,
            isNamed: true,
            defaultValue: 1.0,
          ),
        },
        super.withDampingRatio() {
    mateBuilderName = 'SpringDescription.withDampingRatio';
    matePackageUrl = 'package:flutter/animation.dart';
    mateBuilder = (p) => SpringDescription$Mate.withDampingRatio(
          mass: p.get('mass').build(),
          stiffness: p.get('stiffness').build(),
          ratio: p.get('ratio').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class SpringSimulation extends Simulation
class SpringSimulation$Mate extends _i1.SpringSimulation with _i2.Mate {
  /// SpringSimulation SpringSimulation(SpringDescription spring, double start, double end, double velocity, {Tolerance tolerance = Tolerance.defaultTolerance})
  SpringSimulation$Mate(
    /// requiredParameters: SpringDescription spring
    super.spring,

    /// requiredParameters: double start
    super.start,

    /// requiredParameters: double end
    super.end,

    /// requiredParameters: double velocity
    super.velocity, {
    /// optionalParameters: {Tolerance tolerance = Tolerance.defaultTolerance} , default:processed=PrefixedIdentifierImpl
    super.tolerance,
  })  : mateParams = {
          'spring': _i2.BuilderArg<_i1.SpringDescription>(
            name: 'spring',
            init: spring,
            isNamed: false,
          ),
          'start': _i2.BuilderArg<double>(
            name: 'start',
            init: start,
            isNamed: false,
          ),
          'end': _i2.BuilderArg<double>(
            name: 'end',
            init: end,
            isNamed: false,
          ),
          'velocity': _i2.BuilderArg<double>(
            name: 'velocity',
            init: velocity,
            isNamed: false,
          ),
          'tolerance': _i2.BuilderArg<_i3.Tolerance>(
            name: 'tolerance',
            init: tolerance,
            isNamed: true,
            defaultValue: _i4.Tolerance.defaultTolerance,
          ),
        },
        super() {
    mateBuilderName = 'SpringSimulation';
    matePackageUrl = 'package:flutter/physics.dart';
    mateBuilder = (p) => SpringSimulation$Mate(
          p.get('spring').value,
          p.get('start').value,
          p.get('end').value,
          p.get('velocity').value,
          tolerance: p.get('tolerance').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class ScrollSpringSimulation extends SpringSimulation
class ScrollSpringSimulation$Mate extends _i1.ScrollSpringSimulation
    with _i2.Mate {
  /// ScrollSpringSimulation ScrollSpringSimulation(SpringDescription spring, double start, double end, double velocity, {Tolerance tolerance = Tolerance.defaultTolerance})
  ScrollSpringSimulation$Mate(
    /// requiredParameters: SpringDescription spring
    super.spring,

    /// requiredParameters: double start
    super.start,

    /// requiredParameters: double end
    super.end,

    /// requiredParameters: double velocity
    super.velocity, {
    /// optionalParameters: {Tolerance tolerance = Tolerance.defaultTolerance} , default:processed=PrefixedIdentifierImpl
    super.tolerance,
  })  : mateParams = {
          'spring': _i2.BuilderArg<_i1.SpringDescription>(
            name: 'spring',
            init: spring,
            isNamed: false,
          ),
          'start': _i2.BuilderArg<double>(
            name: 'start',
            init: start,
            isNamed: false,
          ),
          'end': _i2.BuilderArg<double>(
            name: 'end',
            init: end,
            isNamed: false,
          ),
          'velocity': _i2.BuilderArg<double>(
            name: 'velocity',
            init: velocity,
            isNamed: false,
          ),
          'tolerance': _i2.BuilderArg<_i3.Tolerance>(
            name: 'tolerance',
            init: tolerance,
            isNamed: true,
            defaultValue: _i4.Tolerance.defaultTolerance,
          ),
        },
        super() {
    mateBuilderName = 'ScrollSpringSimulation';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => ScrollSpringSimulation$Mate(
          p.get('spring').value,
          p.get('start').value,
          p.get('end').value,
          p.get('velocity').value,
          tolerance: p.get('tolerance').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}