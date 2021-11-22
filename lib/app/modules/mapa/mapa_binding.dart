import 'package:get/get.dart';
import 'package:pharma_app/app/modules/mapa/mapa_controller.dart';

class MapaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapaController>(() => MapaController());
  }
}
