import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_app/app/data/database.dart';

class FarmaceuticoApiClient extends GetConnect {
  Future<String> getFarmaceutico(int idFarmacia) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'id_farmacia': idFarmacia.toString(),
    };
    var response = await http.post(
        Uri.parse(database.site + 'farmacia/farmaceutico'),
        body: requestHeaders);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return ('');
    }
  }

  Future<bool> cadastrartFarmaceutico(String farmaceutico) async {
    try {
      var response = await http.post(
          Uri.parse(database.site + 'farmacia/farmaceutico/cadastrar'),
          body: farmaceutico,
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          });
      if (response.statusCode == 500)
        return false;
      else
        return true;
    } catch (TimeoutException) {
      throw 'Servidor não encontrado, verifique a conexão com a internet';
    }
  }

  Future<bool> atualizarFarmaceutico(String farmaceutico) async {
    try {
      var res = await http.post(
          Uri.parse(database.site + 'farmacia/farmaceutico/atualizar'),
          body: farmaceutico,
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          });
      if (res.statusCode == 200)
        return true;
      else
        return false;
    } catch (TimeoutException) {
      throw 'Servidor não encontrado, verifique a conexão com a internet';
    }
  }

  Future<bool> excluirFarmaceutico(int idFarmaceutico) async {
    try {
      var res = await http.post(
        Uri.parse(database.site + 'farmacia/farmaceutico/excluir'),
        body: {"id_farmaceutico": idFarmaceutico.toString()},
      );
      if (res.statusCode == 200)
        return true;
      else
        return false;
    } catch (TimeoutException) {
      throw 'Servidor não encontrado, verifique a conexão com a internet';
    }
  }
}
