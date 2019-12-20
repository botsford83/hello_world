import 'dart:async';

import 'package:hello_world/src/models/joke.dart';
import 'package:hello_world/src/shared/constants.dart';
import 'package:hello_world/src/shared/http_status_helper.dart';
import 'package:hello_world/src/shared/utils/custom_logger.dart';
import 'package:http/http.dart' show Client;

class JokeController {
  static JokeController _singleton = new JokeController._internal();

  factory JokeController() {
    return _singleton;
  }

  static set instance(JokeController singleton) {
    _singleton = singleton;
  }

  JokeController._internal();

  Client client = Client();

  Future<Joke> getRandomJokes() async {
    final response = await client.get(Constants.jokeApiUrl);
    if (HttpStatusHelper.checkResponseStatus(response)) {
      return Joke.fromJson(response.body);
    } else {
      CustomLogger().logServiceError(response);
    }
    return null;
  }
}