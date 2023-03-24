import 'package:flutter/material.dart';
import 'package:note/mate.dart';

class EnumRegister extends Enums {
  EnumRegister() {
    enums[MainAxisAlignment] = MainAxisAlignment.values;
    enums[CrossAxisAlignment] = CrossAxisAlignment.values;
    enums[VerticalDirection] = VerticalDirection.values;
    enums[Clip] = Clip.values;
  }
}
