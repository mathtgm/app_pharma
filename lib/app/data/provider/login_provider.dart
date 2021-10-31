import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_app/app/data/database.dart';

class LoginApiClient extends GetConnect {
  Future<String> autenticarUsuario(String username, String senha) async {
    var response = await http.get(Uri.parse(database.site + 'usuarioLogin'),
        headers: {
          "email": username,
          "senha": md5.convert(utf8.encode(senha)).toString()
        });

    print(username);
    print(md5.convert(utf8.encode(senha)).toString());

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return ('[{"erro": "${response.statusCode}", "msg" : "Usuario/Senha incorretos"}]');
    }
  }
}
