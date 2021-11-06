import 'package:get/get.dart';
import 'package:pharma_app/app/data/provider/listaProdutos_provider.dart';
import 'package:pharma_app/app/data/repository/listaProdutos_repository.dart';
import 'package:pharma_app/app/modules/listaProdutos/listaProdutos_controller.dart';

class ListaProdutosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListaProdutosController>(() => ListaProdutosController());
    Get.lazyPut<ListaProdutosRepository>(() => ListaProdutosRepository());
    Get.lazyPut<ListaProdutosApiClient>(() => ListaProdutosApiClient());
  }
}
