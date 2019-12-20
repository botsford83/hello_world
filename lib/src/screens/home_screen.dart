import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/src/controllers/joke_controller.dart';
import 'package:hello_world/src/models/joke.dart';
import 'package:hello_world/src/shared/widgets/loading_indicator.dart';

class HomeScreen extends StatefulWidget {
  static String tag = 'home-screen';

  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Future<Joke> jokeFuture;

  @override
  void initState() {
    super.initState();
    // calling the future in the init eliminates the widget change of state causing another service call
    jokeFuture = JokeController().getRandomJokes(numberOfJokes: 20);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: FutureBuilder<Joke>(
                future: jokeFuture,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    Joke jokes = snapshot.data;
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: jokes.value.length,
                      itemBuilder: (context, index) {
                        JokeValue joke = jokes.value[index];
                        return Column(
                          children: <Widget>[
                            Container(
                              child: Card(
                                key: Key('joke${index}CardKey'),
                                child: InkWell(
                                  child: Container(
                                    color: Colors.white,
                                    child: Row(
                                      children: <Widget>[
                                        Flexible(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              '${joke.joke}' ?? '',
                                              key: Key('joke${index}TitleKey'),
                                              maxLines: 5,
                                              style: TextStyle(
                                                  color: Colors.purple,
                                                  fontSize: 20.0),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                  // Easily able to display loading or error screens while future call is made
                  return Scaffold(
                    backgroundColor: Colors.white,
                    body: LoadingIndicator(),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
