import 'dart:convert';

class Farmaceutico {
  int id_farmaceutico;
  String nome;
  String crf;
  String telefone;
  String genero;
  Farmaceutico({
    required this.id_farmaceutico,
    required this.nome,
    required this.crf,
    required this.telefone,
    required this.genero,
  });

  Farmaceutico copyWith({
    int? id_farmaceutico,
    String? nome,
    String? crf,
    String? telefone,
    String? genero,
  }) {
    return Farmaceutico(
      id_farmaceutico: id_farmaceutico ?? this.id_farmaceutico,
      nome: nome ?? this.nome,
      crf: crf ?? this.crf,
      telefone: telefone ?? this.telefone,
      genero: genero ?? this.genero,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_farmaceutico': id_farmaceutico,
      'nome': nome,
      'crf': crf,
      'telefone': telefone,
      'genero': genero,
    };
  }

  factory Farmaceutico.fromMap(Map<String, dynamic> map) {
    return Farmaceutico(
      id_farmaceutico: map['id_farmaceutico'],
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
    return 'Farmaceutico(id_farmaceutico: $id_farmaceutico, nome: $nome, crf: $crf, telefone: $telefone, genero: $genero)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Farmaceutico &&
        other.id_farmaceutico == id_farmaceutico &&
        other.nome == nome &&
        other.crf == crf &&
        other.telefone == telefone &&
        other.genero == genero;
  }

  @override
  int get hashCode {
    return id_farmaceutico.hashCode ^
        nome.hashCode ^
        crf.hashCode ^
        telefone.hashCode ^
        genero.hashCode;
  }
}
