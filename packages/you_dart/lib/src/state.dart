import 'dart:collection';

import 'package:collection/collection.dart';

// TODO 去除flutter依赖，这玩意应该是个纯dart lib ，比如json工具等
import 'package:flutter/foundation.dart';

import 'package:meta/meta.dart';
import 'package:you_dart/src/_core.dart';

_defaultOnSignalDoNothing(Signal signal) {}

typedef FromJson = Object Function(Object input);

_defaultOnConnectedImmediatelyClose(SignalSubscription conn) {
  conn.cancel();
}

/// State是对数据的加强，增加了监听功能
///  class RootStore extends Store{
///    final username="".npc.signal(name:"username",at:RootStore);
///    final SubStore subStore=Store().asField(name:"subStore",at:RootStore)
///  }
///  class SubStore extends Store{}
/// TODO 缺少批更新函数 batch(), 可以一次性更新后再notify
///
extension StoreExtension<T extends Store> on T {
  /// 在自定义Store时需提供[field] [at]，会注册字段
  T signal({String field = "", Type at = Null, String debugLabel = ""}) {
    _debugLabel = debugLabel;
    return this;
  }
}

extension ListExtension<E> on List<E> {
  /// 在自定义Store时需提供[field] [at]，会注册字段
  List<E> signal({String field = "", Type at = Null}) => _List(this);
}

extension QueueExtension<E> on Queue<E> {
  /// 在自定义Store时需提供[field] [at]，会注册字段
  Queue<E> signal({String field = "", Type at = Null, String debugLabel = ""}) {
    var data = _Queue(this, debugLabel: debugLabel);
    return data;
  }
}

extension SetExtension<E> on Set<E> {
  /// 在自定义Store时需提供[field] [at]，会注册字段
  Set<E> signal({String field = "", Type at = Null, String debugLabel = ""}) {
    var data = _Set(this, debugLabel: debugLabel);
    return data;
  }
}

extension MapExtension<K, V> on Map<K, V> {
  /// 在自定义Store时需提供[field] [at]，会注册字段
  Map<K, V> signal({String field = "", Type at = Null, String debugLabel = ""}) {
    var data = _Map(this, debugLabel: debugLabel);
    return data;
  }
}

extension ValueExtension<T> on T {
  /// 在自定义Store时需提供[field] [at]，会注册字段
  Value<T> signal({String field = "", Type at = Null, String debugLabel = ""}) {
    var data = Value(this, debugLabel: debugLabel);
    return data;
  }
}

// 没有代码生成，具备字段反射能力，需要一些手工指定配置
// 可反射的对象

/// Store 是自定义状态类的基类，自定义类型的复杂状态应该继承它。
///
/// flutter无法使用mirror库的反射能力，导致很多库的编写成为问题，比如json解析，没代码生成就不好搞。
/// 而Store类基于简单原则，试图不用代码，尽力完成类似功能。
///  - [JsonMixin] json 自动生成和填充,不用手工一个个字段设置了
///  - todo State树层级事件传播
///
/// 举例：
/// 一般你可能会这样组织一大堆状态：
///   YouStore{
///     final theme=ValueState("dark");
///     final users=_MapState({});
///   }
///   YouStore state_store.dart=YouStore();
///   state_store.dart.theme.value="light";
///   class SomeWidget{
///     build(Context){
///       return Watch((context)=>Text("current theme: ${state_store.dart.theme.value}"));
///     }
///    }
///
///  但也可以这样：
///   YouStore extends Store with JsonStoreMixin {
///     final theme=ValueState("dark",name="theme",at=YouStore);
///     final users=_MapState({},      name="users",at=YouStore);
///   }
///
/// 注意到了吗，多了2个参数：name="users",at=UserStore，即告诉Store字段的name和所属，然后就可以这样：
///
/// YouStore state_store.dart=YouStore();
/// print(state_store.dart.toJson());
///    =>  {"theme":"dark"......}
///
///
///
///

/// FIXME 临时实现，未处理signal集合的删除case，所以急需实现一种无生命周期的通知机制
final class _Notifier with ChangeNotifier {
  void fireChanged() {
    notifyListeners();
  }
  @override
  String toString() {
    return "$runtimeType  ";
  }
}
class _Watcher {
  final ValueChanged<Signal> onChanged;
  final ValueChanged<SignalSubscription> onListen;

  _Watcher({required this.onChanged, required this.onListen});
}

/// StateBase 继承关系：
/// Singal
///   - Store
///   - Value
///   - _List
///   - _Set
///   - _Map
abstract base class Signal {
  /// name: The field name
  /// at: The declared type of this field
  ///   - if at != Null then: it's a state_store.dart field
  ///   - if at == Null then: Independent variable, not belong to any Store,
  Signal({String debugLabel = ""}) : _debugLabel = debugLabel;

  String _name = "";

  String _debugLabel;

  // : _data = data,
  //   assert(data is! Signal, "already asSignal() on $data");

  // YouState不直接扩展ChangeNotifier的原因是:
  //  1. 不想给核心类添加很多客户可见方法，干扰别人代码提示
  //  2. 暴露出的addListener，客户代码就要自己dispose，还没想好如何处理，暂时隐藏实现
  @nonVirtual
  final _Notifier _notifier = _Notifier();

  // TODO _notifier 和_registeredWatchers可以合并！而且notifier内部用List实现的，删除性能貌似不咋地
  // 这些是在read scope时，发现需要观测write事件的watcher，他们需要在生命期结束时来自己removeWatcher，Signal不知道什么时候结束观察
  final Map<_Watcher, SignalSubscription> _subscriptions = {};

  /// 这个栈类似多重梦境，因为观测者会一层嵌套一层，最上方是当前梦境，即当前Watcher
  /// 不用担心这个stack的长度，这是在[track]包裹下瞬间使用的临时stack，用作嵌套的watchRead，瞬间用完，瞬间清理
  /// Multi-layered dreams
  static final List<_Watcher> _listenerTempStack = List.empty(growable: true);

  /// 在客户程序Widget.build时，会有读操作，比如 Text("username: ${username.value}")
  /// Signal.watchRead在[useSignal]callback执行期间打开一个封闭的瞬时作用域，
  /// 期间的Signal读操作会通知[onRead]，并用[onChanged]为key注册监听器
  ///
  /// * [onChanged] 当watchRead阶段发现有signal的read操作，会把注册[onChanged]注册到Signal的监听池
  /// * [onConnected] 当注册[onChanged]到的监听池时，会调用此方法，并提供一个dispose钩子给外部程序
  ///   外部程序生命周期结束时，可以用dispose移除监听器s
  static T track<T>({
    required T Function() useSignal,
    ValueChanged<Signal> onChanged = _defaultOnSignalDoNothing,
    ValueChanged<SignalSubscription> onConnected = _defaultOnConnectedImmediatelyClose,
  }) {
    /// TODO watchRead时应关闭写通知，因为watchRead是在Widget.build期间调用的，写通知会触发Watcher的setState，不符合flutter规范
    _listenerTempStack.add(_Watcher(onChanged: onChanged, onListen: onConnected));
    try {
      return useSignal();
    } finally {
      _listenerTempStack.removeLast();
    }
  }

  @nonVirtual
  _fireRead() {
    var listener = _listenerTempStack.lastOrNull;
    // watcher为空表示未在[tryConnect]范围内执行，比如不关注Signal变化的地方，或命令行工具场景。
    if (listener == null) return;

    if (_subscriptions.containsKey(listener)) {
      // alread connected
      return;
    }
    listen() {
      listener.onChanged(this);
    }

    dispose() {
      _subscriptions.remove(listener);
      _notifier.removeListener(listen);
    }

    // to connect
    var subscription = SignalSubscription._(this, dispose);
    _subscriptions[listener] = subscription;
    _notifier.addListener(listen);

    // 通知调用方
    listener.onListen(subscription);
  }

  // @visibleForOverriding
  @nonVirtual
  _fireChanged() {
    _notifier.fireChanged();
  }

  /// 为了解决外部json程序无法获知Signal内部范型的问题，实验了一个类型钩子，
  /// 貌似可以解决此问题，目前还没想到其他更简单的方案。
  /// json处理比较复杂，而且和Signal核心逻辑无关，还是把json、yaml等处理放在state.dart外部，
  /// 这样就需要一些机制可以拿到Map List的范型类型，比如：
  ///   Value<String>           返回[TypeHook<String>]
  ///   _MapSignal<int,String>  返回[TypeHook<int>,TypeHook<String>]
  ///   Store                   返回[TypeHook<Store>] Store自己没范型，返回自己
  ///   ......其他类似
  @experimental
  List<TypeHook> get typeArgs;
}

/// 本包是无代码生成反射的低级抽象，本质是自行注册字段元数据，而后获得类似反射的能力
/// [Store]是本基于本包的状态管理工具，使用更容易。
/// 希望获得反射能力的类，需要按如下方法实现：
/// base class X extends Store{
///   int i = Field(name:"",at:X,data:1).value;
/// }
/// print(X().fields)
/// base Class modifiers 限定子类只能继承，不能implements
/// ref: <https://dart.cn/language/class-modifiers#base>
abstract base class Store extends Signal {
  Store({super.debugLabel});

  final _fields = <String, Signal>{};

  Map<String, Signal> get fields => UnmodifiableMapView(_fields);

  @visibleForTesting
  @protected
  T field<T>(String name, T value, {FromJson? fromJson}) {
    assert(!_fields.containsKey(name), "name:$name : value:$value");
    var s = value as Signal;
    s._name = name;
    _fields[name] = s;
    return value;
  }

  @override
  List<TypeHook> get typeArgs => [const TypeHook<Store>()];

  @override
  String toString() {
    return 'type:$runtimeType,name:$_name, debugLabel:$_debugLabel, fields:${fields.toString()}';
  }
}

@experimental
class FieldBuilder {
  final _fields = <String, Signal>{};

  void field<T>(String name, T value, {FromJson? fromJson}) {
    assert(!_fields.containsKey(name), "name:$name : value:$value");
    _fields[name] = value as Signal;
  }

  Map<String, Signal> get fields => _fields;

  static void build(Store store, void Function(FieldBuilder) updates) {
    FieldBuilder builder = FieldBuilder();
    updates(builder);
    for (var MapEntry(key: key, value: value) in builder._fields.entries) {
      store.field(key, value);
    }
  }
}


@experimental
final class SignalSubscription {
  final Signal signal;

  final VoidCallback dispose;

  SignalSubscription._(this.signal, VoidCallback close) : dispose = close;

  /// 取消订阅Signal事件
  void cancel() {
    dispose();
  }
}

/// ref: ObserverList
final class Value<T> extends Signal {
  Value(T data, {super.debugLabel}) : _data = data;
  T _data;

  @useResult
  T get value {
    _fireRead();
    return _data;
  }

  set value(T newValue) {
    if (_data == newValue) return;
    _data = newValue;
    _fireChanged();
  }

  /// 更短的用法
  @useResult
  T call() {
    return value;
  }

  T peek() {
    return _data;
  }

  @override
  List<TypeHook> get typeArgs => [TypeHook<T>()];

  @override
  String toString() {
    return 'type:Value<$T>,name:$_name, debugLabel:$_debugLabel, value:$value';
  }
}

/// ref: [DelegatingList] [ListMixin]
final class _List<E> extends _Iterable<E> with ListMixin<E> {
  // 复制一份data,要不然外面可能是const集合
  _List(List<E> data, {super.debugLabel}) : _data = List.from(data);
  final List<E> _data;

  @override
  List<TypeHook> get typeArgs => [TypeHook<E>()];

  // #############################################################
  // ## 下面为ListMixin的实现
  // #############################################################

  @override
  int get length {
    _fireRead();
    return _data.length;
  }

  @override
  operator [](int index) {
    _fireRead();
    return _data[index];
  }

  @override
  set length(int newLength) {
    _data.length = newLength;
    _fireChanged();
  }

  @override
  void operator []=(int index, value) {
    _data[index] = value;
    _fireChanged();
  }

  @override
  void add(E value) {
    _data.add(value);
    _fireChanged();
  }

  @override
  void addAll(Iterable<E> iterable) {
    _data.addAll(iterable);
    _fireChanged();
  }
}

final class _Queue<E> extends _Iterable<E> with ListMixin<E> implements Queue<E> {
  // 复制一份data,要不然外面可能是只读集合
  _Queue(Queue<E> data, {super.debugLabel}) : _data = QueueList.from(data);
  final QueueList<E> _data;

  @override
  List<TypeHook> get typeArgs => [TypeHook<E>()];

  @override
  String toString() {
    return super.toSignalString();
  }
  // #############################################################
  // ## 下面为ListMixin的实现
  // #############################################################
  @override
  QueueList<T> cast<T>() {
    _fireRead();
    return _data.cast<T>();
  }

  @override
  int get length {
    _fireRead();
    return _data.length;
  }

  @override
  operator [](int index) {
    _fireRead();
    return _data[index];
  }

  @override
  set length(int newLength) {
    _data.length = newLength;
    _fireChanged();
  }

  @override
  void operator []=(int index, value) {
    _data[index] = value;
    _fireChanged();
  }

  @override
  void add(E value) {
    _data.add(value);
    _fireChanged();
  }

  @override
  void addAll(Iterable<E> iterable) {
    _data.addAll(iterable);
    _fireChanged();
  }

  // #############################################################
  // ## 下面是Queue的实现
  // #############################################################

  @override
  void addFirst(E element) {
    _data.addFirst(element);
    _fireChanged();
  }

  @override
  void addLast(E element) {
    _data.addLast(element);
    _fireChanged();
  }

  @override
  E removeFirst() {
    E result = _data.removeFirst();
    _fireChanged();
    return result;
  }
}

/// ref: [DelegatingList] [ListMixin]
/// key没限定为String的理由：int key 比 String key 取值快10倍！
final class _Map<K, V> extends Signal with MapMixin<K, V> {
  // 复制一份data,要不然外面可能是const集合
  _Map(Map<K, V> data, {super.debugLabel}) : _data = Map.from(data);
  final Map<K, V> _data;

  @override
  List<TypeHook> get typeArgs => [TypeHook<K>(), TypeHook<V>()];

  @override
  String toString() {
    return 'type:$runtimeType, name:$_name, debugLabel:$_debugLabel, length:$length';
  }

  // #############################################################
  // ## 下面为MapMixin的实现
  // #############################################################

  @override
  V? operator [](Object? key) {
    _fireRead();
    return _data[key];
  }

  @override
  void operator []=(K key, V value) {
    if (_data[key] == value) return;
    _data[key] = value;
    _fireChanged();
  }

  @override
  void clear() {
    _data.clear();
    _fireChanged();
  }

  @override
  Iterable<K> get keys {
    _fireRead();
    return _data.keys;
  }

  @override
  V? remove(Object? key) {
    var result = _data.remove(key);
    if (result != null) _fireChanged();
    return result;
  }
}

abstract base class _Iterable<E> extends Signal implements Iterable<E> {
  _Iterable({super.debugLabel});

  @override
  String toString() {
    return toSignalString();
  }
  String toSignalString() {
    return 'type:$runtimeType, name:$_name, debugLabel:$_debugLabel, length:$length';
  }

}

final class _Set<E> extends _Iterable<E> with SetMixin<E> {
  // 复制一份data,要不然外面可能是const集合
  _Set(Set<E> data, {super.debugLabel}) : _data = Set.from(data);
  final Set<E> _data;

  @override
  List<TypeHook> get typeArgs => [TypeHook<E>()];

  // #############################################################
  // ## 下面为SetMixin的实现
  // #############################################################

  @override
  bool add(E value) {
    var result = _data.add(value);
    if (result) _fireChanged();
    return result;
  }

  @override
  bool contains(Object? element) {
    _fireRead();
    return _data.contains(element);
  }

  @override
  Iterator<E> get iterator {
    _fireRead();
    return _data.iterator;
  }

  @override
  int get length {
    _fireRead();
    return _data.length;
  }

  @override
  E? lookup(Object? element) {
    _fireRead();
    return _data.lookup(element);
  }

  @override
  bool remove(Object? value) {
    var result = _data.remove(value);
    if (result) _fireChanged();
    return result;
  }

  @override
  Set<E> toSet() {
    _fireRead();
    return _data.toSet();
  }

  @override
  void clear() {
    _fireChanged();
    _data.clear();
  }
}
