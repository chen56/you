
@HelloMetadata("Class1")
class Class1 {
  @HelloMetadata("method")
  void method() {
  }
}

class HelloMetadata {
  final String text;
  const HelloMetadata(this.text):x=s;
  final dynamic x;
  @override
  String toString() => "Hello '${s()}'";
}
String s(){
  print("ss");
  return "sss";
}
main(){

}