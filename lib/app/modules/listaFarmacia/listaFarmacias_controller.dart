import 'package:get/get.dart';
import 'package:pharma_app/app/data/repository/listaFarmacia_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaController extends GetxController with StateMixin {
  final repository = Get.find<listaFarmaciaRepository>();

  @override
  void onInit() {
    super.onInit();
    listarFarmacias();
  }

  listarFarmacias() async {
    await repository.listaFarmacias('Araras', 'SP').then((value) {
      change(value, status: RxStatus.success());
    }).catchError((err) {
      print(err);
      if (value == null)
        change(value, status: RxStatus.empty());
      else
        change(null, status: RxStatus.error('Erro ao receber os dados.'));
    });
  }

  getPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map user = {'id': prefs.get('id'), 'nome': prefs.get('nome')};
    return user;
  }
}
