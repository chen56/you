// /// Generated by gen_maters.dart, please don't edit!

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/src/widgets/list_wheel_scroll_view.dart' as _i1;
import 'package:mate/mate_core.dart' as _i2;
import 'package:flutter/src/widgets/framework.dart' as _i3;
import 'package:flutter/src/widgets/scroll_controller.dart' as _i4;
import 'package:flutter/src/painting/basic_types.dart' as _i5;
import 'package:flutter/src/widgets/scroll_physics.dart' as _i6;
import 'package:flutter/src/foundation/key.dart' as _i7;
import 'package:flutter/rendering.dart' as _i8;
import 'package:flutter/src/foundation/basic_types.dart' as _i9;
import 'dart:ui' as _i10;
import 'package:flutter/src/widgets/scroll_configuration.dart' as _i11;
import 'package:flutter/src/rendering/viewport_offset.dart' as _i12;

/// class ListWheelChildListDelegate extends ListWheelChildDelegate
class ListWheelChildListDelegate$Mate extends _i1.ListWheelChildListDelegate with _i2.Mate {
  /// ListWheelChildListDelegate ListWheelChildListDelegate({required List<Widget> children})
  ListWheelChildListDelegate$Mate(
      {
      /// optionalParameters: {required List<Widget> children} , default:none
      required super.children})
      : mateParams = {
          'children': _i2.BuilderArg<List<_i3.Widget>>(
            name: 'children',
            init: children,
            isNamed: true,
          )
        },
        super() {
    mateBuilderName = 'ListWheelChildListDelegate';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => ListWheelChildListDelegate$Mate(children: p.get('children').build());
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class ListWheelChildLoopingListDelegate extends ListWheelChildDelegate
class ListWheelChildLoopingListDelegate$Mate extends _i1.ListWheelChildLoopingListDelegate with _i2.Mate {
  /// ListWheelChildLoopingListDelegate ListWheelChildLoopingListDelegate({required List<Widget> children})
  ListWheelChildLoopingListDelegate$Mate(
      {
      /// optionalParameters: {required List<Widget> children} , default:none
      required super.children})
      : mateParams = {
          'children': _i2.BuilderArg<List<_i3.Widget>>(
            name: 'children',
            init: children,
            isNamed: true,
          )
        },
        super() {
    mateBuilderName = 'ListWheelChildLoopingListDelegate';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => ListWheelChildLoopingListDelegate$Mate(children: p.get('children').build());
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class ListWheelChildBuilderDelegate extends ListWheelChildDelegate
class ListWheelChildBuilderDelegate$Mate extends _i1.ListWheelChildBuilderDelegate with _i2.Mate {
  /// ListWheelChildBuilderDelegate ListWheelChildBuilderDelegate({required Widget? Function(BuildContext, int) builder, int? childCount})
  ListWheelChildBuilderDelegate$Mate({
    /// optionalParameters: {required Widget? Function(BuildContext, int) builder} , default:none
    required super.builder,

    /// optionalParameters: {int? childCount} , default:none
    super.childCount,
  })  : mateParams = {
          'builder': _i2.BuilderArg<_i3.NullableIndexedWidgetBuilder>(
            name: 'builder',
            init: builder,
            isNamed: true,
          ),
          'childCount': _i2.BuilderArg<int?>(
            name: 'childCount',
            init: childCount,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'ListWheelChildBuilderDelegate';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => ListWheelChildBuilderDelegate$Mate(
          builder: p.get('builder').build(),
          childCount: p.get('childCount').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class FixedExtentScrollController extends ScrollController
class FixedExtentScrollController$Mate extends _i1.FixedExtentScrollController with _i2.Mate {
  /// FixedExtentScrollController FixedExtentScrollController({int initialItem = 0, void Function(ScrollPosition)? onAttach, void Function(ScrollPosition)? onDetach})
  FixedExtentScrollController$Mate({
    /// optionalParameters: {int initialItem = 0} , default:processed=IntegerLiteralImpl
    super.initialItem,

    /// optionalParameters: {void Function(ScrollPosition)? onAttach} , default:none
    super.onAttach,

    /// optionalParameters: {void Function(ScrollPosition)? onDetach} , default:none
    super.onDetach,
  })  : mateParams = {
          'initialItem': _i2.BuilderArg<int>(
            name: 'initialItem',
            init: initialItem,
            isNamed: true,
            defaultValue: 0,
          ),
          'onAttach': _i2.BuilderArg<_i4.ScrollControllerCallback?>(
            name: 'onAttach',
            init: onAttach,
            isNamed: true,
          ),
          'onDetach': _i2.BuilderArg<_i4.ScrollControllerCallback?>(
            name: 'onDetach',
            init: onDetach,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'FixedExtentScrollController';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => FixedExtentScrollController$Mate(
          initialItem: p.get('initialItem').build(),
          onAttach: p.get('onAttach').build(),
          onDetach: p.get('onDetach').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class FixedExtentMetrics extends FixedScrollMetrics
class FixedExtentMetrics$Mate extends _i1.FixedExtentMetrics with _i2.Mate {
  /// FixedExtentMetrics FixedExtentMetrics({required double? minScrollExtent, required double? maxScrollExtent, required double? pixels, required double? viewportDimension, required AxisDirection axisDirection, required int itemIndex, required double devicePixelRatio})
  FixedExtentMetrics$Mate({
    /// optionalParameters: {required double? minScrollExtent} , default:none
    required super.minScrollExtent,

    /// optionalParameters: {required double? maxScrollExtent} , default:none
    required super.maxScrollExtent,

    /// optionalParameters: {required double? pixels} , default:none
    required super.pixels,

    /// optionalParameters: {required double? viewportDimension} , default:none
    required super.viewportDimension,

    /// optionalParameters: {required AxisDirection axisDirection} , default:none
    required super.axisDirection,

    /// optionalParameters: {required int itemIndex} , default:none
    required super.itemIndex,

    /// optionalParameters: {required double devicePixelRatio} , default:none
    required super.devicePixelRatio,
  })  : mateParams = {
          'minScrollExtent': _i2.BuilderArg<double?>(
            name: 'minScrollExtent',
            init: minScrollExtent,
            isNamed: true,
          ),
          'maxScrollExtent': _i2.BuilderArg<double?>(
            name: 'maxScrollExtent',
            init: maxScrollExtent,
            isNamed: true,
          ),
          'pixels': _i2.BuilderArg<double?>(
            name: 'pixels',
            init: pixels,
            isNamed: true,
          ),
          'viewportDimension': _i2.BuilderArg<double?>(
            name: 'viewportDimension',
            init: viewportDimension,
            isNamed: true,
          ),
          'axisDirection': _i2.BuilderArg<_i5.AxisDirection>(
            name: 'axisDirection',
            init: axisDirection,
            isNamed: true,
          ),
          'itemIndex': _i2.BuilderArg<int>(
            name: 'itemIndex',
            init: itemIndex,
            isNamed: true,
          ),
          'devicePixelRatio': _i2.BuilderArg<double>(
            name: 'devicePixelRatio',
            init: devicePixelRatio,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'FixedExtentMetrics';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => FixedExtentMetrics$Mate(
          minScrollExtent: p.get('minScrollExtent').build(),
          maxScrollExtent: p.get('maxScrollExtent').build(),
          pixels: p.get('pixels').build(),
          viewportDimension: p.get('viewportDimension').build(),
          axisDirection: p.get('axisDirection').build(),
          itemIndex: p.get('itemIndex').build(),
          devicePixelRatio: p.get('devicePixelRatio').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class FixedExtentScrollPhysics extends ScrollPhysics
class FixedExtentScrollPhysics$Mate extends _i1.FixedExtentScrollPhysics with _i2.Mate {
  /// FixedExtentScrollPhysics FixedExtentScrollPhysics({ScrollPhysics? parent})
  FixedExtentScrollPhysics$Mate(
      {
      /// optionalParameters: {ScrollPhysics? parent} , default:none
      super.parent})
      : mateParams = {
          'parent': _i2.BuilderArg<_i6.ScrollPhysics?>(
            name: 'parent',
            init: parent,
            isNamed: true,
          )
        },
        super() {
    mateBuilderName = 'FixedExtentScrollPhysics';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => FixedExtentScrollPhysics$Mate(parent: p.get('parent').build());
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class ListWheelScrollView extends StatefulWidget
class ListWheelScrollView$Mate extends _i1.ListWheelScrollView with _i2.Mate {
  /// ListWheelScrollView ListWheelScrollView({Key? key, ScrollController? controller, ScrollPhysics? physics, double diameterRatio = RenderListWheelViewport.defaultDiameterRatio, double perspective = RenderListWheelViewport.defaultPerspective, double offAxisFraction = 0.0, bool useMagnifier = false, double magnification = 1.0, double overAndUnderCenterOpacity = 1.0, required double itemExtent, double squeeze = 1.0, void Function(int)? onSelectedItemChanged, bool renderChildrenOutsideViewport = false, Clip clipBehavior = Clip.hardEdge, String? restorationId, ScrollBehavior? scrollBehavior, required List<Widget> children})
  ListWheelScrollView$Mate({
    /// optionalParameters: {Key? key} , default:none
    super.key,

    /// optionalParameters: {ScrollController? controller} , default:none
    super.controller,

    /// optionalParameters: {ScrollPhysics? physics} , default:none
    super.physics,

    /// optionalParameters: {double diameterRatio = RenderListWheelViewport.defaultDiameterRatio} , default:processed=PrefixedIdentifierImpl
    super.diameterRatio,

    /// optionalParameters: {double perspective = RenderListWheelViewport.defaultPerspective} , default:processed=PrefixedIdentifierImpl
    super.perspective,

    /// optionalParameters: {double offAxisFraction = 0.0} , default:processed=DoubleLiteralImpl
    super.offAxisFraction,

    /// optionalParameters: {bool useMagnifier = false} , default:processed=BooleanLiteralImpl
    super.useMagnifier,

    /// optionalParameters: {double magnification = 1.0} , default:processed=DoubleLiteralImpl
    super.magnification,

    /// optionalParameters: {double overAndUnderCenterOpacity = 1.0} , default:processed=DoubleLiteralImpl
    super.overAndUnderCenterOpacity,

    /// optionalParameters: {required double itemExtent} , default:none
    required super.itemExtent,

    /// optionalParameters: {double squeeze = 1.0} , default:processed=DoubleLiteralImpl
    super.squeeze,

    /// optionalParameters: {void Function(int)? onSelectedItemChanged} , default:none
    super.onSelectedItemChanged,

    /// optionalParameters: {bool renderChildrenOutsideViewport = false} , default:processed=BooleanLiteralImpl
    super.renderChildrenOutsideViewport,

    /// optionalParameters: {Clip clipBehavior = Clip.hardEdge} , default:processed=PrefixedIdentifierImpl
    super.clipBehavior,

    /// optionalParameters: {String? restorationId} , default:none
    super.restorationId,

    /// optionalParameters: {ScrollBehavior? scrollBehavior} , default:none
    super.scrollBehavior,

    /// optionalParameters: {required List<Widget> children} , default:none
    required super.children,
  })  : mateParams = {
          'key': _i2.BuilderArg<_i7.Key?>(
            name: 'key',
            init: key,
            isNamed: true,
          ),
          'controller': _i2.BuilderArg<_i4.ScrollController?>(
            name: 'controller',
            init: controller,
            isNamed: true,
          ),
          'physics': _i2.BuilderArg<_i6.ScrollPhysics?>(
            name: 'physics',
            init: physics,
            isNamed: true,
          ),
          'diameterRatio': _i2.BuilderArg<double>(
            name: 'diameterRatio',
            init: diameterRatio,
            isNamed: true,
            defaultValue: _i8.RenderListWheelViewport.defaultDiameterRatio,
          ),
          'perspective': _i2.BuilderArg<double>(
            name: 'perspective',
            init: perspective,
            isNamed: true,
            defaultValue: _i8.RenderListWheelViewport.defaultPerspective,
          ),
          'offAxisFraction': _i2.BuilderArg<double>(
            name: 'offAxisFraction',
            init: offAxisFraction,
            isNamed: true,
            defaultValue: 0.0,
          ),
          'useMagnifier': _i2.BuilderArg<bool>(
            name: 'useMagnifier',
            init: useMagnifier,
            isNamed: true,
            defaultValue: false,
          ),
          'magnification': _i2.BuilderArg<double>(
            name: 'magnification',
            init: magnification,
            isNamed: true,
            defaultValue: 1.0,
          ),
          'overAndUnderCenterOpacity': _i2.BuilderArg<double>(
            name: 'overAndUnderCenterOpacity',
            init: overAndUnderCenterOpacity,
            isNamed: true,
            defaultValue: 1.0,
          ),
          'itemExtent': _i2.BuilderArg<double>(
            name: 'itemExtent',
            init: itemExtent,
            isNamed: true,
          ),
          'squeeze': _i2.BuilderArg<double>(
            name: 'squeeze',
            init: squeeze,
            isNamed: true,
            defaultValue: 1.0,
          ),
          'onSelectedItemChanged': _i2.BuilderArg<_i9.ValueChanged<int>?>(
            name: 'onSelectedItemChanged',
            init: onSelectedItemChanged,
            isNamed: true,
          ),
          'renderChildrenOutsideViewport': _i2.BuilderArg<bool>(
            name: 'renderChildrenOutsideViewport',
            init: renderChildrenOutsideViewport,
            isNamed: true,
            defaultValue: false,
          ),
          'clipBehavior': _i2.BuilderArg<_i10.Clip>(
            name: 'clipBehavior',
            init: clipBehavior,
            isNamed: true,
            defaultValue: _i10.Clip.hardEdge,
          ),
          'restorationId': _i2.BuilderArg<String?>(
            name: 'restorationId',
            init: restorationId,
            isNamed: true,
          ),
          'scrollBehavior': _i2.BuilderArg<_i11.ScrollBehavior?>(
            name: 'scrollBehavior',
            init: scrollBehavior,
            isNamed: true,
          ),
          'children': _i2.BuilderArg<List<_i3.Widget>>(
            name: 'children',
            init: children,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'ListWheelScrollView';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => ListWheelScrollView$Mate(
          key: p.get('key').build(),
          controller: p.get('controller').build(),
          physics: p.get('physics').build(),
          diameterRatio: p.get('diameterRatio').build(),
          perspective: p.get('perspective').build(),
          offAxisFraction: p.get('offAxisFraction').build(),
          useMagnifier: p.get('useMagnifier').build(),
          magnification: p.get('magnification').build(),
          overAndUnderCenterOpacity: p.get('overAndUnderCenterOpacity').build(),
          itemExtent: p.get('itemExtent').build(),
          squeeze: p.get('squeeze').build(),
          onSelectedItemChanged: p.get('onSelectedItemChanged').build(),
          renderChildrenOutsideViewport: p.get('renderChildrenOutsideViewport').build(),
          clipBehavior: p.get('clipBehavior').build(),
          restorationId: p.get('restorationId').build(),
          scrollBehavior: p.get('scrollBehavior').build(),
          children: p.get('children').build(),
        );
  }

  /// ListWheelScrollView ListWheelScrollView.useDelegate({Key? key, ScrollController? controller, ScrollPhysics? physics, double diameterRatio = RenderListWheelViewport.defaultDiameterRatio, double perspective = RenderListWheelViewport.defaultPerspective, double offAxisFraction = 0.0, bool useMagnifier = false, double magnification = 1.0, double overAndUnderCenterOpacity = 1.0, required double itemExtent, double squeeze = 1.0, void Function(int)? onSelectedItemChanged, bool renderChildrenOutsideViewport = false, Clip clipBehavior = Clip.hardEdge, String? restorationId, ScrollBehavior? scrollBehavior, required ListWheelChildDelegate childDelegate})
  ListWheelScrollView$Mate.useDelegate({
    /// optionalParameters: {Key? key} , default:none
    super.key,

    /// optionalParameters: {ScrollController? controller} , default:none
    super.controller,

    /// optionalParameters: {ScrollPhysics? physics} , default:none
    super.physics,

    /// optionalParameters: {double diameterRatio = RenderListWheelViewport.defaultDiameterRatio} , default:processed=PrefixedIdentifierImpl
    super.diameterRatio,

    /// optionalParameters: {double perspective = RenderListWheelViewport.defaultPerspective} , default:processed=PrefixedIdentifierImpl
    super.perspective,

    /// optionalParameters: {double offAxisFraction = 0.0} , default:processed=DoubleLiteralImpl
    super.offAxisFraction,

    /// optionalParameters: {bool useMagnifier = false} , default:processed=BooleanLiteralImpl
    super.useMagnifier,

    /// optionalParameters: {double magnification = 1.0} , default:processed=DoubleLiteralImpl
    super.magnification,

    /// optionalParameters: {double overAndUnderCenterOpacity = 1.0} , default:processed=DoubleLiteralImpl
    super.overAndUnderCenterOpacity,

    /// optionalParameters: {required double itemExtent} , default:none
    required super.itemExtent,

    /// optionalParameters: {double squeeze = 1.0} , default:processed=DoubleLiteralImpl
    super.squeeze,

    /// optionalParameters: {void Function(int)? onSelectedItemChanged} , default:none
    super.onSelectedItemChanged,

    /// optionalParameters: {bool renderChildrenOutsideViewport = false} , default:processed=BooleanLiteralImpl
    super.renderChildrenOutsideViewport,

    /// optionalParameters: {Clip clipBehavior = Clip.hardEdge} , default:processed=PrefixedIdentifierImpl
    super.clipBehavior,

    /// optionalParameters: {String? restorationId} , default:none
    super.restorationId,

    /// optionalParameters: {ScrollBehavior? scrollBehavior} , default:none
    super.scrollBehavior,

    /// optionalParameters: {required ListWheelChildDelegate childDelegate} , default:none
    required super.childDelegate,
  })  : mateParams = {
          'key': _i2.BuilderArg<_i7.Key?>(
            name: 'key',
            init: key,
            isNamed: true,
          ),
          'controller': _i2.BuilderArg<_i4.ScrollController?>(
            name: 'controller',
            init: controller,
            isNamed: true,
          ),
          'physics': _i2.BuilderArg<_i6.ScrollPhysics?>(
            name: 'physics',
            init: physics,
            isNamed: true,
          ),
          'diameterRatio': _i2.BuilderArg<double>(
            name: 'diameterRatio',
            init: diameterRatio,
            isNamed: true,
            defaultValue: _i8.RenderListWheelViewport.defaultDiameterRatio,
          ),
          'perspective': _i2.BuilderArg<double>(
            name: 'perspective',
            init: perspective,
            isNamed: true,
            defaultValue: _i8.RenderListWheelViewport.defaultPerspective,
          ),
          'offAxisFraction': _i2.BuilderArg<double>(
            name: 'offAxisFraction',
            init: offAxisFraction,
            isNamed: true,
            defaultValue: 0.0,
          ),
          'useMagnifier': _i2.BuilderArg<bool>(
            name: 'useMagnifier',
            init: useMagnifier,
            isNamed: true,
            defaultValue: false,
          ),
          'magnification': _i2.BuilderArg<double>(
            name: 'magnification',
            init: magnification,
            isNamed: true,
            defaultValue: 1.0,
          ),
          'overAndUnderCenterOpacity': _i2.BuilderArg<double>(
            name: 'overAndUnderCenterOpacity',
            init: overAndUnderCenterOpacity,
            isNamed: true,
            defaultValue: 1.0,
          ),
          'itemExtent': _i2.BuilderArg<double>(
            name: 'itemExtent',
            init: itemExtent,
            isNamed: true,
          ),
          'squeeze': _i2.BuilderArg<double>(
            name: 'squeeze',
            init: squeeze,
            isNamed: true,
            defaultValue: 1.0,
          ),
          'onSelectedItemChanged': _i2.BuilderArg<_i9.ValueChanged<int>?>(
            name: 'onSelectedItemChanged',
            init: onSelectedItemChanged,
            isNamed: true,
          ),
          'renderChildrenOutsideViewport': _i2.BuilderArg<bool>(
            name: 'renderChildrenOutsideViewport',
            init: renderChildrenOutsideViewport,
            isNamed: true,
            defaultValue: false,
          ),
          'clipBehavior': _i2.BuilderArg<_i10.Clip>(
            name: 'clipBehavior',
            init: clipBehavior,
            isNamed: true,
            defaultValue: _i10.Clip.hardEdge,
          ),
          'restorationId': _i2.BuilderArg<String?>(
            name: 'restorationId',
            init: restorationId,
            isNamed: true,
          ),
          'scrollBehavior': _i2.BuilderArg<_i11.ScrollBehavior?>(
            name: 'scrollBehavior',
            init: scrollBehavior,
            isNamed: true,
          ),
          'childDelegate': _i2.BuilderArg<_i1.ListWheelChildDelegate>(
            name: 'childDelegate',
            init: childDelegate,
            isNamed: true,
          ),
        },
        super.useDelegate() {
    mateBuilderName = 'ListWheelScrollView.useDelegate';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => ListWheelScrollView$Mate.useDelegate(
          key: p.get('key').build(),
          controller: p.get('controller').build(),
          physics: p.get('physics').build(),
          diameterRatio: p.get('diameterRatio').build(),
          perspective: p.get('perspective').build(),
          offAxisFraction: p.get('offAxisFraction').build(),
          useMagnifier: p.get('useMagnifier').build(),
          magnification: p.get('magnification').build(),
          overAndUnderCenterOpacity: p.get('overAndUnderCenterOpacity').build(),
          itemExtent: p.get('itemExtent').build(),
          squeeze: p.get('squeeze').build(),
          onSelectedItemChanged: p.get('onSelectedItemChanged').build(),
          renderChildrenOutsideViewport: p.get('renderChildrenOutsideViewport').build(),
          clipBehavior: p.get('clipBehavior').build(),
          restorationId: p.get('restorationId').build(),
          scrollBehavior: p.get('scrollBehavior').build(),
          childDelegate: p.get('childDelegate').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class ListWheelElement extends RenderObjectElement implements ListWheelChildManager
class ListWheelElement$Mate extends _i1.ListWheelElement with _i2.Mate {
  /// ListWheelElement ListWheelElement(ListWheelViewport widget)
  ListWheelElement$Mate(

      /// requiredParameters: ListWheelViewport widget
      super.widget)
      : mateParams = {
          'widget': _i2.BuilderArg<_i1.ListWheelViewport>(
            name: 'widget',
            init: widget,
            isNamed: false,
          )
        },
        super() {
    mateBuilderName = 'ListWheelElement';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => ListWheelElement$Mate(p.get('widget').value);
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class ListWheelViewport extends RenderObjectWidget
class ListWheelViewport$Mate extends _i1.ListWheelViewport with _i2.Mate {
  /// ListWheelViewport ListWheelViewport({Key? key, double diameterRatio = RenderListWheelViewport.defaultDiameterRatio, double perspective = RenderListWheelViewport.defaultPerspective, double offAxisFraction = 0.0, bool useMagnifier = false, double magnification = 1.0, double overAndUnderCenterOpacity = 1.0, required double itemExtent, double squeeze = 1.0, bool renderChildrenOutsideViewport = false, required ViewportOffset offset, required ListWheelChildDelegate childDelegate, Clip clipBehavior = Clip.hardEdge})
  ListWheelViewport$Mate({
    /// optionalParameters: {Key? key} , default:none
    super.key,

    /// optionalParameters: {double diameterRatio = RenderListWheelViewport.defaultDiameterRatio} , default:processed=PrefixedIdentifierImpl
    super.diameterRatio,

    /// optionalParameters: {double perspective = RenderListWheelViewport.defaultPerspective} , default:processed=PrefixedIdentifierImpl
    super.perspective,

    /// optionalParameters: {double offAxisFraction = 0.0} , default:processed=DoubleLiteralImpl
    super.offAxisFraction,

    /// optionalParameters: {bool useMagnifier = false} , default:processed=BooleanLiteralImpl
    super.useMagnifier,

    /// optionalParameters: {double magnification = 1.0} , default:processed=DoubleLiteralImpl
    super.magnification,

    /// optionalParameters: {double overAndUnderCenterOpacity = 1.0} , default:processed=DoubleLiteralImpl
    super.overAndUnderCenterOpacity,

    /// optionalParameters: {required double itemExtent} , default:none
    required super.itemExtent,

    /// optionalParameters: {double squeeze = 1.0} , default:processed=DoubleLiteralImpl
    super.squeeze,

    /// optionalParameters: {bool renderChildrenOutsideViewport = false} , default:processed=BooleanLiteralImpl
    super.renderChildrenOutsideViewport,

    /// optionalParameters: {required ViewportOffset offset} , default:none
    required super.offset,

    /// optionalParameters: {required ListWheelChildDelegate childDelegate} , default:none
    required super.childDelegate,

    /// optionalParameters: {Clip clipBehavior = Clip.hardEdge} , default:processed=PrefixedIdentifierImpl
    super.clipBehavior,
  })  : mateParams = {
          'key': _i2.BuilderArg<_i7.Key?>(
            name: 'key',
            init: key,
            isNamed: true,
          ),
          'diameterRatio': _i2.BuilderArg<double>(
            name: 'diameterRatio',
            init: diameterRatio,
            isNamed: true,
            defaultValue: _i8.RenderListWheelViewport.defaultDiameterRatio,
          ),
          'perspective': _i2.BuilderArg<double>(
            name: 'perspective',
            init: perspective,
            isNamed: true,
            defaultValue: _i8.RenderListWheelViewport.defaultPerspective,
          ),
          'offAxisFraction': _i2.BuilderArg<double>(
            name: 'offAxisFraction',
            init: offAxisFraction,
            isNamed: true,
            defaultValue: 0.0,
          ),
          'useMagnifier': _i2.BuilderArg<bool>(
            name: 'useMagnifier',
            init: useMagnifier,
            isNamed: true,
            defaultValue: false,
          ),
          'magnification': _i2.BuilderArg<double>(
            name: 'magnification',
            init: magnification,
            isNamed: true,
            defaultValue: 1.0,
          ),
          'overAndUnderCenterOpacity': _i2.BuilderArg<double>(
            name: 'overAndUnderCenterOpacity',
            init: overAndUnderCenterOpacity,
            isNamed: true,
            defaultValue: 1.0,
          ),
          'itemExtent': _i2.BuilderArg<double>(
            name: 'itemExtent',
            init: itemExtent,
            isNamed: true,
          ),
          'squeeze': _i2.BuilderArg<double>(
            name: 'squeeze',
            init: squeeze,
            isNamed: true,
            defaultValue: 1.0,
          ),
          'renderChildrenOutsideViewport': _i2.BuilderArg<bool>(
            name: 'renderChildrenOutsideViewport',
            init: renderChildrenOutsideViewport,
            isNamed: true,
            defaultValue: false,
          ),
          'offset': _i2.BuilderArg<_i12.ViewportOffset>(
            name: 'offset',
            init: offset,
            isNamed: true,
          ),
          'childDelegate': _i2.BuilderArg<_i1.ListWheelChildDelegate>(
            name: 'childDelegate',
            init: childDelegate,
            isNamed: true,
          ),
          'clipBehavior': _i2.BuilderArg<_i10.Clip>(
            name: 'clipBehavior',
            init: clipBehavior,
            isNamed: true,
            defaultValue: _i10.Clip.hardEdge,
          ),
        },
        super() {
    mateBuilderName = 'ListWheelViewport';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => ListWheelViewport$Mate(
          key: p.get('key').build(),
          diameterRatio: p.get('diameterRatio').build(),
          perspective: p.get('perspective').build(),
          offAxisFraction: p.get('offAxisFraction').build(),
          useMagnifier: p.get('useMagnifier').build(),
          magnification: p.get('magnification').build(),
          overAndUnderCenterOpacity: p.get('overAndUnderCenterOpacity').build(),
          itemExtent: p.get('itemExtent').build(),
          squeeze: p.get('squeeze').build(),
          renderChildrenOutsideViewport: p.get('renderChildrenOutsideViewport').build(),
          offset: p.get('offset').build(),
          childDelegate: p.get('childDelegate').build(),
          clipBehavior: p.get('clipBehavior').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}
