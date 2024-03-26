// /// Generated by gen_maters.dart, please don't edit!

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/src/widgets/focus_scope.dart' as _i1;
import 'package:mate/mate_core.dart' as _i2;
import 'package:flutter/src/foundation/key.dart' as _i3;
import 'package:flutter/src/widgets/framework.dart' as _i4;
import 'package:flutter/src/widgets/focus_manager.dart' as _i5;
import 'package:flutter/src/foundation/basic_types.dart' as _i6;

/// class Focus extends StatefulWidget
class Focus$Mate extends _i1.Focus with _i2.Mate {
  /// Focus Focus({Key? key, required Widget child, FocusNode? focusNode, FocusNode? parentNode, bool autofocus = false, void Function(bool)? onFocusChange, KeyEventResult Function(FocusNode, KeyEvent)? onKeyEvent, KeyEventResult Function(FocusNode, RawKeyEvent)? onKey, bool? canRequestFocus, bool? skipTraversal, bool? descendantsAreFocusable, bool? descendantsAreTraversable, bool includeSemantics = true, String? debugLabel})
  Focus$Mate({
    /// optionalParameters: {Key? key} , default:none
    super.key,

    /// optionalParameters: {required Widget child} , default:none
    required super.child,

    /// optionalParameters: {FocusNode? focusNode} , default:none
    super.focusNode,

    /// optionalParameters: {FocusNode? parentNode} , default:none
    super.parentNode,

    /// optionalParameters: {bool autofocus = false} , default:processed=BooleanLiteralImpl
    super.autofocus,

    /// optionalParameters: {void Function(bool)? onFocusChange} , default:none
    super.onFocusChange,

    /// optionalParameters: {KeyEventResult Function(FocusNode, KeyEvent)? onKeyEvent} , default:none
    super.onKeyEvent,

    /// optionalParameters: {bool? canRequestFocus} , default:none
    super.canRequestFocus,

    /// optionalParameters: {bool? skipTraversal} , default:none
    super.skipTraversal,

    /// optionalParameters: {bool? descendantsAreFocusable} , default:none
    super.descendantsAreFocusable,

    /// optionalParameters: {bool? descendantsAreTraversable} , default:none
    super.descendantsAreTraversable,

    /// optionalParameters: {bool includeSemantics = true} , default:processed=BooleanLiteralImpl
    super.includeSemantics,

    /// optionalParameters: {String? debugLabel} , default:none
    super.debugLabel,
  })  : mateParams = {
          'key': _i2.BuilderArg<_i3.Key?>(
            name: 'key',
            init: key,
            isNamed: true,
          ),
          'child': _i2.BuilderArg<_i4.Widget>(
            name: 'child',
            init: child,
            isNamed: true,
          ),
          'focusNode': _i2.BuilderArg<_i5.FocusNode?>(
            name: 'focusNode',
            init: focusNode,
            isNamed: true,
          ),
          'parentNode': _i2.BuilderArg<_i5.FocusNode?>(
            name: 'parentNode',
            init: parentNode,
            isNamed: true,
          ),
          'autofocus': _i2.BuilderArg<bool>(
            name: 'autofocus',
            init: autofocus,
            isNamed: true,
            defaultValue: false,
          ),
          'onFocusChange': _i2.BuilderArg<_i6.ValueChanged<bool>?>(
            name: 'onFocusChange',
            init: onFocusChange,
            isNamed: true,
          ),
          'onKeyEvent': _i2.BuilderArg<_i5.FocusOnKeyEventCallback?>(
            name: 'onKeyEvent',
            init: onKeyEvent,
            isNamed: true,
          ),
          'canRequestFocus': _i2.BuilderArg<bool?>(
            name: 'canRequestFocus',
            init: canRequestFocus,
            isNamed: true,
          ),
          'skipTraversal': _i2.BuilderArg<bool?>(
            name: 'skipTraversal',
            init: skipTraversal,
            isNamed: true,
          ),
          'descendantsAreFocusable': _i2.BuilderArg<bool?>(
            name: 'descendantsAreFocusable',
            init: descendantsAreFocusable,
            isNamed: true,
          ),
          'descendantsAreTraversable': _i2.BuilderArg<bool?>(
            name: 'descendantsAreTraversable',
            init: descendantsAreTraversable,
            isNamed: true,
          ),
          'includeSemantics': _i2.BuilderArg<bool>(
            name: 'includeSemantics',
            init: includeSemantics,
            isNamed: true,
            defaultValue: true,
          ),
          'debugLabel': _i2.BuilderArg<String?>(
            name: 'debugLabel',
            init: debugLabel,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'Focus';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => Focus$Mate(
          key: p.get('key').build(),
          child: p.get('child').build(),
          focusNode: p.get('focusNode').build(),
          parentNode: p.get('parentNode').build(),
          autofocus: p.get('autofocus').build(),
          onFocusChange: p.get('onFocusChange').build(),
          onKeyEvent: p.get('onKeyEvent').build(),
          canRequestFocus: p.get('canRequestFocus').build(),
          skipTraversal: p.get('skipTraversal').build(),
          descendantsAreFocusable: p.get('descendantsAreFocusable').build(),
          descendantsAreTraversable: p.get('descendantsAreTraversable').build(),
          includeSemantics: p.get('includeSemantics').build(),
          debugLabel: p.get('debugLabel').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class FocusScope extends Focus
class FocusScope$Mate extends _i1.FocusScope with _i2.Mate {
  /// FocusScope FocusScope({Key? key, FocusScopeNode? node, FocusNode? parentNode, required Widget child, bool autofocus = false, void Function(bool)? onFocusChange, bool? canRequestFocus, bool? skipTraversal, KeyEventResult Function(FocusNode, KeyEvent)? onKeyEvent, KeyEventResult Function(FocusNode, RawKeyEvent)? onKey, String? debugLabel})
  FocusScope$Mate({
    /// optionalParameters: {Key? key} , default:none
    super.key,

    /// optionalParameters: {FocusScopeNode? node} , default:none
    super.node,

    /// optionalParameters: {FocusNode? parentNode} , default:none
    super.parentNode,

    /// optionalParameters: {required Widget child} , default:none
    required super.child,

    /// optionalParameters: {bool autofocus = false} , default:processed=BooleanLiteralImpl
    super.autofocus,

    /// optionalParameters: {void Function(bool)? onFocusChange} , default:none
    super.onFocusChange,

    /// optionalParameters: {bool? canRequestFocus} , default:none
    super.canRequestFocus,

    /// optionalParameters: {bool? skipTraversal} , default:none
    super.skipTraversal,

    /// optionalParameters: {KeyEventResult Function(FocusNode, KeyEvent)? onKeyEvent} , default:none
    super.onKeyEvent,

    /// optionalParameters: {KeyEventResult Function(FocusNode, RawKeyEvent)? onKey} , default:none
    super.onKey,

    /// optionalParameters: {String? debugLabel} , default:none
    super.debugLabel,
  })  : mateParams = {
          'key': _i2.BuilderArg<_i3.Key?>(
            name: 'key',
            init: key,
            isNamed: true,
          ),
          'node': _i2.BuilderArg<_i5.FocusScopeNode?>(
            name: 'node',
            init: node,
            isNamed: true,
          ),
          'parentNode': _i2.BuilderArg<_i5.FocusNode?>(
            name: 'parentNode',
            init: parentNode,
            isNamed: true,
          ),
          'child': _i2.BuilderArg<_i4.Widget>(
            name: 'child',
            init: child,
            isNamed: true,
          ),
          'autofocus': _i2.BuilderArg<bool>(
            name: 'autofocus',
            init: autofocus,
            isNamed: true,
            defaultValue: false,
          ),
          'onFocusChange': _i2.BuilderArg<_i6.ValueChanged<bool>?>(
            name: 'onFocusChange',
            init: onFocusChange,
            isNamed: true,
          ),
          'canRequestFocus': _i2.BuilderArg<bool?>(
            name: 'canRequestFocus',
            init: canRequestFocus,
            isNamed: true,
          ),
          'skipTraversal': _i2.BuilderArg<bool?>(
            name: 'skipTraversal',
            init: skipTraversal,
            isNamed: true,
          ),
          'onKeyEvent': _i2.BuilderArg<_i5.FocusOnKeyEventCallback?>(
            name: 'onKeyEvent',
            init: onKeyEvent,
            isNamed: true,
          ),
          'onKey': _i2.BuilderArg<_i5.FocusOnKeyCallback?>(
            name: 'onKey',
            init: onKey,
            isNamed: true,
          ),
          'debugLabel': _i2.BuilderArg<String?>(
            name: 'debugLabel',
            init: debugLabel,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'FocusScope';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => FocusScope$Mate(
          key: p.get('key').build(),
          node: p.get('node').build(),
          parentNode: p.get('parentNode').build(),
          child: p.get('child').build(),
          autofocus: p.get('autofocus').build(),
          onFocusChange: p.get('onFocusChange').build(),
          canRequestFocus: p.get('canRequestFocus').build(),
          skipTraversal: p.get('skipTraversal').build(),
          onKeyEvent: p.get('onKeyEvent').build(),
          onKey: p.get('onKey').build(),
          debugLabel: p.get('debugLabel').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class ExcludeFocus extends StatelessWidget
class ExcludeFocus$Mate extends _i1.ExcludeFocus with _i2.Mate {
  /// ExcludeFocus ExcludeFocus({Key? key, bool excluding = true, required Widget child})
  ExcludeFocus$Mate({
    /// optionalParameters: {Key? key} , default:none
    super.key,

    /// optionalParameters: {bool excluding = true} , default:processed=BooleanLiteralImpl
    super.excluding,

    /// optionalParameters: {required Widget child} , default:none
    required super.child,
  })  : mateParams = {
          'key': _i2.BuilderArg<_i3.Key?>(
            name: 'key',
            init: key,
            isNamed: true,
          ),
          'excluding': _i2.BuilderArg<bool>(
            name: 'excluding',
            init: excluding,
            isNamed: true,
            defaultValue: true,
          ),
          'child': _i2.BuilderArg<_i4.Widget>(
            name: 'child',
            init: child,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'ExcludeFocus';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => ExcludeFocus$Mate(
          key: p.get('key').build(),
          excluding: p.get('excluding').build(),
          child: p.get('child').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}
