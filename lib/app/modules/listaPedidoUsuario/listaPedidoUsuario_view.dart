import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pharma_app/app/global/widgets/images.dart';
import 'package:pharma_app/app/global/widgets/msgErro.dart';
import 'package:pharma_app/app/modules/listaPedidoUsuario/listaPedidoUsuario_controller.dart';
import 'package:pharma_app/app/routes/app_routes.dart';

class ListaPedidoUsuario extends GetView<ListaPedidoUsuarioController> {
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
      body: controller.obx((list) {
        final DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm');
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          color: Colors.black38,
                          offset: Offset(1, 8),
                          spreadRadius: 0.1)
                    ]),
                    margin: EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () async {
                        await Get.toNamed(Routes.detalhePedidosUsuario,
                            arguments: list[index]);
                        controller.getListaPedidos();
                      },
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 12, left: 12),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              child: list[index]['foto'] == null
                                  ? Image.asset(
                                      'assets/StandartIcon.png',
                                      fit: BoxFit.cover,
                                      height: 50,
                                      width: 50,
                                    )
                                  : Image.network(
                                      list[index]['foto'],
                                      fit: BoxFit.cover,
                                      height: 50,
                                      width: 50,
                                    )),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${list[index]['nome_fantasia']}',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 49, 175, 180)),
                              ),
                              Text(
                                'Data pedido: ${formatter.format(DateTime.parse(list[index]['datapedido']))}',
                              ),
                              Text(
                                  'Total: R\$ ${list[index]['totalpedido'].replaceAll('.', ',')}'),
                              Text('Status: ${list[index]['status']}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
          onError: (err) => Text(err!),
          onEmpty: msgErro().telaErro(
              'Você não tem pedidos realizados', ImagensTela.imgErroConexao)),
    );
  }
}
