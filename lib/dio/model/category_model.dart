import 'dart:convert';

class CategoryModel {
  int id;
  String name;
  int color;
  int icon;
  CategoryModel({
    required this.id,
    required this.name,
    required this.color,
    required this.icon,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'color': color});
    result.addAll({'icon': icon});

    return result;
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      color: map['color']?.toInt() ?? 0,
      icon: map['icon']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));
}
