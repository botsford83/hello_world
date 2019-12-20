import 'dart:convert';

class Joke {
  String type;
  List<JokeValue> value;

  Joke({
    this.type,
    this.value,
  });

  factory Joke.fromJson(String str) => Joke.fromMap(json.decode(str));

  factory Joke.fromMap(Map<String, dynamic> json) => Joke(
        type: json["type"] == null ? null : json["type"],
        value: json["value"] == null
            ? null
            : List<JokeValue>.from(
                json["value"].map((x) => JokeValue.fromMap(x))),
      );
}

class JokeValue {
  int id;
  String joke;
  List<String> categories;

  JokeValue({
    this.id,
    this.joke,
    this.categories,
  });

  factory JokeValue.fromMap(Map<String, dynamic> json) => JokeValue(
        id: json["id"] == null ? null : json["id"],
        joke: json["joke"] == null ? null : json["joke"],
        categories: json["categories"] == null
            ? null
            : List<String>.from(json["categories"].map((x) => x)),
      );
}
