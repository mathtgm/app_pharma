import 'package:get/get.dart';
import 'package:pharma_app/app/data/provider/farmaceutico_provider.dart';
import 'package:pharma_app/app/data/repository/farmaceutico_repository.dart';
import 'package:pharma_app/app/modules/listaFarmaceutico/farmaceutico_controller.dart';

class FarmaceuticoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FarmaceuticoController>(() => FarmaceuticoController());
    Get.lazyPut<FarmaceuticoRepository>(() => FarmaceuticoRepository());
    Get.lazyPut<FarmaceuticoApiClient>(() => FarmaceuticoApiClient());
  }
}
