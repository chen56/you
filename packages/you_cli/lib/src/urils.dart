import 'package:analyzer/dart/element/element.dart';

Analyzer analyzerUtils=Analyzer();

class Analyzer{
  Iterable<T> findChildrenByType<T>(Element toFind) sync* {
    if (toFind is T)  yield toFind as T;
    for(var child in toFind.children){
      yield* findChildrenByType(child);
    }
  }
}

