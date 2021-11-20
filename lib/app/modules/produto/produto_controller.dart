import 'package:get/get.dart';
import 'package:pharma_app/app/data/repository/carrinhoProduto_repository.dart';

class ProdutoController extends GetxController with StateMixin {
  RxInt quantProduto = 1.obs;
  RxDouble total = 0.00.obs;
  CarrinhoProdutoRepository rep = CarrinhoProdutoRepository();

  @override
  void onInit() {
    super.onInit();
    total.value = Get.arguments['preco_unid'];
  }

  void addProdutoCarrinho(Map produto) async {
    if (quantProduto > 0) {
      rep.addProduto(
          quantProduto.toInt(),
          total.toDouble(),
          produto['descricao'],
          produto['id_farmacia'],
          produto['id_produto'],
          produto['nome']);
    }
  }
}
