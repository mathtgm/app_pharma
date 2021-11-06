import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/data/model/modelFarmaceutico.dart';
import 'package:pharma_app/app/modules/listaFarmaceutico/farmaceutico_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class ListaFarmaceuticoFarmacia extends GetView<FarmaceuticoController> {
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
      body: controller.obx(
        (list) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  Farmaceutico farmaceutico = list[index];
                  return Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black12))),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100)),
                          width: 100,
                          height: 100,
                          child: Image.asset(farmaceutico.genero == 'M'
                              ? 'assets/pMale.png'
                              : 'assets/pFemale.png'),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              farmaceutico.nome,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 49, 175, 180),
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'CRF ' + farmaceutico.crf,
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Telefone ' + farmaceutico.telefone,
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 16,
                              ),
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  launch("tel://" + farmaceutico.telefone);
                                },
                                child: Text('Entrar em contato'))
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        onError: (err) => Text(err!),
        onEmpty: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/results-not-found.png",
                height: 300,
                width: 300,
              ),
              Text(
                'A farmacia não tem farmaceuticos cadastrados',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 49, 175, 180),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
