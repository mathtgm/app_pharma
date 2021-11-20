import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pharma_app/app/data/model/modelPedidoProduto.dart';
import 'package:pharma_app/app/global/widgets/images.dart';
import 'package:pharma_app/app/global/widgets/msgErro.dart';
import 'package:pharma_app/app/modules/detalhePedidoFarmacia/detalhePedidoFarmacia_controller.dart';

class DetalhePedidoFarmacia extends GetView<DetalhePedidoFarmaciaController> {
  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm');
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhe do pedido'),
      ),
      body: controller.obx(
          (value) => Container(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Data do pedido: ${formatter.format(DateTime.parse(Get.arguments['datapedido']))}',
                      ),
                      Text('Status do pedido: ${Get.arguments['status']}'),
                      Divider(),
                      titulo('Informações do cliente'),
                      Text(Get.arguments['nome']),
                      Text(Get.arguments['celular']),
                      Divider(),
                      titulo('Endereço de entrega'),
                      Text(Get.arguments['enderecoentrega']),
                      Text(
                          'Frete: R\$ ${Get.arguments['frete'].replaceAll('.', ',')}'),
                      Divider(),
                      titulo('Método de pagamento'),
                      Text(Get.arguments['metodopagamento'] != 'Dinheiro'
                          ? 'Método: ${Get.arguments['metodopagamento']}'
                          : 'Método: ${Get.arguments['metodopagamento']}'),
                      Visibility(
                        visible: (Get.arguments['metodopagamento'] == 'Dinheiro'
                            ? true
                            : false),
                        child: Text(
                            'Dinheiro do cliente: R\$ ${Get.arguments['troco'].replaceAll('.', ',')}'),
                      ),
                      Visibility(
                        visible: (Get.arguments['metodopagamento'] == 'Dinheiro'
                            ? true
                            : false),
                        child: Text(
                            'Troco para o cliente: R\$ ${(double.parse(Get.arguments['troco']) - double.parse(Get.arguments['totalpedido'])).toString().replaceAll('.', ',')}'),
                      ),
                      Divider(),
                      titulo('Produto(s)'),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          PedidoProduto prod = value[index];
                          return Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  margin: EdgeInsets.only(
                                      left: 12, right: 12, top: 12),
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
                                            prod.nome_produto,
                                            softWrap: true,
                                            maxLines: 1,
                                            overflow: TextOverflow.fade,
                                          )),
                                          Container(
                                            width: 80,
                                            child: Text(
                                              'R\$ ' +
                                                  prod.total
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
                              ],
                            ),
                          );
                        },
                      ),
                      Container(
                        width: Get.width,
                        child: Text(
                          'Frete: R\$ ${Get.arguments['frete'].replaceAll('.', ',')}',
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Container(
                        width: Get.width,
                        child: Text(
                          'Produto(s) + Frete: R\$ ${Get.arguments['totalpedido'].replaceAll('.', ',')}',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Color.fromARGB(255, 49, 175, 180)),
                        ),
                      ),
                      Divider(),
                      titulo('Ações'),
                      Container(
                        width: Get.width,
                        child: TextButton(
                          child: Text(
                            'Preparar pedido',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            controller.alterarStatus('Preparando');
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 49, 175, 180),
                          ),
                        ),
                      ),
                      Container(
                        width: Get.width,
                        child: TextButton(
                          child: Text(
                            'Enviado para o cliente',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 49, 175, 180),
                          ),
                          onPressed: () {
                            controller.alterarStatus('Enviado para o cliente');
                          },
                        ),
                      ),
                      Container(
                        width: Get.width,
                        child: TextButton(
                          child: Text(
                            'Entregue',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            controller.statusEntregar();
                          },
                        ),
                      ),
                      Container(
                        width: Get.width,
                        child: TextButton(
                          child: Text(
                            'Cancelar',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          onPressed: () {
                            caixaMotivo();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          onEmpty: msgErro().telaErro(
              'Nenhum produto nesse pedido', ImagensTela.imgCarrinhoVazio)),
    );
  }

  titulo(String titulo) {
    return Text(
      titulo,
      style: TextStyle(
        color: Color.fromARGB(255, 49, 175, 180),
        fontSize: 18,
      ),
    );
  }

  caixaMotivo() {
    Get.defaultDialog(
        title: 'Motivo do cancelamento',
        content: TextField(controller: controller.motivoText),
        buttonColor: Colors.red,
        actions: [
          Container(
            width: Get.width,
            height: 50,
            child: InkWell(
              child: Center(child: Text('Confirmar')),
              onTap: () {
                controller.statusCancelar();
                Get.back();
              },
            ),
          ),
          Container(
            width: Get.width,
            height: 50,
            child: InkWell(
              child: Center(child: Text('Fechar')),
              onTap: () {
                Get.back();
              },
            ),
          )
        ]);
  }
}
