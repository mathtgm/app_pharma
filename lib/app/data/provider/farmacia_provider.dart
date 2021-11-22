import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_app/app/data/database.dart';

class FarmaciaApi extends GetConnect {
  Future<bool> cadastrartFarmacia(String farmacia) async {
    try {
      print(farmacia);
      var response = await http.post(
          Uri.parse(database.site + 'farmacia/cadastrar'),
          body: farmacia,
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

  Future<bool> atualizarFarmacia(String farmacia) async {
    try {
      var res = await http.post(Uri.parse(database.site + 'farmacia/atualizar'),
          body: farmacia,
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

  Future<String> getFarmacia(int idFarmacia) async {
    try {
      var response = await http.post(
        Uri.parse(database.site + 'farmacia'),
        body: {"id_farmacia": idFarmacia.toString()},
      );
      if (response.statusCode == 200)
        return response.body;
      else
        return '';
    } catch (TimeoutException) {
      throw 'Servidor não encontrado, verifique a conexão com a internet';
    }
  }

  statusFarmacia(bool status, int idFarmacia) async {
    try {
      var response = await http.post(
        Uri.parse(database.site + 'farmacia/status'),
        body: {
          "status": status.toString(),
          "id_farmacia": idFarmacia.toString()
        },
      );
      if (response.statusCode == 200)
        return true;
      else
        return throw 'Não foi possivel executar a ação';
    } catch (TimeoutException) {
      throw 'Servidor não encontrado, verifique a conexão com a internet';
    }
  }
}
