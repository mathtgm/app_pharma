import 'dart:convert';

class PedidoProduto {
  int id_ordempedido;
  int id_produto;
  String nome_produto;
  int quantidade;
  double total;
  PedidoProduto({
    required this.id_ordempedido,
    required this.id_produto,
    required this.nome_produto,
    required this.quantidade,
    required this.total,
  });

  PedidoProduto copyWith({
    int? id_ordempedido,
    int? id_produto,
    String? nome_produto,
    int? quantidade,
    double? total,
  }) {
    return PedidoProduto(
      id_ordempedido: id_ordempedido ?? this.id_ordempedido,
      id_produto: id_produto ?? this.id_produto,
      nome_produto: nome_produto ?? this.nome_produto,
      quantidade: quantidade ?? this.quantidade,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_ordempedido': id_ordempedido,
      'id_produto': id_produto,
      'nome_produto': nome_produto,
      'quantidade': quantidade,
      'total': total,
    };
  }

  factory PedidoProduto.fromMap(Map<String, dynamic> map) {
    return PedidoProduto(
      id_ordempedido: map['id_ordempedido'],
      id_produto: map['id_produto'],
      nome_produto: map['nome_produto'],
      quantidade: map['quantidade'],
      total: double.parse(map['total']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PedidoProduto.fromJson(String source) =>
      PedidoProduto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PedidoProduto(id_ordempedido: $id_ordempedido, id_produto: $id_produto, nome_produto: $nome_produto, quantidade: $quantidade, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PedidoProduto &&
        other.id_ordempedido == id_ordempedido &&
        other.id_produto == id_produto &&
        other.nome_produto == nome_produto &&
        other.quantidade == quantidade &&
        other.total == total;
  }

  @override
  int get hashCode {
    return id_ordempedido.hashCode ^
        id_produto.hashCode ^
        nome_produto.hashCode ^
        quantidade.hashCode ^
        total.hashCode;
  }
}
