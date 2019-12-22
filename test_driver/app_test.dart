import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Lincoln Stars Mobile App', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      new Directory('screenshots').create();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    takeScreenshot(FlutterDriver driver, String path) async {
      final List<int> pixels = await driver.screenshot();
      final File file = new File(path);
      await file.writeAsBytes(pixels);
    }

    test('get screenshots of all screens', () async {
      print('waiting to load');
      await driver.waitFor(find.byValueKey('submitBtn'));
      print('taking snapshot of login screen');
      await takeScreenshot(driver, 'screenshots/login_screen.png');
      print('clicking submit button');
      await driver.tap(find.byValueKey('submitBtn'));
      print('taking snapshot of home screen');
      await takeScreenshot(driver, 'screenshots/home_screen.png');
      print('clicking on profile tab');
      await driver.tap(find.byValueKey(('profileTab')));
      print('taking snapshot of profile screen');
      await takeScreenshot(driver, 'screenshots/profile_screen.png');
    });
  });
}
