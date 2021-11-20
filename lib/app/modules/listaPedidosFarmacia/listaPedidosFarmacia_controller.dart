import 'package:get/get.dart';
import 'package:pharma_app/app/data/repository/farmaciaPedido_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaPedidoFarmaciaController extends GetxController with StateMixin {
  FarmaciaPedidoRepository repository = Get.find<FarmaciaPedidoRepository>();

  @override
  void onInit() {
    super.onInit();
    getPedidoOrdem();
  }

  void getPedidoOrdem() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await repository.getOrdemPedido(pref.getInt('id')!).then((value) {
      if (value == '')
        change(null, status: RxStatus.empty());
      else
        change(value, status: RxStatus.success());
    });
  }
}
