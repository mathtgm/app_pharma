import 'package:get/get.dart';
import 'package:pharma_app/app/data/provider/pedido_provider.dart';
import 'package:pharma_app/app/data/repository/pedido_repository.dart';
import 'package:pharma_app/app/modules/listaPedidoUsuario/listaPedidoUsuario_controller.dart';

class ListaPedidoUsuarioBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListaPedidoUsuarioController>(
        () => ListaPedidoUsuarioController());
    Get.lazyPut<PedidoRepository>(() => PedidoRepository());
    Get.lazyPut<PedidoApi>(() => PedidoApi());
  }
}
