import 'dart:convert';

class ProdutoCarrinho {
  int quantidade;
  double valor_total;
  int id_produto;
  String nomeProd;
  String descricao;
  int id_farmacia;
  ProdutoCarrinho({
    required this.quantidade,
    required this.valor_total,
    required this.id_produto,
    required this.nomeProd,
    required this.descricao,
    required this.id_farmacia,
  });

  ProdutoCarrinho copyWith({
    int? quantidade,
    double? valor_total,
    int? id_produto,
    String? nomeProd,
    String? descricao,
    int? id_farmacia,
  }) {
    return ProdutoCarrinho(
      quantidade: quantidade ?? this.quantidade,
      valor_total: valor_total ?? this.valor_total,
      id_produto: id_produto ?? this.id_produto,
      nomeProd: nomeProd ?? this.nomeProd,
      descricao: descricao ?? this.descricao,
      id_farmacia: id_farmacia ?? this.id_farmacia,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quantidade': quantidade,
      'valor_total': valor_total,
      'id_produto': id_produto,
      'nomeProd': nomeProd,
      'descricao': descricao,
      'id_farmacia': id_farmacia,
    };
  }

  factory ProdutoCarrinho.fromMap(Map<String, dynamic> map) {
    return ProdutoCarrinho(
      quantidade: map['quantidade'],
      valor_total: map['valor_total'],
      id_produto: map['id_produto'],
      nomeProd: map['nomeProd'],
      descricao: map['descricao'],
      id_farmacia: map['id_farmacia'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdutoCarrinho.fromJson(String source) =>
      ProdutoCarrinho.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProdutoCarrinho(quantidade: $quantidade, valor_total: $valor_total, id_produto: $id_produto, nomeProd: $nomeProd, descricao: $descricao, id_farmacia: $id_farmacia)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProdutoCarrinho &&
        other.quantidade == quantidade &&
        other.valor_total == valor_total &&
        other.id_produto == id_produto &&
        other.nomeProd == nomeProd &&
        other.descricao == descricao &&
        other.id_farmacia == id_farmacia;
  }

  @override
  int get hashCode {
    return quantidade.hashCode ^
        valor_total.hashCode ^
        id_produto.hashCode ^
        nomeProd.hashCode ^
        descricao.hashCode ^
        id_farmacia.hashCode;
  }
}
