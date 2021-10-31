import 'package:get/get.dart';
import 'package:pharma_app/app/modules/listaFarmacia/ListaFarmacias_view.dart';
import 'package:pharma_app/app/modules/listaFarmacia/listaFarmacias_binding.dart';
import 'package:pharma_app/app/modules/login/login_binding.dart';
import 'package:pharma_app/app/modules/login/login_view.dart';

import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.INITIAL;
  static const listaFarmacias = Routes.farmaciaLista;

  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.farmaciaLista,
      page: () => listaFarmaciaState(),
      binding: listaFarmaciasBinding(),
    ),
  ];
}
