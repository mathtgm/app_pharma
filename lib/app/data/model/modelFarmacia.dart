import 'dart:convert';

class Farmacia {
  int id_farmacia;
  String nome_fantasia;
  String cnpj;
  String telefone;
  String endereco;
  String numero;
  String bairro;
  String data_cad;
  String cidade;
  String estado;
  String nota;

  Farmacia({
    required this.id_farmacia,
    required this.nome_fantasia,
    required this.cnpj,
    required this.telefone,
    required this.endereco,
    required this.numero,
    required this.bairro,
    required this.data_cad,
    required this.cidade,
    required this.estado,
    required this.nota,
  });

  Farmacia copyWith({
    int? id_farmacia,
    String? nome_fantasia,
    String? cnpj,
    String? telefone,
    String? endereco,
    String? numero,
    String? bairro,
    String? data_cad,
    String? cidade,
    String? estado,
    String? nota,
  }) {
    return Farmacia(
      id_farmacia: id_farmacia ?? this.id_farmacia,
      nome_fantasia: nome_fantasia ?? this.nome_fantasia,
      cnpj: cnpj ?? this.cnpj,
      telefone: telefone ?? this.telefone,
      endereco: endereco ?? this.endereco,
      numero: numero ?? this.numero,
      bairro: bairro ?? this.bairro,
      data_cad: data_cad ?? this.data_cad,
      cidade: cidade ?? this.cidade,
      estado: estado ?? this.estado,
      nota: nota ?? this.nota,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_farmacia': id_farmacia,
      'nome_fantasia': nome_fantasia,
      'cnpj': cnpj,
      'telefone': telefone,
      'endereco': endereco,
      'numero': numero,
      'bairro': bairro,
      'data_cad': data_cad,
      'cidade': cidade,
      'estado': estado,
      'nota': nota,
    };
  }

  factory Farmacia.fromMap(Map<String, dynamic> map) {
    return Farmacia(
      id_farmacia: map['id_farmacia'],
      nome_fantasia: map['nome_fantasia'],
      cnpj: map['cnpj'],
      telefone: map['telefone'],
      endereco: map['endereco'],
      numero: map['numero'],
      bairro: map['bairro'],
      data_cad: map['data_cad'],
      cidade: map['cidade'],
      estado: map['estado'],
      nota: map['nota'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Farmacia.fromJson(String source) =>
      Farmacia.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Farmacia(id_farmacia: $id_farmacia, nome_fantasia: $nome_fantasia, cnpj: $cnpj, telefone: $telefone, endereco: $endereco, numero: $numero, bairro: $bairro, data_cad: $data_cad, cidade: $cidade, estado: $estado, nota: $nota)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Farmacia &&
        other.id_farmacia == id_farmacia &&
        other.nome_fantasia == nome_fantasia &&
        other.cnpj == cnpj &&
        other.telefone == telefone &&
        other.endereco == endereco &&
        other.numero == numero &&
        other.bairro == bairro &&
        other.data_cad == data_cad &&
        other.cidade == cidade &&
        other.estado == estado &&
        other.nota == nota;
  }

  @override
  int get hashCode {
    return id_farmacia.hashCode ^
        nome_fantasia.hashCode ^
        cnpj.hashCode ^
        telefone.hashCode ^
        endereco.hashCode ^
        numero.hashCode ^
        bairro.hashCode ^
        data_cad.hashCode ^
        cidade.hashCode ^
        estado.hashCode ^
        nota.hashCode;
  }
}
