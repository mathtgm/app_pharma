import 'dart:convert';

class Produto {
  int id_produto;
  String nome;
  String? descricao;
  double preco_unid;
  String? imagem;
  int id_farmacia;
  Produto({
    required this.id_produto,
    required this.nome,
    required this.descricao,
    required this.preco_unid,
    required this.imagem,
    required this.id_farmacia,
  });

  Produto copyWith({
    int? id_produto,
    String? nome,
    String? descricao,
    double? preco_unid,
    String? imagem,
    int? id_farmacia,
  }) {
    return Produto(
      id_produto: id_produto ?? this.id_produto,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
      preco_unid: preco_unid ?? this.preco_unid,
      imagem: imagem ?? this.imagem,
      id_farmacia: id_farmacia ?? this.id_farmacia,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_produto': id_produto,
      'nome': nome,
      'descricao': descricao,
      'preco_unid': preco_unid,
      'imagem': imagem,
      'id_farmacia': id_farmacia,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      id_produto: map['id_produto'],
      nome: map['nome'],
      descricao: map['descricao'] != null ? map['descricao'] : null,
      preco_unid: map['preco_unid'] is double
          ? map['preco_unid']
          : double.parse(map['preco_unid']),
      imagem: map['imagem'] != null ? map['imagem'] : null,
      id_farmacia: map['id_farmacia'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Produto.fromJson(String source) =>
      Produto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Produto(id_produto: $id_produto, nome: $nome, descricao: $descricao, preco_unid: $preco_unid, imagem: $imagem, id_farmacia: $id_farmacia)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Produto &&
        other.id_produto == id_produto &&
        other.nome == nome &&
        other.descricao == descricao &&
        other.preco_unid == preco_unid &&
        other.imagem == imagem &&
        other.id_farmacia == id_farmacia;
  }

  @override
  int get hashCode {
    return id_produto.hashCode ^
        nome.hashCode ^
        descricao.hashCode ^
        preco_unid.hashCode ^
        imagem.hashCode ^
        id_farmacia.hashCode;
  }
}
