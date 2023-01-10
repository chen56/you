/// 判断类型Sub是否是Super的子类型
bool isSubtype<Super, Sub>() {
  return <Sub>[] is List<Super>;
}

/// 判断类型T是否是nullable的:
///     expect(isNullable<int>(), isFalse);
///     expect(isNullable<int?>(), isTrue);
bool isNullable<T>() {
  return null is T;
}
