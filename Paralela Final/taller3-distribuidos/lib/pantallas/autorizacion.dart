import 'package:flutter/material.dart';
import 'package:taller3_distribuidos/pantallas/login.dart';
import 'package:taller3_distribuidos/servicio/voter.dart';
import 'package:taller3_distribuidos/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthorizationScreen extends StatelessWidget {
  final String url;
  final String token;

  const AuthorizationScreen(
      {super.key, required this.url, required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebView(
      initialUrl: url,
      userAgent: "Utem/1.0",
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller) {
        controller.clearCache();
        CookieManager().clearCookies();
      },
      navigationDelegate: (delegate) {
        final Uri responseUri = Uri.parse(delegate.url);
        final String path = responseUri.path;
        final bool ok = path.endsWith('/' + token + '/result');
        if (ok) {
          VoterService.getJwt(token).then((value) => print(value));

          Navigator.pop(context);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ok ? const MiAplicacion() : const LoginScreen()));
        }

        return NavigationDecision.navigate;
      },
    ));
  }
}
