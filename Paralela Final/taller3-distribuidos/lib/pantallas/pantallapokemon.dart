import 'package:flutter/material.dart';
import 'package:taller3_distribuidos/colores.dart';
import 'package:taller3_distribuidos/internoapi/conexiondetalles.dart';
import '../widget/informacionpokemon.dart';

class PokemonScreen extends StatefulWidget {
  final PokemonDetailModel pokemon;
  const PokemonScreen({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

_getTranslate(String? type) {
  if (type == "normal") {
    return "Normal";
  } else if (type == "fire") {
    return "Fuego";
  } else if (type == "water") {
    return "Agua";
  } else if (type == "electric") {
    return "Eléctrico";
  } else if (type == "grass") {
    return "Planta";
  } else if (type == "ice") {
    return "Hielo";
  } else if (type == "fighting") {
    return "Lucha";
  } else if (type == "poison") {
    return "Veneno";
  } else if (type == "ground") {
    return "Tierra";
  } else if (type == "flying") {
    return "Volador";
  } else if (type == "psychic") {
    return "Psíquico";
  } else if (type == "bug") {
    return "Bicho";
  } else if (type == "rock") {
    return "Roca";
  } else if (type == "ghost") {
    return "Fantasma";
  } else if (type == "dragon") {
    return "Dragón";
  } else if (type == "dark") {
    return "Siniestro";
  } else if (type == "steel") {
    return "Acero";
  } else if (type == "fairy") {
    return "Hada";
  }
}

class _PokemonScreenState extends State<PokemonScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  void init(TickerProvider tickerProvider) {
    _tabController = TabController(length: 2, vsync: tickerProvider);
  }

  @override
  void initState() {
    super.initState();
    init(this);
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
        title: appLogo,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                height: 110,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        getBackGroundColor(
                          widget.pokemon.types![0].type!.name!,
                        ),
                        getBackGroundColor2(
                          widget.pokemon.types![0].type!.name!,
                        ),
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "#${widget.pokemon.id.toString()} - ${widget.pokemon.name!.toUpperCase()}",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: widget.pokemon.types!
                          .map(
                            (e) => Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(
                                color: getBackGroundColor2(
                                  widget.pokemon.types![0].type!.name!,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(_getTranslate(e.type!.name!)),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color:
                      getBackGroundColor(widget.pokemon.types![0].type!.name!),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: AboutPokemonWidget(pokemon: widget.pokemon),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.26,
            top: MediaQuery.of(context).size.width * 0,
            child: SizedBox(
                height: 115,
                width: 400,
                child: Image.network(
                  widget.pokemon.sprites!.frontDefault!,
                  height: 100.0,
                  width: 100.0,
                )),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Color.fromARGB(15, 0, 0, 0),
        child: InkWell(
          onTap: () => print('Agregar a favoritos'),
          child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.favorite_border,
                  color: Theme.of(context).accentColor,
                ),
                Text('Me Gusta'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
