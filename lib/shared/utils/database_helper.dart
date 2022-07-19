import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _dbVersion = 1;
  static const _operationTable = 'operation';
  static const _categoryTable = 'category';
  static Database? _database;

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
        color TEXT NOT NULL)''');
        await db.execute('''CREATE TABLE $_operationTable
          (id INTEGER PRIMARY KEY AUTOINCREMENT,
          value NUM NOT NULL,
           name TEXT NOT NULL,
         entry INTERGER NOT NULL,
          date TEXT NO NULL,
         categoryId INTERGER,
         FOREIGN KEY(categoryId) REFERENCES Category(id)
         )''');
      },
    );
  }

  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  void insertCategory(String name, String color) async {
    await _database!.rawInsert(
      'INSERT INTO Category(name, color) VALUES(?, ?)',
      [name, color],
    );
  }

  void insertOperation(
      double value, String name, int entry, String date, int categoryId) async {
    await _database!.rawInsert(
      'INSERT INTO operation(value, name, entry, date, categoryId) VALUES(?, ?, ?, ?, ?)',
      [value, name, entry, date, categoryId],
    );
  }

  void selectCategory() async {
    List<Map> list = await _database!.rawQuery('SELECT * FROM Category');
    print(list);
  }

  void selectOperation() async {
    List<Map> list = await _database!.rawQuery('SELECT * FROM operation');
    print(list);
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
