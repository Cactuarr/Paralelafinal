import 'package:flutter/material.dart';
import 'package:taller3_distribuidos/internoapi/detallespokemon.dart';
import '../colores.dart';

class PokemonWidget extends StatelessWidget {
  final PokemonDetailModel pokemon;
  final VoidCallback onTap;
  const PokemonWidget({Key? key, required this.pokemon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(2),
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
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: getBackGroundColor(
              pokemon.types![0].type!.name!,
            ),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Center(
                child: Image.network(
              pokemon.sprites!.frontDefault!,
            )),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "#${pokemon.id.toString()}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 68, 68, 68)),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.all(8),
                // ignore: sort_child_properties_last
                child: Text(pokemon.name!.toUpperCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color.fromARGB(255, 247, 247, 247))),
                decoration: BoxDecoration(
                  color: Color.fromARGB(106, 59, 59, 59),
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(
                    color: getBackGroundColor(
                      pokemon.types![0].type!.name!,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
