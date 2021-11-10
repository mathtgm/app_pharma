import 'dart:async';
import 'dart:convert';

import 'package:pharma_app/app/data/model/modelFarmacia.dart';
import 'package:pharma_app/app/data/provider/listaFarmacias_provider.dart';

class listaFarmaciaRepository {
  final ListaApiClient api = ListaApiClient();

  Future<dynamic> listaFarmacias(String cidade, String estado) async {
    List<Farmacia> list = <Farmacia>[];
    final json = await api.getListaFarmacias(cidade, estado);
    if (json == '') return json;
    final responseMap = jsonDecode(json);

    if (responseMap != null) {
      responseMap.forEach((e) {
        list.add(Farmacia.fromMap(e));
      });
    }
    return list;
  }
}
