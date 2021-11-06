import 'dart:convert';

class Produto {
  int id_produto;
  String nome;
  String? descricao;
  String tipo_produto;
  String preco_unid;
  String? imagem;
  Produto({
    required this.id_produto,
    required this.nome,
    required this.descricao,
    required this.tipo_produto,
    required this.preco_unid,
    required this.imagem,
  });

  Produto copyWith({
    int? id_produto,
    String? nome,
    String? descricao,
    String? tipo_produto,
    String? preco_unid,
    String? imagem,
  }) {
    return Produto(
      id_produto: id_produto ?? this.id_produto,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
      tipo_produto: tipo_produto ?? this.tipo_produto,
      preco_unid: preco_unid ?? this.preco_unid,
      imagem: imagem ?? this.imagem,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_produto': id_produto,
      'nome': nome,
      'descricao': descricao,
      'tipo_produto': tipo_produto,
      'preco_unid': preco_unid,
      'imagem': imagem,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      id_produto: map['id_produto'],
      nome: map['nome'],
      descricao: map['descricao'] != null ? map['descricao'] : null,
      tipo_produto: map['tipo_produto'],
      preco_unid: map['preco_unid'],
      imagem: map['imagem'] != null ? map['imagem'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Produto.fromJson(String source) =>
      Produto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Produto(id_produto: $id_produto, nome: $nome, descricao: $descricao, tipo_produto: $tipo_produto, preco_unid: $preco_unid, imagem: $imagem)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Produto &&
        other.id_produto == id_produto &&
        other.nome == nome &&
        other.descricao == descricao &&
        other.tipo_produto == tipo_produto &&
        other.preco_unid == preco_unid &&
        other.imagem == imagem;
  }

  @override
  int get hashCode {
    return id_produto.hashCode ^
        nome.hashCode ^
        descricao.hashCode ^
        tipo_produto.hashCode ^
        preco_unid.hashCode ^
        imagem.hashCode;
  }
}
