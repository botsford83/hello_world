import 'package:flutter/material.dart';

import '../../main.dart';
import '../app_config.dart';

void main() {
  var configuredApp = new AppConfig(
    appName: 'Hello World',
    flavorName: 'local',
    mobileApiBaseUrl: 'http://api.icndb.com/jokes/random/',
    child: new MyApp(),
  );

  runApp(configuredApp);
}
