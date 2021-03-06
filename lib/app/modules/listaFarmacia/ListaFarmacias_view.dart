import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/data/model/modelFarmacia.dart';
import 'package:pharma_app/app/global/widgets/images.dart';
import 'package:pharma_app/app/global/widgets/msgErro.dart';
import 'package:pharma_app/app/modules/listaFarmacia/listaFarmacias_controller.dart';
import 'package:pharma_app/app/routes/app_routes.dart';

class listaFarmaciaState extends GetView<ListaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawerInicio(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return SafeArea(
              child: IconButton(
                  icon: Icon(
                    Icons.person_rounded,
                    size: 40,
                    color: Color.fromARGB(255, 49, 175, 180),
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer()),
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
                padding: EdgeInsets.only(top: 20),
                itemBuilder: (context, index) {
                  Farmacia farm = list[index];
                  return Card(
                    color: farm.aberto == true
                        ? Color.fromARGB(255, 240, 254, 254)
                        : Color.fromARGB(255, 240, 243, 255),
                    shadowColor: farm.aberto == true
                        ? Color.fromARGB(255, 49, 175, 180)
                        : Colors.red,
                    elevation: 5,
                    child: InkWell(
                      onTap: () {
                        farm.aberto == true
                            ? Get.toNamed(Routes.listaProdutos,
                                arguments: farm.toMap())
                            : null;
                      },
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            child: farm.foto == null
                                ? Image.asset(
                                    'assets/StandartIcon.png',
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 100,
                                  )
                                : Image.network(
                                    farm.foto!,
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 100,
                                    errorBuilder:
                                        (context, exception, stackTrace) {
                                      return Image.asset(
                                        'assets/StandartIcon.png',
                                        fit: BoxFit.cover,
                                        height: 100,
                                        width: 100,
                                      );
                                    },
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  farm.nome_fantasia,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  farm.bairro,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${farm.tempo} min',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      ' ??? ',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.grey),
                                    ),
                                    Text(
                                      (controller.location.getDistancia(
                                                      controller
                                                          .distUser.latitude,
                                                      controller
                                                          .distUser.longitude,
                                                      farm.lat,
                                                      farm.long) /
                                                  1000)
                                              .toPrecision(1)
                                              .toString() +
                                          ' Km',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                    Text(
                                      ' ??? ',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.grey),
                                    ),
                                    Text(
                                        farm.aberto == true
                                            ? 'ABERTO'
                                            : 'FECHADO',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: farm.aberto!
                                                ? Colors.lightGreen
                                                : Colors.red))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
          onError: (err) =>
              msgErro().telaErro(err!, ImagensTela.imgErroConexao),
          onEmpty: msgErro().telaErro('N??o foi encontrado farmacias perto',
              ImagensTela.imgSemRegistroLoc)),
    );
  }

  Widget _drawerInicio() {
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
                            "Ol??",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Color.fromARGB(255, 49, 175, 180),
                            ),
                          ),
                          Obx(
                            () => Container(
                              width: 150,
                              child: Text(
                                controller.info.value.split(" ")[0],
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.formUsuario,
                                  arguments: controller.id);
                              controller.onInit();
                            },
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
                      Get.toNamed(Routes.listaPedidosUsuario);
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
                              "Lista de pedidos",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.endereco);
                    },
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          Icon(
                            Icons.pin_drop_outlined,
                            size: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Endere??os",
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
                              "Encerrar sess??o",
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
