import 'dart:io';

import 'package:pharma_app/app/data/model/modelProdutoCarrinho.dart';
import 'package:sqflite/sqflite.dart';
import 'package:get/get.dart';

class ProdutoCarrinhoApi extends GetConnect {
  static final _databaseName = 'dbCarrinho.db';
  static final _databaseVersion = 1;

  static final table = 'carrinho';

  static final idProduto = 'id_produto';
  static final idFarmacia = 'id_farmacia';
  static final descricao = 'descricao';
  static final quantidade = 'quantidade';
  static final total = 'valor_total';
  static final nomeProduto = 'nomeProd';

  late Database db;

  Future open() async {
    var databasesPath = await getDatabasesPath();
    await Directory(databasesPath).create(recursive: true);
    var path = (databasesPath + '/' + _databaseName);

    db = await openDatabase(path, version: _databaseVersion,
        onCreate: (Database db, int version) async {
      await db.execute('''
        create table $table ( 
          $idProduto integer not null, 
          $idFarmacia interger not null,
          $descricao varchar not null,
          $quantidade interger not null,
          $total real not null,
          $nomeProduto varchar not null
        )''');
    });
  }

  Future<void> addProdutoCarrinho(ProdutoCarrinho produtoCarrinho) async {
    await open();

    await db.insert(
      'carrinho',
      produtoCarrinho.toMap(),
    );
    db.close();
  }

  Future<void> atualizarProduto(ProdutoCarrinho pedido) async {
    await open();

    await db.update(table, pedido.toMap(),
        where: 'id_produto == ?', whereArgs: [pedido.id_produto]);

    db.close();
  }

  getCarrinho() async {
    await open();

    List<Map> maps = await db.query(
      table,
      columns: [
        idFarmacia,
        idProduto,
        descricao,
        quantidade,
        total,
        nomeProduto
      ],
    );
    if (maps.length > 0) {
      db.close();
      return maps;
    }
    db.close();
    return '';
  }

  Future<void> removerProduto(int prod) async {
    await open();

    await db.delete(table, where: 'id_produto == ?', whereArgs: [prod]);

    db.close();
  }

  Future<void> esvaziarCarrinho() async {
    await open();
    db.execute('DELETE FROM $table;');
    db.close();
  }
}
