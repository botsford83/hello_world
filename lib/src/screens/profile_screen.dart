import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/src/controllers/pokemon_controller.dart';
import 'package:hello_world/src/models/pokemon.dart';
import 'package:hello_world/src/screens/main_screen.dart';


class ProfileScreen extends StatefulWidget {
  static String tag = 'profile-screen';

  @override
  _ProfileScreenState createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<List<Pokemon>> pokemonFutureList;

  @override
  void initState() {
    super.initState();
    pokemonFutureList = PokemonController().getMultiplePokemonById(pokemonIdNumber: 1, pokemonCount: 807);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: <Widget>[
          Expanded (
            child: Column(
              children: <Widget>[
                Text(
                    'Hello Leo The Cat (=^.^=)',
                    style: TextStyle(
                        color: Colors.pink[400],
                        fontSize: 10
                    )
                ),
                FutureBuilder<List<Pokemon>>(
                  future: pokemonFutureList,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<Pokemon> pokemonList = snapshot.data;
                      return Expanded(
                        //height: MediaQuery.of(context).size.height/1.3,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: pokemonList.length,
                          itemBuilder: (context,index) {
                            Pokemon pokemon = pokemonList[index];
                            return InkWell(
                              child: Text(
                                '${pokemon.name}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20
                                ),
                              ),
                              onTap: () {Navigator.pushNamed(context, MainScreen.tag );}
                            );
                          }
                        ),
                      );
                    }
                    return Container(color: Colors.orange,);
                  }
                )
              ],
            )
          )
        ],
      ),
    );
  }
}
