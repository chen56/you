import 'base.dart';

// 编译错误无法implement一个base mixin 或class
// 非常棒，这就是要的效果
// base class ImplA implements BaseMixin {}
// base class ExtendBaseClass implements BaseClass {}

base class WithBaseMixin with BaseMixin {}

base class ExtendBaseClass extends BaseClass {}
