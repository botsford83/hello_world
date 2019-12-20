import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/src/screens/main_screen.dart';
import 'package:hello_world/src/shared/constants.dart';
import 'package:hello_world/src/shared/utils/custom_route_settings.dart';

import '../../mocks/mock_observer.dart';

void main() {
  Constants.shouldDebugPrint = false;
  MockNavigatorObserver mockObserver;

  _buildWidget(WidgetTester tester) async {
    mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(MaterialApp(
        home: MainScreen(),
        onGenerateRoute: (RouteSettings settings) {
          return CustomRouteSettings().fetchPageRoute(settings);
        },
        navigatorObservers: [mockObserver]));
  }

  testWidgets('widget displays all elements', (WidgetTester tester) async {
    await _buildWidget(tester);
    expect(find.byKey(Key('homeTab')), findsOneWidget);
    expect(find.byKey(Key('profileTab')), findsOneWidget);
  });

  testWidgets('navbar current index should be 0 since its on the home tab',
      (WidgetTester tester) async {
    await _buildWidget(tester);
    BottomNavigationBar navigationBar =
        tester.firstWidget(find.byKey(Key('navBar')));
    expect(navigationBar.currentIndex, 0);
  });

  testWidgets('navbar current index should be 1 since its on the profile tab',
      (WidgetTester tester) async {
    await _buildWidget(tester);
    await tester.tap(find.byKey(Key('profileTab')));
    await tester.pump();
    BottomNavigationBar navigationBar =
        tester.firstWidget(find.byKey(Key('navBar')));
    expect(navigationBar.currentIndex, 1);
  });
}
