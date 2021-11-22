import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/data/repository/carrinhoProduto_repository.dart';
import 'package:pharma_app/app/data/repository/endereco_repository.dart';
import 'package:pharma_app/app/data/repository/listaFarmacia_repository.dart';
import 'package:pharma_app/app/global/controller/global_controller.dart';
import 'package:pharma_app/app/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaController extends GetxController with StateMixin {
  final repository = Get.find<listaFarmaciaRepository>();
  var info = ''.obs;
  var id = 0;
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
      if (value == '') change(value, status: RxStatus.empty());
    });
    getPreferences();
  }

  //Pegar o nome do usuario logado no aplicativo
  getPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nome = prefs.getString('name').toString();
    id = prefs.getInt('id')!;
    info(nome);
  }

  void sairAplicativo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    CarrinhoProdutoRepository repCarrinho = CarrinhoProdutoRepository();
    EnderecoRepository repEndereco = EnderecoRepository();
    repEndereco.esvaziarEndereco();
    repCarrinho.esvaziarCarrinho();
    pref.clear();
    Get.offAllNamed(Routes.INITIAL);
  }
}
