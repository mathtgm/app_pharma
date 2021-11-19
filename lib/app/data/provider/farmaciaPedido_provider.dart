import 'package:http/http.dart' as http;
import 'package:pharma_app/app/data/database.dart';

class FarmaciaPedidoApi {
  Future<String> getPedidoDisponivel(int idFarmacia) async {
    try {
      var response = await http.post(
          Uri.parse(database.site + 'farmacia/pedidoDisponivel'),
          body: {'idFarmacia': idFarmacia.toString()});

      if (response.statusCode == 200)
        return response.body;
      else
        return '';
    } catch (TimeOutException) {
      throw 'Falha ao conectar ao servidor';
    }
  }
}
