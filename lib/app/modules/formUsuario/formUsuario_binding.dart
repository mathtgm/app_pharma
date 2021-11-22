import 'package:get/get.dart';
import 'package:pharma_app/app/data/provider/usuario_provider.dart';
import 'package:pharma_app/app/data/repository/usuario_repository.dart';
import 'package:pharma_app/app/modules/formUsuario/formUsuario_controller.dart';

class FormUsuarioBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormUsuarioController>(() => FormUsuarioController());
    Get.lazyPut<UsuarioRepository>(() => UsuarioRepository());
    Get.lazyPut<UsuarioApi>(() => UsuarioApi());
  }
}
