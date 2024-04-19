import 'package:flutter/material.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:you_note_dart/note.dart';

build(BuildContext context, Pen print) {
  print.markdown("""
# exception

""");
  List log=[];
  try{
    throwException();
  }catch(e,stack){
    debugPrint("$e");
    debugPrint("$stack");

    var x=  Trace.parse(stack.toString());
    debugPrint("$x");
    log.addAll([e,stack,...x.frames.map((e)=>"${e.line}-$e\n")]);

  }
  print("$log-------");
}
void throwException(){
  throw Exception("my throw");
}