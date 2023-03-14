// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/about.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:core';
import 'package:note/mate.dart';

/// class AboutListTile extends StatelessWidget
class AboutListTile$Mate extends AboutListTile with WidgetMate<AboutListTile$Mate> {
  /// AboutListTile AboutListTile({Key? key, Widget? icon, Widget? child, String? applicationName, String? applicationVersion, Widget? applicationIcon, String? applicationLegalese, List<Widget>? aboutBoxChildren, bool? dense})
  AboutListTile$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {Widget? icon} , hasDefaultValue:false, defaultValueCode:null
    Widget? icon,

    /// optionalParameters: {Widget? child} , hasDefaultValue:false, defaultValueCode:null
    Widget? child,

    /// optionalParameters: {String? applicationName} , hasDefaultValue:false, defaultValueCode:null
    String? applicationName,

    /// optionalParameters: {String? applicationVersion} , hasDefaultValue:false, defaultValueCode:null
    String? applicationVersion,

    /// optionalParameters: {Widget? applicationIcon} , hasDefaultValue:false, defaultValueCode:null
    Widget? applicationIcon,

    /// optionalParameters: {String? applicationLegalese} , hasDefaultValue:false, defaultValueCode:null
    String? applicationLegalese,

    /// optionalParameters: {List<Widget>? aboutBoxChildren} , hasDefaultValue:false, defaultValueCode:null
    List<Widget>? aboutBoxChildren,

    /// optionalParameters: {bool? dense} , hasDefaultValue:false, defaultValueCode:null
    bool? dense,
  }) : super(
          key: key,
          icon: icon,
          child: child,
          applicationName: applicationName,
          applicationVersion: applicationVersion,
          applicationIcon: applicationIcon,
          applicationLegalese: applicationLegalese,
          aboutBoxChildren: aboutBoxChildren,
          dense: dense,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => AboutListTile$Mate(
        key: p.getValue('key'),
        icon: p.getValue('icon'),
        child: p.getValue('child'),
        applicationName: p.getValue('applicationName'),
        applicationVersion: p.getValue('applicationVersion'),
        applicationIcon: p.getValue('applicationIcon'),
        applicationLegalese: p.getValue('applicationLegalese'),
        aboutBoxChildren: p.getValue('aboutBoxChildren'),
        dense: p.getValue('dense'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'icon', init: icon);
    mateParams.set(name: 'child', init: child);
    mateParams.set(name: 'applicationName', init: applicationName);
    mateParams.set(name: 'applicationVersion', init: applicationVersion);
    mateParams.set(name: 'applicationIcon', init: applicationIcon);
    mateParams.set(name: 'applicationLegalese', init: applicationLegalese);
    mateParams.set(name: 'aboutBoxChildren', init: aboutBoxChildren);
    mateParams.set(name: 'dense', init: dense);
  }
}

/// class AboutDialog extends StatelessWidget
class AboutDialog$Mate extends AboutDialog with WidgetMate<AboutDialog$Mate> {
  /// AboutDialog AboutDialog({Key? key, String? applicationName, String? applicationVersion, Widget? applicationIcon, String? applicationLegalese, List<Widget>? children})
  AboutDialog$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {String? applicationName} , hasDefaultValue:false, defaultValueCode:null
    String? applicationName,

    /// optionalParameters: {String? applicationVersion} , hasDefaultValue:false, defaultValueCode:null
    String? applicationVersion,

    /// optionalParameters: {Widget? applicationIcon} , hasDefaultValue:false, defaultValueCode:null
    Widget? applicationIcon,

    /// optionalParameters: {String? applicationLegalese} , hasDefaultValue:false, defaultValueCode:null
    String? applicationLegalese,

    /// optionalParameters: {List<Widget>? children} , hasDefaultValue:false, defaultValueCode:null
    List<Widget>? children,
  }) : super(
          key: key,
          applicationName: applicationName,
          applicationVersion: applicationVersion,
          applicationIcon: applicationIcon,
          applicationLegalese: applicationLegalese,
          children: children,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => AboutDialog$Mate(
        key: p.getValue('key'),
        applicationName: p.getValue('applicationName'),
        applicationVersion: p.getValue('applicationVersion'),
        applicationIcon: p.getValue('applicationIcon'),
        applicationLegalese: p.getValue('applicationLegalese'),
        children: p.getValue('children'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'applicationName', init: applicationName);
    mateParams.set(name: 'applicationVersion', init: applicationVersion);
    mateParams.set(name: 'applicationIcon', init: applicationIcon);
    mateParams.set(name: 'applicationLegalese', init: applicationLegalese);
    mateParams.set(name: 'children', init: children);
  }
}

/// class LicensePage extends StatefulWidget
class LicensePage$Mate extends LicensePage with WidgetMate<LicensePage$Mate> {
  /// LicensePage LicensePage({Key? key, String? applicationName, String? applicationVersion, Widget? applicationIcon, String? applicationLegalese})
  LicensePage$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {String? applicationName} , hasDefaultValue:false, defaultValueCode:null
    String? applicationName,

    /// optionalParameters: {String? applicationVersion} , hasDefaultValue:false, defaultValueCode:null
    String? applicationVersion,

    /// optionalParameters: {Widget? applicationIcon} , hasDefaultValue:false, defaultValueCode:null
    Widget? applicationIcon,

    /// optionalParameters: {String? applicationLegalese} , hasDefaultValue:false, defaultValueCode:null
    String? applicationLegalese,
  }) : super(
          key: key,
          applicationName: applicationName,
          applicationVersion: applicationVersion,
          applicationIcon: applicationIcon,
          applicationLegalese: applicationLegalese,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => LicensePage$Mate(
        key: p.getValue('key'),
        applicationName: p.getValue('applicationName'),
        applicationVersion: p.getValue('applicationVersion'),
        applicationIcon: p.getValue('applicationIcon'),
        applicationLegalese: p.getValue('applicationLegalese'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'applicationName', init: applicationName);
    mateParams.set(name: 'applicationVersion', init: applicationVersion);
    mateParams.set(name: 'applicationIcon', init: applicationIcon);
    mateParams.set(name: 'applicationLegalese', init: applicationLegalese);
  }
}
