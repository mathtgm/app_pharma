import 'package:get/get.dart';
import 'package:pharma_app/app/data/provider/farmaciaPedido_provider.dart';
import 'package:pharma_app/app/data/repository/farmaciaPedido_repository.dart';
import 'package:pharma_app/app/modules/detalhePedidoFarmacia/detalhePedidoFarmacia_controller.dart';

class DetalhePedidoFarmaciaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetalhePedidoFarmaciaController>(
        () => DetalhePedidoFarmaciaController());
    Get.lazyPut<FarmaciaPedidoRepository>(() => FarmaciaPedidoRepository());
    Get.lazyPut<FarmaciaPedidoApi>(() => FarmaciaPedidoApi());
  }
}
