import 'dart:convert';

class PedidoOrdem {
  int id_ordempedido;
  double totalpedido;
  String enderecoentrega;
  double frete;
  int id_usuario;
  int id_farmacia;
  String? dataentrega;
  String? datapedido;
  double? troco;
  String metodopagamento;
  String? motivo;
  PedidoOrdem({
    required this.id_ordempedido,
    required this.totalpedido,
    required this.enderecoentrega,
    required this.frete,
    required this.id_usuario,
    required this.id_farmacia,
    required this.dataentrega,
    required this.datapedido,
    required this.troco,
    required this.metodopagamento,
    this.motivo,
  });

  PedidoOrdem copyWith({
    int? id_ordempedido,
    double? totalpedido,
    String? enderecoentrega,
    double? frete,
    int? id_usuario,
    int? id_farmacia,
    String? dataentrega,
    String? datapedido,
    double? troco,
    String? metodopagamento,
    String? motivo,
  }) {
    return PedidoOrdem(
      id_ordempedido: id_ordempedido ?? this.id_ordempedido,
      totalpedido: totalpedido ?? this.totalpedido,
      enderecoentrega: enderecoentrega ?? this.enderecoentrega,
      frete: frete ?? this.frete,
      id_usuario: id_usuario ?? this.id_usuario,
      id_farmacia: id_farmacia ?? this.id_farmacia,
      dataentrega: dataentrega ?? this.dataentrega,
      datapedido: datapedido ?? this.datapedido,
      troco: troco ?? this.troco,
      metodopagamento: metodopagamento ?? this.metodopagamento,
      motivo: motivo ?? this.motivo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_ordempedido': id_ordempedido,
      'totalpedido': totalpedido,
      'enderecoentrega': enderecoentrega,
      'frete': frete,
      'id_usuario': id_usuario,
      'id_farmacia': id_farmacia,
      'dataentrega': dataentrega,
      'datapedido': datapedido,
      'troco': troco,
      'metodopagamento': metodopagamento,
      'motivo': motivo,
    };
  }

  factory PedidoOrdem.fromMap(Map<String, dynamic> map) {
    return PedidoOrdem(
      id_ordempedido: map['id_ordempedido'],
      totalpedido: map['totalpedido'],
      enderecoentrega: map['enderecoentrega'],
      frete: map['frete'],
      id_usuario: map['id_usuario'],
      id_farmacia: map['id_farmacia'],
      dataentrega: map['dataentrega'] != null ? map['dataentrega'] : null,
      datapedido: map['datapedido'] != null ? map['datapedido'] : null,
      troco: map['troco'] != null ? map['troco'] : null,
      metodopagamento: map['metodopagamento'],
      motivo: map['motivo'] != null ? map['motivo'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PedidoOrdem.fromJson(String source) =>
      PedidoOrdem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PedidoOrdem(id_ordempedido: $id_ordempedido, totalpedido: $totalpedido, enderecoentrega: $enderecoentrega, frete: $frete, id_usuario: $id_usuario, id_farmacia: $id_farmacia, dataentrega: $dataentrega, datapedido: $datapedido, troco: $troco, metodopagamento: $metodopagamento, motivo: $motivo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PedidoOrdem &&
        other.id_ordempedido == id_ordempedido &&
        other.totalpedido == totalpedido &&
        other.enderecoentrega == enderecoentrega &&
        other.frete == frete &&
        other.id_usuario == id_usuario &&
        other.id_farmacia == id_farmacia &&
        other.dataentrega == dataentrega &&
        other.datapedido == datapedido &&
        other.troco == troco &&
        other.metodopagamento == metodopagamento &&
        other.motivo == motivo;
  }

  @override
  int get hashCode {
    return id_ordempedido.hashCode ^
        totalpedido.hashCode ^
        enderecoentrega.hashCode ^
        frete.hashCode ^
        id_usuario.hashCode ^
        id_farmacia.hashCode ^
        dataentrega.hashCode ^
        datapedido.hashCode ^
        troco.hashCode ^
        metodopagamento.hashCode ^
        motivo.hashCode;
  }
}
