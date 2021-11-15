import 'package:get/get.dart';
import 'package:pharma_app/app/data/model/modelProdutoCarrinho.dart';
import 'package:pharma_app/app/data/repository/carrinhoProduto_repository.dart';

class CarrinhoController extends GetxController with StateMixin {
  CarrinhoProdutoRepository rep = Get.find<CarrinhoProdutoRepository>();
  var endereco = null;
  var pagamento = ''.obs;
  var total = 0.00.obs;

  @override
  void onInit() async {
    super.onInit();
    getCarrinho();
  }

  getCarrinho() async {
    await rep.getCarrinho().then((value) {
      if (value.length < 1) {
        change(null, status: RxStatus.empty());
      } else {
        calcularTotal(value);
        change(value, status: RxStatus.success());
      }
    });
  }

  void calcularTotal(List value) {
    total.value = 0;
    for (ProdutoCarrinho item in value) {
      total.value += item.valor_total;
    }
  }
}
