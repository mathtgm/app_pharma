import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pharma_app/controllers/interface/Inter_Farmacia.dart';
import 'package:pharma_app/models/modelFarmacia.dart';

class Http_farmacia implements IFarmaciaRepository {
  @override
  Future<List<Farmacia>> findAllUsers() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:3000/farmacias'));
    final List<dynamic> responseMap = jsonDecode(response.body);

    return responseMap.map<Farmacia>((resp) => Farmacia.fromMap(resp)).toList();
  }
}
