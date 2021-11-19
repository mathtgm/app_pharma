import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_app/app/data/database.dart';
import 'package:pharma_app/app/data/model/modelPedidoOrdem.dart';
import 'package:pharma_app/app/data/model/modelPedidoProduto.dart';

class PedidoApi extends GetConnect {
  Future<String> getSequencia() async {
    try {
      var response = await http
          .get(Uri.parse(database.site + 'usuario/carrinho/pedidoSequencia'));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw response.statusCode;
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> realizarPedido(
      PedidoOrdem ordemPedido, List<PedidoProduto> ordemProduto) async {
    var repOrdemPedido = await http.post(
        Uri.parse(database.site + 'usuario/carrinho/ordemPedido'),
        body: ordemPedido.toJson(),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        });

    for (PedidoProduto item in ordemProduto) {
      var repOrdemProduto = await http.post(
        Uri.parse(database.site + 'usuario/carrinho/ordemProduto'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: item.toJson(),
      );
    }
  }

  Future<String> getListaPedidoOrdemUsuario(int idUser) async {
    try {
      var res = await http.post(
          Uri.parse(database.site + 'usuario/pedido/ordemPedido'),
          body: {"iduser": idUser.toString()});
      if (res.statusCode == 200) {
        return res.body;
      } else {
        return ('');
      }
    } catch (e) {
      throw 'Servidor não encontrado, verifique a conexão com a internet';
    }
  }

  Future<String> getListaPedidoProdutoUsuario(int idOrdemPedido) async {
    try {
      var res = await http.post(
        Uri.parse(database.site + 'usuario/pedido/ordemProduto'),
        body: {"idOrdemPedido": idOrdemPedido.toString()},
      );
      if (res.statusCode == 200) {
        return res.body;
      } else {
        return ('');
      }
    } catch (TimeoutException) {
      throw 'Servidor não encontrado, verifique a conexão com a internet';
    }
  }

  Future<void> confirmarEntrega(int idOrdemPedido) async {
    try {
      var res = await http.post(
        Uri.parse(database.site + 'usuario/pedido/ordemPedido/entregue'),
        body: {"idOrdemPedido": idOrdemPedido.toString()},
      );
    } catch (TimeoutException) {
      throw 'Servidor não encontrado, verifique a conexão com a internet';
    }
  }
}
