import 'package:flutter/material.dart';
import 'package:taller3_distribuidos/Ventanas/lista_pokemones.dart';
import 'package:taller3_distribuidos/Ventanas/login.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ValidacionVentana extends StatelessWidget {
  final String url;
  final String token;

  const ValidacionVentana(
      {super.key, required this.url, required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebView(
          initialUrl: url,
          userAgent: "Utem/1.0",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (webViewController) {
            webViewController.clearCache();
            CookieManager().clearCookies();
          },
          navigationDelegate: (response) {

            final Uri responseUri = Uri.parse(response.url);
            final String path = responseUri.path;
            final bool verificar_path = path.endsWith('/$token/result');
            if (verificar_path) { //si es true

              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                     verificar_path ?  const ListaPokemones() : const LoginVentana()//Si es true ir a PokeAPI, si cambia la url regresar al Login
                  )
              );
            }

            //navegar a la pokeAPI o al login nuevamente
            return NavigationDecision.navigate;
          },

        ));
  }
}
