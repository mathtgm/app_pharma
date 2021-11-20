import 'package:get/get.dart';
import 'package:pharma_app/app/modules/carrinho/carrinho_binding.dart';
import 'package:pharma_app/app/modules/carrinho/carrinho_view.dart';
import 'package:pharma_app/app/modules/detalhePedidoFarmacia/detalhePedidoFarmacia_binding.dart';
import 'package:pharma_app/app/modules/detalhePedidoFarmacia/detalhePedidoFarmacia_view.dart';
import 'package:pharma_app/app/modules/detalhePedidoUsuario/detalhePedidoUsuario_binding.dart';
import 'package:pharma_app/app/modules/detalhePedidoUsuario/detalhePedidoUsuario_view.dart';
import 'package:pharma_app/app/modules/farmaciaMenu/farmaciaMenu_binding.dart';
import 'package:pharma_app/app/modules/farmaciaMenu/farmaciaMenu_view.dart';
import 'package:pharma_app/app/modules/formEndereco/formEndereco_binding.dart';
import 'package:pharma_app/app/modules/formEndereco/formEndereco_view.dart';
import 'package:pharma_app/app/modules/formProdutoFarmacia/formProduto_binding.dart';
import 'package:pharma_app/app/modules/formProdutoFarmacia/formProduto_view.dart';
import 'package:pharma_app/app/modules/listaEnderecos/endereco_binding.dart';
import 'package:pharma_app/app/modules/listaEnderecos/endereco_view.dart';
import 'package:pharma_app/app/modules/listaFarmaceutico/farmaceutico_binding.dart';
import 'package:pharma_app/app/modules/listaFarmaceutico/farmaceutico_view.dart';
import 'package:pharma_app/app/modules/listaFarmacia/ListaFarmacias_view.dart';
import 'package:pharma_app/app/modules/listaFarmacia/listaFarmacias_binding.dart';
import 'package:pharma_app/app/modules/listaPedidoUsuario/listaPedidoUsuario_binding.dart';
import 'package:pharma_app/app/modules/listaPedidoUsuario/listaPedidoUsuario_view.dart';
import 'package:pharma_app/app/modules/listaProdutos/listaProdutos_binding.dart';
import 'package:pharma_app/app/modules/listaProdutos/listaProdutos_view.dart';
import 'package:pharma_app/app/modules/login/login_binding.dart';
import 'package:pharma_app/app/modules/login/login_view.dart';
import 'package:pharma_app/app/modules/produto/produto_binding.dart';
import 'package:pharma_app/app/modules/produto/produto_view.dart';
import 'package:pharma_app/app/modules/produtoCarrinho/produtoCarrinho_binding.dart';
import 'package:pharma_app/app/modules/produtoCarrinho/produtoCarrinho_view.dart';
import 'package:pharma_app/app/modules/produtosFarmacia/produtosFarmacia_binding.dart';
import 'package:pharma_app/app/modules/produtosFarmacia/produtosFarmacia_view.dart';

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
        binding: ProdutoBinding()),
    GetPage(
        name: Routes.carrinho,
        page: () => CarrinhoFarmacia(),
        binding: CarrinhoBinding()),
    GetPage(
        name: Routes.endereco,
        page: () => EnderecoView(),
        binding: EnderecoBinding()),
    GetPage(
        name: Routes.formEndereco,
        page: () => FormEndereco(),
        binding: FormEnderecoBinding()),
    GetPage(
        name: Routes.menuFarmacia,
        page: () => FarmaciaMenu(),
        binding: MenuFarmaciaBinding()),
    GetPage(
        name: Routes.carrinhoProduto,
        page: () => ProdutoCarrinho(),
        binding: ProdutoCarrinhoBinding()),
    GetPage(
        name: Routes.listaPedidosUsuario,
        page: () => ListaPedidoUsuario(),
        binding: ListaPedidoUsuarioBinding()),
    GetPage(
        name: Routes.detalhePedidosUsuario,
        page: () => DetalhePedidoUsuario(),
        binding: DetalhePedidoUsuarioBinding()),
    GetPage(
        name: Routes.detalhePedidosFarmacia,
        page: () => DetalhePedidoFarmacia(),
        binding: DetalhePedidoFarmaciaBinding()),
    GetPage(
        name: Routes.listaProdutosFarmacia,
        page: () => FarmaciaListaProduto(),
        binding: ProdutosFarmaciaBinding()),
    GetPage(
        name: Routes.formProdutoFarmacia,
        page: () => FormProdutoFarmacia(),
        binding: FormProdutoFarmaciaBinding())
  ];
}
