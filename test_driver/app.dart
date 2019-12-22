import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:hello_world/main.dart';
import 'package:hello_world/src/app_config.dart';

void main() {
  enableFlutterDriverExtension();
  var configuredApp = new AppConfig(
    appName: 'Lincoln Stars',
    flavorName: 'local',
    mobileApiBaseUrl: 'http://localhost:8080/',
    child: new MyApp(),
  );
  runApp(configuredApp);
}
