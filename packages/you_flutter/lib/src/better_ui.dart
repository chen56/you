@experimental
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';

typedef _WidgetWarp = Widget Function(Widget child);

bool _isDebug = kDebugMode && true;

/*
 * 更好的flutter ui编程实践，代码尽力做到美观:
 *  - 代码缩进只应体现组件的父子关系，属性会干扰层级视觉，需要独立开尽量不换行，最少也要隔离开。
 *  - 扁平化不必要的组件层级，比如Padding、Decoration、Aglin等只是外观属性，不用一层包一层。
 * */

/// 用 Style(padding:...,center:...)的形式构造时，包裹Padding、Center等组件的顺序时固定的,写在[BetterUI]构造器初始化块里
/// 如果想自定义包裹顺序应该：Style().center(...).padding(...).styled(child)
///     => Center
///          Padding
///             child
///             c
///
BetterUI betterUI = BetterUI._([]);

final class BetterUI {
  final List<_WidgetWarp> _warps;

  BetterUI._(this._warps);

  BetterUI _wrap(_WidgetWarp newWarp) {
    return BetterUI._([..._warps, newWarp]);
  }

  Widget child(Widget child) {
    Widget result = child;
    for (var warp in _warps) {
      result = warp(result);
    }
    return result;
  }

  BetterUI expanded({int flex = 1}) {
    return _wrap((child) => Expanded(flex: flex, child: child));
  }

  BetterUI padding(EdgeInsetsGeometry padding) {
    return _wrap((child) => Padding(padding: padding, child: child));
  }

  BetterUI paddingAll(double value) {
    return _wrap((child) => Padding(padding: EdgeInsets.all(value), child: child));
  }

  BetterUI paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return _wrap((child) => Padding(
          padding: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
          child: child,
        ));
  }

  BetterUI paddingSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    return _wrap((child) => Padding(
          padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
          child: child,
        ));
  }

  BetterUI center({double? widthFactor, double? heightFactor}) {
    return _wrap((child) => Center(
          widthFactor: widthFactor,
          heightFactor: heightFactor,
          child: child,
        ));
  }

  /// [LimitedBox]
  /// [maxWidth] The maximum width limit to apply in the absence of a
  /// [BoxConstraints.maxWidth] constraint.
  /// [maxHeight] The maximum height limit to apply in the absence of a
  /// [BoxConstraints.maxHeight] constraint.
  BetterUI limit({double maxWidth = double.infinity, double maxHeight = double.infinity}) {
    return _wrap((child) => LimitedBox(
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          child: child,
        ));
  }
}

Size measureWidget(Widget widget) {
  final PipelineOwner pipelineOwner = PipelineOwner();
  final _MeasurementView rootView = pipelineOwner.rootNode = _MeasurementView();
  final BuildOwner buildOwner = BuildOwner(focusManager: FocusManager());
  final RenderObjectToWidgetElement<RenderBox> element = RenderObjectToWidgetAdapter<RenderBox>(
    container: rootView,
    debugShortDescription: '[root]',
    child: widget,
  ).attachToRenderTree(buildOwner);
  try {
    rootView.scheduleInitialLayout();
    pipelineOwner.flushLayout();
    return rootView.size;
  } finally {
    // Clean up.
    element.update(RenderObjectToWidgetAdapter<RenderBox>(container: rootView));
    buildOwner.finalizeTree();
  }
}

class _MeasurementView extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  @override
  void performLayout() {
    assert(child != null);
    child!.layout(const BoxConstraints(), parentUsesSize: true);
    size = child!.size;
  }

  @override
  void debugAssertDoesMeetConstraints() => true;
}

extension StyleExtension on Widget {
  /// Warp a [Padding]
  Widget marginAll$(double value) {
    return Container(margin: EdgeInsets.all(value), child: this);
  }

  Widget margin$(EdgeInsets margin) {
    return Container(margin: margin, child: this);
  }

  /// Warp a [Padding]
  Widget padding$(EdgeInsetsGeometry padding) => Padding(padding: padding, child: this);

  /// Warp a [Padding]
  Widget paddingAll$(double value) {
    return Padding(padding: EdgeInsets.all(value), child: this);
  }

  /// Warp a [Padding]
  Widget paddingOnly$({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
      child: this,
    );
  }

  /// Warp a [Padding]
  Widget paddingSymmetric$({double vertical = 0.0, double horizontal = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  /// Warp a [Expanded]
  Widget expanded$({int flex = 1}) => Expanded(flex: flex, child: this);

  /// Warp a [Flexible]
  /// [flex]Default to 1
  /// [fit]Default to FlexFit.loose
  Widget flexible$({int flex = 1, FlexFit fit = FlexFit.loose}) {
    return Flexible(flex: flex, fit: fit, child: this);
  }

  Widget clipRect$({Clip clipBehavior = Clip.hardEdge}) {
    return ClipRect(clipBehavior: clipBehavior, child: this);
  }

  /// Warp a [Center]
  Widget center$({double? widthFactor, double? heightFactor}) {
    return Center(widthFactor: widthFactor, heightFactor: heightFactor, child: this);
  }

  /// Warp a [LimitedBox]
  /// [maxWidth] The maximum width limit to apply in the absence of a
  /// [BoxConstraints.maxWidth] constraint.
  /// [maxHeight] The maximum height limit to apply in the absence of a
  /// [BoxConstraints.maxHeight] constraint.
  Widget limitedBox$({double maxWidth = double.infinity, double maxHeight = double.infinity}) {
    return LimitedBox(
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      child: this,
    );
  }

  Widget constrainedBox$({required BoxConstraints constraints}) {
    return ConstrainedBox(
      constraints: constraints,
      child: this,
    );
  }

  Widget intrinsicWidth$({double? stepWidth, double? stepHeight}) {
    return IntrinsicWidth(
      stepWidth: stepWidth,
      stepHeight: stepHeight,
      child: this,
    );
  }

  Widget intrinsicHeight$() {
    return IntrinsicHeight(
      child: this,
    );
  }

  /// [width]If non-null, requires the child to have exactly this width.
  /// [height]If non-null, requires the child to have exactly this height.
  Widget sizedBox$({double? width, double? height}) {
    return SizedBox(
      width: width,
      height: height,
      child: this,
    );
  }

  Widget sizedBoxExpand$() {
    return SizedBox.expand(
      child: this,
    );
  }

  Widget sizedBoxShrink$() {
    return SizedBox.shrink(
      child: this,
    );
  }

  Widget sizedBoxSquare$({double? dimension}) {
    return SizedBox.square(
      dimension: dimension,
      child: this,
    );
  }

  /// Warp a [FittedBox]
  /// [fit]How to inscribe the child into the space allocated during layout.
  /// [alignment]Defaults to [Alignment.center].
  /// [clipBehavior]Defaults to [Clip.none].
  Widget fittedBox$({BoxFit fit = BoxFit.contain, AlignmentGeometry alignment = Alignment.center, Clip clipBehavior = Clip.none}) {
    return FittedBox(
      fit: fit,
      alignment: alignment,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  Widget fractionallySizedBox$({double? widthFactor, double? heightFactor, Alignment alignment = Alignment.center}) {
    return FractionallySizedBox(
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: this,
    );
  }

  /// [minWidth]The minimum width constraint to give the child. Set this to null (the
  /// default) to use the constraint from the parent instead.
  /// [maxWidth]The maximum width constraint to give the child. Set this to null (the
  /// default) to use the constraint from the parent instead.
  /// [minHeight]The minimum height constraint to give the child. Set this to null (the
  /// default) to use the constraint from the parent instead.
  /// [maxHeight]The maximum height constraint to give the child. Set this to null (the
  /// default) to use the constraint from the parent instead.
  Widget overflowBox$({AlignmentGeometry alignment = Alignment.center, double? minWidth, double? maxWidth, double? minHeight, double? maxHeight, OverflowBoxFit fit = OverflowBoxFit.max}) {
    return OverflowBox(
      fit: fit,
      alignment: alignment,
      child: this,
    );
  }

  /// Warp a [Align]
  Widget align$({Alignment alignment = Alignment.center, double? widthFactor, double? heightFactor}) {
    return Align(alignment: alignment, widthFactor: widthFactor, heightFactor: heightFactor, child: this);
  }

  Widget visibility$({bool visible = true, bool maintainState = false, bool maintainAnimation = false, bool maintainSize = false, bool maintainSemantics = false, bool maintainInteractivity = false, Widget replacement = const SizedBox.shrink()}) {
    return Visibility(
      replacement: replacement,
      visible: visible,
      maintainState: maintainState,
      maintainAnimation: maintainAnimation,
      maintainSize: maintainSize,
      maintainSemantics: maintainSemantics,
      maintainInteractivity: maintainInteractivity,
      child: this,
    );
  }

  Widget offstage$({bool offstage = true}) {
    return Offstage(
      offstage: offstage,
      child: this,
    );
  }

  /// Warp a [Align]
  Widget singleChildScrollView$({Axis scrollDirection = Axis.vertical}) {
    return SingleChildScrollView(scrollDirection: scrollDirection, child: this);
  }

  /// Warp a [DecoratedBox], and add border
  Widget borderAll$({
    Color color = const Color(0xFF000000),
    double width = 1.0,
    BorderStyle style = BorderStyle.solid,
    double strokeAlign = BorderSide.strokeAlignInside,
    double radius = 0,
  }) {
    return DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: BoxDecoration(
        border: Border.all(color: color, width: width, style: style, strokeAlign: strokeAlign),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: this,
    );
  }

  /// if(kDebugMode) Warp a [LayoutBuilder], and print constraints info
  Widget debugLayoutBuilder$() {
    if (!_isDebug) {
      return this;
    }

    return LayoutBuilder(builder: (context, constraints) {
      var screenWidth = MediaQuery.of(context).size.width;
      debugPrint("\$debugLayoutBuilder: screenWidth:$screenWidth, this:$runtimeType, constraints:$constraints, this:$this");
      return this;
    });
  }

  /// if(kDebugMode)  add border and padding, show what is looks like.
  Widget debugBorder$({double paddingAll = 6}) {
    if (!_isDebug) {
      return this;
    }
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          // 上下左右四个边框
          top: BorderSide(color: Colors.black, width: 1.0),
          right: BorderSide(color: Colors.black, width: 1.0),
          bottom: BorderSide(color: Colors.black, width: 1.0),
          left: BorderSide(color: Colors.black, width: 1.0),
          // 如果需要圆角边框
          // borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: this,
    ).paddingAll$(paddingAll);
  }
}

/// 小屏手机优先的响应式设计
///
/// material3
/// https://m3.material.io/foundations/layout/applying-layout/window-size-classes
///   Compact	Width < 600	Phone in portrait
///   Medium	600 ≤ width < 840	Tablet in portrait Foldable in portrait (unfolded)
///   Expanded	840 ≤ width < 1200*	Phone in landscape, Tablet in landscape , Foldable in landscape (unfolded) Desktop Large
///   1200 ≤ width < 1600	Desktop
///   Extra-large	1600 ≤ width	Desktop Ultra-wide
///
/// tailwindcss:
/// https://www.tailwindcss.cn/docs/responsive-design#targeting-a-breakpoint-range
///    sm	640px	@media (min-width: 640px) { ... }
///    md	768px	@media (min-width: 768px) { ... }
///    lg	1024px	@media (min-width: 1024px) { ... }
///    xl	1280px	@media (min-width: 1280px) { ... }
///    2xl	1536px	@media (min-÷÷width: 1536px) { ... }
/// 命名模仿tailwindcss命名习惯
enum ScreenSize {
  /// 即缺省档, mobile优先设计
  min(minWidth: 0),
  sm(minWidth: 640),
  md(minWidth: 768),
  lg(minWidth: 1024),
  xl(minWidth: 1280),
  xxl(minWidth: 1536);

  const ScreenSize({required this.minWidth});

  final double minWidth;

  static ScreenSize byName(String name) {
    return ScreenSize.values.firstWhere((e) => e.name == name);
  }

  /// 计算当前屏幕宽度卡在哪一档，比如
  ///   - 如果screen==639,       卡在min档，因为 0<=screen<640
  ///   - 如果screen==640或767 ， 卡在sm档， 因为640<=screen<768
  ///   - 如果screen==768或1023,  卡在md档，因为768<=screen<1024
  ///   - 如果screen==1024或1279, 卡在lg档，因为1024<=screen<1280
  ///   - 如果screen==1280或1535, 卡在lx档，因为1280<=screen<1536
  ///   - 如果screen==1536及以上, 卡在xxl档，因为1536<=screen<infinity
  static ScreenSize ofWidth(double screenWidth) {
    var current = ScreenSize.min;
    for (var breakpoint in values) {
      if (screenWidth >= breakpoint.minWidth) {
        current = breakpoint;
        continue;
      }
      return current;
    }
    return ScreenSize.xxl;
  }

  static ScreenSize of(BuildContext context) {
    return ofWidth(MediaQuery.of(context).size.width);
  }

  static T match<T>(BuildContext context, {required T min, T? sm, T? md, T? lg, T? xl, T? xxl}) {
    return matchWidth(MediaQuery.of(context).size.width, min: min, sm: sm, md: md, lg: lg, xl: xl, xxl: xxl);
  }

  /// 为一个宽度的屏幕选择其相应的样式,概念和tailwindcss相似
  /// 屏幕宽度落在哪档的计算参考[ofWidth]
  static T matchWidth<T>(double screenWidth, {required T min, T? sm, T? md, T? lg, T? xl, T? xxl}) {
    ScreenSize now = ofWidth(screenWidth);
    List<(ScreenSize, T?)> options = [
      (ScreenSize.xxl, xxl),
      (ScreenSize.xl, xl),
      (ScreenSize.lg, lg),
      (ScreenSize.md, md),
      (ScreenSize.sm, sm),
    ];
    for (var (breakpoint, option) in options) {
      // 未提供某档专用样式的忽略
      if (option == null) {
        continue;
      }
      // 专用样式落在此档
      if (breakpoint.minWidth <= now.minWidth) {
        return option;
      }
    }
    return min;
  }
}

/// ref:
/// - <https://tr.designtokens.org/format/>
/// - <https://m3.material.io/foundations/design-tokens/overview>
/// - <https://daisyui.com/docs/colors/>
@experimental
final class DesignTokens with DesignTokensMixin {
  @override
  final BuildContext context;

  const DesignTokens.of(this.context);
}

@experimental
base mixin DesignTokensMixin {
  BuildContext get context;

  ColorScheme get colors => Theme.of(context).colorScheme;

  ButtonStyle get elevatedButtonPrimary => ElevatedButton.styleFrom(backgroundColor: colors.primary, foregroundColor: colors.onPrimary);

  ButtonStyle get elevatedButtonSecondary => ElevatedButton.styleFrom(backgroundColor: colors.secondary, foregroundColor: colors.onSecondary);

  ButtonStyle get elevatedButtonTertiary => ElevatedButton.styleFrom(backgroundColor: colors.tertiary, foregroundColor: colors.onTertiary);

  ButtonStyle get elevatedButtonPrimaryContainer => ElevatedButton.styleFrom(backgroundColor: colors.primaryContainer, foregroundColor: colors.onPrimaryContainer);

  ButtonStyle get elevatedButtonSecondaryContainer => ElevatedButton.styleFrom(backgroundColor: colors.secondaryContainer, foregroundColor: colors.onSecondaryContainer);

  ButtonStyle get elevatedButtonTertiaryContainer => ElevatedButton.styleFrom(backgroundColor: colors.tertiaryContainer, foregroundColor: colors.onTertiaryContainer);

  ButtonStyle get elevatedButtonError => ElevatedButton.styleFrom(backgroundColor: colors.error, foregroundColor: colors.onError);

  ButtonStyle get elevatedButtonErrorContainer => ElevatedButton.styleFrom(backgroundColor: colors.errorContainer, foregroundColor: colors.onErrorContainer);

  TextStyle get textPrimary => TextStyle(color: colors.onPrimary);

  TextStyle get textSecondary => TextStyle(color: colors.onSecondary);

  TextStyle get textTertiary => TextStyle(color: colors.onTertiaryContainer);

  TextStyle get textPrimaryContainer => TextStyle(color: colors.onPrimaryContainer);

  TextStyle get textSecondaryContainer => TextStyle(color: colors.onSecondaryContainer);

  TextStyle get textTertiaryContainer => TextStyle(color: colors.onTertiaryContainer);

  TextStyle get textError => TextStyle(color: colors.onError);

  TextStyle get textErrorContainer => TextStyle(color: colors.onErrorContainer);
}

enum ColorSeed {
  m3baseline('M3 Baseline', Color(0xff6750a4)),
  indigo('Indigo', Colors.indigo),
  blue('Blue', Colors.blue),
  teal('Teal', Colors.teal),
  green('Green', Colors.green),
  yellow('Yellow', Colors.yellow),
  orange('Orange', Colors.orange),
  deepOrange('Deep Orange', Colors.deepOrange),
  white('White', Colors.white),
  pink('Pink', Colors.pink);

  const ColorSeed(this.label, this.color);

  final String label;
  final Color color;
}
