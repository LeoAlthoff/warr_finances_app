import 'dart:convert';

class Usermodel {
  final int id;
  final String name;
  final String email;
  final String password;
  Usermodel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  Usermodel copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
  }) {
    return Usermodel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'password': password});
  
    return result;
  }

  factory Usermodel.fromMap(Map<String, dynamic> map) {
    return Usermodel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Usermodel.fromJson(String source) => Usermodel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Usermodel(id: $id, name: $name, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Usermodel &&
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      password.hashCode;
  }
}