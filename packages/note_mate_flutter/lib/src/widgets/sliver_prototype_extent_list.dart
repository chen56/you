// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/sliver_prototype_extent_list.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/sliver.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:core';

/// class SliverPrototypeExtentList extends SliverMultiBoxAdaptorWidget
class SliverPrototypeExtentList$Mate extends SliverPrototypeExtentList with Mate {
  /// SliverPrototypeExtentList SliverPrototypeExtentList({Key? key, required SliverChildDelegate delegate, required Widget prototypeItem})
  SliverPrototypeExtentList$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required SliverChildDelegate delegate} , hasDefaultValue:false, defaultValueCode:null
    required SliverChildDelegate delegate,

    /// optionalParameters: {required Widget prototypeItem} , hasDefaultValue:false, defaultValueCode:null
    required Widget prototypeItem,
  }) : super(
          key: key,
          delegate: delegate,
          prototypeItem: prototypeItem,
        ) {
    mateBuilder = (p) => SliverPrototypeExtentList$Mate(
          key: p.get('key').build(),
          delegate: p.get('delegate').build(),
          prototypeItem: p.get('prototypeItem').build(),
        );
    matePut('key', key);
    matePut('delegate', delegate);
    matePut('prototypeItem', prototypeItem);
  }

  /// SliverPrototypeExtentList SliverPrototypeExtentList.builder({Key? key, required Widget? Function(BuildContext, int) itemBuilder, required Widget prototypeItem, int? Function(Key)? findChildIndexCallback, int? itemCount, bool addAutomaticKeepAlives = true, bool addRepaintBoundaries = true, bool addSemanticIndexes = true})
  SliverPrototypeExtentList$Mate.builder({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required Widget? Function(BuildContext, int) itemBuilder} , hasDefaultValue:false, defaultValueCode:null
    required NullableIndexedWidgetBuilder itemBuilder,

    /// optionalParameters: {required Widget prototypeItem} , hasDefaultValue:false, defaultValueCode:null
    required Widget prototypeItem,

    /// optionalParameters: {int? Function(Key)? findChildIndexCallback} , hasDefaultValue:false, defaultValueCode:null
    ChildIndexGetter? findChildIndexCallback,

    /// optionalParameters: {int? itemCount} , hasDefaultValue:false, defaultValueCode:null
    int? itemCount,

    /// optionalParameters: {bool addAutomaticKeepAlives = true} , hasDefaultValue:true, defaultValueCode:true
    required bool addAutomaticKeepAlives,

    /// optionalParameters: {bool addRepaintBoundaries = true} , hasDefaultValue:true, defaultValueCode:true
    required bool addRepaintBoundaries,

    /// optionalParameters: {bool addSemanticIndexes = true} , hasDefaultValue:true, defaultValueCode:true
    required bool addSemanticIndexes,
  }) : super.builder(
          key: key,
          itemBuilder: itemBuilder,
          prototypeItem: prototypeItem,
          findChildIndexCallback: findChildIndexCallback,
          itemCount: itemCount,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
        ) {
    mateBuilder = (p) => SliverPrototypeExtentList$Mate.builder(
          key: p.get('key').build(),
          itemBuilder: p.get('itemBuilder').build(),
          prototypeItem: p.get('prototypeItem').build(),
          findChildIndexCallback: p.get('findChildIndexCallback').build(),
          itemCount: p.get('itemCount').build(),
          addAutomaticKeepAlives: p.get('addAutomaticKeepAlives').build(),
          addRepaintBoundaries: p.get('addRepaintBoundaries').build(),
          addSemanticIndexes: p.get('addSemanticIndexes').build(),
        );
    matePut('key', key);
    matePut('itemBuilder', itemBuilder);
    matePut('prototypeItem', prototypeItem);
    matePut('findChildIndexCallback', findChildIndexCallback);
    matePut('itemCount', itemCount);
    matePut('addAutomaticKeepAlives', addAutomaticKeepAlives);
    matePut('addRepaintBoundaries', addRepaintBoundaries);
    matePut('addSemanticIndexes', addSemanticIndexes);
  }

  /// SliverPrototypeExtentList SliverPrototypeExtentList.list({Key? key, required List<Widget> children, required Widget prototypeItem, bool addAutomaticKeepAlives = true, bool addRepaintBoundaries = true, bool addSemanticIndexes = true})
  SliverPrototypeExtentList$Mate.list({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required List<Widget> children} , hasDefaultValue:false, defaultValueCode:null
    required List<Widget> children,

    /// optionalParameters: {required Widget prototypeItem} , hasDefaultValue:false, defaultValueCode:null
    required Widget prototypeItem,

    /// optionalParameters: {bool addAutomaticKeepAlives = true} , hasDefaultValue:true, defaultValueCode:true
    required bool addAutomaticKeepAlives,

    /// optionalParameters: {bool addRepaintBoundaries = true} , hasDefaultValue:true, defaultValueCode:true
    required bool addRepaintBoundaries,

    /// optionalParameters: {bool addSemanticIndexes = true} , hasDefaultValue:true, defaultValueCode:true
    required bool addSemanticIndexes,
  }) : super.list(
          key: key,
          children: children,
          prototypeItem: prototypeItem,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
        ) {
    mateBuilder = (p) => SliverPrototypeExtentList$Mate.list(
          key: p.get('key').build(),
          children: p.get('children').build(),
          prototypeItem: p.get('prototypeItem').build(),
          addAutomaticKeepAlives: p.get('addAutomaticKeepAlives').build(),
          addRepaintBoundaries: p.get('addRepaintBoundaries').build(),
          addSemanticIndexes: p.get('addSemanticIndexes').build(),
        );
    matePut('key', key);
    matePut('children', children);
    matePut('prototypeItem', prototypeItem);
    matePut('addAutomaticKeepAlives', addAutomaticKeepAlives);
    matePut('addRepaintBoundaries', addRepaintBoundaries);
    matePut('addSemanticIndexes', addSemanticIndexes);
  }
}