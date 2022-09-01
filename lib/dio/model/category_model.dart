import 'dart:convert';

class Categorymodel {
  final int id;
  final String name;
  final int color;
  final int icon;
  final User user;
  Categorymodel({
    required this.id,
    required this.name,
    required this.color,
    required this.icon,
    required this.user,
  });

  Categorymodel copyWith({
    int? id,
    String? name,
    int? color,
    int? icon,
    User? user,
  }) {
    return Categorymodel(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'color': color});
    result.addAll({'icon': icon});
    result.addAll({'user': user.toMap()});
  
    return result;
  }

  factory Categorymodel.fromMap(Map<String, dynamic> map) {
    return Categorymodel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      color: map['color']?.toInt() ?? 0,
      icon: map['icon']?.toInt() ?? 0,
      user: User.fromMap(map['user']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Categorymodel.fromJson(String source) => Categorymodel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Categorymodel(id: $id, name: $name, color: $color, icon: $icon, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Categorymodel &&
      other.id == id &&
      other.name == name &&
      other.color == color &&
      other.icon == icon &&
      other.user == user;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      color.hashCode ^
      icon.hashCode ^
      user.hashCode;
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String password;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
  }) {
    return User(
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

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
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