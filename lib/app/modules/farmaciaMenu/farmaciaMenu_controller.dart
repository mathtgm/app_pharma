import 'dart:async';

import 'package:get/get.dart';
import 'package:pharma_app/app/data/repository/farmaciaPedido_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FarmaciaMenuController extends GetxController with StateMixin {
  late Timer _timer;
  FarmaciaPedidoRepository rep = Get.find<FarmaciaPedidoRepository>();
  RxString nomeFarm = ''.obs;
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void onInit() {
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
    _timer = Timer.periodic(Duration(seconds: 30), (Timer t) => getPedidos());
  }

  getPreferences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    nomeFarm.value = pref.getString('name')!;
  }
}
