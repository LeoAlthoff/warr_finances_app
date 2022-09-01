import 'dart:convert';

class Operationmodel {
  final int id;
  final String name;
  final int value;
  final bool entry;
  final Date date;
  final Category category;
  final User user;
  Operationmodel({
    required this.id,
    required this.name,
    required this.value,
    required this.entry,
    required this.date,
    required this.category,
    required this.user,
  });

  Operationmodel copyWith({
    int? id,
    String? name,
    int? value,
    bool? entry,
    Date? date,
    Category? category,
    User? user,
  }) {
    return Operationmodel(
      id: id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
      entry: entry ?? this.entry,
      date: date ?? this.date,
      category: category ?? this.category,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'value': value});
    result.addAll({'entry': entry});
    result.addAll({'date': date.toMap()});
    result.addAll({'category': category.toMap()});
    result.addAll({'user': user.toMap()});
  
    return result;
  }

  factory Operationmodel.fromMap(Map<String, dynamic> map) {
    return Operationmodel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      value: map['value']?.toInt() ?? 0,
      entry: map['entry'] ?? false,
      date: Date.fromMap(map['date']),
      category: Category.fromMap(map['category']),
      user: User.fromMap(map['user']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Operationmodel.fromJson(String source) => Operationmodel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Usermodel(id: $id, name: $name, value: $value, entry: $entry, date: $date, category: $category, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Operationmodel &&
      other.id == id &&
      other.name == name &&
      other.value == value &&
      other.entry == entry &&
      other.date == date &&
      other.category == category &&
      other.user == user;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      value.hashCode ^
      entry.hashCode ^
      date.hashCode ^
      category.hashCode ^
      user.hashCode;
  }
}

class Date {
  final int year;
  final int month;
  final int day;
  final int dayOfWeek;
  final int dayOfYear;
  final int dayNumber;
  Date({
    required this.year,
    required this.month,
    required this.day,
    required this.dayOfWeek,
    required this.dayOfYear,
    required this.dayNumber,
  });

  Date copyWith({
    int? year,
    int? month,
    int? day,
    int? dayOfWeek,
    int? dayOfYear,
    int? dayNumber,
  }) {
    return Date(
      year: year ?? this.year,
      month: month ?? this.month,
      day: day ?? this.day,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      dayOfYear: dayOfYear ?? this.dayOfYear,
      dayNumber: dayNumber ?? this.dayNumber,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'year': year});
    result.addAll({'month': month});
    result.addAll({'day': day});
    result.addAll({'dayOfWeek': dayOfWeek});
    result.addAll({'dayOfYear': dayOfYear});
    result.addAll({'dayNumber': dayNumber});
  
    return result;
  }

  factory Date.fromMap(Map<String, dynamic> map) {
    return Date(
      year: map['year']?.toInt() ?? 0,
      month: map['month']?.toInt() ?? 0,
      day: map['day']?.toInt() ?? 0,
      dayOfWeek: map['dayOfWeek']?.toInt() ?? 0,
      dayOfYear: map['dayOfYear']?.toInt() ?? 0,
      dayNumber: map['dayNumber']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Date.fromJson(String source) => Date.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Date(year: $year, month: $month, day: $day, dayOfWeek: $dayOfWeek, dayOfYear: $dayOfYear, dayNumber: $dayNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Date &&
      other.year == year &&
      other.month == month &&
      other.day == day &&
      other.dayOfWeek == dayOfWeek &&
      other.dayOfYear == dayOfYear &&
      other.dayNumber == dayNumber;
  }

  @override
  int get hashCode {
    return year.hashCode ^
      month.hashCode ^
      day.hashCode ^
      dayOfWeek.hashCode ^
      dayOfYear.hashCode ^
      dayNumber.hashCode;
  }
}

class Category {
  final int id;
  final String name;
  final int color;
  final int icon;
  final User user;
  Category({
    required this.id,
    required this.name,
    required this.color,
    required this.icon,
    required this.user,
  });

  Category copyWith({
    int? id,
    String? name,
    int? color,
    int? icon,
    User? user,
  }) {
    return Category(
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

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      color: map['color']?.toInt() ?? 0,
      icon: map['icon']?.toInt() ?? 0,
      user: User.fromMap(map['user']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) => Category.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Category(id: $id, name: $name, color: $color, icon: $icon, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Category &&
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