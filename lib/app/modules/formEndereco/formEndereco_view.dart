import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/modules/formEndereco/formEndereco_controller.dart';

class FormEndereco extends GetView<FormEnderecoController> {
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
      body: Form(
        key: controller.formkey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: controller.obx(
            (value) => Column(
              children: [
                campoForm(
                    'Endereço',
                    'O preenchimento do campo "Endereço" é obrigatório',
                    controller.endereco),
                campoForm(
                    'Bairro',
                    'O preenchimento do campo "Bairro" é obrigatório',
                    controller.bairro),
                campoForm(
                    'Número',
                    'O preenchimento do campo "Número" é obrigatório',
                    controller.numero),
                TextFormField(
                  controller: controller.complemento,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.blueGrey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 49, 175, 180),
                        ),
                      ),
                      hintText: 'Apartamento/Casa/Ponto de referência',
                      labelText: 'Complemento'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Get.arguments == null
                      ? botaoCadastro()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [botaoAtualizar(), botaoDeletar()]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget campoForm(
      String titulo, String msgErro, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.blueGrey),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 49, 175, 180),
            ),
          ),
          labelText: titulo),
      validator: (value) {
        if (value!.isEmpty) return msgErro;
      },
    );
  }

  Widget botaoCadastro() {
    return TextButton(
      onPressed: () {
        if (controller.formkey.currentState!.validate()) {
          controller.cadastrarEndereco();
          Get.back();
        }
      },
      child: Text(
        'Cadastrar!',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      style: TextButton.styleFrom(
        fixedSize: Size(Get.width, 40),
        backgroundColor: Color.fromARGB(255, 49, 175, 180),
      ),
    );
  }

  Widget botaoAtualizar() {
    return TextButton(
      onPressed: () {
        if (controller.formkey.currentState!.validate()) {
          controller.atualizarEndereco();
          Get.back();
        }
      },
      child: Text(
        'Atualizar!',
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(
        fixedSize: Size(150, 40),
        backgroundColor: Color.fromARGB(255, 49, 175, 180),
      ),
    );
  }

  Widget botaoDeletar() {
    return TextButton(
      onPressed: () {
        controller.deletarEndereco();
        Get.back();
      },
      child: Text(
        'Excluir',
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(
        fixedSize: Size(150, 40),
        backgroundColor: Color.fromARGB(255, 49, 175, 180),
      ),
    );
  }
}
