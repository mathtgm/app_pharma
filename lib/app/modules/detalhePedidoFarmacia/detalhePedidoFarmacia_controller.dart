import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/data/repository/farmaciaPedido_repository.dart';

class DetalhePedidoFarmaciaController extends GetxController with StateMixin {
  FarmaciaPedidoRepository repository = Get.find<FarmaciaPedidoRepository>();
  TextEditingController motivoText = TextEditingController();
  int idOrdemPedido = Get.arguments['id_ordempedido'];
  @override
  void onInit() {
    super.onInit();
    getPedidoOrdem();
  }

  void getPedidoOrdem() async {
    await repository.getPedidoProduto(idOrdemPedido).then((value) {
      if (value != '')
        change(value, status: RxStatus.success());
      else
        change(null, status: RxStatus.empty());
    });
  }

  void alterarStatus(String status) async {
    await repository.alterarStatus(idOrdemPedido, status);
    Get.arguments['status'] = status;
    getPedidoOrdem();
  }

  void statusEntregar() async {
    await repository.statusEntregar(idOrdemPedido);
    Get.back();
  }

  void statusCancelar() async {
    await repository.statusCancelar(idOrdemPedido, motivoText.text);
    Get.back();
  }
}
