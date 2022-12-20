import 'package:flutter/material.dart';
import 'package:taller3_distribuidos/informacionpokeapi/pokemon.dart';
import 'package:taller3_distribuidos/pantallas/pantallapokemons.dart';
import 'package:taller3_distribuidos/conexionapi/conexionpokeapi.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  void _onItemTapped(int index) {
    if (index == 1) {
      context.read<PokemonProvider>().getPokemons();
    }
    if (index == 0) {
      context.read<PokemonProvider>().backPokemons();
    }
  }

  Image appLogo = const Image(
    image: ExactAssetImage("lib/assets/Icons/Pokeball.png"),
    height: 60,
    width: 500,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appLogo,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color(0xFF3366FF),
                  const Color(0xFF00CCFF),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: context.read<PokemonProvider>().getPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Consumer<PokemonProvider>(
              builder: (context, pokemon, _) => GridView.count(
                padding: const EdgeInsets.all(20),
                controller: _scrollController,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                children: pokemon.pokemonsDetail
                    .map(
                      (pokemon) => PokemonWidget(
                        pokemon: pokemon,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PokemonScreen(pokemon: pokemon),
                            ),
                          );
                        },
                      ),
                    )
                    .toList(),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Anterior',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward),
            label: 'Siguiente',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
