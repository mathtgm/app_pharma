import 'package:get/get.dart';
import 'package:pharma_app/app/data/repository/listaProdutos_repository.dart';

class ProdutosFarmaciaController extends GetxController with StateMixin {
  final repository = Get.find<ListaProdutosRepository>();
  @override
  void onInit() {
    super.onInit();
    getProdutos();
  }

  getProdutos() async {
    await repository.listaProdutos(Get.arguments).then((value) {
      if (value == '')
        change(null, status: RxStatus.empty());
      else
        change(value, status: RxStatus.success());
    });
  }
}
