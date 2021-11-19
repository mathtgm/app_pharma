import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/data/repository/carrinhoProduto_repository.dart';

class ProdutoController extends GetxController with StateMixin {
  RxInt quantProduto = 1.obs;
  RxDouble total = double.parse(Get.arguments['preco_unid']).obs;
  CarrinhoProdutoRepository rep = CarrinhoProdutoRepository();

  void addProdutoCarrinho(Map produto) async {
    if (quantProduto > 0) {
      rep.addProduto(
          quantProduto.toInt(),
          total.toDouble(),
          produto['descricao'],
          produto['id_farmacia'],
          produto['id_produto'],
          produto['nome']);
    }
  }
}
