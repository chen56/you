// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/draggable_scrollable_sheet.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:core';
import 'package:note/mate.dart';
import 'package:flutter/src/widgets/framework.dart';

/// class DraggableScrollableSheet extends StatefulWidget
class DraggableScrollableSheet$Mate extends DraggableScrollableSheet with WidgetMate<DraggableScrollableSheet$Mate> {
  /// DraggableScrollableSheet DraggableScrollableSheet({Key? key, double initialChildSize = 0.5, double minChildSize = 0.25, double maxChildSize = 1.0, bool expand = true, bool snap = false, List<double>? snapSizes, Duration? snapAnimationDuration, DraggableScrollableController? controller, required Widget Function(BuildContext, ScrollController) builder})
  DraggableScrollableSheet$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {double initialChildSize = 0.5} , hasDefaultValue:true, defaultValueCode:0.5
    required double initialChildSize,

    /// optionalParameters: {double minChildSize = 0.25} , hasDefaultValue:true, defaultValueCode:0.25
    required double minChildSize,

    /// optionalParameters: {double maxChildSize = 1.0} , hasDefaultValue:true, defaultValueCode:1.0
    required double maxChildSize,

    /// optionalParameters: {bool expand = true} , hasDefaultValue:true, defaultValueCode:true
    required bool expand,

    /// optionalParameters: {bool snap = false} , hasDefaultValue:true, defaultValueCode:false
    required bool snap,

    /// optionalParameters: {List<double>? snapSizes} , hasDefaultValue:false, defaultValueCode:null
    List<double>? snapSizes,

    /// optionalParameters: {Duration? snapAnimationDuration} , hasDefaultValue:false, defaultValueCode:null
    Duration? snapAnimationDuration,

    /// optionalParameters: {DraggableScrollableController? controller} , hasDefaultValue:false, defaultValueCode:null
    DraggableScrollableController? controller,

    /// optionalParameters: {required Widget Function(BuildContext, ScrollController) builder} , hasDefaultValue:false, defaultValueCode:null
    required ScrollableWidgetBuilder builder,
  }) : super(
          key: key,
          initialChildSize: initialChildSize,
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
          expand: expand,
          snap: snap,
          snapSizes: snapSizes,
          snapAnimationDuration: snapAnimationDuration,
          controller: controller,
          builder: builder,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => DraggableScrollableSheet$Mate(
        key: p.getValue('key'),
        initialChildSize: p.getValue('initialChildSize'),
        minChildSize: p.getValue('minChildSize'),
        maxChildSize: p.getValue('maxChildSize'),
        expand: p.getValue('expand'),
        snap: p.getValue('snap'),
        snapSizes: p.getValue('snapSizes'),
        snapAnimationDuration: p.getValue('snapAnimationDuration'),
        controller: p.getValue('controller'),
        builder: p.getValue('builder'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'initialChildSize', init: initialChildSize);
    mateParams.set(name: 'minChildSize', init: minChildSize);
    mateParams.set(name: 'maxChildSize', init: maxChildSize);
    mateParams.set(name: 'expand', init: expand);
    mateParams.set(name: 'snap', init: snap);
    mateParams.set(name: 'snapSizes', init: snapSizes);
    mateParams.set(name: 'snapAnimationDuration', init: snapAnimationDuration);
    mateParams.set(name: 'controller', init: controller);
    mateParams.set(name: 'builder', init: builder);
  }
}

/// class DraggableScrollableNotification extends Notification with ViewportNotificationMixin
class DraggableScrollableNotification$Mate extends DraggableScrollableNotification
    with Mate<DraggableScrollableNotification$Mate> {
  /// DraggableScrollableNotification DraggableScrollableNotification({required double extent, required double minExtent, required double maxExtent, required double initialExtent, required BuildContext context})
  DraggableScrollableNotification$Mate({
    /// optionalParameters: {required double extent} , hasDefaultValue:false, defaultValueCode:null
    required double extent,

    /// optionalParameters: {required double minExtent} , hasDefaultValue:false, defaultValueCode:null
    required double minExtent,

    /// optionalParameters: {required double maxExtent} , hasDefaultValue:false, defaultValueCode:null
    required double maxExtent,

    /// optionalParameters: {required double initialExtent} , hasDefaultValue:false, defaultValueCode:null
    required double initialExtent,

    /// optionalParameters: {required BuildContext context} , hasDefaultValue:false, defaultValueCode:null
    required BuildContext context,
  }) : super(
          extent: extent,
          minExtent: minExtent,
          maxExtent: maxExtent,
          initialExtent: initialExtent,
          context: context,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => DraggableScrollableNotification$Mate(
        extent: p.getValue('extent'),
        minExtent: p.getValue('minExtent'),
        maxExtent: p.getValue('maxExtent'),
        initialExtent: p.getValue('initialExtent'),
        context: p.getValue('context'),
      ),
    );
    mateParams.set(name: 'extent', init: extent);
    mateParams.set(name: 'minExtent', init: minExtent);
    mateParams.set(name: 'maxExtent', init: maxExtent);
    mateParams.set(name: 'initialExtent', init: initialExtent);
    mateParams.set(name: 'context', init: context);
  }
}

/// class DraggableScrollableActuator extends StatelessWidget
class DraggableScrollableActuator$Mate extends DraggableScrollableActuator
    with WidgetMate<DraggableScrollableActuator$Mate> {
  /// DraggableScrollableActuator DraggableScrollableActuator({Key? key, required Widget child})
  DraggableScrollableActuator$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required Widget child} , hasDefaultValue:false, defaultValueCode:null
    required Widget child,
  }) : super(
          key: key,
          child: child,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => DraggableScrollableActuator$Mate(
        key: p.getValue('key'),
        child: p.getValue('child'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'child', init: child);
  }
}
