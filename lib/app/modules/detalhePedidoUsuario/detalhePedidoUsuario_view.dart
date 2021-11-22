import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pharma_app/app/data/model/modelPedidoProduto.dart';
import 'package:pharma_app/app/global/widgets/images.dart';
import 'package:pharma_app/app/global/widgets/msgErro.dart';
import 'package:pharma_app/app/modules/detalhePedidoUsuario/detalhePedidoUsuario_controller.dart';

class DetalhePedidoUsuario extends GetView<DetalhePedidoUsuarioController> {
  final DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm');
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
            child: Container(
              margin: EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        child: Get.arguments['foto'] == null
                            ? Image.asset(
                                'assets/StandartIcon.png',
                                fit: BoxFit.cover,
                                height: 50,
                                width: 50,
                              )
                            : Image.network(
                                Get.arguments['foto'],
                                fit: BoxFit.cover,
                                height: 50,
                                width: 50,
                              ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Get.arguments['nome_fantasia'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                              'Pedido realizado ${formatter.format(DateTime.parse(Get.arguments['datapedido']))}'),
                        ],
                      ),
                    ],
                  ),
                  Divider(),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      PedidoProduto prod = list[index];
                      return Container(
                        height: 50,
                        margin: EdgeInsets.only(left: 12, right: 12, top: 12),
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
                      );
                    },
                  ),
                  Text(
                    'Frete: R\$ ${Get.arguments['frete'].replaceAll('.', ',')}',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 49, 175, 180)),
                  ),
                  Text(
                    'Total: R\$ ${Get.arguments['totalpedido'].replaceAll('.', ',')}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 49, 175, 180)),
                  ),
                  campoTroco(),
                  caixaStatus(),
                  caixaEntrega(),
                  botaoEntrega(),
                  caixaCancelado()
                ],
              ),
            ),
          ),
          onError: (err) => Text(err!),
          onEmpty: msgErro().telaErro(
              'Não ha produto nesse pedido', ImagensTela.imgCarrinhoVazio),
        ),
      ),
    );
  }

  Widget campoTroco() {
    if (Get.arguments['metodopagamento'] == 'Dinheiro')
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Dinheiro: R\$ ${double.parse(Get.arguments['troco']).toStringAsFixed(2).replaceAll('.', ',')}',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 49, 175, 180)),
          ),
          Text(
            'Troco: R\$ ${(double.parse(Get.arguments['troco']) - double.parse(Get.arguments['totalpedido'])).toStringAsFixed(2).replaceAll('.', ',')}',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 49, 175, 180)),
          ),
        ],
      );
    return Container();
  }

  Widget caixaStatus() {
    if (Get.arguments['status'] != 'Entregue' &&
        Get.arguments['status'] != 'Cancelado')
      return Container(
        width: Get.width,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.lightGreen[100],
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(top: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Seu pedido ainda não foi entregue. \nSituação: "${Get.arguments['status']}"',
              softWrap: true,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 49, 175, 180)),
            ),
          ],
        ),
      );
    return Container();
  }

  Widget caixaEntrega() {
    if (Get.arguments['status'] == 'Entregue' &&
        Get.arguments['dataentrega'] != null)
      return Container(
        width: Get.width,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.lightGreen[100],
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(top: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Get.arguments['dataentrega'] != null
                  ? 'Pedido entregue ${formatter.format(DateTime.parse(Get.arguments['dataentrega']))}'
                  : '',
              softWrap: true,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 49, 175, 180)),
            ),
          ],
        ),
      );
    return Container();
  }

  Widget botaoEntrega() {
    if (Get.arguments['status'] == 'Saiu para entrega')
      return Container(
        width: Get.width,
        height: 50,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 49, 175, 180),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(top: 50),
        child: TextButton(
          onPressed: () async {
            controller.confirmaEntrega();
            Get.back();
          },
          child: Text(
            'Confirmar entrega',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      );
    return Container();
  }

  Widget caixaCancelado() {
    if (Get.arguments['status'] == 'Cancelado')
      return Container(
        width: Get.width,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.red[100], borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(top: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Seu pedido foi cancelado \nMotivo: ${Get.arguments['motivo']}',
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 49, 175, 180)),
            ),
          ],
        ),
      );
    return Container();
  }
}
