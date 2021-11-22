import 'dart:convert';

class Farmaceutico {
  int? id_farmaceutico;
  int? id_farmacia;
  String nome;
  String crf;
  String telefone;
  String genero;
  Farmaceutico({
    this.id_farmaceutico,
    this.id_farmacia,
    required this.nome,
    required this.crf,
    required this.telefone,
    required this.genero,
  });

  Farmaceutico copyWith({
    int? id_farmaceutico,
    int? id_farmacia,
    String? nome,
    String? crf,
    String? telefone,
    String? genero,
  }) {
    return Farmaceutico(
      id_farmaceutico: id_farmaceutico ?? this.id_farmaceutico,
      id_farmacia: id_farmacia ?? this.id_farmacia,
      nome: nome ?? this.nome,
      crf: crf ?? this.crf,
      telefone: telefone ?? this.telefone,
      genero: genero ?? this.genero,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_farmaceutico': id_farmaceutico,
      'id_farmacia': id_farmacia,
      'nome': nome,
      'crf': crf,
      'telefone': telefone,
      'genero': genero,
    };
  }

  factory Farmaceutico.fromMap(Map<String, dynamic> map) {
    return Farmaceutico(
      id_farmaceutico:
          map['id_farmaceutico'] != null ? map['id_farmaceutico'] : null,
      id_farmacia: map['id_farmacia'] != null ? map['id_farmacia'] : null,
      nome: map['nome'],
      crf: map['crf'],
      telefone: map['telefone'],
      genero: map['genero'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Farmaceutico.fromJson(String source) =>
      Farmaceutico.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Farmaceutico(id_farmaceutico: $id_farmaceutico, id_farmacia: $id_farmacia, nome: $nome, crf: $crf, telefone: $telefone, genero: $genero)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Farmaceutico &&
        other.id_farmaceutico == id_farmaceutico &&
        other.id_farmacia == id_farmacia &&
        other.nome == nome &&
        other.crf == crf &&
        other.telefone == telefone &&
        other.genero == genero;
  }

  @override
  int get hashCode {
    return id_farmaceutico.hashCode ^
        id_farmacia.hashCode ^
        nome.hashCode ^
        crf.hashCode ^
        telefone.hashCode ^
        genero.hashCode;
  }
}
