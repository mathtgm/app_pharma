import 'package:get/get.dart';
import 'package:pharma_app/app/data/provider/endereco_provider.dart';
import 'package:pharma_app/app/data/repository/endereco_repository.dart';
import 'package:pharma_app/app/modules/formEndereco/formEndereco_controller.dart';

class FormEnderecoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormEnderecoController>(() => FormEnderecoController());
    Get.lazyPut<EnderecoApi>(() => EnderecoApi());
    Get.lazyPut<EnderecoRepository>(() => EnderecoRepository());
  }
}
