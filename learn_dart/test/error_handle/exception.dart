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
      print("StackTrace.current ${StackTrace.current}");
    });
  });

}
