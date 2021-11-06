import 'dart:convert';

class Farmacia {
  int id_farmacia;
  String nome_fantasia;
  String telefone;
  String endereco;
  String numero;
  String bairro;
  String data_cad;
  String cidade;
  String estado;
  String nota;
  double lat;
  double long;
  String? foto;
  bool aberto;
  String tempo;
  String frete;

  Farmacia({
    required this.id_farmacia,
    required this.nome_fantasia,
    required this.telefone,
    required this.endereco,
    required this.numero,
    required this.bairro,
    required this.data_cad,
    required this.cidade,
    required this.estado,
    required this.nota,
    required this.lat,
    required this.long,
    required this.foto,
    required this.aberto,
    required this.tempo,
    required this.frete,
  });

  Farmacia copyWith({
    int? id_farmacia,
    String? nome_fantasia,
    String? telefone,
    String? endereco,
    String? numero,
    String? bairro,
    String? data_cad,
    String? cidade,
    String? estado,
    String? nota,
    double? lat,
    double? long,
    String? foto,
    bool? aberto,
    String? tempo,
    String? frete,
  }) {
    return Farmacia(
      id_farmacia: id_farmacia ?? this.id_farmacia,
      nome_fantasia: nome_fantasia ?? this.nome_fantasia,
      telefone: telefone ?? this.telefone,
      endereco: endereco ?? this.endereco,
      numero: numero ?? this.numero,
      bairro: bairro ?? this.bairro,
      data_cad: data_cad ?? this.data_cad,
      cidade: cidade ?? this.cidade,
      estado: estado ?? this.estado,
      nota: nota ?? this.nota,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      foto: foto ?? this.foto,
      aberto: aberto ?? this.aberto,
      tempo: tempo ?? this.tempo,
      frete: frete ?? this.frete,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_farmacia': id_farmacia,
      'nome_fantasia': nome_fantasia,
      'telefone': telefone,
      'endereco': endereco,
      'numero': numero,
      'bairro': bairro,
      'data_cad': data_cad,
      'cidade': cidade,
      'estado': estado,
      'nota': nota,
      'lat': lat,
      'long': long,
      'foto': foto,
      'aberto': aberto,
      'tempo': tempo,
      'frete': frete,
    };
  }

  factory Farmacia.fromMap(Map<String, dynamic> map) {
    return Farmacia(
      id_farmacia: map['id_farmacia'],
      nome_fantasia: map['nome_fantasia'],
      telefone: map['telefone'],
      endereco: map['endereco'],
      numero: map['numero'],
      bairro: map['bairro'],
      data_cad: map['data_cad'],
      cidade: map['cidade'],
      estado: map['estado'],
      nota: map['nota'],
      lat: map['lat'],
      long: map['long'],
      foto: map['foto'] != null ? map['foto'] : null,
      aberto: map['aberto'],
      tempo: map['tempo'],
      frete: map['frete'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Farmacia.fromJson(String source) =>
      Farmacia.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Farmacia(id_farmacia: $id_farmacia, nome_fantasia: $nome_fantasia, telefone: $telefone, endereco: $endereco, numero: $numero, bairro: $bairro, data_cad: $data_cad, cidade: $cidade, estado: $estado, nota: $nota, lat: $lat, long: $long, foto: $foto, aberto: $aberto, tempo: $tempo, frete: $frete)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Farmacia &&
        other.id_farmacia == id_farmacia &&
        other.nome_fantasia == nome_fantasia &&
        other.telefone == telefone &&
        other.endereco == endereco &&
        other.numero == numero &&
        other.bairro == bairro &&
        other.data_cad == data_cad &&
        other.cidade == cidade &&
        other.estado == estado &&
        other.nota == nota &&
        other.lat == lat &&
        other.long == long &&
        other.foto == foto &&
        other.aberto == aberto &&
        other.tempo == tempo &&
        other.frete == frete;
  }

  @override
  int get hashCode {
    return id_farmacia.hashCode ^
        nome_fantasia.hashCode ^
        telefone.hashCode ^
        endereco.hashCode ^
        numero.hashCode ^
        bairro.hashCode ^
        data_cad.hashCode ^
        cidade.hashCode ^
        estado.hashCode ^
        nota.hashCode ^
        lat.hashCode ^
        long.hashCode ^
        foto.hashCode ^
        aberto.hashCode ^
        tempo.hashCode ^
        frete.hashCode;
  }
}
