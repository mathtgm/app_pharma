import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_app/app/data/database.dart';

class ListaApiClient extends GetConnect {
  Future<String> getListaFarmacias(String cidade, String estado) async {
    var response = await http.get(Uri.parse(database.site + 'farmacias'),
        headers: {"cidade": cidade, "estado": estado});

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return ('');
    }
  }
}
