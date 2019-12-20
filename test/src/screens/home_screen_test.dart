import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/src/controllers/joke_controller.dart';
import 'package:hello_world/src/models/joke.dart';
import 'package:hello_world/src/screens/home_screen.dart';
import 'package:hello_world/src/shared/constants.dart';
import 'package:hello_world/src/shared/utils/custom_route_settings.dart';
import 'package:hello_world/src/shared/widgets/loading_indicator.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/controller_mocks.dart';
import '../../mocks/jokes/mock_joke_response.dart';
import '../../mocks/mock_observer.dart';

void main() {
  Constants.shouldDebugPrint = false;
  MockNavigatorObserver mockObserver;
  JokeController.instance = MockJokeController();
  _basicOkMock() {
    when(JokeController().getRandomJokes())
        .thenAnswer((_) => Future.value(Joke.fromMap(mock20JokeResponse)));
  }

  _basicBadMock() {
    when(JokeController().getRandomJokes())
        .thenAnswer((_) => Future.value(null));
  }

  _buildWidget(WidgetTester tester) async {
    HttpOverrides.global = null;
    mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(MaterialApp(
        home: HomeScreen(),
        onGenerateRoute: (RouteSettings settings) {
          return CustomRouteSettings().fetchPageRoute(settings);
        },
        navigatorObservers: [mockObserver]));
  }

  testWidgets('widget displays all elements', (WidgetTester tester) async {
    _basicOkMock();
    await _buildWidget(tester);
    await tester.pumpAndSettle();
    expect(find.byKey(Key('joke1CardKey')), findsOneWidget);
    expect(find.byKey(Key('joke1TitleKey')), findsOneWidget);
    expect(find.byKey(Key('joke2CardKey')), findsOneWidget);
    expect(find.byKey(Key('joke2TitleKey')), findsOneWidget);
    expect(find.byKey(Key('joke3CardKey')), findsOneWidget);
    expect(find.byKey(Key('joke3TitleKey')), findsOneWidget);
    expect(find.byKey(Key('joke4CardKey')), findsOneWidget);
    expect(find.byKey(Key('joke4TitleKey')), findsOneWidget);
  });

  testWidgets('widget should display a loading indicator',
      (WidgetTester tester) async {
    _basicBadMock();
    await _buildWidget(tester);
    await tester.pump();
    expect(find.byType(LoadingIndicator), findsOneWidget);
  });
}
