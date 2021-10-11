import 'package:get/get.dart';
import 'package:pharma_app/controllers/http/http_farmacia.dart';
import 'package:pharma_app/controllers/http/http_farmacia_controller.dart';
import 'package:pharma_app/controllers/interface/Inter_Farmacia.dart';

class HttpBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IFarmaciaRepository>(Http_farmacia());
    Get.put(HttpController(Get.find()));
  }
}
