import 'package:flutter/material.dart';
import 'package:hello_world/src/app_config.dart';
import 'package:hello_world/src/screens/home_screen.dart';
import 'package:hello_world/src/screens/login_screen.dart';
import 'package:hello_world/src/screens/main_screen.dart';
import 'package:hello_world/src/shared/constants.dart';
import 'package:hello_world/src/shared/utils/custom_route_settings.dart';

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginScreen.tag: (context) => LoginScreen(),
    MainScreen.tag: (context) => MainScreen(),
    HomeScreen.tag: (context) => HomeScreen(),
  };

  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    Constants.mobileApiUrl = config.mobileApiBaseUrl;

    return MaterialApp(
      title: config.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo, fontFamily: 'Nunito'),
      home: LoginScreen(),
      onGenerateRoute: (RouteSettings settings) {
        return CustomRouteSettings().fetchPageRoute(settings);
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) => LoginScreen());
      },
    );
  }
}
