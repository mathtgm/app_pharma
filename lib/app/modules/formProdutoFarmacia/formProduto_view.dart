import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/modules/formProdutoFarmacia/formProduto_controller.dart';

class FormProdutoFarmacia extends GetView<FormProdutoFarmaciaController> {
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
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                campoForm(
                    'Nome do produto',
                    'O preenchimento do campo "Nome do produto" é obrigatório',
                    controller.nome),
                TextFormField(
                  controller: controller.descricao,
                  maxLength: 200,
                  maxLines: 10,
                  minLines: 1,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.blueGrey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 49, 175, 180),
                        ),
                      ),
                      labelText: 'Descrição do produto'),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.preco,
                  decoration: InputDecoration(
                    label: Text('Preço'),
                  ),
                  validator: (value) {
                    if (value!.isEmpty)
                      return 'O preenchimento do campo "Preço" é obrigatório';
                  },
                ),
                TextFormField(
                  controller: controller.imagem,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.blueGrey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 49, 175, 180),
                        ),
                      ),
                      labelText: 'URL da imagem do produto'),
                  onEditingComplete: () {
                    controller.viewImagem.value = controller.imagem.text;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Image do produto',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 49, 175, 180),
                    ),
                  ),
                ),
                Obx(
                  () => ClipRect(
                    child: Image.network(
                      controller.viewImagem.value,
                      height: 300,
                      width: Get.width,
                      gaplessPlayback: true,
                      errorBuilder: (context, exception, stackTrace) {
                        return Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Text('Sem Imagem'));
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: Get.arguments != null,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          child: Text(
                            'Atualizar',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                              backgroundColor:
                                  Color.fromARGB(255, 49, 175, 180)),
                          onPressed: () {
                            controller.alterarProduto();
                            Get.back();
                          },
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          child: Text(
                            'Excluir',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                              backgroundColor:
                                  Color.fromARGB(255, 49, 175, 180)),
                          onPressed: () async {
                            await controller.removerProduto();
                            Get.back();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: (Get.arguments == null),
                  child: Container(
                    width: Get.width,
                    height: 50,
                    child: TextButton(
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          backgroundColor: Color.fromARGB(255, 49, 175, 180)),
                      onPressed: () async {
                        await controller.cadastraProduto();
                        Get.back();
                      },
                    ),
                  ),
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
}
