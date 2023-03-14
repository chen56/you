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
class KeySet$Mate<T extends KeyboardKey> extends KeySet<T> with Mate<KeySet$Mate> {
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
    mateParams = Params(
      init: this,
      builder: (p) => KeySet$Mate(
        p.getValue('key1'),
        p.getValue('key2'),
        p.getValue('key3'),
        p.getValue('key4'),
      ),
    );
    mateParams.set(name: 'key1', init: key1);
    mateParams.set(name: 'key2', init: key2);
    mateParams.set(name: 'key3', init: key3);
    mateParams.set(name: 'key4', init: key4);
  }

  /// KeySet<T> KeySet.fromSet(Set<T> keys)
  KeySet$Mate.fromSet(

      /// requiredParameters: Set<T> keys
      Set<T> keys)
      : super.fromSet(keys) {
    mateParams = Params(
      init: this,
      builder: (p) => KeySet$Mate.fromSet(p.getValue('keys')),
    );
    mateParams.set(name: 'keys', init: keys);
  }
}

/// class LogicalKeySet extends KeySet<LogicalKeyboardKey> with Diagnosticable implements ShortcutActivator
class LogicalKeySet$Mate extends LogicalKeySet with Mate<LogicalKeySet$Mate> {
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
    mateParams = Params(
      init: this,
      builder: (p) => LogicalKeySet$Mate(
        p.getValue('key1'),
        p.getValue('key2'),
        p.getValue('key3'),
        p.getValue('key4'),
      ),
    );
    mateParams.set(name: 'key1', init: key1);
    mateParams.set(name: 'key2', init: key2);
    mateParams.set(name: 'key3', init: key3);
    mateParams.set(name: 'key4', init: key4);
  }

  /// LogicalKeySet LogicalKeySet.fromSet(Set<LogicalKeyboardKey> keys)
  LogicalKeySet$Mate.fromSet(

      /// requiredParameters: Set<LogicalKeyboardKey> keys
      Set<LogicalKeyboardKey> keys)
      : super.fromSet(keys) {
    mateParams = Params(
      init: this,
      builder: (p) => LogicalKeySet$Mate.fromSet(p.getValue('keys')),
    );
    mateParams.set(name: 'keys', init: keys);
  }
}

/// class ShortcutMapProperty extends DiagnosticsProperty<Map<ShortcutActivator, Intent>>
class ShortcutMapProperty$Mate extends ShortcutMapProperty with Mate<ShortcutMapProperty$Mate> {
  /// ShortcutMapProperty ShortcutMapProperty(String name, Map<ShortcutActivator, Intent> value, {bool showName = true, Object defaultValue = kNoDefaultValue, DiagnosticLevel level = DiagnosticLevel.info, String? description})
  ShortcutMapProperty$Mate(
    /// requiredParameters: String name
    String name,

    /// requiredParameters: Map<ShortcutActivator, Intent> value
    Map<ShortcutActivator, Intent> value, {
    /// optionalParameters: {bool showName = true} , hasDefaultValue:true, defaultValueCode:true
    required bool showName,

    /// optionalParameters: {Object defaultValue = kNoDefaultValue} , hasDefaultValue:true, defaultValueCode:kNoDefaultValue
    required Object defaultValue,

    /// optionalParameters: {DiagnosticLevel level = DiagnosticLevel.info} , hasDefaultValue:true, defaultValueCode:DiagnosticLevel.info
    required DiagnosticLevel level,

    /// optionalParameters: {String? description} , hasDefaultValue:false, defaultValueCode:null
    String? description,
  }) : super(
          name,
          value,
          showName: showName,
          defaultValue: defaultValue,
          level: level,
          description: description,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ShortcutMapProperty$Mate(
        p.getValue('name'),
        p.getValue('value'),
        showName: p.getValue('showName'),
        defaultValue: p.getValue('defaultValue'),
        level: p.getValue('level'),
        description: p.getValue('description'),
      ),
    );
    mateParams.set(name: 'name', init: name);
    mateParams.set(name: 'value', init: value);
    mateParams.set(name: 'showName', init: showName);
    mateParams.set(name: 'defaultValue', init: defaultValue);
    mateParams.set(name: 'level', init: level);
    mateParams.set(name: 'description', init: description);
  }
}

/// class SingleActivator with Diagnosticable, MenuSerializableShortcut implements ShortcutActivator
class SingleActivator$Mate extends SingleActivator with Mate<SingleActivator$Mate> {
  /// SingleActivator SingleActivator(LogicalKeyboardKey trigger, {bool control = false, bool shift = false, bool alt = false, bool meta = false, bool includeRepeats = true})
  SingleActivator$Mate(
    /// requiredParameters: LogicalKeyboardKey trigger
    LogicalKeyboardKey trigger, {
    /// optionalParameters: {bool control = false} , hasDefaultValue:true, defaultValueCode:false
    required bool control,

    /// optionalParameters: {bool shift = false} , hasDefaultValue:true, defaultValueCode:false
    required bool shift,

    /// optionalParameters: {bool alt = false} , hasDefaultValue:true, defaultValueCode:false
    required bool alt,

    /// optionalParameters: {bool meta = false} , hasDefaultValue:true, defaultValueCode:false
    required bool meta,

    /// optionalParameters: {bool includeRepeats = true} , hasDefaultValue:true, defaultValueCode:true
    required bool includeRepeats,
  }) : super(
          trigger,
          control: control,
          shift: shift,
          alt: alt,
          meta: meta,
          includeRepeats: includeRepeats,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => SingleActivator$Mate(
        p.getValue('trigger'),
        control: p.getValue('control'),
        shift: p.getValue('shift'),
        alt: p.getValue('alt'),
        meta: p.getValue('meta'),
        includeRepeats: p.getValue('includeRepeats'),
      ),
    );
    mateParams.set(name: 'trigger', init: trigger);
    mateParams.set(name: 'control', init: control);
    mateParams.set(name: 'shift', init: shift);
    mateParams.set(name: 'alt', init: alt);
    mateParams.set(name: 'meta', init: meta);
    mateParams.set(name: 'includeRepeats', init: includeRepeats);
  }
}

/// class CharacterActivator with Diagnosticable, MenuSerializableShortcut implements ShortcutActivator
class CharacterActivator$Mate extends CharacterActivator with Mate<CharacterActivator$Mate> {
  /// CharacterActivator CharacterActivator(String character, {bool alt = false, bool control = false, bool meta = false, bool includeRepeats = true})
  CharacterActivator$Mate(
    /// requiredParameters: String character
    String character, {
    /// optionalParameters: {bool alt = false} , hasDefaultValue:true, defaultValueCode:false
    required bool alt,

    /// optionalParameters: {bool control = false} , hasDefaultValue:true, defaultValueCode:false
    required bool control,

    /// optionalParameters: {bool meta = false} , hasDefaultValue:true, defaultValueCode:false
    required bool meta,

    /// optionalParameters: {bool includeRepeats = true} , hasDefaultValue:true, defaultValueCode:true
    required bool includeRepeats,
  }) : super(
          character,
          alt: alt,
          control: control,
          meta: meta,
          includeRepeats: includeRepeats,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => CharacterActivator$Mate(
        p.getValue('character'),
        alt: p.getValue('alt'),
        control: p.getValue('control'),
        meta: p.getValue('meta'),
        includeRepeats: p.getValue('includeRepeats'),
      ),
    );
    mateParams.set(name: 'character', init: character);
    mateParams.set(name: 'alt', init: alt);
    mateParams.set(name: 'control', init: control);
    mateParams.set(name: 'meta', init: meta);
    mateParams.set(name: 'includeRepeats', init: includeRepeats);
  }
}

/// class ShortcutManager with Diagnosticable, ChangeNotifier
class ShortcutManager$Mate extends ShortcutManager with Mate<ShortcutManager$Mate> {
  /// ShortcutManager ShortcutManager({Map<ShortcutActivator, Intent> shortcuts = const <ShortcutActivator, Intent>{}, bool modal = false})
  ShortcutManager$Mate({
    /// optionalParameters: {Map<ShortcutActivator, Intent> shortcuts = const <ShortcutActivator, Intent>{}} , hasDefaultValue:true, defaultValueCode:const <ShortcutActivator, Intent>{}
    required Map<ShortcutActivator, Intent> shortcuts,

    /// optionalParameters: {bool modal = false} , hasDefaultValue:true, defaultValueCode:false
    required bool modal,
  }) : super(
          shortcuts: shortcuts,
          modal: modal,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ShortcutManager$Mate(
        shortcuts: p.getValue('shortcuts'),
        modal: p.getValue('modal'),
      ),
    );
    mateParams.set(name: 'shortcuts', init: shortcuts);
    mateParams.set(name: 'modal', init: modal);
  }
}

/// class Shortcuts extends StatefulWidget
class Shortcuts$Mate extends Shortcuts with WidgetMate<Shortcuts$Mate> {
  /// Shortcuts Shortcuts({Key? key, required Map<ShortcutActivator, Intent> shortcuts, required Widget child, String? debugLabel})
  Shortcuts$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required Map<ShortcutActivator, Intent> shortcuts} , hasDefaultValue:false, defaultValueCode:null
    required Map<ShortcutActivator, Intent> shortcuts,

    /// optionalParameters: {required Widget child} , hasDefaultValue:false, defaultValueCode:null
    required Widget child,

    /// optionalParameters: {String? debugLabel} , hasDefaultValue:false, defaultValueCode:null
    String? debugLabel,
  }) : super(
          key: key,
          shortcuts: shortcuts,
          child: child,
          debugLabel: debugLabel,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => Shortcuts$Mate(
        key: p.getValue('key'),
        shortcuts: p.getValue('shortcuts'),
        child: p.getValue('child'),
        debugLabel: p.getValue('debugLabel'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'shortcuts', init: shortcuts);
    mateParams.set(name: 'child', init: child);
    mateParams.set(name: 'debugLabel', init: debugLabel);
  }

  /// Shortcuts Shortcuts.manager({Key? key, required ShortcutManager manager, required Widget child, String? debugLabel})
  Shortcuts$Mate.manager({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required ShortcutManager manager} , hasDefaultValue:false, defaultValueCode:null
    required ShortcutManager manager,

    /// optionalParameters: {required Widget child} , hasDefaultValue:false, defaultValueCode:null
    required Widget child,

    /// optionalParameters: {String? debugLabel} , hasDefaultValue:false, defaultValueCode:null
    String? debugLabel,
  }) : super.manager(
          key: key,
          manager: manager,
          child: child,
          debugLabel: debugLabel,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => Shortcuts$Mate.manager(
        key: p.getValue('key'),
        manager: p.getValue('manager'),
        child: p.getValue('child'),
        debugLabel: p.getValue('debugLabel'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'manager', init: manager);
    mateParams.set(name: 'child', init: child);
    mateParams.set(name: 'debugLabel', init: debugLabel);
  }
}

/// class CallbackShortcuts extends StatelessWidget
class CallbackShortcuts$Mate extends CallbackShortcuts with WidgetMate<CallbackShortcuts$Mate> {
  /// CallbackShortcuts CallbackShortcuts({Key? key, required Map<ShortcutActivator, void Function()> bindings, required Widget child})
  CallbackShortcuts$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required Map<ShortcutActivator, void Function()> bindings} , hasDefaultValue:false, defaultValueCode:null
    required Map<ShortcutActivator, VoidCallback> bindings,

    /// optionalParameters: {required Widget child} , hasDefaultValue:false, defaultValueCode:null
    required Widget child,
  }) : super(
          key: key,
          bindings: bindings,
          child: child,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => CallbackShortcuts$Mate(
        key: p.getValue('key'),
        bindings: p.getValue('bindings'),
        child: p.getValue('child'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'bindings', init: bindings);
    mateParams.set(name: 'child', init: child);
  }
}

/// class ShortcutRegistrar extends StatefulWidget
class ShortcutRegistrar$Mate extends ShortcutRegistrar with WidgetMate<ShortcutRegistrar$Mate> {
  /// ShortcutRegistrar ShortcutRegistrar({Key? key, required Widget child})
  ShortcutRegistrar$Mate({
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
      builder: (p) => ShortcutRegistrar$Mate(
        key: p.getValue('key'),
        child: p.getValue('child'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'child', init: child);
  }
}
