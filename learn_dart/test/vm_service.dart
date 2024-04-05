import 'package:test/test.dart';
import 'package:test_api/src/backend/invoker.dart';

String testTitle() {
  final liveTest = Invoker.current!.liveTest;
  return "bench:${liveTest.test.name}";
}
String groupTitle(){
  if(Invoker.current==null){
    return "not in test!";
  }
  final liveTest = Invoker.current!.liveTest;
  var group = liveTest.groups.last;
  if (group.name.isEmpty) return "main";
  return group.name.isEmpty?"main":group.name;
}


void main() {

  group("group1", () {
    print(groupTitle());
    test('test1', () {
      print(groupTitle());
      print(testTitle());
    });
  });
}
