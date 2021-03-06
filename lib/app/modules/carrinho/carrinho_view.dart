import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/data/model/modelEndereco.dart';
import 'package:pharma_app/app/data/model/modelProdutoCarrinho.dart';
import 'package:pharma_app/app/global/widgets/images.dart';
import 'package:pharma_app/app/global/widgets/msgErro.dart';
import 'package:pharma_app/app/modules/carrinho/carrinho_controller.dart';
import 'package:pharma_app/app/routes/app_routes.dart';

class CarrinhoFarmacia extends GetView<CarrinhoController> {
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
          (list) => Form(
            key: controller.formkey,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    entregaTitulos('Endereço de entrega'),
                    enderecoEntregaCorpo(),
                    entregaTitulos('Método de pagamento'),
                    metodoPagamento('Cartão de Crédito', 'Cartão de Crédito'),
                    metodoPagamento('Cartão de Débito', 'Cartão de Débito'),
                    metodoPagamento('Dinheiro', 'Dinheiro'),
                    Obx(
                      () => Visibility(
                        visible: controller.dinheiroFlag.value,
                        child: Container(
                          margin: EdgeInsets.all(12),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: controller.campoTroco,
                            decoration: InputDecoration(
                              label: Text('Valor em dinheiro'),
                              prefixIcon: Icon(Icons.money_rounded),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) return 'Preencha esse campo';
                              if (controller.campoTroco.doubleValue <
                                  controller.total.value)
                                return 'O valor ter que ser maior que o total';
                            },
                            onChanged: (value) {
                              if (controller.campoTroco.doubleValue != 0) {
                                controller.getTroco();
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    entregaTitulos('Produtos'),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        ProdutoCarrinho prod = list[index];
                        return InkWell(
                          child: Container(
                            height: 50,
                            margin:
                                EdgeInsets.only(left: 12, right: 12, top: 12),
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
                          ),
                          onTap: () {
                            Get.toNamed(Routes.carrinhoProduto,
                                    arguments: prod.toMap())!
                                .then((value) => controller.getCarrinho());
                          },
                        );
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 12),
                      child: Text(
                        'Total carrinho: R\$ ' +
                            controller.totalCarrinho.value
                                .toStringAsFixed(2)
                                .replaceAll('.', ','),
                        style: TextStyle(
                          color: Color.fromARGB(255, 49, 175, 180),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 12),
                      child: Text(
                        'Frete: R\$ ' +
                            controller.freteTotal.value
                                .toStringAsFixed(2)
                                .replaceAll('.', ','),
                        style: TextStyle(
                          color: Color.fromARGB(255, 49, 175, 180),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      margin: EdgeInsets.only(right: 12),
                      child: Text(
                        'Total: R\$ ' +
                            controller.total.value
                                .toStringAsFixed(2)
                                .replaceAll('.', ','),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 49, 175, 180),
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: controller.dinheiroFlag.value,
                        child: Container(
                          margin: EdgeInsets.all(12),
                          child: Text(
                            'Troco: ' +
                                controller.troco.value
                                    .toStringAsFixed(2)
                                    .replaceAll('.', ','),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 49, 175, 180),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 49, 175, 180),
                                fixedSize: Size(150, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                              ),
                              onPressed: () {
                                if (controller.formkey.currentState!
                                    .validate()) {
                                  controller.realizarPedido();
                                }
                              },
                              child: Text(
                                'Realizar pedido',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 49, 175, 180),
                                fixedSize: Size(150, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                              ),
                              onPressed: () {
                                controller.esvaziarCarrinho();
                                Get.back();
                              },
                              child: Text(
                                'Esvaziar carrinho',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
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
          var tempEnd =
              await Get.toNamed(Routes.endereco, arguments: 'selecionar');
          if (tempEnd != null) {
            controller.endereco = Endereco.fromMap(tempEnd);
            controller.getCarrinho();
          }
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
      return InkWell(
        onTap: () async {
          var tempEnd =
              await Get.toNamed(Routes.endereco, arguments: 'selecionar');
          if (tempEnd != null) {
            controller.endereco = Endereco.fromMap(tempEnd);
            controller.getCarrinho();
          }
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
          if (value != 'Dinheiro') {
            controller.dinheiroFlag.value = false;
          } else {
            controller.dinheiroFlag.value = true;
          }

          controller.pagamento.value = value.toString();
        },
      ),
    );
  }
}
