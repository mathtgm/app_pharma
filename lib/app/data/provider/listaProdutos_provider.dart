import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_app/app/data/database.dart';

class ListaProdutosApiClient extends GetConnect {
  Future<String> getListaProdutos(int idFarmacia) async {
    Map<String, String> requestHeaders = {
      'id_farmacia': idFarmacia.toString(),
    };
    var response = await http.post(
        Uri.parse(database.site + 'farmacia/produtos'),
        body: requestHeaders);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return ('');
    }
  }
}
