import 'package:flutter/material.dart';

import '../../shared/utils/database_helper.dart';

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
            onPressed: () async {
              await DatabaseHelper.instance.queryCategoryForSummary('06/2022');
            },
            child: const Text("insert Operation"),
          ),
          TextButton(
            onPressed: () {
              DatabaseHelper.instance.selectOperation();
            },
            child: const Text("select Operation"),
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
              DatabaseHelper.instance.queryCategory();
            },
            child: const Text("query Category"),
          ),
          TextButton(
            onPressed: () {
              DatabaseHelper.instance.deleteAllData();
            },
            child: const Text("Delete Database"),
          ),
          TextButton(
            onPressed: () {
              DatabaseHelper.instance.queryOperation("07/2022");
            },
            child: const Text("Query Operation"),
          ),
          TextButton(
            onPressed: () {
              DatabaseHelper.instance.queryForSummaryChart("06/2022");
            },
            child: const Text("Teste"),
          ),
        ],
      ),
    );
  }
}
