import 'package:flutter/material.dart';

import '../../shared/utils/database_helper.dart';

// ignore: must_be_immutable
class TestPage extends StatelessWidget {
  TestPage({Key? key}) : super(key: key);

  DatabaseHelper database = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              database.insertOperation(2500, 'NomeTeste', 1, '15/07/2022', 1);
            },
            child: const Text("insert Operation"),
          ),
          TextButton(
            onPressed: () {
              database.selectOperation();
            },
            child: const Text("Query Operation"),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Update Operation"),
          ),
          TextButton(
            onPressed: () {
              database.deleteCategory(2);
            },
            child: const Text("Delete Operation"),
          ),
          TextButton(
            onPressed: () {
              database.insertCategory("Nome", "Colors.Blue");
            },
            child: const Text("Insert Category"),
          ),
          TextButton(
            onPressed: () {
              database.selectCategory();
            },
            child: const Text("query Category"),
          ),
          TextButton(
            onPressed: () {
              database.deleteAllData();
            },
            child: const Text("update Category"),
          ),
          TextButton(
            onPressed: () {
              database.deleteCategory(2);
            },
            child: const Text("delete Category"),
          ),
        ],
      ),
    );
  }
}
