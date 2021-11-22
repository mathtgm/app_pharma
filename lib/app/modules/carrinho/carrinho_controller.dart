import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/data/model/modelFarmacia.dart';
import 'package:pharma_app/app/data/model/modelProdutoCarrinho.dart';
import 'package:pharma_app/app/data/repository/carrinhoProduto_repository.dart';
import 'package:pharma_app/app/data/repository/pedido_repository.dart';
import 'package:pharma_app/app/global/controller/global_controller.dart';
import 'package:pharma_app/app/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarrinhoController extends GetxController with StateMixin {
  CarrinhoProdutoRepository rep = Get.find<CarrinhoProdutoRepository>();
  PedidoRepository repPedido = Get.find<PedidoRepository>();
  //Variavel form
  final formkey = GlobalKey<FormState>();
  CurrencyTextFieldController campoTroco =
      CurrencyTextFieldController(decimalSymbol: ",", thousandSymbol: ".");

  Farmacia farm =
      Farmacia.fromMap(Get.arguments); //Converte um Map para farmacia
  var endereco = null;
  double dinheiro = 0.00;

  //Variaveis de observação
  RxString pagamento = ''.obs;
  RxDouble total = 0.00.obs;
  RxDouble totalCarrinho = 0.00.obs;
  RxDouble freteTotal = 0.00.obs;
  RxBool dinheiroFlag = false.obs;
  RxDouble troco = 0.00.obs;

  //Variavel de posição
  PositionController pos = PositionController();

  @override
  void onInit() async {
    super.onInit();
    getCarrinho();
  }

  getCarrinho() async {
    await rep.getCarrinho().then((value) {
      if (value.length < 1) {
        change(null, status: RxStatus.empty());
      } else {
        getFrete();
        calcularTotal(value);
        getTroco();
        change(value, status: RxStatus.success());
      }
    });
  }

  void getFrete() {
    if (endereco != null) {
      var distancia = (pos.getDistancia(double.parse(endereco.lat),
                  double.parse(endereco.long), farm.lat, farm.long) /
              1000)
          .toStringAsFixed(0);
      freteTotal.value = pos.getFrete(double.parse(distancia), farm.frete);
    }
  }

  void calcularTotal(List value) {
    total.value = 0;
    totalCarrinho.value = 0;
    for (ProdutoCarrinho item in value) {
      totalCarrinho.value += item.valor_total;
    }
    total.value = freteTotal.value + totalCarrinho.value;
  }

  void getTroco() {
    dinheiro = campoTroco.doubleValue;
    troco.value = campoTroco.doubleValue - total.value;
  }

  void realizarPedido() async {
    if (endereco == null) {
      avisoFinalizacao(
          'Endereço não selecionado, por favor selecione um endereço de entrega.');
    } else if (pagamento == '') {
      avisoFinalizacao(
          'Método de pagamento não selecionado, por favor selecione um endereço de entrega.');
    } else {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<ProdutoCarrinho> prodList = await rep.getCarrinho();
      int idOrdemPedido = await repPedido.getSequence();
      repPedido.realizarPedido(
          endereco,
          total.value,
          freteTotal.value,
          pagamento.value == 'Dinheiro' ? dinheiro : 0.00,
          pagamento.value,
          prodList,
          pref.getInt('id')!,
          farm.id_farmacia!,
          idOrdemPedido);
      esvaziarCarrinho();
      Get.offNamed(Routes.listaPedidosUsuario);
    }
  }

  void esvaziarCarrinho() {
    rep.esvaziarCarrinho();
  }

  void avisoFinalizacao(String msg) {
    if (!Get.isDialogOpen!) {
      Get.defaultDialog(title: 'Erro ao finalizar o pedido', middleText: msg);
    }
  }
}
