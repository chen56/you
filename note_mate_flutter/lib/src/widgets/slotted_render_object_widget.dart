// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/slotted_render_object_widget.dart';
import 'package:note/mate.dart';

/// class SlottedRenderObjectElement<S> extends RenderObjectElement
class SlottedRenderObjectElement$Mate<S> extends SlottedRenderObjectElement<S>
    with Mate<SlottedRenderObjectElement$Mate> {
  /// SlottedRenderObjectElement<S> SlottedRenderObjectElement(SlottedMultiChildRenderObjectWidgetMixin<S> widget)
  SlottedRenderObjectElement$Mate(

      /// requiredParameters: SlottedMultiChildRenderObjectWidgetMixin<S> widget
      SlottedMultiChildRenderObjectWidgetMixin<S> widget)
      : super(widget) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => SlottedRenderObjectElement$Mate(p.get('widget').value),
    );
    mateParams.put('widget', widget);
  }
}
