import 'dart:convert';

import 'package:pharma_app/app/data/model/modelProduto.dart';
import 'package:pharma_app/app/data/provider/listaProdutos_provider.dart';

class ListaProdutosRepository {
  final ListaProdutosApiClient api = ListaProdutosApiClient();

  Future<List<Produto>> listaProdutos(int idFarmacia) async {
    List<Produto> list = <Produto>[];
    final json = await api.getListaProdutos(idFarmacia);
    final responseMap = jsonDecode(json);

    if (responseMap != null) {
      responseMap.forEach((e) {
        list.add(Produto.fromMap(e));
      });
    }
    return list;
  }
}
