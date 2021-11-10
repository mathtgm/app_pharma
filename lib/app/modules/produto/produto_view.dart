import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/modules/produto/produto_controller.dart';

class ProdutoFarmacia extends GetView<ProdutoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 49, 175, 180),
              ),
            );
          },
        ),
        title: Text(
          "PharmApp",
          style: TextStyle(
              color: Color.fromARGB(255, 49, 175, 180),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: Get.arguments['id_produto'],
              child: Container(
                margin: EdgeInsets.only(bottom: 30),
                width: Get.width,
                height: 200,
                child: Get.arguments['imagem'] == null
                    ? Image.asset('assets/produto_default.png')
                    : Image.network(Get.arguments['imagem']),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 10, spreadRadius: 5)
                  ],
                ),
              ),
            ),
            Text(
              Get.arguments['nome'],
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromARGB(255, 49, 175, 180),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              Get.arguments['descricao'],
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black45,
                fontSize: 18,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  botaoQuantidade(),
                  Obx(
                    () => Text(
                      'Total R\$ ${controller.total.value.toStringAsFixed(2).toString().replaceAll('.', ',')}',
                      style: TextStyle(
                          color: Color.fromARGB(255, 49, 175, 180),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: Get.width,
              child: TextButton(
                onPressed: () {
                  controller.addProdutoCarrinho(Get.arguments);
                  Get.back();
                },
                child: Text(
                  'Adicionar ao carrinho',
                  style: TextStyle(
                      color: Color.fromARGB(255, 49, 175, 180), fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget botaoQuantidade() {
    return Container(
      child: Row(
        children: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              controller.quantProduto.value += 1;
              controller.total.value = controller.quantProduto.value *
                  double.parse(Get.arguments['preco_unid']);
            },
            child: Container(
              height: 40,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
                color: Color.fromARGB(255, 49, 175, 180),
              ),
              child: Center(
                child: Text(
                  '+',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            width: 45,
            color: Colors.white,
            child: Center(
              child: Obx(
                () => Text(
                  controller.quantProduto.toString(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              controller.quantProduto > 1 ? controller.quantProduto -= 1 : null;
              controller.total.value = controller.quantProduto.value *
                  double.parse(Get.arguments['preco_unid']).toPrecision(2);
            },
            child: Container(
              height: 40,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                color: Color.fromARGB(255, 49, 175, 180),
              ),
              child: Center(
                child: Text(
                  '-',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
