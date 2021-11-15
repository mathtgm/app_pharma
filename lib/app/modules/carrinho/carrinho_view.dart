import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/data/model/modelEndereco.dart';
import 'package:pharma_app/app/data/model/modelProdutoCarrinho.dart';
import 'package:pharma_app/app/global/widgets/images.dart';
import 'package:pharma_app/app/global/widgets/msgErro.dart';
import 'package:pharma_app/app/modules/carrinho/carrinho_controller.dart';
import 'package:pharma_app/app/routes/app_routes.dart';

class CarrinhoFarmacia extends GetView<CarrinhoController> {
  final formPedido = GlobalKey<FormFieldState>();

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
      body: SafeArea(
        child: controller.obx(
          (list) => SingleChildScrollView(
            child: Form(
              child: Container(
                height: Get.height,
                child: Column(
                  children: [
                    entregaTitulos('Endereço de entrega'),
                    enderecoEntregaCorpo(),
                    entregaTitulos('Método de pagamento'),
                    metodoPagamento('Cartão de Crédito', 'credito'),
                    metodoPagamento('Cartão de Débito', 'debito'),
                    metodoPagamento('Dinheiro', 'dinheiro'),
                    entregaTitulos('Produtos'),
                    Container(
                      height: 300,
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          ProdutoCarrinho prod = list[index];
                          return Container(
                            margin: EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      child: Text(
                                        prod.quantidade.toString() + 'x',
                                      ),
                                    ),
                                    Expanded(
                                        child: Text(
                                      prod.nomeProd,
                                      softWrap: true,
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                    )),
                                    Container(
                                      width: 80,
                                      child: Text(
                                        'R\$ ' +
                                            prod.valor_total
                                                .toStringAsFixed(2)
                                                .replaceAll('.', ','),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider()
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Text(
                      'Total: R\$ ' +
                          controller.total.value
                              .toStringAsFixed(2)
                              .replaceAll('.', ','),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 49, 175, 180),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          onEmpty: msgErro().telaErro(
              'Nenhum produto no carrinho', ImagensTela.imgCarrinhoVazio),
        ),
      ),
    );
  }

  Widget entregaTitulos(String titulo) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      width: Get.width,
      height: 50,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 49, 175, 180),
      ),
      child: Text(
        titulo,
        style: TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  //Widget selecionar o endereço de entrega
  Widget enderecoEntregaCorpo() {
    if (controller.endereco == null) {
      return InkWell(
        onTap: () async {
          controller.endereco =
              await Get.toNamed(Routes.endereco, arguments: 'selecionar');
          controller.getCarrinho();
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          width: Get.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.pin_drop,
                color: Color.fromARGB(255, 49, 175, 180),
                size: 50,
              ),
              Text(
                'Selecione o endereço de entrega',
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 22, color: Colors.black45),
              ),
            ],
          ),
        ),
      );
    } else {
      controller.endereco = Endereco.fromMap(controller.endereco);
      return InkWell(
        onTap: () async {
          controller.endereco =
              await Get.toNamed(Routes.endereco, arguments: 'selecionar');
          controller.getCarrinho();
        },
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text(
                    '${controller.endereco.endereco}, Número ${controller.endereco.numero}'),
                subtitle: Text(controller.endereco.bairro),
              ),
            ),
            Container(width: 50, height: 50, child: Icon(Icons.edit)),
          ],
        ),
      );
    }
  }

  //Widget selecionar método de pagamento
  Widget metodoPagamento(String msg, String valor) {
    return Obx(
      () => RadioListTile(
        title: Text(msg),
        value: valor,
        groupValue: controller.pagamento.value,
        onChanged: (value) {
          controller.pagamento.value = value.toString();
        },
      ),
    );
  }
}
