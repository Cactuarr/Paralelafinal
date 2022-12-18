import 'package:flutter/material.dart';
import 'package:taller3_distribuidos/apis/api_login.dart';

class LoginVentana extends StatelessWidget {
  const LoginVentana({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffef063f),
      padding: const EdgeInsets.symmetric(vertical: 20, ),
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /*Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 421,
                height: 422,
                child: Image.asset('assets/voting_system.png'),
              )
            ],
          ),*/
          const SizedBox(height: 32,),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Bienvenido a tu PokeAPI",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xffedf2f4),
                    fontSize: 32,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400
                ),
              ),
              SizedBox(height: 15,),

              SizedBox(height: 15,),
              SizedBox(
                width: 300,
                child: Text(
                  "Accede con tu correo UTEM",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 50,),
          TextButton(
              onPressed: () {LoginGoogle.loginG(context);} ,
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xcc009850)
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Image.asset('assets/google_logo.png'),
                    ),
                    const SizedBox(width: 10,),
                    const Text(
                      "Inicia sesion con Google",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xffedf2f4),
                          fontSize: 14,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700
                      ),
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
