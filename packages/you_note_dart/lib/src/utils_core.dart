final Collections collections=Collections();

class Collections{


  Iterable<(E value, E? next)> combineNext<E>(Iterable<E> values) sync* {
    var list = values.toList();
    for (int i = 0; i < list.length; i++) {
      if (i + 1 < list.length) {
        yield (list[i], list[i + 1]);
      } else {
        yield (list[i], null);
      }
    }
  }

}