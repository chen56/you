import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

Analyzer analyzerUtils=Analyzer();

class Analyzer{
  Iterable<T> findChildrenByType<T>(Element findFrom){
    CollectChildElement<T> e=CollectChildElement<T>();
    findFrom.accept(e);
    return e.list;
    // if (findFrom is T)  yield findFrom as T;
    // for(var child in findFrom.children){
    //   yield* findChildrenByType(child);
    // }
  }
}

class CollectChildElement<T> extends GeneralizingElementVisitor{
  List<T> list=[];
  @override
  visitElement(Element element) {
    print("ffffff$element");
    if(element is T){
      list.add(element as T);
    }
    return super.visitElement(element);
  }
}