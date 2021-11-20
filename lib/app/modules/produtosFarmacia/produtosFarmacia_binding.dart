import 'package:get/get.dart';
import 'package:pharma_app/app/data/provider/listaProdutos_provider.dart';
import 'package:pharma_app/app/data/repository/listaProdutos_repository.dart';
import 'package:pharma_app/app/modules/produtosFarmacia/produtosFarmacia_controller.dart';

class ProdutosFarmaciaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProdutosFarmaciaController>(() => ProdutosFarmaciaController());
    Get.lazyPut<ListaProdutosApiClient>(() => ListaProdutosApiClient());
    Get.lazyPut<ListaProdutosRepository>(() => ListaProdutosRepository());
  }
}
