import 'dart:convert';

import 'package:pharma_app/app/data/provider/farmaciaPedido_provider.dart';

class FarmaciaPedidoRepository {
  FarmaciaPedidoApi api = FarmaciaPedidoApi();

  getPedidoDisponivel(int idFarmacia) async {
    var res = await api.getPedidoDisponivel(idFarmacia);
    if (res != '') return jsonDecode(res);
    return '';
  }
}
