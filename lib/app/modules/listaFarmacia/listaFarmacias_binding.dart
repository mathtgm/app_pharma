import 'package:get/get.dart';
import 'package:pharma_app/app/data/provider/listaFarmacias_provider.dart';
import 'package:pharma_app/app/data/repository/listaFarmacia_repository.dart';
import 'package:pharma_app/app/modules/listaFarmacia/listaFarmacias_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class listaFarmaciasBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListaController>(() => ListaController());
    Get.lazyPut<listaFarmaciaRepository>(() => listaFarmaciaRepository());
    Get.lazyPut<ListaApiClient>(() => ListaApiClient());
  }
}
