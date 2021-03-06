import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/global/widgets/logo.dart';
import 'package:pharma_app/app/modules/login/login_controller.dart';
import 'package:pharma_app/app/routes/app_routes.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Form(
                key: controller.formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    logoApp().logo(),
                    Text(
                      "PharmApp",
                      style: TextStyle(
                          color: Color.fromARGB(255, 49, 175, 180),
                          fontWeight: FontWeight.bold),
                      textScaleFactor: 3,
                      textAlign: TextAlign.center,
                    ),
                    TextFormField(
                      controller: controller.email,
                      validator: (value) {
                        if (value!.isEmpty) return 'E-mail inválido';
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Color.fromARGB(255, 49, 175, 180),
                        ),
                        labelText: "E-mail",
                        labelStyle: TextStyle(color: Colors.blueGrey),
                        focusColor: Color.fromARGB(255, 49, 175, 180),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 49, 175, 180),
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: controller.senha,
                      validator: (value) {
                        if (value!.isEmpty) return 'Senha inválida';
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outlined,
                          color: Color.fromARGB(255, 49, 175, 180),
                        ),
                        labelText: "Senha",
                        labelStyle: TextStyle(color: Colors.blueGrey),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 49, 175, 180),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50, bottom: 10),
                      child: Container(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (controller.formkey.currentState!.validate())
                              controller.login();
                          },
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color.fromARGB(255, 49, 175, 180),
                                  Color.fromARGB(255, 67, 241, 247)
                                ]),
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              width: 300,
                              height: 100,
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Entrar',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(
                                      Icons.play_arrow_rounded,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 300,
                      child: OutlinedButton(
                        onPressed: () {
                          if (Get.arguments == null)
                            Get.toNamed(Routes.formUsuario);
                          else
                            Get.toNamed(Routes.formFarmacia);
                        },
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            side: BorderSide(
                              width: 1.0,
                              color: Color.fromARGB(255, 49, 175, 180),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cadastrar',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 49, 175, 180),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Icon(
                              Icons.article_outlined,
                              color: Color.fromARGB(255, 49, 175, 180),
                              size: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (Get.arguments == null)
                          Get.offAllNamed(Routes.INITIAL,
                              arguments: 'farmacia');
                        else
                          Get.offAllNamed(Routes.INITIAL);
                      },
                      child: Text(
                        Get.arguments == 'farmacia'
                            ? 'Entrar como usuário'
                            : 'Entrar como farmacia',
                        style: TextStyle(
                          color: Color.fromARGB(255, 49, 175, 180),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
