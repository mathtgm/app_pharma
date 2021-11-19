import 'package:get/get.dart';
import 'package:pharma_app/app/data/model/modelProdutoCarrinho.dart';
import 'package:pharma_app/app/data/repository/carrinhoProduto_repository.dart';

class ProdutoCarrinhoController extends GetxController with StateMixin {
  ProdutoCarrinho prod = ProdutoCarrinho.fromMap(Get.arguments);
  RxInt quantProduto = 0.obs;
  RxDouble total = 0.00.obs;
  double precoUnid = 0.00;
  CarrinhoProdutoRepository rep = CarrinhoProdutoRepository();

  @override
  void onInit() {
    quantProduto.value = prod.quantidade;
    total.value = prod.valor_total;
    precoUnid = prod.valor_total / prod.quantidade;
  }

  void updateProdutoCarrinho() async {
    if (quantProduto.value == 0) {
      rep.removerProduto(prod.id_produto);
    } else {
      prod.quantidade = quantProduto.value;
      prod.valor_total = total.value;
      rep.atualizarProduto(prod);
    }
  }
}
