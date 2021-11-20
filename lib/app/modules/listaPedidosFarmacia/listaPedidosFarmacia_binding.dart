import 'package:get/get.dart';
import 'package:pharma_app/app/data/provider/farmaciaPedido_provider.dart';
import 'package:pharma_app/app/data/repository/farmaciaPedido_repository.dart';
import 'package:pharma_app/app/modules/listaPedidosFarmacia/listaPedidosFarmacia_controller.dart';

class ListaPedidoFarmaciaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListaPedidoFarmaciaController>(
        () => ListaPedidoFarmaciaController());
    Get.lazyPut<FarmaciaPedidoRepository>(() => FarmaciaPedidoRepository());
    Get.lazyPut<FarmaciaPedidoApi>(() => FarmaciaPedidoApi());
  }
}
