import 'dart:convert';

import 'package:pharma_app/app/data/model/modelFarmacia.dart';
import 'package:pharma_app/app/data/provider/farmacia_provider.dart';

class FarmaciaRepository {
  FarmaciaApi api = FarmaciaApi();

  Future<bool> cadastrarFarmacia(
      String nome_fantasia,
      String cnpj,
      String telefone,
      String email,
      String senha,
      String endereco,
      String numero,
      String cidade,
      String estado,
      String bairro,
      String foto,
      double lat,
      double long,
      String tempo,
      double frete) async {
    Farmacia farm = Farmacia(
        nome_fantasia: nome_fantasia,
        email: email,
        senha: senha,
        cnpj: cnpj,
        telefone: telefone,
        endereco: endereco,
        numero: numero,
        bairro: bairro,
        cidade: cidade,
        estado: estado,
        lat: lat,
        long: long,
        tempo: tempo,
        frete: frete);
    var res = await api.cadastrartFarmacia(farm.toJson());
    return res;
  }

  atualizarFarmacia(
      int id_farmacia,
      String nome_fantasia,
      String cnpj,
      String telefone,
      String email,
      String endereco,
      String numero,
      String bairro,
      String foto,
      double lat,
      double long,
      String tempo,
      double frete) async {
    Farmacia farm = Farmacia(
        id_farmacia: id_farmacia,
        nome_fantasia: nome_fantasia,
        email: email,
        cnpj: cnpj,
        telefone: telefone,
        endereco: endereco,
        numero: numero,
        bairro: bairro,
        lat: lat,
        long: long,
        tempo: tempo,
        frete: frete,
        foto: foto == '' ? null : foto);
    var res = await api.atualizarFarmacia(farm.toJson());
    return res;
  }

  getFarmacia(idFarmacia) async {
    final json = await api.getFarmacia(idFarmacia);
    if (json != '') {
      var res = jsonDecode(json);
      return Farmacia.fromMap(res.first);
    }
    return '';
  }

  statusFarmacia(bool status, int idFarmacia) async {
    return await api.statusFarmacia(status, idFarmacia);
  }
}
