// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/services/keyboard_key.g.dart';
import 'package:flutter/src/widgets/shortcuts.dart';
import 'package:note/mate.dart';
import 'dart:core';
import 'package:flutter/src/widgets/actions.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:ui';

/// class KeySet<T extends KeyboardKey>
class KeySet$Mate<T extends KeyboardKey> extends KeySet<T> with Mate {
  /// KeySet<T> KeySet(T key1, [T? key2, T? key3, T? key4])
  KeySet$Mate(
    /// requiredParameters: T key1
    T key1,

    /// requiredParameters: [T? key2]
    T? key2,

    /// requiredParameters: [T? key3]
    T? key3,

    /// requiredParameters: [T? key4]
    T? key4,
  ) : super(
          key1,
          key2,
          key3,
          key4,
        ) {
    mateCreateName = 'KeySet';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => KeySet$Mate<T>(
          p.get('key1').value,
          p.get('key2').value,
          p.get('key3').value,
          p.get('key4').value,
        );
    mateUse('key1', key1);
    mateUse('key2', key2);
    mateUse('key3', key3);
    mateUse('key4', key4);
  }

  /// KeySet<T> KeySet.fromSet(Set<T> keys)
  KeySet$Mate.fromSet(

      /// requiredParameters: Set<T> keys
      Set<T> keys)
      : super.fromSet(keys) {
    mateCreateName = 'KeySet.fromSet';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => KeySet$Mate<T>.fromSet(p.get('keys').value);
    mateUse('keys', keys);
  }
}

/// class LogicalKeySet extends KeySet<LogicalKeyboardKey> with Diagnosticable implements ShortcutActivator
class LogicalKeySet$Mate extends LogicalKeySet with Mate {
  /// LogicalKeySet LogicalKeySet(LogicalKeyboardKey key1, [LogicalKeyboardKey? key2, LogicalKeyboardKey? key3, LogicalKeyboardKey? key4])
  LogicalKeySet$Mate(
    /// requiredParameters: LogicalKeyboardKey key1
    LogicalKeyboardKey key1,

    /// requiredParameters: [LogicalKeyboardKey? key2]
    LogicalKeyboardKey? key2,

    /// requiredParameters: [LogicalKeyboardKey? key3]
    LogicalKeyboardKey? key3,

    /// requiredParameters: [LogicalKeyboardKey? key4]
    LogicalKeyboardKey? key4,
  ) : super(
          key1,
          key2,
          key3,
          key4,
        ) {
    mateCreateName = 'LogicalKeySet';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => LogicalKeySet$Mate(
          p.get('key1').value,
          p.get('key2').value,
          p.get('key3').value,
          p.get('key4').value,
        );
    mateUse('key1', key1);
    mateUse('key2', key2);
    mateUse('key3', key3);
    mateUse('key4', key4);
  }

  /// LogicalKeySet LogicalKeySet.fromSet(Set<LogicalKeyboardKey> keys)
  LogicalKeySet$Mate.fromSet(

      /// requiredParameters: Set<LogicalKeyboardKey> keys
      Set<LogicalKeyboardKey> keys)
      : super.fromSet(keys) {
    mateCreateName = 'LogicalKeySet.fromSet';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => LogicalKeySet$Mate.fromSet(p.get('keys').value);
    mateUse('keys', keys);
  }
}

/// class ShortcutMapProperty extends DiagnosticsProperty<Map<ShortcutActivator, Intent>>
class ShortcutMapProperty$Mate extends ShortcutMapProperty with Mate {
  /// ShortcutMapProperty ShortcutMapProperty(String name, Map<ShortcutActivator, Intent> value, {bool showName = true, Object defaultValue = kNoDefaultValue, DiagnosticLevel level = DiagnosticLevel.info, String? description})
  ShortcutMapProperty$Mate(
    /// requiredParameters: String name
    String name,

    /// requiredParameters: Map<ShortcutActivator, Intent> value
    Map<ShortcutActivator, Intent> value, {
    /// optionalParameters: {bool showName = true} , defaultValue:is!ConstVariableElement
    required bool showName,

    /// optionalParameters: {Object defaultValue = kNoDefaultValue} , defaultValue:is!ConstVariableElement
    required Object defaultValue,

    /// optionalParameters: {DiagnosticLevel level = DiagnosticLevel.info} , defaultValue:is!ConstVariableElement
    required DiagnosticLevel level,

    /// optionalParameters: {String? description} , defaultValue:none
    String? description,
  }) : super(
          name,
          value,
          showName: showName,
          defaultValue: defaultValue,
          level: level,
          description: description,
        ) {
    mateCreateName = 'ShortcutMapProperty';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => ShortcutMapProperty$Mate(
          p.get('name').value,
          p.get('value').value,
          showName: p.get('showName').build(),
          defaultValue: p.get('defaultValue').build(),
          level: p.get('level').build(),
          description: p.get('description').build(),
        );
    mateUse('name', name);
    mateUse('value', value);
    mateUse('showName', showName);
    mateUse('defaultValue', defaultValue);
    mateUse('level', level);
    mateUse('description', description);
  }
}

/// class SingleActivator with Diagnosticable, MenuSerializableShortcut implements ShortcutActivator
class SingleActivator$Mate extends SingleActivator with Mate {
  /// SingleActivator SingleActivator(LogicalKeyboardKey trigger, {bool control = false, bool shift = false, bool alt = false, bool meta = false, bool includeRepeats = true})
  SingleActivator$Mate(
    /// requiredParameters: LogicalKeyboardKey trigger
    LogicalKeyboardKey trigger, {
    /// optionalParameters: {bool control = false} , defaultValue:Literal
    bool control = false,

    /// optionalParameters: {bool shift = false} , defaultValue:Literal
    bool shift = false,

    /// optionalParameters: {bool alt = false} , defaultValue:Literal
    bool alt = false,

    /// optionalParameters: {bool meta = false} , defaultValue:Literal
    bool meta = false,

    /// optionalParameters: {bool includeRepeats = true} , defaultValue:Literal
    bool includeRepeats = true,
  }) : super(
          trigger,
          control: control,
          shift: shift,
          alt: alt,
          meta: meta,
          includeRepeats: includeRepeats,
        ) {
    mateCreateName = 'SingleActivator';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => SingleActivator$Mate(
          p.get('trigger').value,
          control: p.get('control').build(),
          shift: p.get('shift').build(),
          alt: p.get('alt').build(),
          meta: p.get('meta').build(),
          includeRepeats: p.get('includeRepeats').build(),
        );
    mateUse('trigger', trigger);
    mateUse('control', control);
    mateUse('shift', shift);
    mateUse('alt', alt);
    mateUse('meta', meta);
    mateUse('includeRepeats', includeRepeats);
  }
}

/// class CharacterActivator with Diagnosticable, MenuSerializableShortcut implements ShortcutActivator
class CharacterActivator$Mate extends CharacterActivator with Mate {
  /// CharacterActivator CharacterActivator(String character, {bool alt = false, bool control = false, bool meta = false, bool includeRepeats = true})
  CharacterActivator$Mate(
    /// requiredParameters: String character
    String character, {
    /// optionalParameters: {bool alt = false} , defaultValue:Literal
    bool alt = false,

    /// optionalParameters: {bool control = false} , defaultValue:Literal
    bool control = false,

    /// optionalParameters: {bool meta = false} , defaultValue:Literal
    bool meta = false,

    /// optionalParameters: {bool includeRepeats = true} , defaultValue:Literal
    bool includeRepeats = true,
  }) : super(
          character,
          alt: alt,
          control: control,
          meta: meta,
          includeRepeats: includeRepeats,
        ) {
    mateCreateName = 'CharacterActivator';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => CharacterActivator$Mate(
          p.get('character').value,
          alt: p.get('alt').build(),
          control: p.get('control').build(),
          meta: p.get('meta').build(),
          includeRepeats: p.get('includeRepeats').build(),
        );
    mateUse('character', character);
    mateUse('alt', alt);
    mateUse('control', control);
    mateUse('meta', meta);
    mateUse('includeRepeats', includeRepeats);
  }
}

/// class ShortcutManager with Diagnosticable, ChangeNotifier
class ShortcutManager$Mate extends ShortcutManager with Mate {
  /// ShortcutManager ShortcutManager({Map<ShortcutActivator, Intent> shortcuts = const <ShortcutActivator, Intent>{}, bool modal = false})
  ShortcutManager$Mate({
    /// optionalParameters: {Map<ShortcutActivator, Intent> shortcuts = const <ShortcutActivator, Intent>{}} , defaultValue:unprocessed
    required Map<ShortcutActivator, Intent> shortcuts,

    /// optionalParameters: {bool modal = false} , defaultValue:Literal
    bool modal = false,
  }) : super(
          shortcuts: shortcuts,
          modal: modal,
        ) {
    mateCreateName = 'ShortcutManager';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => ShortcutManager$Mate(
          shortcuts: p.get('shortcuts').build(),
          modal: p.get('modal').build(),
        );
    mateUse('shortcuts', shortcuts);
    mateUse('modal', modal);
  }
}

/// class Shortcuts extends StatefulWidget
class Shortcuts$Mate extends Shortcuts with Mate {
  /// Shortcuts Shortcuts({Key? key, required Map<ShortcutActivator, Intent> shortcuts, required Widget child, String? debugLabel})
  Shortcuts$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required Map<ShortcutActivator, Intent> shortcuts} , defaultValue:none
    required Map<ShortcutActivator, Intent> shortcuts,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,

    /// optionalParameters: {String? debugLabel} , defaultValue:none
    String? debugLabel,
  }) : super(
          key: key,
          shortcuts: shortcuts,
          child: child,
          debugLabel: debugLabel,
        ) {
    mateCreateName = 'Shortcuts';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => Shortcuts$Mate(
          key: p.get('key').build(),
          shortcuts: p.get('shortcuts').build(),
          child: p.get('child').build(),
          debugLabel: p.get('debugLabel').build(),
        );
    mateUse('key', key);
    mateUse('shortcuts', shortcuts);
    mateUse('child', child);
    mateUse('debugLabel', debugLabel);
  }

  /// Shortcuts Shortcuts.manager({Key? key, required ShortcutManager manager, required Widget child, String? debugLabel})
  Shortcuts$Mate.manager({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required ShortcutManager manager} , defaultValue:none
    required ShortcutManager manager,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,

    /// optionalParameters: {String? debugLabel} , defaultValue:none
    String? debugLabel,
  }) : super.manager(
          key: key,
          manager: manager,
          child: child,
          debugLabel: debugLabel,
        ) {
    mateCreateName = 'Shortcuts.manager';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => Shortcuts$Mate.manager(
          key: p.get('key').build(),
          manager: p.get('manager').build(),
          child: p.get('child').build(),
          debugLabel: p.get('debugLabel').build(),
        );
    mateUse('key', key);
    mateUse('manager', manager);
    mateUse('child', child);
    mateUse('debugLabel', debugLabel);
  }
}

/// class CallbackShortcuts extends StatelessWidget
class CallbackShortcuts$Mate extends CallbackShortcuts with Mate {
  /// CallbackShortcuts CallbackShortcuts({Key? key, required Map<ShortcutActivator, void Function()> bindings, required Widget child})
  CallbackShortcuts$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required Map<ShortcutActivator, void Function()> bindings} , defaultValue:none
    required Map<ShortcutActivator, VoidCallback> bindings,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,
  }) : super(
          key: key,
          bindings: bindings,
          child: child,
        ) {
    mateCreateName = 'CallbackShortcuts';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => CallbackShortcuts$Mate(
          key: p.get('key').build(),
          bindings: p.get('bindings').build(),
          child: p.get('child').build(),
        );
    mateUse('key', key);
    mateUse('bindings', bindings);
    mateUse('child', child);
  }
}

/// class ShortcutRegistrar extends StatefulWidget
class ShortcutRegistrar$Mate extends ShortcutRegistrar with Mate {
  /// ShortcutRegistrar ShortcutRegistrar({Key? key, required Widget child})
  ShortcutRegistrar$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,
  }) : super(
          key: key,
          child: child,
        ) {
    mateCreateName = 'ShortcutRegistrar';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => ShortcutRegistrar$Mate(
          key: p.get('key').build(),
          child: p.get('child').build(),
        );
    mateUse('key', key);
    mateUse('child', child);
  }
}
