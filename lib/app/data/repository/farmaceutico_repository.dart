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

  atualizarFarmaceutico(int idFarmaceutico, String nome, String crf,
      String telefone, String genero) async {
    Farmaceutico farm = Farmaceutico(
        id_farmaceutico: idFarmaceutico,
        nome: nome,
        crf: crf,
        telefone: telefone,
        genero: genero);
    await api.atualizarFarmaceutico(farm.toJson());
  }

  excluirFarmaceutico(int idFarmaceutico) async {
    await api.excluirFarmaceutico(idFarmaceutico);
  }

  cadastrarFarmaceutico(int idFarmacia, String nome, String crf,
      String telefone, String genero) async {
    Farmaceutico farm = Farmaceutico(
        id_farmacia: idFarmacia,
        nome: nome,
        crf: crf,
        telefone: telefone,
        genero: genero);
    await api.cadastrartFarmaceutico(farm.toJson());
  }
}
