import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/data/repository/carrinhoProduto_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProdutoController extends GetxController with StateMixin {
  RxInt quantProduto = 1.obs;
  RxDouble total = 0.00.obs;
  CarrinhoProdutoRepository rep = CarrinhoProdutoRepository();

  void addProdutoCarrinho(Map produto) async {
    if (quantProduto > 0) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      rep.addProduto(quantProduto.toInt(), total.toDouble(),
          prefs.getInt('id')!, produto['id_farmacia'], produto['id_produto']);
      Get.rawSnackbar(
        animationDuration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color.fromARGB(255, 49, 175, 180),
        messageText: Text(
          'Produto adicionado ao carrinho',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      );
    }
  }
}
