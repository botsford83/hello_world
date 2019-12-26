import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/src/screens/login_screen.dart';
import 'package:hello_world/src/shared/constants.dart';
import 'package:hello_world/src/shared/utils/custom_route_settings.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/mock_observer.dart';

void main() {
  Constants.shouldDebugPrint = false;
  MockNavigatorObserver mockObserver;

  _buildWidget(WidgetTester tester) async {
    mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(MaterialApp(
        home: LoginScreen(),
        onGenerateRoute: (RouteSettings settings) {
          return CustomRouteSettings().fetchPageRoute(settings);
        },
        navigatorObservers: [mockObserver]));
  }

  testWidgets('widget displays all elements', (WidgetTester tester) async {
    // Create a cached object to test that it clears the cache on login
    await _buildWidget(tester);
    expect(find.byKey(Key('logoImg')), findsOneWidget);
    expect(find.byKey(Key('emailField')), findsOneWidget);
    expect(find.byKey(Key('passwordField')), findsOneWidget);
    expect(find.byKey(Key('forgotBtn')), findsOneWidget);
    var submitBtn = find.byKey(Key('submitBtn'));
    expect(submitBtn, findsOneWidget);
    expect((submitBtn.evaluate().single.widget as RaisedButton).color,
        Colors.purple);
    await tester.tap(find.byKey(Key('submitBtn')));
    await tester.pump();
    verify(mockObserver.didPush(any, any));
  });

  testWidgets(
      'tapping submit should log user in and navigate to different page',
      (WidgetTester tester) async {
    await _buildWidget(tester);
    await tester.tap(find.byKey(Key('submitBtn')));
    await tester.pump();
    verify(mockObserver.didPush(any, any));
  });

  testWidgets('tapping forgot password', (WidgetTester tester) async {
    await _buildWidget(tester);
    await tester.tap(find.byKey(Key('forgotBtn')));
    await tester.pump();
    verify(mockObserver.didPush(any, any));
  });
}
