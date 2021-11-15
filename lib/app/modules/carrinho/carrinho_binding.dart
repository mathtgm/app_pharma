import 'package:get/get.dart';
import 'package:pharma_app/app/data/provider/carrinho_provider.dart';
import 'package:pharma_app/app/data/repository/carrinhoProduto_repository.dart';
import 'package:pharma_app/app/modules/carrinho/carrinho_controller.dart';

class CarrinhoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarrinhoController>(() => CarrinhoController());
    Get.lazyPut<ProdutoCarrinhoApi>(() => ProdutoCarrinhoApi());
    Get.lazyPut<CarrinhoProdutoRepository>(() => CarrinhoProdutoRepository());
  }
}
