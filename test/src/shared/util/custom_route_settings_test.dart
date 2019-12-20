import 'dart:core' as prefix0;
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/src/screens/home_screen.dart';
import 'package:hello_world/src/screens/login_screen.dart';
import 'package:hello_world/src/screens/main_screen.dart';
import 'package:hello_world/src/screens/profile_screen.dart';
import 'package:hello_world/src/shared/constants.dart';
import 'package:hello_world/src/shared/utils/custom_route_settings.dart';

main() {
  Constants.shouldDebugPrint = false;

  setUp(() {});

  group('Custom Route Settings: fetchPageRoute', () {
    test('Login Screen', () {
      CustomRouteSettings customRouteSettings = new CustomRouteSettings();
      RouteSettings settings = new RouteSettings(name: Constants.loginScreen);
      MaterialPageRoute route = customRouteSettings.fetchPageRoute(settings);
      expect(customRouteSettings.screen.runtimeType, LoginScreen);
      expect(route.runtimeType, MaterialPageRoute);
    });
    test('Main Screen', () {
      CustomRouteSettings customRouteSettings = new CustomRouteSettings();
      RouteSettings settings = new RouteSettings(name: Constants.mainScreen);
      MaterialPageRoute route = customRouteSettings.fetchPageRoute(settings);
      expect(customRouteSettings.screen.runtimeType, MainScreen);
      expect(route.runtimeType, MaterialPageRoute);
    });
    test('Home Screen', () {
      CustomRouteSettings customRouteSettings = new CustomRouteSettings();
      RouteSettings settings = new RouteSettings(name: Constants.homeScreen);
      MaterialPageRoute route = customRouteSettings.fetchPageRoute(settings);
      expect(customRouteSettings.screen.runtimeType, HomeScreen);
      expect(route.runtimeType, MaterialPageRoute);
    });
    test('Profile Screen', () {
      CustomRouteSettings customRouteSettings = new CustomRouteSettings();
      RouteSettings settings = new RouteSettings(name: Constants.profileScreen);
      MaterialPageRoute route = customRouteSettings.fetchPageRoute(settings);
      expect(customRouteSettings.screen.runtimeType, ProfileScreen);
      expect(route.runtimeType, MaterialPageRoute);
    });
  });
}
