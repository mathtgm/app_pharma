import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pharma_app/app/global/widgets/images.dart';
import 'package:pharma_app/app/global/widgets/msgErro.dart';
import 'package:pharma_app/app/modules/farmaciaMenu/farmaciaMenu_controller.dart';

class FarmaciaMenu extends GetView<FarmaciaMenuController> {
  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm');
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.nomeFarm.value)),
      ),
      body: Container(
        child: controller.obx(
            (value) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    var item = value[index];
                    return InkWell(
                      onTap: () {
                        print('Glória');
                      },
                      child: Container(
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              color: Colors.black38,
                              offset: Offset(1, 8),
                              spreadRadius: 0.1)
                        ]),
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['nome'],
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              item['enderecoentrega'],
                            ),
                            Divider(),
                            Text(
                                'Frete: R\$ ${item['frete'].replaceAll('.', ',')}'),
                            Text(
                              'Produto(s) + Frete: R\$ ${item['totalpedido'].replaceAll('.', ',')}',
                              style: TextStyle(
                                color: Color.fromARGB(255, 49, 175, 180),
                              ),
                            ),
                            Text(
                                'Data do pedido: ${formatter.format(DateTime.parse(item['datapedido']))}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
            onEmpty: msgErro().telaErro(
                'Nenhum pedido no momento', ImagensTela.imgCarrinhoVazio)),
      ),
    );
  }
}
