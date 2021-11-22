import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/data/model/modelFarmaceutico.dart';
import 'package:pharma_app/app/global/widgets/images.dart';
import 'package:pharma_app/app/global/widgets/msgErro.dart';
import 'package:pharma_app/app/modules/listaFarmaceutico/farmaceutico_controller.dart';
import 'package:pharma_app/app/routes/app_routes.dart';
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
            Container(
              height: 500,
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
                            controller.tipoUsuario == 1
                                ? botaoEditar(farmaceutico)
                                : botaoLigacao(farmaceutico.telefone),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            botaoCadastrar(),
          ],
        ),
        onError: (err) => Text(err!),
        onEmpty: Column(
          children: [
            msgErro().telaErro('A farmacia não tem farmaceutico cadastrado',
                ImagensTela.imgErroConexao),
            botaoCadastrar()
          ],
        ),
      ),
    );
  }

  Widget botaoEditar(Farmaceutico farm) {
    return OutlinedButton(
        onPressed: () async {
          await Get.toNamed(Routes.formFarmaceutico, arguments: farm.toMap());
          controller.onInit();
        },
        child: Text('Editar'));
  }

  Widget botaoLigacao(String telefone) {
    return OutlinedButton(
        onPressed: () {
          launch("tel://" + telefone);
        },
        child: Text('Entrar em contato'));
  }

  Widget botaoCadastrar() {
    if (controller.tipoUsuario == 1)
      return Center(
        child: TextButton(
          onPressed: () async {
            await Get.toNamed(Routes.formFarmaceutico);
            controller.onInit();
          },
          child: Text(
            'Cadastrar Farmacêutico',
            style: TextStyle(color: Colors.white),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 49, 175, 180),
          ),
        ),
      );
    return Container();
  }
}
