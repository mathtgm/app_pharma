import 'package:get/get.dart';
import 'package:pharma_app/app/modules/produto/produto_controller.dart';

class ProdutoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProdutoController>(() => ProdutoController());
  }
}
