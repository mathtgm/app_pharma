import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pharma_app/app/data/model/modelFarmaceutico.dart';
import 'package:pharma_app/app/data/repository/farmaceutico_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormFarmaceuticoController extends GetxController with StateMixin {
  FarmaceuticoRepository repository = Get.find<FarmaceuticoRepository>();

  var crfMask = new MaskTextInputFormatter(
      mask: '####-#', filter: {"#": RegExp(r'[0-9]')});
  var telefoneMask = new MaskTextInputFormatter(
      mask: '(##) #########', filter: {"#": RegExp(r'[0-9]')});

  TextEditingController crf = TextEditingController();
  TextEditingController nome = TextEditingController();
  TextEditingController telefone = TextEditingController();
  TextEditingController genero = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) preencherCampos();
    change(null, status: RxStatus.success());
  }

  void preencherCampos() {
    Farmaceutico farm = Farmaceutico.fromMap(Get.arguments);
    crf.text = farm.crf;
    nome.text = farm.nome;
    telefone.text = farm.telefone;
    genero.text = farm.genero;
  }

  cadastrar() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await repository.cadastrarFarmaceutico(
        pref.getInt('id')!, nome.text, crf.text, telefone.text, genero.text);
  }

  atualizar() async {
    await repository.atualizarFarmaceutico(Get.arguments['id_farmaceutico'],
        nome.text, crf.text, telefone.text, genero.text);
  }

  excluir() async {
    await repository.excluirFarmaceutico(Get.arguments['id_farmaceutico']);
  }
}
