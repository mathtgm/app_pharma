import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_app/app/data/database.dart';

class ListaApiClient extends GetConnect {
  Future<String> getListaFarmacias(String cidadeHTTP, String estadoHTTP) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'cidade': cidadeHTTP,
      'estado': estadoHTTP
    };
    var response = await http.post(Uri.parse(database.site + 'farmacias'),
        body: requestHeaders);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return ('');
    }
  }
}
