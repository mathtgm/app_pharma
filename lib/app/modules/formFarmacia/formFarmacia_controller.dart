import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pharma_app/app/data/repository/farmacia_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormFarmaciaController extends GetxController with StateMixin {
  FarmaciaRepository repository = Get.find<FarmaciaRepository>();

  TextEditingController nome = TextEditingController();
  TextEditingController cnpj = TextEditingController();
  TextEditingController endereco = TextEditingController();
  TextEditingController numero = TextEditingController();
  TextEditingController bairro = TextEditingController();
  TextEditingController telefone = TextEditingController();
  TextEditingController entregaMin = TextEditingController();
  TextEditingController entregaMax = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  TextEditingController foto = TextEditingController();

  RxString viewImagem = ''.obs;

  var cnpjMask = new MaskTextInputFormatter(
      mask: '##.###.###/####-##', filter: {"#": RegExp(r'[0-9]')});
  var telefoneMask = new MaskTextInputFormatter(
      mask: '(##) #########', filter: {"#": RegExp(r'[0-9]')});
  CurrencyTextFieldController frete =
      CurrencyTextFieldController(decimalSymbol: ",", thousandSymbol: ".");

  final formkey = GlobalKey<FormState>();

  var coordenada = [];

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null)
      preencherCampos();
    else
      change(null, status: RxStatus.success());
  }

  void cadastrarFarmacia() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(coordenada[0], coordenada[1]);
    var cidade = placemarks[1].subAdministrativeArea!;
    var estado = placemarks[1].administrativeArea!;
    String tempo = entregaMin.text + ' - ' + entregaMax.text;
    var res = await repository.cadastrarFarmacia(
        nome.text,
        cnpj.text,
        telefone.text,
        email.text,
        senha.text,
        endereco.text,
        numero.text,
        cidade,
        estado,
        bairro.text,
        foto.text,
        coordenada[0],
        coordenada[1],
        tempo,
        frete.doubleValue);
    if (res) {
      Get.back();
    } else {
      Get.defaultDialog(
          middleText: 'Email/CNPJ já cadastrado', title: 'Alerta');
    }
  }

  atualizarFarmacia() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String tempo = entregaMin.text + ' - ' + entregaMax.text;
    var res = await repository.atualizarFarmacia(
        pref.getInt('id')!,
        nome.text,
        '',
        telefone.text,
        '',
        '',
        '',
        '',
        foto.text,
        0.00,
        0.00,
        tempo,
        frete.doubleValue);
    if (res == false) {
      Get.defaultDialog(
          title: 'Erro',
          middleText: 'Aconteceu um erro contate o desenvolvedor',
          onCancel: () {
            Get.back();
          });
    } else {
      pref.setString('name', nome.text);
    }
    Get.back();
  }

  preencherCampos() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    repository.getFarmacia(pref.getInt('id')).then((value) {
      if (value == '') {
        change(null, status: RxStatus.empty());
      } else {
        var tempo = value.tempo.split(" ");
        nome.text = value.nome_fantasia;
        cnpj.text = value.cnpj;
        telefone.text = value.telefone;
        email.text = value.email;
        endereco.text = value.endereco;
        numero.text = value.numero;
        bairro.text = value.bairro;
        foto.text = value.foto == null ? '' : value.foto;
        frete.text = value.frete.toStringAsFixed(2);
        entregaMin.text = tempo[0];
        entregaMax.text = tempo[2];
        change(null, status: RxStatus.success());
      }
    });
  }
}
