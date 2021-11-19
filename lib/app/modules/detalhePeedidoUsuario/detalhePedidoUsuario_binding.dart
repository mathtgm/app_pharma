import 'package:get/get.dart';
import 'package:pharma_app/app/data/provider/pedido_provider.dart';
import 'package:pharma_app/app/data/repository/pedido_repository.dart';
import 'package:pharma_app/app/modules/detalhePeedidoUsuario/detalhePedidoUsuario_controller.dart';

class DetalhePedidoUsuarioBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetalhePedidoUsuarioController>(
        () => DetalhePedidoUsuarioController());
    Get.lazyPut<PedidoRepository>(() => PedidoRepository());
    Get.lazyPut<PedidoApi>(() => PedidoApi());
  }
}
