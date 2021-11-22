import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/modules/formUsuario/formUsuario_controller.dart';

class FormUsuario extends GetView<FormUsuarioController> {
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
                            ? 'Cadastro de usuario'
                            : 'Perfil',
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
                      controller: controller.email,
                      readOnly: Get.arguments != null,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'O preenchimento do campo "E-mail" é obrigatório';
                        else if (!value.isEmail) {
                          return 'Formato de E-mail invalido';
                        }
                      },
                      onTap: () {
                        if (Get.arguments != null)
                          Get.defaultDialog(
                              title: 'Alerta',
                              middleText:
                                  'Essa informação não pode ser alterada por segurança');
                      },
                    ),
                    campoSenha(),
                    TextFormField(
                      controller: controller.cpf,
                      inputFormatters: [controller.cpfMask],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'CPF',
                        prefixIcon: Icon(Icons.description_rounded),
                      ),
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'O preenchimento do campo "CPF" é obrigatório';
                        else if (!value.isCpf) return 'CPF invalido';
                      },
                    ),
                    TextFormField(
                      controller: controller.nascimento,
                      readOnly: Get.arguments != null,
                      keyboardType: TextInputType.number,
                      inputFormatters: [controller.nascimentoMask],
                      decoration: InputDecoration(
                          labelText: 'Nascimento',
                          prefixIcon: Icon(Icons.cake)),
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'O preenchimento do campo "Nascimento" é obrigatório';
                        else if (controller.verificarIdade(value))
                          return 'Para cadastrar precisa ter mais de 18 anos';
                      },
                      onTap: () {
                        if (Get.arguments != null)
                          Get.defaultDialog(
                              title: 'Alerta',
                              middleText:
                                  'Essa informação não pode ser alterada por segurança');
                      },
                    ),
                    TextFormField(
                      controller: controller.celular,
                      keyboardType: TextInputType.number,
                      inputFormatters: [controller.celularMask],
                      decoration: InputDecoration(
                          labelText: 'Celular',
                          prefixIcon: Icon(Icons.mobile_friendly_rounded)),
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'O preenchimento do campo "Celular" é obrigatório';
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

  Widget campoSenha() {
    if (Get.arguments == null)
      return TextFormField(
        controller: controller.senha,
        readOnly: Get.arguments != null,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Senha',
          prefixIcon: Icon(Icons.lock),
        ),
        validator: (value) {
          if (value!.isEmpty)
            return 'O preenchimento do campo "Senha" é obrigatório';
        },
      );
    return Container();
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
              controller.cadastrarUsuario();
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
      return Container(
        margin: EdgeInsets.only(top: 20),
        width: Get.width,
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 49, 175, 180)),
          onPressed: () {
            if (controller.formkey.currentState!.validate()) {
              controller.atualizarUsuario();
              Get.back();
            }
          },
          child: Text(
            'Atualizar',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      );
    return Container();
  }
}
