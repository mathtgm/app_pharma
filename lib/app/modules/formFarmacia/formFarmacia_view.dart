import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/modules/formFarmacia/formFarmacia_controller.dart';
import 'package:pharma_app/app/routes/app_routes.dart';

class FormFarmacia extends GetView<FormFarmaciaController> {
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
              width: Get.width,
              margin: EdgeInsets.all(20),
              child: Form(
                key: controller.formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: controller.nome,
                      decoration: InputDecoration(
                          labelText: 'Nome fantasia',
                          prefixIcon: Icon(Icons.person)),
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'O preenchimento do campo "Nome fantasia" é obrigatório';
                      },
                    ),
                    TextFormField(
                      readOnly: Get.arguments != null,
                      controller: controller.cnpj,
                      keyboardType: TextInputType.number,
                      inputFormatters: [controller.cnpjMask],
                      decoration: InputDecoration(
                          labelText: 'CNPJ',
                          prefixIcon: Icon(Icons.business_center_rounded)),
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'O preenchimento do campo "CNPJ" é obrigatório';
                        else if (!value.isCnpj) return 'CNPJ invalido';
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
                      readOnly: Get.arguments != null,
                      controller: controller.endereco,
                      decoration: InputDecoration(
                          labelText: 'Endereço',
                          prefixIcon: Icon(Icons.business)),
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'O preenchimento do campo "Endereço" é obrigatório';
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
                      readOnly: Get.arguments != null,
                      controller: controller.numero,
                      decoration: InputDecoration(
                          labelText: 'Número',
                          prefixIcon: Icon(Icons.business)),
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'O preenchimento do campo "Número" é obrigatório';
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
                      readOnly: Get.arguments != null,
                      controller: controller.bairro,
                      decoration: InputDecoration(
                          labelText: 'Bairro',
                          prefixIcon: Icon(Icons.business)),
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'O preenchimento do campo "Bairro" é obrigatório';
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
                      controller: controller.telefone,
                      inputFormatters: [
                        controller.telefoneMask,
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Telefone',
                        prefixIcon: Icon(Icons.call),
                      ),
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'O preenchimento do campo "Telefone" é obrigatório';
                      },
                    ),
                    TextFormField(
                      controller: controller.frete,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Valor do frete por Km',
                          prefixIcon: Icon(Icons.delivery_dining_rounded)),
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'O preenchimento do campo "Valor do frete" é obrigatório';
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Text(
                        'Tempo de entrega',
                        style: TextStyle(
                            color: Color.fromARGB(255, 49, 175, 180),
                            fontSize: 18),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          margin: EdgeInsets.only(right: 20),
                          child: TextFormField(
                            controller: controller.entregaMin,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(3),
                            ],
                            keyboardType: TextInputType.number,
                            decoration:
                                InputDecoration(labelText: 'Mínimo(min.)'),
                            validator: (value) {
                              if (value!.isEmpty)
                                return 'O preenchimento do campo "Minimo" é obrigatório';
                            },
                          ),
                        ),
                        Container(
                          width: 100,
                          child: TextFormField(
                            controller: controller.entregaMax,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(3),
                            ],
                            decoration:
                                InputDecoration(labelText: 'Máximo(min.)'),
                            validator: (value) {
                              if (value!.isEmpty)
                                return 'O preenchimento do campo "Maximo" é obrigatório';
                            },
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      readOnly: Get.arguments != null,
                      controller: controller.email,
                      decoration: InputDecoration(
                          labelText: 'E-mail', prefixIcon: Icon(Icons.email)),
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'O preenchimento do campo "E-mail" é obrigatório';
                        else if (!value.isEmail) return 'E-mail inválido';
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
                      controller: controller.foto,
                      decoration: InputDecoration(
                        labelText: 'URL da imagem de perfil',
                        prefixIcon: Icon(Icons.image),
                      ),
                      onChanged: (value) {
                        controller.viewImagem.value = value;
                      },
                      onTap: () {
                        controller.foto.text = '';
                        controller.viewImagem.value = '';
                      },
                    ),
                    viewImagem(),
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
        inputFormatters: [LengthLimitingTextInputFormatter(16)],
        obscureText: true,
        decoration: InputDecoration(
            labelText: 'Senha', prefixIcon: Icon(Icons.password)),
        validator: (value) {
          if (value!.isEmpty)
            return 'O preenchimento do campo "Senha" é obrigatório';
        },
      );
    return Container();
  }

  Widget botaoAtualizar() {
    if (Get.arguments != null)
      return Container(
        width: Get.width,
        height: 50,
        child: TextButton(
          child: Text(
            'Atualizar',
            style: TextStyle(color: Colors.white),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 49, 175, 180),
          ),
          onPressed: () async {
            await controller.atualizarFarmacia();
          },
        ),
      );
    return Container();
  }

  Widget botaoCadastrar() {
    if (Get.arguments == null)
      return Container(
        width: Get.width,
        height: 50,
        child: TextButton(
          child: Text(
            'Cadastrar',
            style: TextStyle(color: Colors.white),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 49, 175, 180),
          ),
          onPressed: () async {
            if (controller.formkey.currentState!.validate())
              controller.coordenada =
                  await Get.toNamed(Routes.mapa, arguments: 'farmacia');
            controller.cadastrarFarmacia();
          },
        ),
      );
    return Container();
  }

  Widget viewImagem() {
    return Obx(
      () => ClipRect(
        child: Image.network(
          controller.viewImagem.value,
          height: 300,
          width: Get.width,
          gaplessPlayback: true,
          errorBuilder: (context, exception, stackTrace) {
            return Container(
                margin: EdgeInsets.only(bottom: 20), child: Text('Sem Imagem'));
          },
        ),
      ),
    );
  }
}
