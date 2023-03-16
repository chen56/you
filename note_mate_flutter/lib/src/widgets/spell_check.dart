// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/spell_check.dart';
import 'package:flutter/src/services/spell_check.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:note/mate.dart';

/// class SpellCheckConfiguration
class SpellCheckConfiguration$Mate extends SpellCheckConfiguration with Mate<SpellCheckConfiguration$Mate> {
  /// SpellCheckConfiguration SpellCheckConfiguration({SpellCheckService? spellCheckService, TextStyle? misspelledTextStyle, Widget Function(BuildContext, EditableTextState)? spellCheckSuggestionsToolbarBuilder})
  SpellCheckConfiguration$Mate({
    /// optionalParameters: {SpellCheckService? spellCheckService} , hasDefaultValue:false, defaultValueCode:null
    SpellCheckService? spellCheckService,

    /// optionalParameters: {TextStyle? misspelledTextStyle} , hasDefaultValue:false, defaultValueCode:null
    TextStyle? misspelledTextStyle,

    /// optionalParameters: {Widget Function(BuildContext, EditableTextState)? spellCheckSuggestionsToolbarBuilder} , hasDefaultValue:false, defaultValueCode:null
    EditableTextContextMenuBuilder? spellCheckSuggestionsToolbarBuilder,
  }) : super(
          spellCheckService: spellCheckService,
          misspelledTextStyle: misspelledTextStyle,
          spellCheckSuggestionsToolbarBuilder: spellCheckSuggestionsToolbarBuilder,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => SpellCheckConfiguration$Mate(
        spellCheckService: p.get('spellCheckService').value,
        misspelledTextStyle: p.get('misspelledTextStyle').value,
        spellCheckSuggestionsToolbarBuilder: p.get('spellCheckSuggestionsToolbarBuilder').value,
      ),
    );
    mateParams.put('spellCheckService', spellCheckService);
    mateParams.put('misspelledTextStyle', misspelledTextStyle);
    mateParams.put('spellCheckSuggestionsToolbarBuilder', spellCheckSuggestionsToolbarBuilder);
  }
}
