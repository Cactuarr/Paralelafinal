import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:taller3_distribuidos/Ventanas/mostrar_poke.dart';


class PokeApi {
  static const String api_host = "http://10.0.2.2:8082/api/Pokemon?desde=0";

  static Future<bool> getPokemones(BuildContext context) async {
    Uri uri = Uri.parse('$api_host');

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      DataApi result = json.decode(response.body);

      if (result.respuesta!.isNotEmpty) {
        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  MostratPoke(pokemones: result.respuesta!, next: result.next!,),
            ));
      }
    }
    return false;
  }
}

class Pokemon {
  final int? id;
  final String? nombre;
  final int? altura;
  final int? peso;
  final List<String>? tipos;
  final List<String>? formas;
  final List<String>? habilidades;
  final List<String>? ubicacion;
  final String? imagen;

  Pokemon({
    this.id,
    this.nombre,
    this.altura,
    this.peso,
    this.tipos,
    this.formas,
    this.habilidades,
    this.ubicacion,
    this.imagen
  });

  factory Pokemon.fromJson(Map<String, dynamic> parsedJson){
      return Pokemon(
          id: parsedJson['id'],
          nombre: parsedJson['nombre'],
          altura: parsedJson['altura'],
          peso: parsedJson['peso'],
          tipos: parsedJson['tipos'],
          formas: parsedJson['formas'],
          habilidades: parsedJson['habilidades'],
          ubicacion: parsedJson['ubicacion'],
          imagen: parsedJson['imagen']
      );
    }
  }

  class DataApi{
    final List<Pokemon>? respuesta;
    final int? next;

    DataApi({
     this.respuesta,
     this.next
    });
    factory DataApi.fromJson(Map<String, dynamic> parsedJson){
      return DataApi(
          respuesta: parsedJson['respuesta'],
          next: parsedJson['next']
      );
    }



  }


