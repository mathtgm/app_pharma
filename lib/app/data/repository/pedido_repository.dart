import 'dart:convert';

import 'package:pharma_app/app/data/model/modelEndereco.dart';
import 'package:pharma_app/app/data/model/modelPedidoOrdem.dart';
import 'package:pharma_app/app/data/model/modelPedidoProduto.dart';
import 'package:pharma_app/app/data/model/modelProdutoCarrinho.dart';
import 'package:pharma_app/app/data/provider/pedido_provider.dart';

class PedidoRepository {
  final PedidoApi api = PedidoApi();

  Future<int> getSequence() async {
    var idOrdemTemp = jsonDecode(await api.getSequencia());
    return int.parse(idOrdemTemp.first['valor']);
  }

  void realizarPedido(
      Endereco endereco,
      double totalPedido,
      double frete,
      double? troco,
      String metodoPag,
      List<ProdutoCarrinho> prodList,
      int idUser,
      int idFarmacia,
      int idOrdemPedido) async {
    List<PedidoProduto> list = [];
    String enderecoEntrega = endereco.endereco +
        ', ' +
        endereco.bairro +
        ', N ' +
        endereco.numero +
        ', ' +
        endereco.complemento!;
    PedidoOrdem pedOrdem = PedidoOrdem(
        id_ordempedido: idOrdemPedido,
        totalpedido: totalPedido,
        enderecoentrega: enderecoEntrega,
        frete: frete,
        id_usuario: idUser,
        id_farmacia: idFarmacia,
        dataentrega: null,
        datapedido: null,
        troco: troco,
        metodopagamento: metodoPag);
    for (ProdutoCarrinho item in prodList) {
      PedidoProduto prod = PedidoProduto(
          id_ordempedido: idOrdemPedido,
          id_produto: item.id_produto,
          nome_produto: item.nomeProd,
          quantidade: item.quantidade,
          total: item.valor_total);
      list.add(prod);
    }
    api.realizarPedido(pedOrdem, list);
  }

  Future getListaPedidoOrdemUsuario(int idUser) async {
    var json = await api.getListaPedidoOrdemUsuario(idUser);
    if (json != '') {
      var res = jsonDecode(json);
      return res;
    }
    return '';
  }

  Future getListaPedidoProdutoUsuario(int idOrdemPedido) async {
    var json = await api.getListaPedidoProdutoUsuario(idOrdemPedido);
    List<PedidoProduto> list = [];
    if (json != '') {
      var res = jsonDecode(json);
      res.forEach((e) => list.add(PedidoProduto.fromMap(e)));
      return list;
    }
    return '';
  }

  void confirmarEntrega(int idOrdemPedido) async {
    await api.confirmarEntrega(idOrdemPedido);
  }
}
