// /// Generated by gen_maters.dart, please don't edit!

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/src/rendering/binding.dart' as _i1;
import 'package:mate/mate_core.dart' as _i2;
import 'package:flutter/src/rendering/box.dart' as _i3;

/// class RenderingFlutterBinding extends BindingBase with GestureBinding, SchedulerBinding, ServicesBinding, SemanticsBinding, PaintingBinding, RendererBinding
class RenderingFlutterBinding$Mate extends _i1.RenderingFlutterBinding
    with _i2.Mate {
  /// RenderingFlutterBinding RenderingFlutterBinding({RenderBox? root})
  RenderingFlutterBinding$Mate(
      {
      /// optionalParameters: {RenderBox? root} , default:none
      super.root})
      : mateParams = {
          'root': _i2.BuilderArg<_i3.RenderBox?>(
            name: 'root',
            init: root,
            isNamed: true,
          )
        },
        super() {
    mateBuilderName = 'RenderingFlutterBinding';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder =
        (p) => RenderingFlutterBinding$Mate(root: p.get('root').build());
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}