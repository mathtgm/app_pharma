import 'dart:io';

import 'package:pharma_app/app/data/model/modelProdutoCarrinho.dart';
import 'package:sqflite/sqflite.dart';
import 'package:get/get.dart';

class ProdutoCarrinhoApi extends GetConnect {
  static final _databaseName = 'dbPharmApp.db';
  static final _databaseVersion = 1;

  static final table = 'carrinho';

  static final idPedido = 'id_pedido';
  static final idProduto = 'id_produto';
  static final idFarmacia = 'id_farmacia';
  static final idUsuario = 'id_usuario';
  static final quantidade = 'quantidade';
  static final total = 'valor_total';

  late Database db;

  Future open() async {
    var databasesPath = await getDatabasesPath();
    await Directory(databasesPath).create(recursive: true);
    var path = (databasesPath + '/' + _databaseName);

    db = await openDatabase(path, version: _databaseVersion,
        onCreate: (Database db, int version) async {
      await db.execute('''
        create table $table ( 
          $idPedido integer not null,
          $idProduto integer not null, 
          $idFarmacia interger not null,
          $idUsuario integer not null,
          $quantidade interger not null,
          $total decimal(7,2) not null
        )''');
    });
  }

  Future<void> addProdutoCarrinho(ProdutoCarrinho produtoCarrinho) async {
    await open();

    await db.insert(
      'carrinho',
      produtoCarrinho.toMap(),
    );
  }

  getCarrinho() async {
    List<Map> maps = await db.query(
      'carrinho',
      columns: [idPedido, idFarmacia, idProduto, idUsuario, quantidade, total],
    );
    if (maps.length > 0) {
      return maps;
    }
    return '';
  }
}
