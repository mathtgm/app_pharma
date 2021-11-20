import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/data/model/modelProduto.dart';
import 'package:pharma_app/app/data/repository/listaProdutos_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormProdutoFarmaciaController extends GetxController {
  ListaProdutosRepository repository = Get.find<ListaProdutosRepository>();
  TextEditingController nome = TextEditingController();
  CurrencyTextFieldController preco =
      CurrencyTextFieldController(decimalSymbol: ",", thousandSymbol: ".");
  TextEditingController descricao = TextEditingController();
  TextEditingController imagem = TextEditingController();
  RxString viewImagem = ''.obs;

  final formkey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      preencherCampos();
    }
  }

  void preencherCampos() {
    nome.text = Get.arguments['nome'];
    preco.text = Get.arguments['preco_unid'].toStringAsFixed(2);
    descricao.text =
        Get.arguments['descricao'] == null ? '' : Get.arguments['descricao'];
    imagem.text =
        Get.arguments['imagem'] == null ? '' : Get.arguments['imagem'];
    viewImagem.value =
        Get.arguments['imagem'] == null ? '' : Get.arguments['imagem'];
  }

  void alterarProduto() {
    repository.alterarProduto(Produto(
        id_produto: Get.arguments['id_produto'],
        nome: nome.text,
        descricao: descricao.text == '' ? null : descricao.text,
        preco_unid: preco.doubleValue,
        imagem: imagem.text == '' ? null : imagem.text,
        id_farmacia: Get.arguments['id_farmacia']));
  }

  removerProduto() async {
    await repository.excluirProduto(Produto.fromMap(Get.arguments));
  }

  cadastraProduto() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    repository.cadastrarProduto(Produto(
        id_produto: 0,
        nome: nome.text,
        descricao: descricao.text == '' ? null : descricao.text,
        preco_unid: preco.doubleValue,
        imagem: imagem.text == '' ? null : imagem.text,
        id_farmacia: pref.getInt('id')!));
  }
}
