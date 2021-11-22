import 'dart:convert';

class Farmacia {
  int? id_farmacia;
  String nome_fantasia;
  String email;
  String? senha;
  String cnpj;
  String telefone;
  String endereco;
  String numero;
  String bairro;
  String? cidade;
  String? estado;
  double lat;
  double long;
  String? foto;
  bool? aberto;
  String tempo;
  double frete;

  Farmacia({
    this.id_farmacia,
    required this.nome_fantasia,
    required this.email,
    this.senha,
    required this.cnpj,
    required this.telefone,
    required this.endereco,
    required this.numero,
    required this.bairro,
    this.cidade,
    this.estado,
    required this.lat,
    required this.long,
    this.foto,
    this.aberto,
    required this.tempo,
    required this.frete,
  });

  Farmacia copyWith({
    int? id_farmacia,
    String? nome_fantasia,
    String? email,
    String? senha,
    String? cnpj,
    String? telefone,
    String? endereco,
    String? numero,
    String? bairro,
    String? cidade,
    String? estado,
    double? lat,
    double? long,
    String? foto,
    bool? aberto,
    String? tempo,
    double? frete,
  }) {
    return Farmacia(
      id_farmacia: id_farmacia ?? this.id_farmacia,
      nome_fantasia: nome_fantasia ?? this.nome_fantasia,
      email: email ?? this.email,
      senha: senha ?? this.senha,
      cnpj: cnpj ?? this.cnpj,
      telefone: telefone ?? this.telefone,
      endereco: endereco ?? this.endereco,
      numero: numero ?? this.numero,
      bairro: bairro ?? this.bairro,
      cidade: cidade ?? this.cidade,
      estado: estado ?? this.estado,
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
      'email': email,
      'senha': senha,
      'cnpj': cnpj,
      'telefone': telefone,
      'endereco': endereco,
      'numero': numero,
      'bairro': bairro,
      'cidade': cidade,
      'estado': estado,
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
      id_farmacia: map['id_farmacia'] != null ? map['id_farmacia'] : null,
      nome_fantasia: map['nome_fantasia'],
      email: map['email'],
      senha: map['senha'] != null ? map['senha'] : null,
      cnpj: map['cnpj'],
      telefone: map['telefone'],
      endereco: map['endereco'],
      numero: map['numero'],
      bairro: map['bairro'],
      cidade: map['cidade'] != null ? map['cidade'] : null,
      estado: map['estado'] != null ? map['estado'] : null,
      lat: map['lat'],
      long: map['long'],
      foto: map['foto'] != null ? map['foto'] : null,
      aberto: map['aberto'] != null ? map['aberto'] : null,
      tempo: map['tempo'],
      frete: map['frete'] is String ? double.parse(map['frete']) : map['frete'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Farmacia.fromJson(String source) =>
      Farmacia.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Farmacia(id_farmacia: $id_farmacia, nome_fantasia: $nome_fantasia, email: $email, senha: $senha, cnpj: $cnpj, telefone: $telefone, endereco: $endereco, numero: $numero, bairro: $bairro, cidade: $cidade, estado: $estado, lat: $lat, long: $long, foto: $foto, aberto: $aberto, tempo: $tempo, frete: $frete)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Farmacia &&
        other.id_farmacia == id_farmacia &&
        other.nome_fantasia == nome_fantasia &&
        other.email == email &&
        other.senha == senha &&
        other.cnpj == cnpj &&
        other.telefone == telefone &&
        other.endereco == endereco &&
        other.numero == numero &&
        other.bairro == bairro &&
        other.cidade == cidade &&
        other.estado == estado &&
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
        email.hashCode ^
        senha.hashCode ^
        cnpj.hashCode ^
        telefone.hashCode ^
        endereco.hashCode ^
        numero.hashCode ^
        bairro.hashCode ^
        cidade.hashCode ^
        estado.hashCode ^
        lat.hashCode ^
        long.hashCode ^
        foto.hashCode ^
        aberto.hashCode ^
        tempo.hashCode ^
        frete.hashCode;
  }
}
