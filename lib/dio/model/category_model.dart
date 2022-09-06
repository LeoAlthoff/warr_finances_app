import 'dart:convert';

class CategoryModel {
  final int id;
  final String name;
  final int color;
  final int icon;
  final int userId;
  CategoryModel({
    this.id = 0,
    required this.name,
    required this.color,
    required this.icon,
    required this.userId,
  });

  CategoryModel copyWith({
    int? id,
    String? name,
    int? color,
    int? icon,
    int? userId,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'color': color});
    result.addAll({'icon': icon});
    result.addAll({'userId': userId});

    return result;
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      color: map['color']?.toInt() ?? 0,
      icon: map['icon']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, color: $color, icon: $icon, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryModel &&
        other.id == id &&
        other.name == name &&
        other.color == color &&
        other.icon == icon &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        color.hashCode ^
        icon.hashCode ^
        userId.hashCode;
  }
}
