import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/data/model/modelUser.dart';
import 'package:pharma_app/app/data/repository/login_repository.dart';
import 'package:pharma_app/app/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController with StateMixin {
  final formkey = GlobalKey<FormState>();
  final repository = Get.find<LoginUserRepository>();

  late Usuario user;

  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    print('Estou iniciando');
    await SharedPreferences.getInstance().then((value) {
      if ((value.get('name') != null) && (value.get('id') != null)) {
        if (value.get('tipo') == 2)
          Get.offAllNamed(Routes.farmaciaLista);
        else
          Get.offAllNamed(Routes.menuFarmacia);
      }
    });
  }

  void login() async {
    if (Get.arguments != 'farmacia') {
      final res = await repository.autenticarUsuario(email.text, senha.text);
      if (res.first['erro'] != null) {
        msgErro(res.first);
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('name', res.first['nome']);
        await prefs.setInt('id', res.first['id_usuario']);
        await prefs.setInt('tipo', 2);
        Get.offAllNamed(Routes.farmaciaLista);
      }
    } else {
      final resp = await repository.autenticarFarmacia(email.text, senha.text);
      if (resp.first['erro'] != null) {
        msgErro(resp.first);
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        print(resp.first);
        await prefs.setString('name', resp.first['nome_fantasia']);
        await prefs.setInt('id', resp.first['id_farmacia']);
        await prefs.setInt('tipo', 1);
        Get.offAllNamed(Routes.menuFarmacia);
      }
    }
  }

  msgErro(Map erro) {
    Get.defaultDialog(
      title: "Falha ao autenticar Erro: ${erro['erro']}",
      middleText: erro['msg'],
      backgroundColor: Color.fromARGB(255, 49, 175, 180),
      titleStyle: TextStyle(color: Colors.white),
      middleTextStyle: TextStyle(color: Colors.white),
    );
  }
}
