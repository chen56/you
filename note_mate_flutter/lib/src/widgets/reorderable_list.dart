// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/widgets/reorderable_list.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:core';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:flutter/src/painting/basic_types.dart';
import 'package:flutter/src/widgets/scroll_controller.dart';
import 'package:flutter/src/widgets/scroll_physics.dart';
import 'package:flutter/src/gestures/recognizer.dart';
import 'package:flutter/src/widgets/scroll_view.dart';
import 'dart:ui';
import 'package:note/mate.dart';
import 'package:flutter/src/widgets/sliver.dart';

/// class ReorderableList extends StatefulWidget
class ReorderableList$Mate extends ReorderableList with WidgetMate<ReorderableList$Mate> {
  /// ReorderableList ReorderableList({Key? key, required Widget Function(BuildContext, int) itemBuilder, required int itemCount, required void Function(int, int) onReorder, void Function(int)? onReorderStart, void Function(int)? onReorderEnd, double? itemExtent, Widget? prototypeItem, Widget Function(Widget, int, Animation<double>)? proxyDecorator, EdgeInsetsGeometry? padding, Axis scrollDirection = Axis.vertical, bool reverse = false, ScrollController? controller, bool? primary, ScrollPhysics? physics, bool shrinkWrap = false, double anchor = 0.0, double? cacheExtent, DragStartBehavior dragStartBehavior = DragStartBehavior.start, ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual, String? restorationId, Clip clipBehavior = Clip.hardEdge})
  ReorderableList$Mate({
    /// param: {Key? key}
    Key? key,

    /// param: {required Widget Function(BuildContext, int) itemBuilder}
    required IndexedWidgetBuilder itemBuilder,

    /// param: {required int itemCount}
    required int itemCount,

    /// param: {required void Function(int, int) onReorder}
    required ReorderCallback onReorder,

    /// param: {void Function(int)? onReorderStart}
    void Function(
      int, [
      int,
    ])?
        onReorderStart,

    /// param: {void Function(int)? onReorderEnd}
    void Function(
      int, [
      int,
    ])?
        onReorderEnd,

    /// param: {double? itemExtent}
    double? itemExtent,

    /// param: {Widget? prototypeItem}
    Widget? prototypeItem,

    /// param: {Widget Function(Widget, int, Animation<double>)? proxyDecorator}
    ReorderItemProxyDecorator? proxyDecorator,

    /// param: {EdgeInsetsGeometry? padding}
    EdgeInsetsGeometry? padding,

    /// param: {Axis scrollDirection = Axis.vertical}
    required Axis scrollDirection,

    /// param: {bool reverse = false}
    required bool reverse,

    /// param: {ScrollController? controller}
    ScrollController? controller,

    /// param: {bool? primary}
    bool? primary,

    /// param: {ScrollPhysics? physics}
    ScrollPhysics? physics,

    /// param: {bool shrinkWrap = false}
    required bool shrinkWrap,

    /// param: {double anchor = 0.0}
    required double anchor,

    /// param: {double? cacheExtent}
    double? cacheExtent,

    /// param: {DragStartBehavior dragStartBehavior = DragStartBehavior.start}
    required DragStartBehavior dragStartBehavior,

    /// param: {ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual}
    required ScrollViewKeyboardDismissBehavior keyboardDismissBehavior,

    /// param: {String? restorationId}
    String? restorationId,

    /// param: {Clip clipBehavior = Clip.hardEdge}
    required Clip clipBehavior,
  }) : super(
          key: key,
          itemBuilder: itemBuilder,
          itemCount: itemCount,
          onReorder: onReorder,
          onReorderStart: onReorderStart,
          onReorderEnd: onReorderEnd,
          itemExtent: itemExtent,
          prototypeItem: prototypeItem,
          proxyDecorator: proxyDecorator,
          padding: padding,
          scrollDirection: scrollDirection,
          reverse: reverse,
          controller: controller,
          primary: primary,
          physics: physics,
          shrinkWrap: shrinkWrap,
          anchor: anchor,
          cacheExtent: cacheExtent,
          dragStartBehavior: dragStartBehavior,
          keyboardDismissBehavior: keyboardDismissBehavior,
          restorationId: restorationId,
          clipBehavior: clipBehavior,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ReorderableList$Mate(
        key: p.getValue('key'),
        itemBuilder: p.getValue('itemBuilder'),
        itemCount: p.getValue('itemCount'),
        onReorder: p.getValue('onReorder'),
        onReorderStart: p.getValue('onReorderStart'),
        onReorderEnd: p.getValue('onReorderEnd'),
        itemExtent: p.getValue('itemExtent'),
        prototypeItem: p.getValue('prototypeItem'),
        proxyDecorator: p.getValue('proxyDecorator'),
        padding: p.getValue('padding'),
        scrollDirection: p.getValue('scrollDirection'),
        reverse: p.getValue('reverse'),
        controller: p.getValue('controller'),
        primary: p.getValue('primary'),
        physics: p.getValue('physics'),
        shrinkWrap: p.getValue('shrinkWrap'),
        anchor: p.getValue('anchor'),
        cacheExtent: p.getValue('cacheExtent'),
        dragStartBehavior: p.getValue('dragStartBehavior'),
        keyboardDismissBehavior: p.getValue('keyboardDismissBehavior'),
        restorationId: p.getValue('restorationId'),
        clipBehavior: p.getValue('clipBehavior'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'itemBuilder', init: itemBuilder);
    mateParams.set(name: 'itemCount', init: itemCount);
    mateParams.set(name: 'onReorder', init: onReorder);
    mateParams.set(name: 'onReorderStart', init: onReorderStart);
    mateParams.set(name: 'onReorderEnd', init: onReorderEnd);
    mateParams.set(name: 'itemExtent', init: itemExtent);
    mateParams.set(name: 'prototypeItem', init: prototypeItem);
    mateParams.set(name: 'proxyDecorator', init: proxyDecorator);
    mateParams.set(name: 'padding', init: padding);
    mateParams.set(name: 'scrollDirection', init: scrollDirection);
    mateParams.set(name: 'reverse', init: reverse);
    mateParams.set(name: 'controller', init: controller);
    mateParams.set(name: 'primary', init: primary);
    mateParams.set(name: 'physics', init: physics);
    mateParams.set(name: 'shrinkWrap', init: shrinkWrap);
    mateParams.set(name: 'anchor', init: anchor);
    mateParams.set(name: 'cacheExtent', init: cacheExtent);
    mateParams.set(name: 'dragStartBehavior', init: dragStartBehavior);
    mateParams.set(name: 'keyboardDismissBehavior', init: keyboardDismissBehavior);
    mateParams.set(name: 'restorationId', init: restorationId);
    mateParams.set(name: 'clipBehavior', init: clipBehavior);
  }
}

/// class SliverReorderableList extends StatefulWidget
class SliverReorderableList$Mate extends SliverReorderableList with WidgetMate<SliverReorderableList$Mate> {
  /// SliverReorderableList SliverReorderableList({Key? key, required Widget Function(BuildContext, int) itemBuilder, int? Function(Key)? findChildIndexCallback, required int itemCount, required void Function(int, int) onReorder, void Function(int)? onReorderStart, void Function(int)? onReorderEnd, double? itemExtent, Widget? prototypeItem, Widget Function(Widget, int, Animation<double>)? proxyDecorator})
  SliverReorderableList$Mate({
    /// param: {Key? key}
    Key? key,

    /// param: {required Widget Function(BuildContext, int) itemBuilder}
    required IndexedWidgetBuilder itemBuilder,

    /// param: {int? Function(Key)? findChildIndexCallback}
    ChildIndexGetter? findChildIndexCallback,

    /// param: {required int itemCount}
    required int itemCount,

    /// param: {required void Function(int, int) onReorder}
    required ReorderCallback onReorder,

    /// param: {void Function(int)? onReorderStart}
    void Function(
      int, [
      int,
    ])?
        onReorderStart,

    /// param: {void Function(int)? onReorderEnd}
    void Function(
      int, [
      int,
    ])?
        onReorderEnd,

    /// param: {double? itemExtent}
    double? itemExtent,

    /// param: {Widget? prototypeItem}
    Widget? prototypeItem,

    /// param: {Widget Function(Widget, int, Animation<double>)? proxyDecorator}
    ReorderItemProxyDecorator? proxyDecorator,
  }) : super(
          key: key,
          itemBuilder: itemBuilder,
          findChildIndexCallback: findChildIndexCallback,
          itemCount: itemCount,
          onReorder: onReorder,
          onReorderStart: onReorderStart,
          onReorderEnd: onReorderEnd,
          itemExtent: itemExtent,
          prototypeItem: prototypeItem,
          proxyDecorator: proxyDecorator,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => SliverReorderableList$Mate(
        key: p.getValue('key'),
        itemBuilder: p.getValue('itemBuilder'),
        findChildIndexCallback: p.getValue('findChildIndexCallback'),
        itemCount: p.getValue('itemCount'),
        onReorder: p.getValue('onReorder'),
        onReorderStart: p.getValue('onReorderStart'),
        onReorderEnd: p.getValue('onReorderEnd'),
        itemExtent: p.getValue('itemExtent'),
        prototypeItem: p.getValue('prototypeItem'),
        proxyDecorator: p.getValue('proxyDecorator'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'itemBuilder', init: itemBuilder);
    mateParams.set(name: 'findChildIndexCallback', init: findChildIndexCallback);
    mateParams.set(name: 'itemCount', init: itemCount);
    mateParams.set(name: 'onReorder', init: onReorder);
    mateParams.set(name: 'onReorderStart', init: onReorderStart);
    mateParams.set(name: 'onReorderEnd', init: onReorderEnd);
    mateParams.set(name: 'itemExtent', init: itemExtent);
    mateParams.set(name: 'prototypeItem', init: prototypeItem);
    mateParams.set(name: 'proxyDecorator', init: proxyDecorator);
  }
}

/// class ReorderableDragStartListener extends StatelessWidget
class ReorderableDragStartListener$Mate extends ReorderableDragStartListener
    with WidgetMate<ReorderableDragStartListener$Mate> {
  /// ReorderableDragStartListener ReorderableDragStartListener({Key? key, required Widget child, required int index, bool enabled = true})
  ReorderableDragStartListener$Mate({
    /// param: {Key? key}
    Key? key,

    /// param: {required Widget child}
    required Widget child,

    /// param: {required int index}
    required int index,

    /// param: {bool enabled = true}
    required bool enabled,
  }) : super(
          key: key,
          child: child,
          index: index,
          enabled: enabled,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ReorderableDragStartListener$Mate(
        key: p.getValue('key'),
        child: p.getValue('child'),
        index: p.getValue('index'),
        enabled: p.getValue('enabled'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'child', init: child);
    mateParams.set(name: 'index', init: index);
    mateParams.set(name: 'enabled', init: enabled);
  }
}

/// class ReorderableDelayedDragStartListener extends ReorderableDragStartListener
class ReorderableDelayedDragStartListener$Mate extends ReorderableDelayedDragStartListener
    with WidgetMate<ReorderableDelayedDragStartListener$Mate> {
  /// ReorderableDelayedDragStartListener ReorderableDelayedDragStartListener({Key? key, required Widget child, required int index, bool enabled = true})
  ReorderableDelayedDragStartListener$Mate({
    /// param: {Key? key}
    Key? key,

    /// param: {required Widget child}
    required Widget child,

    /// param: {required int index}
    required int index,

    /// param: {bool enabled = true}
    required bool enabled,
  }) : super(
          key: key,
          child: child,
          index: index,
          enabled: enabled,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ReorderableDelayedDragStartListener$Mate(
        key: p.getValue('key'),
        child: p.getValue('child'),
        index: p.getValue('index'),
        enabled: p.getValue('enabled'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'child', init: child);
    mateParams.set(name: 'index', init: index);
    mateParams.set(name: 'enabled', init: enabled);
  }
}