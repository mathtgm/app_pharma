import 'package:get/get.dart';
import 'package:pharma_app/app/data/provider/carrinho_provider.dart';
import 'package:pharma_app/app/data/repository/carrinhoProduto_repository.dart';
import 'package:pharma_app/app/modules/produto/produto_controller.dart';

class ProdutoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProdutoController>(() => ProdutoController());
    Get.lazyPut<CarrinhoProdutoRepository>(() => CarrinhoProdutoRepository());
    Get.lazyPut<ProdutoCarrinhoApi>(() => ProdutoCarrinhoApi());
  }
}
