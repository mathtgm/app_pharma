import 'package:get/get.dart';
import 'package:pharma_app/app/data/provider/farmacia_provider.dart';
import 'package:pharma_app/app/data/repository/farmacia_repository.dart';
import 'package:pharma_app/app/modules/formFarmacia/formFarmacia_controller.dart';

class FormFarmaciaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormFarmaciaController>(() => FormFarmaciaController());
    Get.lazyPut<FarmaciaApi>(() => FarmaciaApi());
    Get.lazyPut<FarmaciaRepository>(() => FarmaciaRepository());
  }
}
