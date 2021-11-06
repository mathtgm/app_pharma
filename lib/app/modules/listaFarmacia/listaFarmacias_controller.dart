import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/data/repository/listaFarmacia_repository.dart';
import 'package:pharma_app/app/global/controller/global_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaController extends GetxController with StateMixin {
  final repository = Get.find<listaFarmaciaRepository>();
  var info = ''.obs;
  PositionController location = PositionController();
  late Position distUser;

  @override
  Future<void> onInit() async {
    super.onInit();
    distUser = await location.getPosition();
    listarFarmacias();
  }

  listarFarmacias() async {
    var posUser = await location.getPosition();
    String cidade = await location.getCidade(posUser);
    String estado = await location.getEstado(posUser);
    await repository.listaFarmacias(cidade, estado).then((value) {
      change(value, status: RxStatus.success());
    }).catchError((err) {
      print(err);
      if (value == null)
        change(value, status: RxStatus.empty());
      else
        change(null, status: RxStatus.error('Erro ao receber os dados.'));
    });
    getPreferences();
  }

  //Pegar o nome do usuario logado no aplicativo
  getPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nome = prefs.getString('name').toString();
    info(nome);
  }
}
