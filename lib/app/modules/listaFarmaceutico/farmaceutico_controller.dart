import 'package:get/get.dart';
import 'package:pharma_app/app/data/repository/farmaceutico_repository.dart';

class FarmaceuticoController extends GetxController with StateMixin {
  final repository = FarmaceuticoRepository();

  @override
  void onInit() {
    super.onInit();
    listaFarmaceutico(Get.arguments);
  }

  listaFarmaceutico(int idFarmacia) async {
    await repository.listaFarmaceutico(idFarmacia).then((value) {
      change(value, status: RxStatus.success());
    }).catchError((err) {
      print(err);
      if (value == null)
        change(value, status: RxStatus.empty());
      else
        change(null, status: RxStatus.error('Erro ao receber os dados.'));
    });
  }
}
