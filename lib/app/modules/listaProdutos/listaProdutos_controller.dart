import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/data/repository/listaProdutos_repository.dart';
import 'package:pharma_app/app/global/controller/global_controller.dart';

class ListaProdutosController extends GetxController with StateMixin {
  final repository = Get.find<ListaProdutosRepository>();
  PositionController location = PositionController();
  late Position distUser;
  @override
  void onInit() async {
    super.onInit();
    distUser = await location.getPosition();
    listarFarmaciasProdutos(Get.arguments);
  }

  listarFarmaciasProdutos(Map farmacia) async {
    await repository.listaProdutos(farmacia['id_farmacia']).then((value) {
      change(value, status: RxStatus.success());
    }).catchError((err) {
      print(err);
      if (value == null)
        change(value, status: RxStatus.empty());
      else
        change(value, status: RxStatus.error('Erro ao receber os dados.'));
    });
  }
}
