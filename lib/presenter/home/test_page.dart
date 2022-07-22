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
          // TextButton(
          //   onPressed: () {
          //     DatabaseHelper.instance.insertCategory(
          //         "Nome", , Icons.person.codePoint);
          //   },
          //   child: const Text("Insert Category"),
          // ),
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
            onPressed: () {
              DatabaseHelper.instance.getCategory(2);
            },
            child: const Text("Query Operation"),
          ),
          TextButton(
            onPressed: () {
              DatabaseHelper.instance.queryForSummaryChart("06/2022");

              // DatabaseHelper.instance.selectSum();
            },
            child: const Text("Teste"),
          ),
        ],
      ),
    );
  }
}
