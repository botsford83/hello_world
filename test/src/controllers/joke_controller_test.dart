import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/src/controllers/joke_controller.dart';
import 'package:hello_world/src/shared/constants.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

import '../../mocks/jokes/mock_joke_response.dart';

main() {
  Constants.shouldDebugPrint = false;
  Constants.mobileApiUrl = 'http://localhost:8080';
  group('Joke Controller: getRandomJokes()', () {
    test('gets 20 random jokes', () async {
      JokeController().client = MockClient((request) async {
        return Response(json.encode(mock20JokeResponse), HttpStatus.ok);
      });
      final response = await JokeController().getRandomJokes(numberOfJokes: 20);
      expect(response.value.length, 20);
    });

    test('gets 11 random jokes', () async {
      JokeController().client = MockClient((request) async {
        return Response(json.encode(mock11JokeResponse), HttpStatus.ok);
      });
      final response = await JokeController().getRandomJokes(numberOfJokes: 11);
      expect(response.value.length, 11);
    });
  });

  group('Joke Controller: getRandomJokes() with bad responses', () {
    test('returns null if the response status is 400', () async {
      JokeController().client = MockClient((request) async {
        return Response(json.encode(null), HttpStatus.badRequest);
      });

      final response = await JokeController().getRandomJokes(numberOfJokes: 1);
      expect(response, null);
    });

    test('returns null if the response status is 401', () async {
      JokeController().client = MockClient((request) async {
        return Response(json.encode(null), HttpStatus.unauthorized);
      });

      final response = await JokeController().getRandomJokes(numberOfJokes: 1);
      expect(response, null);
    });

    test('returns null if the response status is 402', () async {
      JokeController().client = MockClient((request) async {
        return Response(json.encode(null), HttpStatus.paymentRequired);
      });

      final response = await JokeController().getRandomJokes(numberOfJokes: 1);
      expect(response, null);
    });

    test('returns null if the response status is 403', () async {
      JokeController().client = MockClient((request) async {
        return Response(json.encode(null), HttpStatus.forbidden);
      });

      final response = await JokeController().getRandomJokes(numberOfJokes: 1);
      expect(response, null);
    });

    test('returns null if the response status is 404', () async {
      JokeController().client = MockClient((request) async {
        return Response(json.encode(null), HttpStatus.notFound);
      });

      final response = await JokeController().getRandomJokes(numberOfJokes: 1);
      expect(response, null);
    });

    test('returns null if the response status is 405', () async {
      JokeController().client = MockClient((request) async {
        return Response(json.encode(null), HttpStatus.methodNotAllowed);
      });

      final response = await JokeController().getRandomJokes(numberOfJokes: 1);
      expect(response, null);
    });

    test('returns null if the response status is 406', () async {
      JokeController().client = MockClient((request) async {
        return Response(json.encode(null), HttpStatus.notAcceptable);
      });

      final response = await JokeController().getRandomJokes(numberOfJokes: 1);
      expect(response, null);
    });
  });
}
