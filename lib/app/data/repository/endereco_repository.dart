import 'package:pharma_app/app/data/model/modelEndereco.dart';
import 'package:pharma_app/app/data/provider/endereco_provider.dart';

class EnderecoRepository {
  final EnderecoApi api = EnderecoApi();

  getEndereco() async {
    var resp = await api.getEndereco();
    List<Endereco> list = [];
    if (resp == '') {
      return resp;
    } else {
      resp.forEach((element) {
        list.add(Endereco.fromMap(element));
      });

      return list;
    }
  }

  setEndereco(Endereco end) async {
    await api.addEndereco(end);
  }

  updateEndereco(Endereco endereco) async {
    await api.updateEndereco(endereco.toMap());
  }

  deleteEndereco(int idEndereco) async {
    await api.deleteEndereco(idEndereco);
  }
}
