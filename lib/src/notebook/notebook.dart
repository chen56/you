import 'package:flutter/widgets.dart';


class Doc {

  String title;
  List<Doc> children;
  Doc({
    required this.title,
    this.children=const [],
  });

  void sample(Widget sample) {}

  void markdown(String s) {
    print(s);
  }
}
