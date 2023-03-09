import augment 'ext.dart';

class Class {
  Class(){
    print("new class");
  }
  void augmentedMethod() {
    print("Class");
  }
}

class Subclass implements Class {
  void augmentedMethod() {
    print("Subclass");
  }
}
