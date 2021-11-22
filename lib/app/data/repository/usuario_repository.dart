import 'dart:convert';

import 'package:pharma_app/app/data/model/modelUser.dart';
import 'package:pharma_app/app/data/provider/usuario_provider.dart';

class UsuarioRepository {
  final UsuarioApi api = UsuarioApi();

  Future<bool> cadastrarUsuario(String nome, String email, String senha,
      String cpf, String nascimento, String celular) async {
    var usuario = Usuario(
        nome: nome,
        email: email,
        celular: celular,
        senha: senha,
        cpf: cpf,
        nascimento: nascimento);
    var response = await api.cadastrarUsuario(usuario.toJson());
    return response;
  }

  Future getUsuario(int idUser) async {
    var json = await api.getUsuario(idUser);
    if (json != '') {
      var res = jsonDecode(json);
      if (res.length == 1) return Usuario.fromMap(res.first);
    }
    throw 'Não foi encontrado nenhuma infomrção';
  }

  atualizarUsuario(int id_usuario, String nome, String email, String cpf,
      String nascimento, String celular) {
    Usuario user = Usuario(
        id_usuario: id_usuario,
        nome: nome,
        email: email,
        celular: celular,
        cpf: cpf,
        nascimento: nascimento);
    api.atualizarUsuario(user.toJson());
  }
}
