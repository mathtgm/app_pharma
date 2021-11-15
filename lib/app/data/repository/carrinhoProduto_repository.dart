import 'package:pharma_app/app/data/model/modelProdutoCarrinho.dart';
import 'package:pharma_app/app/data/provider/carrinho_provider.dart';

class CarrinhoProdutoRepository {
  final ProdutoCarrinhoApi api = ProdutoCarrinhoApi();

  void addProduto(int quantProduto, double total, int id_usuario,
      int id_farmacia, int id_produto, String nomeProd) async {
    bool prodIgual = false;
    List<ProdutoCarrinho> list = [];
    ProdutoCarrinho pedido = ProdutoCarrinho(
        quantidade: quantProduto,
        valor_total: total,
        id_produto: id_produto,
        id_farmacia: id_farmacia,
        id_usuario: id_usuario,
        nomeProd: nomeProd);

    list = await getCarrinho();
    for (ProdutoCarrinho item in list) {
      if (pedido.id_produto == item.id_produto) {
        prodIgual = true;
        pedido.quantidade += item.quantidade;
        pedido.valor_total += item.valor_total;
        api.atualizarProduto(pedido);
      }
    }

    if (prodIgual == false) api.addProdutoCarrinho(pedido);
  }

  getCarrinho() async {
    var res = await api.getCarrinho();
    List<ProdutoCarrinho> list = [];
    if (res != '') {
      res.forEach((element) {
        list.add(ProdutoCarrinho.fromMap(element));
      });
    }
    return list;
  }
}
