// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:you_flutter/note.dart';

/// cell本身作为树存在，而且api让使用者知道，这是树
/// 这个虽然api稍微比1.1复杂，
///   - 但同步异步都可以完全不靠Trace来定位cell，
///   - 可信度也较高（Trace总觉得有点不太靠谱，收集定位 source code 也就行了），
///   - 甚至可以作为通用架构来做note外的开发
void build(BuildContext context, Cell print) {
  print.addCellWith(
    Cell(title: Text("ssss"), (print) {
      print("ss");
    }),
  );
}
