import 'dart:convert';

class Endereco {
  int? id_endereco;
  String endereco;
  String numero;
  String bairro;
  String? complemento;
  var lat;
  var long;

  Endereco({
    this.id_endereco,
    required this.endereco,
    required this.numero,
    required this.bairro,
    required this.complemento,
    required this.lat,
    required this.long,
  });

  Endereco copyWith({
    int? id_endereco,
    String? endereco,
    String? numero,
    String? bairro,
    String? complemento,
    double? lat,
    double? long,
  }) {
    return Endereco(
      id_endereco: id_endereco ?? this.id_endereco,
      endereco: endereco ?? this.endereco,
      numero: numero ?? this.numero,
      bairro: bairro ?? this.bairro,
      complemento: complemento ?? this.complemento,
      lat: lat ?? this.lat,
      long: long ?? this.long,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_endereco': id_endereco,
      'endereco': endereco,
      'numero': numero,
      'bairro': bairro,
      'complemento': complemento,
      'lat': lat,
      'long': long,
    };
  }

  factory Endereco.fromMap(Map<String, dynamic> map) {
    return Endereco(
      id_endereco: map['id_endereco'] != null ? map['id_endereco'] : null,
      endereco: map['endereco'],
      numero: map['numero'],
      bairro: map['bairro'],
      complemento: map['complemento'] != null ? map['complemento'] : null,
      lat: map['lat'],
      long: map['long'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Endereco.fromJson(String source) =>
      Endereco.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Endereco(id_endereco: $id_endereco, endereco: $endereco, numero: $numero, bairro: $bairro, complemento: $complemento, lat: $lat, long: $long)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Endereco &&
        other.id_endereco == id_endereco &&
        other.endereco == endereco &&
        other.numero == numero &&
        other.bairro == bairro &&
        other.complemento == complemento &&
        other.lat == lat &&
        other.long == long;
  }

  @override
  int get hashCode {
    return id_endereco.hashCode ^
        endereco.hashCode ^
        numero.hashCode ^
        bairro.hashCode ^
        complemento.hashCode ^
        lat.hashCode ^
        long.hashCode;
  }
}
