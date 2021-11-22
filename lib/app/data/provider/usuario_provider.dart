import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_app/app/data/database.dart';

class UsuarioApi extends GetConnect {
  Future<bool> cadastrarUsuario(String usuario) async {
    try {
      var response = await http.post(
          Uri.parse(database.site + 'usuario/cadastrar'),
          body: usuario,
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          });
      if (response.statusCode == 406)
        return false;
      else
        return true;
    } catch (TimeoutException) {
      throw 'Servidor não encontrado, verifique a conexão com a internet';
    }
  }

  Future<void> atualizarUsuario(String usuario) async {
    try {
      await http.post(Uri.parse(database.site + 'usuario/atualizar'),
          body: usuario,
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          });
    } catch (TimeoutException) {
      throw 'Servidor não encontrado, verifique a conexão com a internet';
    }
  }

  Future<String> getUsuario(int idUsuario) async {
    try {
      var response = await http.post(
        Uri.parse(database.site + 'usuario'),
        body: {"id_usuario": idUsuario.toString()},
      );
      if (response.statusCode == 200)
        return response.body;
      else
        return '';
    } catch (TimeoutException) {
      throw 'Servidor não encontrado, verifique a conexão com a internet';
    }
  }
}
