import 'package:flutter/material.dart';
import 'package:hello_world/src/screens/home_screen.dart';
import 'package:hello_world/src/screens/login_screen.dart';
import 'package:hello_world/src/screens/main_screen.dart';
import 'package:hello_world/src/screens/profile_screen.dart';

import '../constants.dart';

class CustomRouteSettings {
  Widget screen;

  MaterialPageRoute fetchPageRoute(RouteSettings settings) {
    switch (settings.name) {
      case Constants.loginScreen:
        screen = LoginScreen();
        break;
      case Constants.mainScreen:
        screen = MainScreen();
        break;
      case Constants.homeScreen:
        screen = HomeScreen();
        break;
      case Constants.profileScreen:
        screen = ProfileScreen();
        break;
    }
    return MaterialPageRoute(builder: (context) => screen);
  }
}
