import 'package:get/get.dart';
import 'package:pharma_app/app/data/repository/endereco_repository.dart';

class EnderecoController extends GetxController with StateMixin {
  EnderecoRepository rep = EnderecoRepository();
  @override
  void onInit() {
    super.onInit();
    getEndereco();
  }

  getEndereco() async {
    await rep.getEndereco().then((value) {
      if (value == '')
        change(value, status: RxStatus.empty());
      else
        change(value, status: RxStatus.success());
    });
  }
}
