import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pharma_app/app/global/widgets/images.dart';
import 'package:pharma_app/app/global/widgets/msgErro.dart';
import 'package:pharma_app/app/modules/farmaciaMenu/farmaciaMenu_controller.dart';
import 'package:pharma_app/app/routes/app_routes.dart';

class FarmaciaMenu extends GetView<FarmaciaMenuController> {
  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm');
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.nomeFarm.value)),
        leading: Builder(
          builder: (context) {
            return SafeArea(
              child: IconButton(
                  icon: Icon(
                    Icons.person_rounded,
                    size: 40,
                    color: Colors.white,
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer()),
            );
          },
        ),
      ),
      drawer: _drawerFarmacia(),
      body: Container(
        child: controller.obx(
            (value) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    var item = value[index];
                    return InkWell(
                      onTap: () {
                        Get.toNamed(Routes.detalhePedidosFarmacia,
                            arguments: item);
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
                        padding: EdgeInsets.all(20),
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

  Widget _drawerFarmacia() {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 49, 175, 180),
        ),
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.only(left: 25),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(75),
                        bottomLeft: Radius.circular(75)),
                    color: Colors.white),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/profile.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Olá',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Color.fromARGB(255, 49, 175, 180),
                            ),
                          ),
                          Container(
                              width: 150,
                              child: Obx(
                                () => Text(
                                  controller.nomeFarm.value,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                              )),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              enableFeedback: false,
                              overlayColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.zero),
                            ),
                            child: Text(
                              "Editar perfil",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromARGB(255, 49, 175, 180),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40)),
              ),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.listaPedidoOrdem);
                    },
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          Icon(
                            Icons.checklist_sharp,
                            size: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              'Lista de pedidos',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.listaProdutosFarmacia,
                          arguments: controller.idFarm);
                    },
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          Icon(
                            Icons.list_alt_rounded,
                            size: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              'Produtos',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.sairAplicativo();
                    },
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          Icon(
                            Icons.close_outlined,
                            size: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Encerrar sessão",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
