// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/user_accounts_drawer_header.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/painting/decoration.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:core';
import 'dart:ui';
import 'package:note/mate.dart';

/// class UserAccountsDrawerHeader extends StatefulWidget
class UserAccountsDrawerHeader$Mate extends UserAccountsDrawerHeader with WidgetMate<UserAccountsDrawerHeader$Mate> {
  /// UserAccountsDrawerHeader UserAccountsDrawerHeader({Key? key, Decoration? decoration, EdgeInsetsGeometry? margin = const EdgeInsets.only(bottom: 8.0), Widget? currentAccountPicture, List<Widget>? otherAccountsPictures, Size currentAccountPictureSize = const Size.square(72.0), Size otherAccountsPicturesSize = const Size.square(40.0), required Widget? accountName, required Widget? accountEmail, void Function()? onDetailsPressed, Color arrowColor = Colors.white})
  UserAccountsDrawerHeader$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {Decoration? decoration} , hasDefaultValue:false, defaultValueCode:null
    Decoration? decoration,

    /// optionalParameters: {EdgeInsetsGeometry? margin = const EdgeInsets.only(bottom: 8.0)} , hasDefaultValue:true, defaultValueCode:const EdgeInsets.only(bottom: 8.0)
    EdgeInsetsGeometry? margin,

    /// optionalParameters: {Widget? currentAccountPicture} , hasDefaultValue:false, defaultValueCode:null
    Widget? currentAccountPicture,

    /// optionalParameters: {List<Widget>? otherAccountsPictures} , hasDefaultValue:false, defaultValueCode:null
    List<Widget>? otherAccountsPictures,

    /// optionalParameters: {Size currentAccountPictureSize = const Size.square(72.0)} , hasDefaultValue:true, defaultValueCode:const Size.square(72.0)
    required Size currentAccountPictureSize,

    /// optionalParameters: {Size otherAccountsPicturesSize = const Size.square(40.0)} , hasDefaultValue:true, defaultValueCode:const Size.square(40.0)
    required Size otherAccountsPicturesSize,

    /// optionalParameters: {required Widget? accountName} , hasDefaultValue:false, defaultValueCode:null
    required Widget? accountName,

    /// optionalParameters: {required Widget? accountEmail} , hasDefaultValue:false, defaultValueCode:null
    required Widget? accountEmail,

    /// optionalParameters: {void Function()? onDetailsPressed} , hasDefaultValue:false, defaultValueCode:null
    VoidCallback? onDetailsPressed,

    /// optionalParameters: {Color arrowColor = Colors.white} , hasDefaultValue:true, defaultValueCode:Colors.white
    required Color arrowColor,
  }) : super(
          key: key,
          decoration: decoration,
          margin: margin,
          currentAccountPicture: currentAccountPicture,
          otherAccountsPictures: otherAccountsPictures,
          currentAccountPictureSize: currentAccountPictureSize,
          otherAccountsPicturesSize: otherAccountsPicturesSize,
          accountName: accountName,
          accountEmail: accountEmail,
          onDetailsPressed: onDetailsPressed,
          arrowColor: arrowColor,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => UserAccountsDrawerHeader$Mate(
        key: p.get('key').value,
        decoration: p.get('decoration').value,
        margin: p.get('margin').value,
        currentAccountPicture: p.get('currentAccountPicture').value,
        otherAccountsPictures: p.get('otherAccountsPictures').value,
        currentAccountPictureSize: p.get('currentAccountPictureSize').value,
        otherAccountsPicturesSize: p.get('otherAccountsPicturesSize').value,
        accountName: p.get('accountName').value,
        accountEmail: p.get('accountEmail').value,
        onDetailsPressed: p.get('onDetailsPressed').value,
        arrowColor: p.get('arrowColor').value,
      ),
    );
    mateParams.put('key', key);
    mateParams.put('decoration', decoration);
    mateParams.put('margin', margin);
    mateParams.put('currentAccountPicture', currentAccountPicture);
    mateParams.putList('otherAccountsPictures', otherAccountsPictures);
    mateParams.put('currentAccountPictureSize', currentAccountPictureSize);
    mateParams.put('otherAccountsPicturesSize', otherAccountsPicturesSize);
    mateParams.put('accountName', accountName);
    mateParams.put('accountEmail', accountEmail);
    mateParams.put('onDetailsPressed', onDetailsPressed);
    mateParams.put('arrowColor', arrowColor);
  }
}
