import 'package:flutter/material.dart';

import '../../shared/utils/database_helper.dart';

// ignore: must_be_immutable
class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

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
              DatabaseHelper.instance
                  .insertOperation(2500, 'NomeTeste', 1, '15/07/2022', 1);
            },
            child: const Text("insert Operation"),
          ),
          TextButton(
            onPressed: () {
              DatabaseHelper.instance.selectOperation();
            },
            child: const Text("Query Operation"),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Update Operation"),
          ),
          TextButton(
            onPressed: () {
              DatabaseHelper.instance.deleteCategory(2);
            },
            child: const Text("Delete Operation"),
          ),
          TextButton(
            onPressed: () {
              DatabaseHelper.instance
                  .insertCategory("Nome", "Colors.Blue", "Icons.person");
            },
            child: const Text("Insert Category"),
          ),
          TextButton(
            onPressed: () {
              DatabaseHelper.instance.queryCategory();
            },
            child: const Text("query Category"),
          ),
          TextButton(
            onPressed: () {
              DatabaseHelper.instance.deleteAllData();
            },
            child: const Text("update Category"),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("delete Category"),
          ),
        ],
      ),
    );
  }
}
