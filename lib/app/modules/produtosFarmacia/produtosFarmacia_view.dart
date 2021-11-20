import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/data/model/modelProduto.dart';
import 'package:pharma_app/app/global/widgets/images.dart';
import 'package:pharma_app/app/global/widgets/msgErro.dart';
import 'package:pharma_app/app/modules/produtosFarmacia/produtosFarmacia_controller.dart';
import 'package:pharma_app/app/routes/app_routes.dart';

class FarmaciaListaProduto extends GetView<ProdutosFarmaciaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Get.toNamed(Routes.formProdutoFarmacia);
          controller.getProdutos();
        },
        label: Text('Cadastrar produto'),
        icon: Icon(Icons.add_shopping_cart_rounded),
      ),
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
      body: controller.obx(
        (list) => ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            Produto prod = list[index];
            return InkWell(
              onTap: () async {
                await Get.toNamed(Routes.formProdutoFarmacia,
                    arguments: prod.toMap());
                controller.getProdutos();
              },
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      color: Colors.black38,
                      offset: Offset(1, 8),
                      spreadRadius: 0.1)
                ]),
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: prod.imagem == null
                          ? Image.asset(
                              'assets/produto_default.png',
                              fit: BoxFit.cover,
                              height: 80,
                              width: 80,
                            )
                          : Image.network(
                              prod.imagem!,
                              fit: BoxFit.cover,
                              height: 80,
                              width: 80,
                              errorBuilder: (context, exception, stackTrace) {
                                return Image.asset(
                                  'assets/produto_default.png',
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: 100,
                                );
                              },
                            ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            prod.nome,
                            style: TextStyle(
                                color: Color.fromARGB(255, 49, 175, 180),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            prod.descricao == null
                                ? 'Sem descrição'
                                : prod.descricao!,
                            style: TextStyle(color: Colors.black45),
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            'Valor unidade. R\$ ${prod.preco_unid.toStringAsFixed(2).replaceAll('.', ',')}',
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        onEmpty: msgErro()
            .telaErro('Sem produtos cadastrados', ImagensTela.imgErroConexao),
      ),
    );
  }
}
