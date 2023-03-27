// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/rendering/object.dart';
import 'package:flutter/src/widgets/binding.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:core';

/// class RenderObjectToWidgetAdapter<T extends RenderObject> extends RenderObjectWidget
class RenderObjectToWidgetAdapter$Mate<T extends RenderObject> extends RenderObjectToWidgetAdapter<T> with Mate {
  /// RenderObjectToWidgetAdapter<T> RenderObjectToWidgetAdapter({Widget? child, required RenderObjectWithChildMixin<T> container, String? debugShortDescription})
  RenderObjectToWidgetAdapter$Mate({
    /// optionalParameters: {Widget? child} , defaultValue:none
    Widget? child,

    /// optionalParameters: {required RenderObjectWithChildMixin<T> container} , defaultValue:none
    required RenderObjectWithChildMixin<T> container,

    /// optionalParameters: {String? debugShortDescription} , defaultValue:none
    String? debugShortDescription,
  }) : super(
          child: child,
          container: container,
          debugShortDescription: debugShortDescription,
        ) {
    mateCreateName = 'RenderObjectToWidgetAdapter';
    matePackageUrl = 'package:flutter/widgets.dart';
    mateBuilder = (p) => RenderObjectToWidgetAdapter$Mate<T>(
          child: p.get('child').build(),
          container: p.get('container').build(),
          debugShortDescription: p.get('debugShortDescription').build(),
        );
    mateUse('child', child, isNamed: true);
    mateUse('container', container, isNamed: true);
    mateUse('debugShortDescription', debugShortDescription, isNamed: true);
  }
}

/// class RenderObjectToWidgetElement<T extends RenderObject> extends RootRenderObjectElement
class RenderObjectToWidgetElement$Mate<T extends RenderObject> extends RenderObjectToWidgetElement<T> with Mate {
  /// RenderObjectToWidgetElement<T> RenderObjectToWidgetElement(RenderObjectToWidgetAdapter<T> widget)
  RenderObjectToWidgetElement$Mate(

      /// requiredParameters: RenderObjectToWidgetAdapter<T> widget
      RenderObjectToWidgetAdapter<T> widget)
      : super(widget) {
    mateCreateName = 'RenderObjectToWidgetElement';
    matePackageUrl = 'package:flutter/widgets.dart';
    mateBuilder = (p) => RenderObjectToWidgetElement$Mate<T>(p.get('widget').value);
    mateUse('widget', widget, isNamed: false);
  }
}
