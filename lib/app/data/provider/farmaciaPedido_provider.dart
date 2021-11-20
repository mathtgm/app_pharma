import 'package:http/http.dart' as http;
import 'package:pharma_app/app/data/database.dart';

class FarmaciaPedidoApi {
  Future<String> getPedidoDisponivel(int idFarmacia) async {
    try {
      var response = await http.post(
          Uri.parse(database.site + 'farmacia/pedidoDisponivel'),
          body: {'idFarmacia': idFarmacia.toString()});

      if (response.statusCode == 200)
        return response.body;
      else
        return '';
    } catch (TimeOutException) {
      throw 'Falha ao conectar ao servidor';
    }
  }

  Future<String> getListaPedidoProdutoFarmacia(int idOrdemPedido) async {
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

  Future<void> alterarStatus(int idOrdemPedido, String status) async {
    try {
      var res = await http.post(
        Uri.parse(database.site + 'farmacia/pedido/ordemPedido/alterarStatus'),
        body: {"idOrdemPedido": idOrdemPedido.toString(), "status": status},
      );
    } catch (TimeoutException) {
      throw 'Servidor não encontrado, verifique a conexão com a internet';
    }
  }

  Future<void> cancelarPedido(int idOrdemPedido, String motivo) async {
    await alterarStatus(idOrdemPedido, 'Cancelado');
    try {
      var res = await http.post(
        Uri.parse(database.site + 'farmacia/pedido/ordemPedido/cancelarMotivo'),
        body: {"idOrdemPedido": idOrdemPedido.toString(), "motivo": motivo},
      );
    } catch (TimeoutException) {
      throw 'Servidor não encontrado, verifique a conexão com a internet';
    }
  }
}
