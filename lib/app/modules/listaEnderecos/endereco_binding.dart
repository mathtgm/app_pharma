import 'package:get/get.dart';
import 'package:pharma_app/app/data/provider/endereco_provider.dart';
import 'package:pharma_app/app/data/repository/endereco_repository.dart';
import 'package:pharma_app/app/modules/listaEnderecos/endereco_controller.dart';

class EnderecoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnderecoController>(() => EnderecoController());
    Get.lazyPut<EnderecoApi>(() => EnderecoApi());
    Get.lazyPut<EnderecoRepository>(() => EnderecoRepository());
  }
}
