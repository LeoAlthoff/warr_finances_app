import 'dart:convert';

import 'package:flutter_teste_app/dio/model/category_model.dart';

class OperationModel {
  final String name;
  final double value;
  final bool entry;
  final DateTime date;
  final int categoryId;
  final CategoryModel? category;
  final int userId;
  final int id;
  OperationModel({
    required this.name,
    required this.value,
    required this.entry,
    required this.date,
    required this.categoryId,
    this.category,
    required this.userId,
    required this.id,
  });

  OperationModel copyWith({
    String? name,
    double? value,
    bool? entry,
    DateTime? date,
    int? categoryId,
    CategoryModel? category,
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
    result.addAll({'date': date.toIso8601String()});
    result.addAll({'categoryId': categoryId});
    result.addAll({'category': category?.toMap()});
    result.addAll({'userId': userId});
    result.addAll({'id': id});

    return result;
  }

  factory OperationModel.fromMap(Map<String, dynamic> map) {
    return OperationModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      value: map['value']?.toDouble() ?? 0.0,
      entry: map['entry'] ?? false,
      date: DateTime.parse(map['date']),
      categoryId: map['categoryId']?.toInt() ?? 0,
      category: CategoryModel.fromMap(map['category']),
      userId: map['userId']?.toInt() ?? 0,
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
