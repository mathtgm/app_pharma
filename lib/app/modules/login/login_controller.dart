import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/data/model/modelUser.dart';
import 'package:pharma_app/app/data/repository/login_repository.dart';
import 'package:pharma_app/app/modules/listaFarmacia/ListaFarmacias_view.dart';
import 'package:pharma_app/app/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final formkey = GlobalKey<FormState>();
  final repository = Get.find<LoginUserRepository>();

  late Usuario user;

  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();

  void login() async {
    final res = await repository.autenticarUsuario(email.text, senha.text);
    if (res.first['erro'] != null) {
      Get.defaultDialog(
        title: "Falha ao autenticar Erro: ${res.first['erro']}",
        middleText: res.first['msg'],
        backgroundColor: Color.fromARGB(255, 49, 175, 180),
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),
      );
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', res.first['nome']);
      await prefs.setInt('id', res.first['id_usuario']);
      Get.offAllNamed(Routes.farmaciaLista);
    }
  }
}
