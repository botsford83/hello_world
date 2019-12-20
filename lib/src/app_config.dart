import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class AppConfig extends InheritedWidget {
  AppConfig({
    @required this.appName,
    @required this.flavorName,
    @required this.mobileApiBaseUrl,
    @required Widget child,
  }) : super(child: child);

  final String appName;
  final String flavorName;
  final String mobileApiBaseUrl;

  static AppConfig of(BuildContext context) {
//    return context.dependOnInheritedWidgetOfExactType();
    return context.inheritFromWidgetOfExactType(AppConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
