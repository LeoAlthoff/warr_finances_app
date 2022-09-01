import 'dart:convert';

class CategoryModel {
  final String name;
  final int color;
  final int icon;
  final int userId;
  final int id;
  CategoryModel({
    required this.name,
    required this.color,
    required this.icon,
    required this.userId,
    required this.id,
  });

  CategoryModel copyWith({
    String? name,
    int? color,
    int? icon,
    int? userId,
    int? id,
  }) {
    return CategoryModel(
      name: name ?? this.name,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      userId: userId ?? this.userId,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'color': color});
    result.addAll({'icon': icon});
    result.addAll({'userId': userId});
    result.addAll({'id': id});

    return result;
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'] ?? '',
      color: map['color']?.toInt() ?? 0,
      icon: map['icon']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CategoryModel(name: $name, color: $color, icon: $icon, userId: $userId, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryModel &&
        other.name == name &&
        other.color == color &&
        other.icon == icon &&
        other.userId == userId &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        color.hashCode ^
        icon.hashCode ^
        userId.hashCode ^
        id.hashCode;
  }
}
