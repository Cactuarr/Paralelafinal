import 'package:flutter/material.dart';
import 'package:taller3_distribuidos/Ventanas/lista_pokemones.dart';
import 'package:taller3_distribuidos/Ventanas/login.dart';
import 'package:taller3_distribuidos/apis/api_pokemon.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ListaPokemones extends StatelessWidget {
  const ListaPokemones({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffd1dee0),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 32,
          ),
          Column(
            //mainAxisSize: MainAxisSize.min,
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Tu PokeAPI",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 32,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          TextButton(
              onPressed: () {
                PokeApi.getPokemones(context);
              },
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xcc009850)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Ver Pokemons",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xffedf2f4),
                          fontSize: 18,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
