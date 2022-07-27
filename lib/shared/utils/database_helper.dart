import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _dbVersion = 1;
  static Database? _database;
  static final DatabaseHelper instance = DatabaseHelper();

  DatabaseHelper() {
    _initiateDatabase();
  }

  void _initiateDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = '${databasesPath}warrFinances.db';
    _database = await openDatabase(
      onConfigure: _onConfigure,
      path,
      version: _dbVersion,
      onCreate: (Database db, int version) async {
        await db.execute('''CREATE TABLE category
        (id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        color INTERGER NOT NULL,
        icon INTERGER NOT NULL)''');

        await db.execute('''CREATE TABLE operation
        (id INTEGER PRIMARY KEY AUTOINCREMENT,
        value NUM NOT NULL,
        name TEXT NOT NULL,
        entry INTERGER NOT NULL,
        date TEXT NO NULL,
        categoryId INTERGER,
        FOREIGN KEY(categoryId) REFERENCES Category(id)
         )''');

        await db.execute('''CREATE TABLE user
        (email TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        password TEXT NOT NULL
         )''');

        await db.rawInsert(
          '''INSERT INTO Category(name, color, icon)
         VALUES('Salário', 4294198070, 57522),
          ('Alimentação', 4294961979, 58674),
          ('Compras', 4280391411, 58778),
          ('Aluguel', 4283215696, 58152),
          ('Telefone', 4288423856 , 58530),
          ('Contas', 4288585374 , 983299)
        ''',
        );

        await db.rawInsert('''
        INSERT INTO Operation (value, name, entry, date, categoryId)
        VALUES(2500, 'Warren Tecnologia', 1, '01/07/2022', 1),
        (2500, 'Ifood', 0, '22/06/2022', 2),
        (620, 'Angeloni', 0, '18/06/2022', 3),
        (15500, 'Professor Ailton', 1, '01/07/2022', 1)
        ''');
        await db.rawInsert('''
        INSERT INTO user (emal, name, password)
        VALUES('admin@admin.com.br', 'Admin', 'admin'),
        ''');
      },
    );
  }

  Future<List<Map<String, dynamic>>> queryForSummaryChart(
      String monthYear) async {
    List<Map<String, dynamic>> list = await _database!.rawQuery(
        "SELECT c.icon, c.name, c.color, SUM(o.value) FROM Category AS c INNER JOIN Operation AS o ON c.id = o.categoryId WHERE o.date LIKE ? AND o.entry=0 GROUP BY c.name",
        ['%$monthYear%']);
    return list;
  }

  Future<Map<String, dynamic>> selectSum() async {
    List<Map<String, dynamic>> listPositive = await _database!.rawQuery(
      "SELECT SUM(value) FROM Operation WHERE entry = 1",
    );
    List<Map<String, dynamic>> listNegative = await _database!.rawQuery(
      "SELECT SUM(value) FROM Operation WHERE entry = 0",
    );

    if (listPositive[0]['SUM(value)'] == null) {
      listPositive = [
        {'SUM(value)': 0}
      ];
    }
    if (listNegative[0]['SUM(value)'] == null) {
      listNegative = [
        {'SUM(value)': 0}
      ];
    }
    Map<String, dynamic> map = {
      'entries': listPositive,
      'output': listNegative,
      'total': listPositive[0]['SUM(value)'] - listNegative[0]['SUM(value)'],
      'entryIsNull': false,
      'outIsNull': false
    };
    return map;
  }

  Future<List<Color>> getColorsCategory(String monthYear) async {
    List<Color> listColor = [];
    List<Map<String, dynamic>> list = await queryForSummaryChart(monthYear);

    for (Map<String, dynamic> map in list) {
      int color = map['color'];
      Color colorAdd = Color(color);
      listColor.add(colorAdd);
    }
    return listColor;
  }

  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  void insertCategory(String name, int color, int icon) async {
    await _database!.rawInsert(
      'INSERT INTO Category(name, color, icon) VALUES(?, ?, ?)',
      [name, color, icon],
    );
  }

  void insertUser(String email, String name, String password) async {
    await _database!.rawInsert(
      'INSERT INTO user(email, name, password) VALUES(?, ?, ?)',
      [email, name, password],
    );
  }

  void insertOperation(
      double value, String name, int entry, String date, int categoryId) async {
    await _database!.rawInsert(
      'INSERT INTO Operation(value, name, entry, date, categoryId) VALUES(?, ?, ?, ?, ?)',
      [value, name, entry, date, categoryId],
    );
  }

  Future<bool> validateUser(String email, String password) async {
    var result = await _database!.rawQuery(
      'SELECT * FROM user WHERE email=? AND password=?',
      [email, password],
    );
    if (result[0][0] == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<List<Map<String, dynamic>>> queryCategory() async {
    List<Map<String, dynamic>> list =
        await _database!.rawQuery('SELECT * FROM Category');
    // print(list);
    return list;
  }

  Future<List<Map<String, dynamic>>> queryCategoryForSummary(
      String monthYear) async {
    Map<String, double> map1 = await queryOperation(monthYear);

    Map<String, dynamic> result = {
      'id': 0,
      'name': '',
      'color': '',
      'icon': '',
      'sum': 0
    };
    List<Map<String, dynamic>> list = [];
    List<Map<String, dynamic>> temp = [];

    map1.forEach((id, value) async {
      list = await getCategory(int.parse(id));
      result.addAll({
        'id': id,
        'name': list[0]['name'],
        'color': list[0]['color'],
        'icon': list[0]['icon'],
        'sum': map1[id]
      });
      // temp.add(result);
      // print(result);
      // print(temp);
    });
    return temp;
  }

  Future<Map<String, double>> queryOperation(String monthYear) async {
    List<Map<String, dynamic>> list = await _database!.query(
      'Operation',
      where: 'entry = ? AND date LIKE ? ',
      whereArgs: [0, '%$monthYear%'],
      orderBy: "categoryId",
    );

    Set<int> differentIds = {};

    for (Map<String, dynamic> item in list) {
      differentIds.add(item['categoryId']);
    }

    Map<String, double> sumId = {};

    for (int id in differentIds) {
      sumId.addAll({id.toString(): 0});
      for (Map<String, dynamic> operation in list) {
        double newSum = sumId[id.toString()]!;
        if (operation['categoryId'] == id) {
          num adding = operation['value'];
          newSum += adding;
          sumId[id.toString()] = newSum;
        }
      }
    }
    return sumId;
  }

  Future<int> selectCategory(String categoryName) async {
    List<Map> list = await _database!.rawQuery(
      'SELECT id FROM Category WHERE Name= ?',
      [categoryName],
    );
    return list[0]['id'];
  }

  Future<List<Map<String, dynamic>>> getCategory(int id) async {
    List<Map<String, dynamic>> list = await _database!.rawQuery(
      'SELECT * FROM Category WHERE id= ?',
      [id],
    );
    return list;
  }

  Future<Map<String, List<Map<String, dynamic>>>> selectContainer() async {
    Map<String, List<Map<String, dynamic>>> map = {};
    map['operation'] = await _database!.rawQuery('SELECT * FROM operation');
    map['category'] = await _database!.rawQuery('SELECT * FROM Category');
    return map;
  }

  Future<Map<String, List<Map<String, dynamic>>>> selectOperation() async {
    Map<String, List<Map<String, dynamic>>> map = {};
    map['operation'] = await _database!.rawQuery('SELECT * FROM operation');
    return map;
  }

  void deleteCategory(int id) async {
    await _database!.rawDelete(
      'DELETE FROM Category WHERE id = ?',
      ['$id'],
    );
  }

  void deleteOperation(String name) async {
    await _database!.rawDelete(
      'DELETE FROM operation WHERE name = ?',
      [name],
    );
  }

  void deleteAllOperations() async {
    await _database!.rawDelete(
      'DELETE FROM operation',
    );
  }

  void deleteAllData() async {
    var databasesPath = await getDatabasesPath();
    String path = '${databasesPath}warrFinances.db';
    await deleteDatabase(path);
  }

  void closeDatabase() async {
    await _database!.close();
  }
}
