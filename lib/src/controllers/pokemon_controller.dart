
import 'package:flutter/cupertino.dart';
import 'package:hello_world/src/models/pokemon.dart';
import 'package:hello_world/src/shared/http_status_helper.dart';
import 'package:hello_world/src/shared/utils/custom_logger.dart';
import 'package:http/http.dart';
import 'package:hello_world/src/shared/constants.dart';

int NUMBEROFCALLS = 10;

class PokemonController {
  static PokemonController _singleton = new PokemonController._internal();

  factory PokemonController() {
    return _singleton;
  }

  static set instance(PokemonController singleton) {
    _singleton = singleton;
  }

  PokemonController._internal();

  Client client = Client();


  Future<Pokemon> getPokemonById({@required int pokemonIdNumber}) async {
    final response = await client.get(
      Constants.pokemonApiUrl + 'pokemon/' + pokemonIdNumber.toString(),
    );

    if (HttpStatusHelper.checkResponseStatus(response)) {
      return Pokemon.fromJson(response.body);
    }
    else {
      CustomLogger().logServiceError(response);
    }
    return null;
  }

  Future<List<Pokemon>> getMultiplePokemonById(
      {@required int pokemonIdNumber, @required int pokemonCount}) async {
    List<Pokemon> pokemonList = List();
    for (int i = pokemonIdNumber; i <= pokemonCount; i++) {
      if (pokemonCount - i >= NUMBEROFCALLS) {
        await Future.wait([getPokemonById(pokemonIdNumber: i),
          getPokemonById(pokemonIdNumber: i + 1),
          getPokemonById(pokemonIdNumber: i + 2),
          getPokemonById(pokemonIdNumber: i + 3),
          getPokemonById(pokemonIdNumber: i + 4),
          getPokemonById(pokemonIdNumber: i + 5),
          getPokemonById(pokemonIdNumber: i + 6),
          getPokemonById(pokemonIdNumber: i + 7),
          getPokemonById(pokemonIdNumber: i + 8),
          getPokemonById(pokemonIdNumber: i + 9)])
            .then((List responses) => handleResponses(responses, pokemonList))
            .catchError((error) => print(error)
        );
        i += NUMBEROFCALLS - 1;
      }
      else {
        await getPokemonById(pokemonIdNumber: i).then((pokemon) {
          pokemonList.add(pokemon);
        }).catchError((error) {
          print(error);
        });
      }
    }
    return pokemonList;
  }

  void handleResponses(responses, pokemonList) {
    for (int i = 0; i < NUMBEROFCALLS; i++) {
      pokemonList.add(responses[i]);
    }
  }
}