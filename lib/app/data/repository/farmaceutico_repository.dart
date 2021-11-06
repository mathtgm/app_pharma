import 'dart:convert';

import 'package:pharma_app/app/data/model/modelFarmaceutico.dart';
import 'package:pharma_app/app/data/provider/farmaceutico_provider.dart';

class FarmaceuticoRepository {
  final FarmaceuticoApiClient api = FarmaceuticoApiClient();

  Future<List<Farmaceutico>> listaFarmaceutico(int idFarmacia) async {
    List<Farmaceutico> list = <Farmaceutico>[];
    final json = await api.getFarmaceutico(idFarmacia);
    final responseMap = jsonDecode(json);

    if (responseMap != null) {
      responseMap.forEach((e) {
        list.add(Farmaceutico.fromMap(e));
      });
    }
    return list;
  }
}
