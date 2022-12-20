import 'package:flutter/material.dart';
import 'package:taller3_distribuidos/model/pokemondetail_model.dart';
import 'package:taller3_distribuidos/constant.dart';
import 'package:like_button/like_button.dart';

class AboutPokemonWidget extends StatelessWidget {
  final PokemonDetailModel pokemon;
  const AboutPokemonWidget({Key? key, required this.pokemon}) : super(key: key);

  _getHabilidad() {
    String? habilidad;
    for (var i = 0; i < pokemon.abilities!.length; i++) {
      if (pokemon.abilities![i].isHidden == false) {
        habilidad = pokemon.abilities![i].ability?.name;
        return habilidad;
      }
    }
  }

  _getString() {
    String? oculta;
    for (var i = 0; i < pokemon.abilities!.length; i++) {
      if (pokemon.abilities![i].isHidden == true) {
        oculta = pokemon.abilities![i].ability?.name;
        return oculta;
      }
    }
    return "No posee";
  }

  _getLocation() {
    String location = "";

    if (pokemon.id! >= 1 && pokemon.id! <= 151) {
      location = "Kanto";
    } else if (pokemon.id! >= 152 && pokemon.id! <= 251) {
      location = "Johto";
    } else if (pokemon.id! >= 252 && pokemon.id! <= 386) {
      location = "Hoenn";
    } else if (pokemon.id! >= 387 && pokemon.id! <= 493) {
      location = "Sinnoh";
    } else if (pokemon.id! >= 494 && pokemon.id! <= 649) {
      location = "Unova";
    } else if (pokemon.id! >= 650 && pokemon.id! <= 721) {
      location = "Kalos";
    } else if (pokemon.id! >= 722 && pokemon.id! <= 809) {
      location = "Alola";
    } else if (pokemon.id! >= 810 && pokemon.id! <= 905) {
      location = "Galar";
    }
    return location;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    getBackGroundColor(
                      pokemon.types![0].type!.name!,
                    ),
                    getBackGroundColor2(
                      pokemon.types![0].type!.name!,
                    ),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: getBackGroundColor(
                  pokemon.types![0].type!.name!,
                ),
              ),
              boxShadow: const [],
              color: Colors.white,
            ),
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            height: 300,
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Forma: ",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      Text(
                        "Original",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      )
                    ]),
                const SizedBox(
                  height: 15,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  const Text(
                    "Altura: ",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  Text(
                    "${(pokemon.height! / 10).toString()} m",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  )
                ]),
                const SizedBox(
                  height: 15,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  const Text(
                    "Peso: ",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  Text(
                    "${(pokemon.weight! / 10).toString()} Kg",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  )
                ]),
                const SizedBox(
                  height: 15,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  const Text(
                    "Habilidad: ",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  Text(
                    _getHabilidad(),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  )
                ]),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Habilidad Oculta: ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Text(
                      _getString(),
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  const Text(
                    "Ubicación: ",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  Text(
                    _getLocation(),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  )
                ]),
              ],
            ))
      ],
    );
  }
}
