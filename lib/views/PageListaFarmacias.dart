import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pharma_app/controllers/http/http_farmacia_controller.dart';
import 'package:pharma_app/models/modelFarmacia.dart';

class listaFarmaciaState extends GetView<HttpController> {
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
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: controller.obx(
        (state) {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (_, index) {
              final Farmacia item = state[index];
              return ListTile(
                title: Text(item.nome_fantasia),
              );
            },
          );
        },
      ),
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
                      child: Image.network(
                        'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png',
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
                            "Olá",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Color.fromARGB(255, 49, 175, 180),
                            ),
                          ),
                          Text(
                            "Matheus Mazarotto",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
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
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40)),
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
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
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Icon(
                          Icons.pin_drop_outlined,
                          size: 25,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text(
                            "Endereços",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
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
