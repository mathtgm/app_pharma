import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pharma_app/app/data/repository/usuario_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormUsuarioController extends GetxController with StateMixin {
  UsuarioRepository repository = Get.find<UsuarioRepository>();
  final formkey = GlobalKey<FormState>();
  TextEditingController nome = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController cpf = TextEditingController();
  TextEditingController nascimento = TextEditingController();
  TextEditingController celular = TextEditingController();
  TextEditingController senha = TextEditingController();
  bool emailCadastrar = false;
  var nascimentoMask = new MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
  var cpfMask = new MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
  var celularMask = new MaskTextInputFormatter(
      mask: '(##) #########', filter: {"#": RegExp(r'[0-9]')});

  @override
  void onInit() async {
    super.onInit();
    if (Get.arguments != null) preencherCampos(Get.arguments);
    change(null, status: RxStatus.success());
  }

  void cadastrarUsuario() async {
    var response = await repository.cadastrarUsuario(nome.text, email.text,
        senha.text, cpf.text, nascimento.text, celular.text);
    if (response) {
      Get.back();
    } else {
      Get.defaultDialog(middleText: 'Email já cadastrado', title: 'Alerta');
    }
  }

  preencherCampos(int idUsuario) async {
    var formatNormal = DateFormat('dd/MM/yyyy');
    var formatBanco = DateFormat('yyyy-MM-dd');
    await repository.getUsuario(idUsuario).then((user) {
      nome.text = user.nome;
      email.text = user.email;
      cpf.text = user.cpf;
      nascimento.text = formatNormal.format(formatBanco.parse(user.nascimento));
      celular.text = user.celular;
      change(null, status: RxStatus.success());
    });
  }

  bool verificarIdade(String data) {
    try {
      var format = DateFormat('dd/MM/yyyy');
      var dataForm = format.parse(data).year;
      var dataAtual = DateTime.now().year;
      if ((dataAtual - dataForm) < 18) return true;
      return false;
    } on FormatException catch (e) {
      return true;
    }
  }

  void atualizarUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await repository.atualizarUsuario(prefs.getInt('id')!,
        nome.text, email.text, cpf.text, nascimento.text, celular.text);
  }
}
