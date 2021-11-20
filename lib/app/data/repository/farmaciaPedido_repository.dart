import 'dart:convert';

import 'package:pharma_app/app/data/model/modelPedidoProduto.dart';
import 'package:pharma_app/app/data/provider/farmaciaPedido_provider.dart';

class FarmaciaPedidoRepository {
  FarmaciaPedidoApi api = FarmaciaPedidoApi();

  getPedidoDisponivel(int idFarmacia) async {
    var res = await api.getPedidoDisponivel(idFarmacia);
    if (res != '') return jsonDecode(res);
    return '';
  }

  getOrdemPedido(int idFarmacia) async {
    var json = await api.getOrdemPedido(idFarmacia);
    if (json != '') {
      var res = jsonDecode(json);
      return res;
    } else
      return '';
  }

  getPedidoProduto(int idOrdemPedido) async {
    var json = await api.getListaPedidoProdutoFarmacia(idOrdemPedido);
    List<PedidoProduto> list = [];
    if (json != '') {
      var res = jsonDecode(json);
      for (var item in res) {
        list.add(PedidoProduto.fromMap(item));
      }
      return list;
    }

    return '';
  }

  alterarStatus(int idOrdemPedido, String status) async {
    await api.alterarStatus(idOrdemPedido, status);
  }

  statusEntregar(int idOrdemPedido) async {
    await api.confirmarEntrega(idOrdemPedido);
  }

  statusCancelar(int idOrdemPedido, String motivo) async {
    await api.cancelarPedido(idOrdemPedido, motivo);
  }
}
