import 'package:flutter/material.dart';
import 'package:taller3_distribuidos/home_page.dart';
import 'package:taller3_distribuidos/conexionapi/conexion.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PokemonProvider>(
          create: (_) => PokemonProvider(),
        )
      ],
      child: const MaterialApp(home: HomePage()),
    );
  }
}
