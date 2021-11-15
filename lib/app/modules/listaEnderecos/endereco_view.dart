import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/data/model/modelEndereco.dart';
import 'package:pharma_app/app/global/widgets/images.dart';
import 'package:pharma_app/app/global/widgets/msgErro.dart';
import 'package:pharma_app/app/modules/listaEnderecos/endereco_controller.dart';
import 'package:pharma_app/app/routes/app_routes.dart';

class EnderecoView extends GetView<EnderecoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Get.toNamed(Routes.formEndereco);
          controller.getEndereco();
        },
        label: Text('Adicionar endereço'),
        icon: Icon(Icons.add_location_alt_rounded),
      ),
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
        child: Container(
          width: Get.width,
          height: Get.height,
          child: controller.obx(
            (list) => ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                Endereco end = list[index];
                return Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text('${end.endereco}, Número ${end.numero}'),
                        subtitle: Text(end.bairro),
                      ),
                    ),
                    Get.arguments == null
                        ? botaoEditar(end)
                        : botaoSelecionar(end)
                  ],
                );
              },
            ),
            onError: (err) =>
                msgErro().telaErro(err!, ImagensTela.imgSemRegistroLoc),
            onEmpty: msgErro().telaErro('Ainda não tem endereço cadastrado',
                ImagensTela.imgSemRegistroLoc),
          ),
        ),
      ),
    );
  }

  Widget botaoEditar(Endereco end) {
    return Container(
      width: 100,
      child: IconButton(
        onPressed: () async {
          await Get.toNamed(Routes.formEndereco, arguments: end.toMap());
          controller.getEndereco();
        },
        icon: Icon(
          Icons.edit_location_alt,
          size: 40,
        ),
        color: Colors.red,
      ),
    );
  }

  Widget botaoSelecionar(Endereco end) {
    return Container(
      width: 100,
      child: IconButton(
        onPressed: () {
          Get.back(result: end.toMap());
        },
        icon: Icon(
          Icons.check_box_rounded,
          size: 40,
        ),
        color: Colors.red,
      ),
    );
  }
}
