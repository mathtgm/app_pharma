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
    try {
      var response = await http.post(Uri.parse(database.site + 'farmacias'),
          body: requestHeaders);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return ('');
      }
    } catch (TimeoutConnection) {
      print('Foi erro');
      throw 'Servidor não encontrado, verifique a conexão com a internet';
    }
  }
}
