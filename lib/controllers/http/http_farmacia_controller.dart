import 'package:get/get.dart';
import 'package:pharma_app/controllers/interface/Inter_Farmacia.dart';

class HttpController extends GetxController with StateMixin {
  final IFarmaciaRepository _httpFarmaciaRepository;

  HttpController(this._httpFarmaciaRepository);

  @override
  void onInit() {
    super.onInit();
    findUsers();
  }

  Future<void> findUsers() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _httpFarmaciaRepository.findAllUsers();
      change(dados, status: RxStatus.success());
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Error ao buscar as Farmacias'));
    }
  }
}
