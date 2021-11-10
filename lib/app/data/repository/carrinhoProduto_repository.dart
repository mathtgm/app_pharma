import 'dart:convert';

import 'package:pharma_app/app/data/model/modelProdutoCarrinho.dart';
import 'package:pharma_app/app/data/provider/carrinho_provider.dart';

class CarrinhoProdutoRepository {
  final ProdutoCarrinhoApi api = ProdutoCarrinhoApi();

  void addProduto(int quantProduto, double total, int id_usuario,
      int id_farmacia, int id_produto) {
    ProdutoCarrinho pedido = ProdutoCarrinho(
        quantidade: quantProduto,
        valor_total: total,
        id_produto: id_produto,
        id_farmacia: id_farmacia,
        id_usuario: id_usuario);

    api.addProdutoCarrinho(pedido);
  }
}
