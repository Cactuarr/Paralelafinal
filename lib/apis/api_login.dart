import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:taller3_distribuidos/Ventanas/validacion.dart';


class LoginGoogle {
  static const String api_host = "https://api.sebastian.cl";
  static const String api_token = "sebastian.cl";
  static const String api_key = "aaa-bbb-ccc-ddd";
  static const String api_tipo = "application/json";

  static Future<bool> loginG(BuildContext context) async {
    Uri uri = Uri.parse('$api_host/vote/v1/auth/login');
    Map<String, String> headers = {
      'accept': api_tipo,
      'Content-Type': api_tipo,
      'X-API-TOKEN': api_token,
      'X-API-KEY': api_key
    };

    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      final String token = result['token'];
      final String redirectUrl = result['redirectUrl'];
      if (redirectUrl.isNotEmpty) {
        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ValidacionVentana(url: redirectUrl, token: token),
            ));
      }
    }
    return false;
  }



}