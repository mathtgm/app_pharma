import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/modules/formFarmaceutico/formFarmaceutico_controller.dart';

class FormFarmaceutico extends GetView<FormFarmaceuticoController> {
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
        (value) => SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Form(
                key: controller.formkey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20, top: 20),
                      child: Text(
                        Get.arguments == null
                            ? 'Cadastro de farmaceutico'
                            : 'Farmaceutico',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 49, 175, 180)),
                      ),
                    ),
                    TextFormField(
                      controller: controller.nome,
                      decoration: InputDecoration(
                          labelText: 'Nome', prefixIcon: Icon(Icons.person)),
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'O preenchimento do campo "Nome" é obrigatório';
                      },
                    ),
                    TextFormField(
                      controller: controller.crf,
                      inputFormatters: [controller.crfMask],
                      decoration: InputDecoration(
                        labelText: 'CRF',
                        prefixIcon: Icon(Icons.document_scanner),
                      ),
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'O preenchimento do campo "CRF" é obrigatório';
                      },
                    ),
                    TextFormField(
                      controller: controller.telefone,
                      inputFormatters: [controller.telefoneMask],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Telefone',
                        prefixIcon: Icon(Icons.phone),
                      ),
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'O preenchimento do campo "Telefone" é obrigatório';
                      },
                    ),
                    TextFormField(
                      controller: controller.genero,
                      keyboardType: TextInputType.name,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      decoration: InputDecoration(
                          labelText: 'Gênero', prefixIcon: Icon(Icons.person)),
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'O preenchimento do campo "Gênero" é obrigatório';
                      },
                    ),
                    botaoCadastrar(),
                    botaoAtualizar(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget botaoCadastrar() {
    if (Get.arguments == null)
      return Container(
        width: Get.width,
        margin: EdgeInsets.only(top: 20),
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 49, 175, 180)),
          onPressed: () {
            if (controller.formkey.currentState!.validate()) {
              controller.cadastrar();
              Get.back();
            }
          },
          child: Text(
            'Cadastrar',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      );
    return Container();
  }

  Widget botaoAtualizar() {
    if (Get.arguments != null)
      return Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              margin: EdgeInsets.only(top: 20),
              child: Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      backgroundColor: Color.fromARGB(255, 49, 175, 180)),
                  onPressed: () {
                    if (controller.formkey.currentState!.validate()) {
                      controller.atualizar();
                      Get.back();
                    }
                  },
                  child: Text(
                    'Atualizar',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              margin: EdgeInsets.only(top: 20),
              child: TextButton(
                style: TextButton.styleFrom(
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    backgroundColor: Color.fromARGB(255, 49, 175, 180)),
                onPressed: () {
                  if (controller.formkey.currentState!.validate()) {
                    controller.excluir();
                    Get.back();
                  }
                },
                child: Text(
                  'Excluir',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      );
    return Container();
  }
}
