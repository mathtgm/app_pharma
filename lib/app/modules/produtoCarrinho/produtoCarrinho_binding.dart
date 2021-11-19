import 'package:get/get.dart';
import 'package:pharma_app/app/data/provider/carrinho_provider.dart';
import 'package:pharma_app/app/data/repository/carrinhoProduto_repository.dart';
import 'package:pharma_app/app/modules/produtoCarrinho/produtoCarrinho_controller.dart';

class ProdutoCarrinhoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProdutoCarrinhoController>(() => ProdutoCarrinhoController());
    Get.lazyPut<CarrinhoProdutoRepository>(() => CarrinhoProdutoRepository());
    Get.lazyPut<ProdutoCarrinhoApi>(() => ProdutoCarrinhoApi());
  }
}
