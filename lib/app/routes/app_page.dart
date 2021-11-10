import 'package:get/get.dart';
import 'package:pharma_app/app/data/model/modelFarmaceutico.dart';
import 'package:pharma_app/app/modules/listaFarmaceutico/farmaceutico_binding.dart';
import 'package:pharma_app/app/modules/listaFarmaceutico/farmaceutico_view.dart';
import 'package:pharma_app/app/modules/listaFarmacia/ListaFarmacias_view.dart';
import 'package:pharma_app/app/modules/listaFarmacia/listaFarmacias_binding.dart';
import 'package:pharma_app/app/modules/listaProdutos/listaProdutos_binding.dart';
import 'package:pharma_app/app/modules/listaProdutos/listaProdutos_view.dart';
import 'package:pharma_app/app/modules/login/login_binding.dart';
import 'package:pharma_app/app/modules/login/login_view.dart';
import 'package:pharma_app/app/modules/produto/produto_biding.dart';
import 'package:pharma_app/app/modules/produto/produto_view.dart';

import 'app_routes.dart';

class AppPages {
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
    GetPage(
      name: Routes.listaProdutos,
      page: () => ListaProdutosFarmacia(),
      binding: ListaProdutosBinding(),
    ),
    GetPage(
      name: Routes.farmaceutico,
      page: () => ListaFarmaceuticoFarmacia(),
      binding: FarmaceuticoBinding(),
    ),
    GetPage(
        name: Routes.produto,
        page: () => ProdutoFarmacia(),
        binding: ProdutoBinding())
  ];
}
