import 'package:get/get.dart';
import 'package:pharma_app/app/data/provider/listaProdutos_provider.dart';
import 'package:pharma_app/app/data/repository/listaProdutos_repository.dart';
import 'package:pharma_app/app/modules/formProdutoFarmacia/formProduto_controller.dart';

class FormProdutoFarmaciaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormProdutoFarmaciaController>(
        () => FormProdutoFarmaciaController());
    Get.lazyPut<ListaProdutosApiClient>(() => ListaProdutosApiClient());
    Get.lazyPut<ListaProdutosRepository>(() => ListaProdutosRepository());
  }
}
