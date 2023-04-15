// /// Generated by gen_maters.dart, please don't edit!

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/src/material/search_anchor.dart' as _i1;
import 'package:note/mate.dart' as _i2;
import 'package:flutter/src/foundation/key.dart' as _i3;
import 'package:flutter/src/widgets/framework.dart' as _i4;
import 'dart:ui' as _i5;
import 'package:flutter/src/painting/borders.dart' as _i6;
import 'package:flutter/src/painting/text_style.dart' as _i7;
import 'package:flutter/src/rendering/box.dart' as _i8;
import 'package:flutter/src/widgets/editable_text.dart' as _i9;
import 'package:flutter/src/widgets/focus_manager.dart' as _i10;
import 'package:flutter/src/gestures/tap.dart' as _i11;
import 'package:flutter/src/foundation/basic_types.dart' as _i12;
import 'package:flutter/src/material/material_state.dart' as _i13;
import 'package:flutter/src/painting/edge_insets.dart' as _i14;

/// class SearchAnchor extends StatefulWidget
class SearchAnchor$Mate extends _i1.SearchAnchor with _i2.Mate {
  /// SearchAnchor SearchAnchor({Key? key, bool? isFullScreen, SearchController? searchController, Widget Function(Iterable<Widget>)? viewBuilder, Widget? viewLeading, Iterable<Widget>? viewTrailing, String? viewHintText, Color? viewBackgroundColor, double? viewElevation, Color? viewSurfaceTintColor, BorderSide? viewSide, OutlinedBorder? viewShape, TextStyle? headerTextStyle, TextStyle? headerHintStyle, Color? dividerColor, BoxConstraints? viewConstraints, required Widget Function(BuildContext, SearchController) builder, required Iterable<Widget> Function(BuildContext, SearchController) suggestionsBuilder})
  SearchAnchor$Mate({
    /// optionalParameters: {Key? key} , default:none
    _i3.Key? key,

    /// optionalParameters: {bool? isFullScreen} , default:none
    bool? isFullScreen,

    /// optionalParameters: {SearchController? searchController} , default:none
    _i1.SearchController? searchController,

    /// optionalParameters: {Widget Function(Iterable<Widget>)? viewBuilder} , default:none
    _i1.ViewBuilder? viewBuilder,

    /// optionalParameters: {Widget? viewLeading} , default:none
    _i4.Widget? viewLeading,

    /// optionalParameters: {Iterable<Widget>? viewTrailing} , default:none
    Iterable<_i4.Widget>? viewTrailing,

    /// optionalParameters: {String? viewHintText} , default:none
    String? viewHintText,

    /// optionalParameters: {Color? viewBackgroundColor} , default:none
    _i5.Color? viewBackgroundColor,

    /// optionalParameters: {double? viewElevation} , default:none
    double? viewElevation,

    /// optionalParameters: {Color? viewSurfaceTintColor} , default:none
    _i5.Color? viewSurfaceTintColor,

    /// optionalParameters: {BorderSide? viewSide} , default:none
    _i6.BorderSide? viewSide,

    /// optionalParameters: {OutlinedBorder? viewShape} , default:none
    _i6.OutlinedBorder? viewShape,

    /// optionalParameters: {TextStyle? headerTextStyle} , default:none
    _i7.TextStyle? headerTextStyle,

    /// optionalParameters: {TextStyle? headerHintStyle} , default:none
    _i7.TextStyle? headerHintStyle,

    /// optionalParameters: {Color? dividerColor} , default:none
    _i5.Color? dividerColor,

    /// optionalParameters: {BoxConstraints? viewConstraints} , default:none
    _i8.BoxConstraints? viewConstraints,

    /// optionalParameters: {required Widget Function(BuildContext, SearchController) builder} , default:none
    required _i1.SearchAnchorChildBuilder builder,

    /// optionalParameters: {required Iterable<Widget> Function(BuildContext, SearchController) suggestionsBuilder} , default:none
    required _i1.SuggestionsBuilder suggestionsBuilder,
  }) : super(
          key: key,
          isFullScreen: isFullScreen,
          searchController: searchController,
          viewBuilder: viewBuilder,
          viewLeading: viewLeading,
          viewTrailing: viewTrailing,
          viewHintText: viewHintText,
          viewBackgroundColor: viewBackgroundColor,
          viewElevation: viewElevation,
          viewSurfaceTintColor: viewSurfaceTintColor,
          viewSide: viewSide,
          viewShape: viewShape,
          headerTextStyle: headerTextStyle,
          headerHintStyle: headerHintStyle,
          dividerColor: dividerColor,
          viewConstraints: viewConstraints,
          builder: builder,
          suggestionsBuilder: suggestionsBuilder,
        ) {
    mateBuilderName = 'SearchAnchor';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => SearchAnchor$Mate(
          key: p.get('key').build(),
          isFullScreen: p.get('isFullScreen').build(),
          searchController: p.get('searchController').build(),
          viewBuilder: p.get('viewBuilder').build(),
          viewLeading: p.get('viewLeading').build(),
          viewTrailing: p.get('viewTrailing').build(),
          viewHintText: p.get('viewHintText').build(),
          viewBackgroundColor: p.get('viewBackgroundColor').build(),
          viewElevation: p.get('viewElevation').build(),
          viewSurfaceTintColor: p.get('viewSurfaceTintColor').build(),
          viewSide: p.get('viewSide').build(),
          viewShape: p.get('viewShape').build(),
          headerTextStyle: p.get('headerTextStyle').build(),
          headerHintStyle: p.get('headerHintStyle').build(),
          dividerColor: p.get('dividerColor').build(),
          viewConstraints: p.get('viewConstraints').build(),
          builder: p.get('builder').build(),
          suggestionsBuilder: p.get('suggestionsBuilder').build(),
        );
    mateUse(
      'key',
      key,
      isNamed: true,
    );
    mateUse(
      'isFullScreen',
      isFullScreen,
      isNamed: true,
    );
    mateUse(
      'searchController',
      searchController,
      isNamed: true,
    );
    mateUse(
      'viewBuilder',
      viewBuilder,
      isNamed: true,
    );
    mateUse(
      'viewLeading',
      viewLeading,
      isNamed: true,
    );
    mateUse(
      'viewTrailing',
      viewTrailing,
      isNamed: true,
    );
    mateUse(
      'viewHintText',
      viewHintText,
      isNamed: true,
    );
    mateUse(
      'viewBackgroundColor',
      viewBackgroundColor,
      isNamed: true,
    );
    mateUse(
      'viewElevation',
      viewElevation,
      isNamed: true,
    );
    mateUse(
      'viewSurfaceTintColor',
      viewSurfaceTintColor,
      isNamed: true,
    );
    mateUse(
      'viewSide',
      viewSide,
      isNamed: true,
    );
    mateUse(
      'viewShape',
      viewShape,
      isNamed: true,
    );
    mateUse(
      'headerTextStyle',
      headerTextStyle,
      isNamed: true,
    );
    mateUse(
      'headerHintStyle',
      headerHintStyle,
      isNamed: true,
    );
    mateUse(
      'dividerColor',
      dividerColor,
      isNamed: true,
    );
    mateUse(
      'viewConstraints',
      viewConstraints,
      isNamed: true,
    );
    mateUse(
      'builder',
      builder,
      isNamed: true,
    );
    mateUse(
      'suggestionsBuilder',
      suggestionsBuilder,
      isNamed: true,
    );
  }
}

/// class SearchBar extends StatefulWidget
class SearchBar$Mate extends _i1.SearchBar with _i2.Mate {
  /// SearchBar SearchBar({Key? key, TextEditingController? controller, FocusNode? focusNode, String? hintText, Widget? leading, Iterable<Widget>? trailing, void Function()? onTap, void Function(String)? onChanged, BoxConstraints? constraints, MaterialStateProperty<double?>? elevation, MaterialStateProperty<Color?>? backgroundColor, MaterialStateProperty<Color?>? shadowColor, MaterialStateProperty<Color?>? surfaceTintColor, MaterialStateProperty<Color?>? overlayColor, MaterialStateProperty<BorderSide?>? side, MaterialStateProperty<OutlinedBorder?>? shape, MaterialStateProperty<EdgeInsetsGeometry?>? padding, MaterialStateProperty<TextStyle?>? textStyle, MaterialStateProperty<TextStyle?>? hintStyle})
  SearchBar$Mate({
    /// optionalParameters: {Key? key} , default:none
    _i3.Key? key,

    /// optionalParameters: {TextEditingController? controller} , default:none
    _i9.TextEditingController? controller,

    /// optionalParameters: {FocusNode? focusNode} , default:none
    _i10.FocusNode? focusNode,

    /// optionalParameters: {String? hintText} , default:none
    String? hintText,

    /// optionalParameters: {Widget? leading} , default:none
    _i4.Widget? leading,

    /// optionalParameters: {Iterable<Widget>? trailing} , default:none
    Iterable<_i4.Widget>? trailing,

    /// optionalParameters: {void Function()? onTap} , default:none
    _i11.GestureTapCallback? onTap,

    /// optionalParameters: {void Function(String)? onChanged} , default:none
    _i12.ValueChanged<String>? onChanged,

    /// optionalParameters: {BoxConstraints? constraints} , default:none
    _i8.BoxConstraints? constraints,

    /// optionalParameters: {MaterialStateProperty<double?>? elevation} , default:none
    _i13.MaterialStateProperty<double?>? elevation,

    /// optionalParameters: {MaterialStateProperty<Color?>? backgroundColor} , default:none
    _i13.MaterialStateProperty<_i5.Color?>? backgroundColor,

    /// optionalParameters: {MaterialStateProperty<Color?>? shadowColor} , default:none
    _i13.MaterialStateProperty<_i5.Color?>? shadowColor,

    /// optionalParameters: {MaterialStateProperty<Color?>? surfaceTintColor} , default:none
    _i13.MaterialStateProperty<_i5.Color?>? surfaceTintColor,

    /// optionalParameters: {MaterialStateProperty<Color?>? overlayColor} , default:none
    _i13.MaterialStateProperty<_i5.Color?>? overlayColor,

    /// optionalParameters: {MaterialStateProperty<BorderSide?>? side} , default:none
    _i13.MaterialStateProperty<_i6.BorderSide?>? side,

    /// optionalParameters: {MaterialStateProperty<OutlinedBorder?>? shape} , default:none
    _i13.MaterialStateProperty<_i6.OutlinedBorder?>? shape,

    /// optionalParameters: {MaterialStateProperty<EdgeInsetsGeometry?>? padding} , default:none
    _i13.MaterialStateProperty<_i14.EdgeInsetsGeometry?>? padding,

    /// optionalParameters: {MaterialStateProperty<TextStyle?>? textStyle} , default:none
    _i13.MaterialStateProperty<_i7.TextStyle?>? textStyle,

    /// optionalParameters: {MaterialStateProperty<TextStyle?>? hintStyle} , default:none
    _i13.MaterialStateProperty<_i7.TextStyle?>? hintStyle,
  }) : super(
          key: key,
          controller: controller,
          focusNode: focusNode,
          hintText: hintText,
          leading: leading,
          trailing: trailing,
          onTap: onTap,
          onChanged: onChanged,
          constraints: constraints,
          elevation: elevation,
          backgroundColor: backgroundColor,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          overlayColor: overlayColor,
          side: side,
          shape: shape,
          padding: padding,
          textStyle: textStyle,
          hintStyle: hintStyle,
        ) {
    mateBuilderName = 'SearchBar';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => SearchBar$Mate(
          key: p.get('key').build(),
          controller: p.get('controller').build(),
          focusNode: p.get('focusNode').build(),
          hintText: p.get('hintText').build(),
          leading: p.get('leading').build(),
          trailing: p.get('trailing').build(),
          onTap: p.get('onTap').build(),
          onChanged: p.get('onChanged').build(),
          constraints: p.get('constraints').build(),
          elevation: p.get('elevation').build(),
          backgroundColor: p.get('backgroundColor').build(),
          shadowColor: p.get('shadowColor').build(),
          surfaceTintColor: p.get('surfaceTintColor').build(),
          overlayColor: p.get('overlayColor').build(),
          side: p.get('side').build(),
          shape: p.get('shape').build(),
          padding: p.get('padding').build(),
          textStyle: p.get('textStyle').build(),
          hintStyle: p.get('hintStyle').build(),
        );
    mateUse(
      'key',
      key,
      isNamed: true,
    );
    mateUse(
      'controller',
      controller,
      isNamed: true,
    );
    mateUse(
      'focusNode',
      focusNode,
      isNamed: true,
    );
    mateUse(
      'hintText',
      hintText,
      isNamed: true,
    );
    mateUse(
      'leading',
      leading,
      isNamed: true,
    );
    mateUse(
      'trailing',
      trailing,
      isNamed: true,
    );
    mateUse(
      'onTap',
      onTap,
      isNamed: true,
    );
    mateUse(
      'onChanged',
      onChanged,
      isNamed: true,
    );
    mateUse(
      'constraints',
      constraints,
      isNamed: true,
    );
    mateUse(
      'elevation',
      elevation,
      isNamed: true,
    );
    mateUse(
      'backgroundColor',
      backgroundColor,
      isNamed: true,
    );
    mateUse(
      'shadowColor',
      shadowColor,
      isNamed: true,
    );
    mateUse(
      'surfaceTintColor',
      surfaceTintColor,
      isNamed: true,
    );
    mateUse(
      'overlayColor',
      overlayColor,
      isNamed: true,
    );
    mateUse(
      'side',
      side,
      isNamed: true,
    );
    mateUse(
      'shape',
      shape,
      isNamed: true,
    );
    mateUse(
      'padding',
      padding,
      isNamed: true,
    );
    mateUse(
      'textStyle',
      textStyle,
      isNamed: true,
    );
    mateUse(
      'hintStyle',
      hintStyle,
      isNamed: true,
    );
  }
}
