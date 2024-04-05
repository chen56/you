import 'package:flutter/foundation.dart';
import 'package:test/test.dart';

main(){

  group("temp", () {
    test("description", () {
      y(){
        print("y");
        throw Exception("xx");
      }
      x(){
        try{
          y();
        }finally{
          print("finally");
        }
      }
      x();    });
  });

  group("current stack", () {
    test("description", () {
      debugPrint("${StackTrace.current}");
    });
  });
  group("current bench", () {
    test("StackTrace.current", () {
      // 3s 十万次,还行
      for(int i=0;i<1000*1000;i++){
        StackTrace.current;
      }
    });
    test("StackTrace.current", () {
      // 3s 十万次,和StackTrace.current差不多
      for(int i=0;i<1000*1000;i++){
        try{
          throw Exception("自己实现");
        }catch(e){

        }
      }
    });
  });
}
