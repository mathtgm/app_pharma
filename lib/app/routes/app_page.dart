import 'package:get/get.dart';
import 'package:pharma_app/app/modules/listaFarmacia/ListaFarmacias_view.dart';
import 'package:pharma_app/app/modules/listaFarmacia/listaFarmacias_binding.dart';
import 'package:pharma_app/app/modules/listaProdutos/listaProdutos_binding.dart';
import 'package:pharma_app/app/modules/listaProdutos/listaProdutos_view.dart';
import 'package:pharma_app/app/modules/login/login_binding.dart';
import 'package:pharma_app/app/modules/login/login_view.dart';

import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.INITIAL;
  static const listaFarmacias = Routes.farmaciaLista;
  static const listaProdutos = Routes.listaProdutos;

  static final routes = [
    GetPage(
      name: INITIAL,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: listaFarmacias,
      page: () => listaFarmaciaState(),
      binding: listaFarmaciasBinding(),
    ),
    GetPage(
      name: listaProdutos,
      page: () => ListaProdutosFarmacia(),
      binding: ListaProdutosBinding(),
    )
  ];
}
