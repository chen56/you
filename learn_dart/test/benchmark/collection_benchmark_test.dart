// ignore_for_file: unnecessary_type_check

import 'dart:collection';
import 'dart:core';

import 'package:test/test.dart';

const int count=1*1000*1000;
var timeout=Timeout(Duration(milliseconds: 100));


runBench(Function(int i) banch,{int count=count}){
  for(var i=0;i<count;i++){
    banch(i);
  }
}
// 结论：List 可以，删尾巴还是挺快，和Queue差不多，LinkedList慢，可能和包装对象有关。
void main() {

  group("List.add", () {
    test('List.add', () {
      List<int> x =List.empty(growable: true);
      runBench((i)=>x.add(i));
    });
    test('List.add&removeLast', () {
      List<int> x =List.empty(growable: true);
      runBench((i)=>x.add(i));
      runBench((i)=>x.removeLast());
    });
    test('List.add&removeLast 2 模仿ui', () {
      List<int> x =List.empty(growable: true);
      runBench((i){
        runBench((i)=>x.add(i),count: 1000);
        runBench((i)=>x.removeLast(),count: 1000);
      },count: 100*1000);
    });
  },timeout: timeout);
  group("LinkedList.add", () {
    test('queue.add', () {
      var x =LinkedList<EntryItem>();
      runBench((i)=>x.add(EntryItem(i)));
    });
    test('LinkedList.add&removeLast', () {
      var x =LinkedList<EntryItem>();
      runBench((i)=>x.add(EntryItem(i)));
      runBench((i)=>x.remove(x.last));
    });
    test('LinkedList.add&removeLast 2 模仿ui', () {
      var x = LinkedList<EntryItem>();
      runBench((i) {
        runBench((i) => x.add(EntryItem(i)), count: 1000);
        runBench((i) => x.remove(x.last), count: 1000);
      },count: 100*1000);
    });

  },timeout: timeout);
  group("Queue.add", () {
    test('queue.add', () {
      var x =Queue<int>();
      runBench((i)=>x.add(i));
    });
    test('Queue.add&removeLast', () {
      var x =Queue<int>();
      runBench((i)=>x.add(i));
      runBench((i)=>x.removeLast());
    });

    test('Queue.add&removeLast 2 模仿ui', () {
      var x =Queue<int>();
      runBench((i) {
        runBench((i)=>x.add(i),count: 1000);
        runBench((i)=>x.removeLast(),count: 1000);
      },count: 100*1000);
    });

  },timeout: timeout);

}
final class EntryItem extends LinkedListEntry<EntryItem> {
  final int id;

  EntryItem(this.id);

  @override
  String toString() {
    return '$id';
  }
}
