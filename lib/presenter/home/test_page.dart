import 'package:flutter/material.dart';

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
              //TODO: Implement dio (API)
             
            },
            child: const Text("insert Operation"),
          ),
          TextButton(
            onPressed: () {
                  //TODO: Implement dio (API)
             
            },
            child: const Text("select Operation"),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Update Operation"),
          ),
          TextButton(
            onPressed: () {
                  //TODO: Implement dio (API)
            },
            child: const Text("Delete Operation"),
          ),
          TextButton(
            onPressed: () {
                  //TODO: Implement dio (API)
            },
            child: const Text("query Category"),
          ),
          TextButton(
            onPressed: () {
                  //TODO: Implement dio (API)
            },
            child: const Text("Delete Database"),
          ),
          TextButton(
            onPressed: () {
                  //TODO: Implement dio (API)
            },
            child: const Text("Query Operation"),
          ),
          TextButton(
            onPressed: () {
                  //TODO: Implement dio (API)
            },
            child: const Text("Teste"),
          ),
        ],
      ),
    );
  }
}
