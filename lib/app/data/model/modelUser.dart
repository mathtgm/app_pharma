import 'dart:convert';

class Usuario {
  int id_usuario;
  String nome;
  String celular;
  String cpf;
  Usuario({
    required this.id_usuario,
    required this.nome,
    required this.celular,
    required this.cpf,
  });

  Usuario copyWith({
    int? id_usuario,
    String? nome,
    String? celular,
    String? cpf,
  }) {
    return Usuario(
      id_usuario: id_usuario ?? this.id_usuario,
      nome: nome ?? this.nome,
      celular: celular ?? this.celular,
      cpf: cpf ?? this.cpf,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_usuario': id_usuario,
      'nome': nome,
      'celular': celular,
      'cpf': cpf,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id_usuario: map['id_usuario'],
      nome: map['nome'],
      celular: map['celular'],
      cpf: map['cpf'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Usuario.fromJson(String source) =>
      Usuario.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Usuario(id_usuario: $id_usuario, nome: $nome, celular: $celular, cpf: $cpf)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Usuario &&
        other.id_usuario == id_usuario &&
        other.nome == nome &&
        other.celular == celular &&
        other.cpf == cpf;
  }

  @override
  int get hashCode {
    return id_usuario.hashCode ^
        nome.hashCode ^
        celular.hashCode ^
        cpf.hashCode;
  }
}
