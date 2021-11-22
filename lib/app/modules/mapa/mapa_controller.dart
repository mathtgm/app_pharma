import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:pharma_app/app/global/controller/global_controller.dart';

class MapaController extends GetxController with StateMixin {
  PositionController pos = PositionController();
  late Position coordenada;

  @override
  void onInit() async {
    super.onInit();
    coordenada = await pos.getPosition();
    mapaView();
  }

  mapaView() {
    change(coordenada, status: RxStatus.success());
  }
}
