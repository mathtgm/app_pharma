import 'package:get/get.dart';
import 'package:pharma_app/app/data/provider/farmaciaPedido_provider.dart';
import 'package:pharma_app/app/data/provider/farmacia_provider.dart';
import 'package:pharma_app/app/data/repository/farmaciaPedido_repository.dart';
import 'package:pharma_app/app/data/repository/farmacia_repository.dart';
import 'package:pharma_app/app/modules/farmaciaMenu/farmaciaMenu_controller.dart';

class MenuFarmaciaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FarmaciaMenuController>(() => FarmaciaMenuController());
    Get.lazyPut<FarmaciaPedidoRepository>(() => FarmaciaPedidoRepository());
    Get.lazyPut<FarmaciaPedidoApi>(() => FarmaciaPedidoApi());
    Get.lazyPut<FarmaciaApi>(() => FarmaciaApi());
    Get.lazyPut<FarmaciaRepository>(() => FarmaciaRepository());
  }
}
