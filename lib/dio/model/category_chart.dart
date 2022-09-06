import 'dart:convert';

class CategoryChartModel {
  final String name;
  final int color;
  final int icon;
  final double sum;
  CategoryChartModel({
    required this.name,
    required this.color,
    required this.icon,
    required this.sum,
  });

  CategoryChartModel copyWith({
    String? name,
    int? color,
    int? icon,
    double? sum,
  }) {
    return CategoryChartModel(
      name: name ?? this.name,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      sum: sum ?? this.sum,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'color': color});
    result.addAll({'icon': icon});
    result.addAll({'sum': sum});

    return result;
  }

  factory CategoryChartModel.fromMap(Map<String, dynamic> map) {
    return CategoryChartModel(
      name: map['name'] ?? '',
      color: map['color']?.toInt() ?? 0,
      icon: map['icon']?.toInt() ?? 0,
      sum: map['sum']?.toDouble() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryChartModel.fromJson(String source) =>
      CategoryChartModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CategoryChartModel(name: $name, color: $color, icon: $icon, sum: $sum)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryChartModel &&
        other.name == name &&
        other.color == color &&
        other.icon == icon &&
        other.sum == sum;
  }

  @override
  int get hashCode {
    return name.hashCode ^ color.hashCode ^ icon.hashCode ^ sum.hashCode;
  }
}
