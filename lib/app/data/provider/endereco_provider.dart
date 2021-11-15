import 'dart:io';

import 'package:pharma_app/app/data/model/modelEndereco.dart';
import 'package:sqflite/sqflite.dart';
import 'package:get/get.dart';

class EnderecoApi extends GetConnect {
  static final _databaseName = 'dbEndereco.db';
  static final _databaseVersion = 1;

  static final table = 'endereco';

  static final endereco = 'endereco';
  static final numero = 'numero';
  static final bairro = 'bairro';
  static final complemento = 'complemento';
  static final lat = 'lat';
  static final long = 'long';
  static final idEndereco = 'id_endereco';

  late Database db;

  Future open() async {
    var databasesPath = await getDatabasesPath();
    await Directory(databasesPath).create(recursive: true);
    var path = (databasesPath + '/' + _databaseName);

    db = await openDatabase(path, version: _databaseVersion,
        onCreate: (Database db, int version) async {
      await db.execute('''
        create table $table (
          $idEndereco INTEGER PRIMARY KEY AUTOINCREMENT,
          $endereco varchar not null,
          $numero varchar not null,
          $bairro varchar not null,
          $complemento varchar,
          $lat varchar not null,
          $long varchar not null
        )''');
    });
  }

  Future<void> addEndereco(Endereco endereco) async {
    await open();

    await db.insert(
      table,
      endereco.toMap(),
    );
    close();
  }

  getEndereco() async {
    await open();

    List<Map> maps = await db.query(
      table,
    );
    if (maps.length > 0) {
      close();
      return maps;
    }
    close();
    return '';
  }

  updateEndereco(Map<String, Object?> endereco) async {
    await open();
    await db.update(table, endereco,
        where: '$idEndereco == ?', whereArgs: [endereco['id_endereco']]);
    close();
  }

  deleteEndereco(int id) async {
    await open();

    await db.delete(table, where: '$idEndereco == ?', whereArgs: [id]);
    close();
  }

  void close() async {
    db.close();
  }
}
