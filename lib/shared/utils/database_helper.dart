/*
  Future<List<Map<String, dynamic>>> teste(String monthYear) async {
    List<Map<String, dynamic>> list = await _database!.rawQuery(
      "SELECT c.icon, c.name, c.color FROM Category AS c LEFT JOIN Operation AS o ON c.id = o.categoryId WHERE date LIKE ?",
      [monthYear],
    );
    return list;
  }
*/
import 'dart:async';

import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _dbVersion = 1;
  static const _operationTable = 'operation';
  static const _categoryTable = 'category';
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
        await db.execute('''CREATE TABLE $_categoryTable
        (id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        color TEXT NOT NULL,
        icon INT NOT NULL)''');
        await db.execute('''CREATE TABLE $_operationTable
        (id INTEGER PRIMARY KEY AUTOINCREMENT,
        value NUM NOT NULL,
        name TEXT NOT NULL,
        entry INTERGER NOT NULL,
        date TEXT NO NULL,
        categoryId INTERGER,
        FOREIGN KEY(categoryId) REFERENCES Category(id)
         )''');
        await db.rawInsert(
          '''INSERT INTO Category(name, color, icon) 
         VALUES('Salário', '0xff000000', 57522),
          ('Alimentação', '0xfff50707', 58674),
          ('Compras', '0xfff0f507', 58778),
          ('Aluguel', '0xff072cf5', 58152),
          ('Telefone', '0xff09ab10', 58530),
          ('Contas', '0xff920a79', 983299)
        ''',
        );

        await db.rawInsert('''
        INSERT INTO Operation (value, name, entry, date, categoryId)
        VALUES(2500, 'Warren Tecnologia', 1, '01/07/2022', 1),
        (2500, 'Ifood', 0, '22/06/2022', 2),
        (620, 'Angeloni', 0, '18/06/2022', 3),
        (15500, 'Professor Ailton', 1, '01/07/2022', 1)   
        ''');
      },
    );
  }

  Future<List<Map<String, dynamic>>> teste(String monthYear) async {
    List<Map<String, dynamic>> list = await _database!.rawQuery(
      "SELECT c.icon, c.name, c.color, SUM(o.value) FROM Category AS c LEFT JOIN Operation AS o ON c.id = o.categoryId ORDER BY c.name WHERE date LIKE ?",
      [monthYear],
    );
    print(list);
    return list;
  }

  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  void insertCategory(String name, String color, int icon) async {
    await _database!.rawInsert(
      'INSERT INTO Category(name, color, icon) VALUES(?, ?, ?)',
      [name, color, icon],
    );
  }

  void insertOperation(
      double value, String name, int entry, String date, int categoryId) async {
    await _database!.rawInsert(
      'INSERT INTO Operation(value, name, entry, date, categoryId) VALUES(?, ?, ?, ?, ?)',
      [value, name, entry, date, categoryId],
    );
  }

  Future<List<Map<String, dynamic>>> queryCategory() async {
    return await _database!.rawQuery('SELECT * FROM Category');
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
      temp.add(result);
      print(result);
      print(temp);
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
    print(sumId);
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
    print(map);
    return map;
  }

  Future<Map<String, List<Map<String, dynamic>>>> selectOperation() async {
    Map<String, List<Map<String, dynamic>>> map = {};
    map['operation'] = await _database!.rawQuery('SELECT * FROM operation');
    print(map);
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

  void deleteAllData() async {
    var databasesPath = await getDatabasesPath();
    String path = '${databasesPath}warrFinances.db';
    await deleteDatabase(path);
  }

  void closeDatabase() async {
    await _database!.close();
  }
}
