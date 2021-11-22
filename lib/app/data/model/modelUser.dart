import 'dart:convert';

class Usuario {
  int? id_usuario;
  String nome;
  String email;
  String celular;
  String? senha;
  String cpf;
  String nascimento;

  Usuario({
    this.id_usuario,
    required this.nome,
    required this.email,
    required this.celular,
    this.senha,
    required this.cpf,
    required this.nascimento,
  });

  Usuario copyWith({
    int? id_usuario,
    String? nome,
    String? email,
    String? celular,
    String? senha,
    String? cpf,
    String? nascimento,
  }) {
    return Usuario(
      id_usuario: id_usuario ?? this.id_usuario,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      celular: celular ?? this.celular,
      senha: senha ?? this.senha,
      cpf: cpf ?? this.cpf,
      nascimento: nascimento ?? this.nascimento,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_usuario': id_usuario,
      'nome': nome,
      'email': email,
      'celular': celular,
      'senha': senha,
      'cpf': cpf,
      'nascimento': nascimento,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id_usuario: map['id_usuario'] != null ? map['id_usuario'] : null,
      nome: map['nome'],
      email: map['email'],
      celular: map['celular'],
      senha: map['senha'] != null ? map['senha'] : null,
      cpf: map['cpf'],
      nascimento: map['nascimento'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Usuario.fromJson(String source) =>
      Usuario.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Usuario(id_usuario: $id_usuario, nome: $nome, email: $email, celular: $celular, senha: $senha, cpf: $cpf, nascimento: $nascimento)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Usuario &&
        other.id_usuario == id_usuario &&
        other.nome == nome &&
        other.email == email &&
        other.celular == celular &&
        other.senha == senha &&
        other.cpf == cpf &&
        other.nascimento == nascimento;
  }

  @override
  int get hashCode {
    return id_usuario.hashCode ^
        nome.hashCode ^
        email.hashCode ^
        celular.hashCode ^
        senha.hashCode ^
        cpf.hashCode ^
        nascimento.hashCode;
  }
}
