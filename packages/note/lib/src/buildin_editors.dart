import 'package:code_builder/code_builder.dart' as code;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:note/mate_core.dart';
import 'package:note/note_core.dart';

abstract class BaseValueInputEditor extends BaseValueEditor {
  BaseValueInputEditor(super.param, {required super.editors});

  @override
  @nonVirtual
  Widget valueWidget(BuildContext context) {
    var platform = Theme.of(context).platform;
    bool isAndroid = platform == TargetPlatform.android;
    bool isIOS = platform == TargetPlatform.iOS;
    var isMobileBrowser = kIsWeb && (isAndroid || isIOS);

    return isMobileBrowser
        ? Text("${param.value}")
        : TextFormField(
            initialValue: "${param.init}",
            autofocus: true,
            decoration: InputDecoration(
              hintText: param.name,
            ),
            onChanged: (value) {
              var newValue = toParamValue(value);
              if (newValue != null) {
                param.value = newValue;
              }
            },
          );
  }

  Object? toParamValue(String value);

  @override
  code.Expression toCode() {
    return code.literal(param.value);
  }
}

class IntEditor extends BaseValueInputEditor {
  IntEditor(super.param, {required super.editors});

  @override
  Object? toParamValue(String value) {
    return int.tryParse(value);
  }
}

class StringEditor extends BaseValueInputEditor {
  StringEditor(super.param, {required super.editors}) {}
  @override
  Object? toParamValue(String value) {
    return value;
  }
}

class DoubleEditor extends BaseValueInputEditor {
  DoubleEditor(super.param, {required super.editors});
  @override
  Object? toParamValue(String value) {
    return double.tryParse(value);
  }
}

class BoolEditor extends BaseValueEditor {
  BoolEditor(super.param, {required super.editors});

  @override
  Widget valueWidget(BuildContext context) {
    return ListenableBuilder(
        listenable: param,
        builder: (context, child) {
          return Row(
            children: [
              Text("${param.value}"),
              Switch(
                value: param.value,
                activeColor: Colors.red,
                onChanged: (bool value) {
                  param.value = value;
                },
              ),
            ],
          );
        });
  }

  @override
  code.Expression toCode() {
    return code.literal(param.value);
  }
}

class EnumEditor extends BaseValueEditor {
  final List enums;

  EnumEditor(super.param, {required this.enums, required super.editors});

  @override
  Widget valueWidget(BuildContext context) {
    return DropdownButton<Enum>(
      alignment: Alignment.topLeft,
      value: param.value as Enum,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      onChanged: (Enum? value) {
        param.value = value;
      },
      items:
          enums.map((e) => e as Enum).map<DropdownMenuItem<Enum>>((Enum value) {
        return DropdownMenuItem<Enum>(
          value: value,
          child: Text(value.name),
        );
      }).toList(),
    );
  }

  @override
  code.Expression toCode() {
    return code.refer("${param.value}");
  }

  @override
  String toString() {
    return "EnumEditor(enums:$enums,value:${param.value},param:$param)";
  }
}

class ColorEditor<T> extends BaseValueEditor {
  ColorEditor(super.param, {required super.editors});

  @override
  code.Expression toCode() {
    return _ColorRegister.instance.get(param.value as Color?);
  }

  @override
  Widget valueWidget(BuildContext context) {
    return Row(
      children: [
        Text(param.toCodeExpressionString()),
        Container(
          width: 20,
          height: 20,
          color: param.value as Color,
        )
      ],
    );
  }
}

class IconDataEditor extends BaseValueEditor {
  IconDataEditor(super.param, {required super.editors});

  @override
  code.Expression toCode() {
    // return editors.iconRegisters.getOrEmpty(param.value);
    if (param.value == null) {
      return code.literalNull;
    }
    return code.refer("IconData", "package:flutter/widgets.dart").newInstance(
        [code.refer("0x${param.value.codePoint.toRadixString(16)}")]);
  }

  @override
  Widget valueWidget(BuildContext context) {
    return Row(
      children: [
        // icons file too large, so not use IconRegistry to get icon name
        // Text(param.toCodeExpressionString()),
        SizedBox(
          width: 20,
          height: 20,
          child: param.value == null ? null : Icon(param.value),
        )
      ],
    );
  }
}

/// 颜色
class _ColorRegister {
  static final _ColorRegister instance = _ColorRegister._();
  Map<Color, code.Expression> colors = {};
  _ColorRegister._() {
    colors[Colors.black] = _refer("Colors.black");
    colors[Colors.black87] = _refer("Colors.black87");
    colors[Colors.black54] = _refer("Colors.black54");
    colors[Colors.black45] = _refer("Colors.black45");
    colors[Colors.black38] = _refer("Colors.black38");
    colors[Colors.black26] = _refer("Colors.black26");
    colors[Colors.black12] = _refer("Colors.black12");

    colors[Colors.white] = _refer("Colors.white");
    colors[Colors.white70] = _refer("Colors.white70");
    colors[Colors.white60] = _refer("Colors.white60");
    colors[Colors.white54] = _refer("Colors.white54");
    colors[Colors.white38] = _refer("Colors.white38");
    colors[Colors.white30] = _refer("Colors.white30");
    colors[Colors.white24] = _refer("Colors.white24");
    colors[Colors.white12] = _refer("Colors.white12");
    colors[Colors.white10] = _refer("Colors.white10");

    // material colors
    regMaterialColor(Colors.red, "Colors.red");
    regMaterialColor(Colors.pink, "Colors.pink");
    regMaterialColor(Colors.purple, "Colors.purple");
    regMaterialColor(Colors.deepPurple, "Colors.deepPurple");
    regMaterialColor(Colors.indigo, "Colors.indigo");
    regMaterialColor(Colors.blue, "Colors.blue");
    regMaterialColor(Colors.lightBlue, "Colors.lightBlue");
    regMaterialColor(Colors.cyan, "Colors.cyan");
    regMaterialColor(Colors.teal, "Colors.teal");
    regMaterialColor(Colors.green, "Colors.green");
    regMaterialColor(Colors.lightGreen, "Colors.lightGreen");
    regMaterialColor(Colors.lime, "Colors.lime");
    regMaterialColor(Colors.yellow, "Colors.yellow");
    regMaterialColor(Colors.amber, "Colors.amber");
    regMaterialColor(Colors.orange, "Colors.orange");
    regMaterialColor(Colors.deepOrange, "Colors.deepOrange");
    regMaterialColor(Colors.brown, "Colors.brown");
    regMaterialColor(Colors.grey, "Colors.grey");
    regMaterialColor(Colors.blueGrey, "Colors.blueGrey");

    // accent colors
    regMaterialAccentColor(Colors.redAccent, "Colors.redAccent");
    regMaterialAccentColor(Colors.pinkAccent, "Colors.pinkAccent");
    regMaterialAccentColor(Colors.purpleAccent, "Colors.purpleAccent");
    regMaterialAccentColor(Colors.deepPurpleAccent, "Colors.deepPurpleAccent");
    regMaterialAccentColor(Colors.indigoAccent, "Colors.indigoAccent");
    regMaterialAccentColor(Colors.blueAccent, "Colors.blueAccent");
    regMaterialAccentColor(Colors.lightBlueAccent, "Colors.lightBlueAccent");
    regMaterialAccentColor(Colors.cyanAccent, "Colors.cyanAccent");
    regMaterialAccentColor(Colors.tealAccent, "Colors.tealAccent");
    regMaterialAccentColor(Colors.greenAccent, "Colors.greenAccent");
    regMaterialAccentColor(Colors.lightGreenAccent, "Colors.lightGreenAccent");
    regMaterialAccentColor(Colors.limeAccent, "Colors.limeAccent");
    regMaterialAccentColor(Colors.yellowAccent, "Colors.yellowAccent");
    regMaterialAccentColor(Colors.amberAccent, "Colors.amberAccent");
    regMaterialAccentColor(Colors.orangeAccent, "Colors.orangeAccent");
    regMaterialAccentColor(Colors.deepOrangeAccent, "Colors.deepOrangeAccent");
  }

  regMaterialColor(MaterialColor materialColor, String primaryEx) {
    colors[materialColor] = _refer(primaryEx);
    colors[materialColor.shade50] = _refer("$primaryEx.shade50");
    colors[materialColor.shade100] = _refer("$primaryEx.shade100");
    colors[materialColor.shade200] = _refer("$primaryEx.shade200");
    colors[materialColor.shade300] = _refer("$primaryEx.shade300");
    colors[materialColor.shade400] = _refer("$primaryEx.shade400");
    colors[materialColor.shade500] = _refer("$primaryEx.shade500");
    colors[materialColor.shade600] = _refer("$primaryEx.shade600");
    colors[materialColor.shade700] = _refer("$primaryEx.shade700");
    colors[materialColor.shade800] = _refer("$primaryEx.shade800");
    colors[materialColor.shade900] = _refer("$primaryEx.shade900");
  }

  regMaterialAccentColor(MaterialAccentColor primary, String primaryEx) {
    colors[primary] = _refer(primaryEx);
    colors[primary.shade100] = _refer("$primaryEx.shade100");
    colors[primary.shade200] = _refer("$primaryEx.shade200");
    colors[primary.shade400] = _refer("$primaryEx.shade400");
    colors[primary.shade700] = _refer("$primaryEx.shade700");
  }

  static code.Expression _refer(String colorEx) {
    return code.refer(colorEx, "package:flutter/material.dart").expression;
  }

  code.Expression get(Color? o) {
    if (o == null) return code.literalNull;
    var result = colors[o];
    return result ??
        code.refer("'Color(0x${o.value.toRadixString(16).padLeft(8, '0')})';");
  }
}

abstract class BaseValueEditor extends Editor {
  @override
  final ValueParam param;

  BaseValueEditor(this.param, {required super.editors});

  @override
  Widget valueWidget(BuildContext context);
}

class ObjectParamEditor extends Editor {
  @override
  final ObjectParam param;

  ObjectParamEditor(this.param, {required super.editors});

  @override
  code.Expression toCode() {
    var filtered = param.params.entries.where((e) => e.value.isShow);

    var positionalArguments = filtered
        .where((e) => !e.value.isNamed)
        .map((e) => e.value.toCodeExpression(editors: editors));
    var namedArguments = Map.fromEntries(filtered
        .where((e) => e.value.isNamed)
        .map((e) =>
            MapEntry(e.key, e.value.toCodeExpression(editors: editors))));
    return param.builderRefer.call(positionalArguments, namedArguments);
  }

  @override
  Widget valueWidget(BuildContext context) {
    if (param.isRoot) return const Text("");

    return param.parent is ListParam
        ? const Text("")
        : Text("${param.builderRefer.symbol}");
  }
}

class ListParamEditor extends Editor {
  @override
  final ListParam param;

  ListParamEditor(this.param, {required super.editors});

  @override
  code.Expression toCode() {
    return code.literalList(
        param.children.map((e) => e.toCodeExpression(editors: editors)));
  }

  @override
  Widget valueWidget(BuildContext context) {
    return const Text("");
  }
}

class SetParamEditor extends Editor {
  @override
  final SetParam param;

  SetParamEditor(this.param, {required super.editors});

  @override
  code.Expression toCode() {
    return code.literalSet(
        param.children.map((e) => e.toCodeExpression(editors: editors)));
  }

  @override
  Widget valueWidget(BuildContext context) {
    return const Text("");
  }
}

class UnknowTypeParamEditor extends BaseValueEditor {
  UnknowTypeParamEditor(super.param, {required super.editors});

  @override
  code.Expression toCode() {
    if (param.value == null) {
      return code.literalNull;
    }
    Object result = param.value;
    return result.sampleCode ??
        code.literalString("应该使用[NoteExt.simpleCode]替换掉无法生成的代码${result}");
  }

  @override
  Widget valueWidget(BuildContext context) {
    return Text(toCode().accept(emitter).toString());
  }
}
