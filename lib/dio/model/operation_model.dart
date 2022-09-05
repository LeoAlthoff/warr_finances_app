import 'dart:convert';

class OperationModel {
  final String name;
  final double value;
  final bool entry;
  final String date;
  final int categoryId;
  final Category category;
  final int userId;
  final int id;
  OperationModel({
    required this.name,
    required this.value,
    required this.entry,
    required this.date,
    required this.categoryId,
    required this.category,
    required this.userId,
    required this.id,
  });

  OperationModel copyWith({
    String? name,
    double? value,
    bool? entry,
    String? date,
    int? categoryId,
    Category? category,
    int? userId,
    int? id,
  }) {
    return OperationModel(
      name: name ?? this.name,
      value: value ?? this.value,
      entry: entry ?? this.entry,
      date: date ?? this.date,
      categoryId: categoryId ?? this.categoryId,
      category: category ?? this.category,
      userId: userId ?? this.userId,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'value': value});
    result.addAll({'entry': entry});
    result.addAll({'date': date});
    result.addAll({'categoryId': categoryId});
    result.addAll({'category': category.toMap()});
    result.addAll({'userId': userId});
    result.addAll({'id': id});

    return result;
  }

  factory OperationModel.fromMap(Map<String, dynamic> map) {
    return OperationModel(
      name: map['name'] ?? '',
      value: map['value']?.toInt() ?? 0,
      entry: map['entry'] ?? false,
      date: map['date'] ?? '',
      categoryId: map['categoryId']?.toInt() ?? 0,
      category: Category.fromMap(map['category']),
      userId: map['userId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OperationModel.fromJson(String source) =>
      OperationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OperationModel(name: $name, value: $value, entry: $entry, date: $date, categoryId: $categoryId, category: $category, userId: $userId, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OperationModel &&
        other.name == name &&
        other.value == value &&
        other.entry == entry &&
        other.date == date &&
        other.categoryId == categoryId &&
        other.category == category &&
        other.userId == userId &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        value.hashCode ^
        entry.hashCode ^
        date.hashCode ^
        categoryId.hashCode ^
        category.hashCode ^
        userId.hashCode ^
        id.hashCode;
  }
}

class Category {
  final String name;
  final int color;
  final int icon;
  final int userId;
  final int id;
  Category({
    required this.name,
    required this.color,
    required this.icon,
    required this.userId,
    required this.id,
  });

  Category copyWith({
    String? name,
    int? color,
    int? icon,
    int? userId,
    int? id,
  }) {
    return Category(
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

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'] ?? '',
      color: map['color']?.toInt() ?? 0,
      icon: map['icon']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Category(name: $name, color: $color, icon: $icon, userId: $userId, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
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
