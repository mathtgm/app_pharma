import 'package:get/get.dart';
import 'package:pharma_app/app/data/repository/farmaceutico_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FarmaceuticoController extends GetxController with StateMixin {
  final repository = FarmaceuticoRepository();
  int tipoUsuario = 0;
  int idFarmacia = 0;
  @override
  void onInit() async {
    super.onInit();
    await getPreferences();
    listaFarmaceutico();
  }

  listaFarmaceutico() async {
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

  getPreferences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    tipoUsuario = pref.getInt('tipo')!;
    idFarmacia = pref.getInt('id')!;
  }
}
