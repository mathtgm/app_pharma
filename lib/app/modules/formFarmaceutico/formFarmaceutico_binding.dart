import 'package:get/get.dart';
import 'package:pharma_app/app/data/provider/farmaceutico_provider.dart';
import 'package:pharma_app/app/data/repository/farmaceutico_repository.dart';
import 'package:pharma_app/app/modules/formFarmaceutico/formFarmaceutico_controller.dart';

class FormFarmaceuticoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormFarmaceuticoController>(() => FormFarmaceuticoController());
    Get.lazyPut<FarmaceuticoRepository>(() => FarmaceuticoRepository());
    Get.lazyPut<FarmaceuticoApiClient>(() => FarmaceuticoApiClient());
  }
}
