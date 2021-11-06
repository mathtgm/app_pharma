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
}
