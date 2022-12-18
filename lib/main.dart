import 'package:flutter/material.dart';
import 'package:taller3_distribuidos/Ventanas/login.dart';
import 'package:taller3_distribuidos/Ventanas/lista_pokemones.dart';

void main() {
  runApp(const Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poke API',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: const Login(title: 'Login'),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  final String title;

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {

  @override
  Widget build(BuildContext context){
    return const LoginVentana();
  }
}
