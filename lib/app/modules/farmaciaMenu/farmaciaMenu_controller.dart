import 'dart:async';

import 'package:get/get.dart';
import 'package:pharma_app/app/data/repository/farmaciaPedido_repository.dart';
import 'package:pharma_app/app/data/repository/farmacia_repository.dart';
import 'package:pharma_app/app/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FarmaciaMenuController extends GetxController with StateMixin {
  late Timer timer;
  FarmaciaPedidoRepository rep = Get.find<FarmaciaPedidoRepository>();
  FarmaciaRepository repFarmacia = Get.find<FarmaciaRepository>();
  RxString nomeFarm = ''.obs;
  int idFarm = 0;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void onInit() async {
    super.onInit();
    getPreferences();
    getPedidos();
  }

  void getPedidos() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await rep.getPedidoDisponivel(pref.getInt('id')!).then((value) {
      if (value != '')
        change(value, status: RxStatus.success());
      else
        change(null, status: RxStatus.empty());
    });
    timer = Timer.periodic(Duration(seconds: 30), (Timer t) => getPedidos());
  }

  getPreferences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    nomeFarm.value = pref.getString('name')!;
    idFarm = pref.getInt('id')!;
  }

  sairAplicativo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    timer.cancel();
    Get.offAllNamed(Routes.INITIAL);
  }

  fecharFarmacia() async {
    bool res = await repFarmacia.statusFarmacia(false, idFarm);
    if (res) Get.defaultDialog(title: 'Alerta', middleText: 'Farmacia Fechada');
  }

  abrirFarmacia() async {
    bool res = await repFarmacia.statusFarmacia(true, idFarm);
    if (res) Get.defaultDialog(title: 'Alerta', middleText: 'Farmacia Aberta');
  }
}
