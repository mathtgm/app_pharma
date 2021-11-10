import 'dart:convert';

class ProdutoCarrinho {
  int? id_pedido;
  int quantidade;
  double valor_total;
  int id_produto;
  int id_farmacia;
  int id_usuario;
  ProdutoCarrinho({
    this.id_pedido,
    required this.quantidade,
    required this.valor_total,
    required this.id_produto,
    required this.id_farmacia,
    required this.id_usuario,
  });

  ProdutoCarrinho copyWith({
    int? id_pedido,
    int? quantidade,
    double? valor_total,
    int? id_produto,
    int? id_farmacia,
    int? id_usuario,
  }) {
    return ProdutoCarrinho(
      id_pedido: id_pedido ?? this.id_pedido,
      quantidade: quantidade ?? this.quantidade,
      valor_total: valor_total ?? this.valor_total,
      id_produto: id_produto ?? this.id_produto,
      id_farmacia: id_farmacia ?? this.id_farmacia,
      id_usuario: id_usuario ?? this.id_usuario,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_pedido': id_pedido == null ? 0 : id_pedido,
      'quantidade': quantidade,
      'valor_total': valor_total,
      'id_produto': id_produto,
      'id_farmacia': id_farmacia,
      'id_usuario': id_usuario,
    };
  }

  factory ProdutoCarrinho.fromMap(Map<dynamic, dynamic> map) {
    return ProdutoCarrinho(
      id_pedido: map['id_pedido'],
      quantidade: map['quantidade'],
      valor_total: map['valor_total'],
      id_produto: map['id_produto'],
      id_farmacia: map['id_farmacia'],
      id_usuario: map['id_usuario'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdutoCarrinho.fromJson(String source) =>
      ProdutoCarrinho.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProdutoCarrinho(id_pedido: $id_pedido, quantidade: $quantidade, valor_total: $valor_total, id_produto: $id_produto, id_farmacia: $id_farmacia, id_usuario: $id_usuario)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProdutoCarrinho &&
        other.id_pedido == id_pedido &&
        other.quantidade == quantidade &&
        other.valor_total == valor_total &&
        other.id_produto == id_produto &&
        other.id_farmacia == id_farmacia &&
        other.id_usuario == id_usuario;
  }

  @override
  int get hashCode {
    return id_pedido.hashCode ^
        quantidade.hashCode ^
        valor_total.hashCode ^
        id_produto.hashCode ^
        id_farmacia.hashCode ^
        id_usuario.hashCode;
  }
}
