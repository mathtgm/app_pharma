import 'package:get/get.dart';
import 'package:pharma_app/app/data/repository/pedido_repository.dart';

class DetalhePedidoUsuarioController extends GetxController with StateMixin {
  PedidoRepository repository = Get.find<PedidoRepository>();
  bool trocoFlag = Get.arguments['troco'] == 'Dinheiro';
  bool statusFlag = ((Get.arguments['dataentrega'] == null) &&
      (Get.arguments['status'] == 'Cancelado'));
  bool statusFlag2 = Get.arguments['status'] == 'Saiu para entrega';
  bool statusFlag3 = ((Get.arguments['status'] == 'Entregue') &&
      (Get.arguments['dataentrega'] != null));
  bool cancelado = Get.arguments['status'] == 'Cancelado';
  @override
  void onInit() {
    super.onInit();
    getPedidoProduto();
  }

  void getPedidoProduto() {
    repository
        .getListaPedidoProdutoUsuario(Get.arguments['id_ordempedido'])
        .then((value) {
      if (value == '')
        change(null, status: RxStatus.empty());
      else
        change(value, status: RxStatus.success());
    });
  }

  void confirmaEntrega() async {
    repository.confirmarEntrega(Get.arguments['id_ordempedido']);
  }
}
