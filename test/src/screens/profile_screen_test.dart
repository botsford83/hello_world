import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/src/screens/profile_screen.dart';
import 'package:hello_world/src/shared/constants.dart';
import 'package:hello_world/src/shared/utils/custom_route_settings.dart';

import '../../mocks/mock_observer.dart';

void main() {
  Constants.shouldDebugPrint = false;
  MockNavigatorObserver mockObserver;

  _buildWidget(WidgetTester tester) async {
    mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(MaterialApp(
        home: ProfileScreen(),
        onGenerateRoute: (RouteSettings settings) {
          return CustomRouteSettings().fetchPageRoute(settings);
        },
        navigatorObservers: [mockObserver]));
  }

  testWidgets('widget displays all elements', (WidgetTester tester) async {
    await _buildWidget(tester);
  });
}
