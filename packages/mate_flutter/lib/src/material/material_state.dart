// /// Generated by gen_maters.dart, please don't edit!

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/src/material/material_state.dart' as _i1;
import 'package:mate/mate_core.dart' as _i2;

/// class MaterialStatePropertyAll<T> implements MaterialStateProperty<T>
class MaterialStatePropertyAll$Mate<T> extends _i1.MaterialStatePropertyAll<T>
    with _i2.Mate {
  /// MaterialStatePropertyAll<T> MaterialStatePropertyAll(T value)
  MaterialStatePropertyAll$Mate(

      /// requiredParameters: T value
      super.value)
      : mateParams = {
          'value': _i2.BuilderArg<T>(
            name: 'value',
            init: value,
            isNamed: false,
          )
        },
        super() {
    mateBuilderName = 'MaterialStatePropertyAll';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => MaterialStatePropertyAll$Mate<T>(p.get('value').value);
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class MaterialStatesController extends ValueNotifier<Set<MaterialState>>
class MaterialStatesController$Mate extends _i1.MaterialStatesController
    with _i2.Mate {
  /// MaterialStatesController MaterialStatesController([Set<MaterialState>? value])
  MaterialStatesController$Mate(

      /// requiredParameters: [Set<MaterialState>? value]
      super.value)
      : mateParams = {
          'value': _i2.BuilderArg<Set<_i1.MaterialState>?>(
            name: 'value',
            init: value,
            isNamed: false,
          )
        },
        super() {
    mateBuilderName = 'MaterialStatesController';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => MaterialStatesController$Mate(p.get('value').value);
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}