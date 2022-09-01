import 'dart:convert';

import 'category_model.dart';

class OperationModel {
  String id;
  double value;
  String name;
  bool entry;
  DateTime date;
  CategoryModel category;
  OperationModel({
    required this.id,
    required this.value,
    required this.name,
    required this.entry,
    required this.date,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'value': value});
    result.addAll({'name': name});
    result.addAll({'entry': entry});
    result.addAll({'date': date.millisecondsSinceEpoch});
    result.addAll({'category': category.toMap()});
  
    return result;
  }

  factory OperationModel.fromMap(Map<String, dynamic> map) {
    return OperationModel(
      id: map['id'] ?? '',
      value: map['value']?.toDouble() ?? 0.0,
      name: map['name'] ?? '',
      entry: map['entry'] ?? false,
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      category: CategoryModel.fromMap(map['category']),
    );
  }

  String toJson() => json.encode(toMap());

  factory OperationModel.fromJson(String source) => OperationModel.fromMap(json.decode(source));
}
