import 'dart:ui';

import 'package:code_builder/code_builder.dart' as code;
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:note/mate.dart';

class ColorEditor extends Editor<Color> {}

class ColorRegister {
  static final ColorRegister instance = ColorRegister._();
  Map<Color, code.Expression> colors = {};
  ColorRegister._() {
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

  code.Expression get(Color o) {
    var result = colors[o];
    return result ?? code.refer("'Color(0x${o.value.toRadixString(16).padLeft(8, '0')})';");
  }
}
