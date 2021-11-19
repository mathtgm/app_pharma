import 'package:get/get.dart';
import 'package:pharma_app/app/data/repository/pedido_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaPedidoUsuarioController extends GetxController with StateMixin {
  final repository = Get.find<PedidoRepository>();

  @override
  void onInit() async {
    super.onInit();
    await getListaPedidos();
  }

  Future<void> getListaPedidos() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int userId = pref.getInt('id')!;
    repository.getListaPedidoOrdemUsuario(userId).then((value) {
      if (value == '')
        change(null, status: RxStatus.empty());
      else
        change(value, status: RxStatus.success());
    });
  }
}
