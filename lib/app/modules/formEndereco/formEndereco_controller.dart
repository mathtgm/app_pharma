import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/data/model/modelEndereco.dart';
import 'package:pharma_app/app/data/repository/endereco_repository.dart';

class FormEnderecoController extends GetxController with StateMixin {
  TextEditingController endereco = TextEditingController();
  TextEditingController numero = TextEditingController();
  TextEditingController bairro = TextEditingController();
  TextEditingController complemento = TextEditingController();

  final rep = Get.find<EnderecoRepository>();
  final formkey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null)
      preencherCampos();
    else
      change(null, status: RxStatus.success());
  }

  preencherCampos() {
    bairro.text = Get.arguments['bairro'];
    endereco.text = Get.arguments['endereco'];
    numero.text = Get.arguments['numero'];
    complemento.text = Get.arguments['complemento'];
    change(null, status: RxStatus.success());
  }

  atualizarEndereco() {
    rep.updateEndereco(Endereco(
        id_endereco: Get.arguments['id_endereco'],
        endereco: endereco.text,
        numero: numero.text,
        bairro: bairro.text,
        complemento: complemento.text,
        lat: 1.11,
        long: 1.11));
  }

  cadastrarEndereco(List pos) async {
    Endereco end = Endereco(
        endereco: endereco.text,
        numero: numero.text,
        bairro: bairro.text,
        complemento: complemento.text,
        lat: pos[0],
        long: pos[1]);
    rep.setEndereco(end);
  }

  deletarEndereco() {
    rep.deleteEndereco(Get.arguments['id_endereco']);
  }
}
