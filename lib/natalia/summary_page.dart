import 'package:flutter/material.dart';

import 'itens_summary_page.dart';

void main() {
  runApp(const MaterialApp(
    title: 'categoriesSummary',
    home: Summary(),
    debugShowCheckedModeBanner: false,
  ));
}

class Summary extends StatelessWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Resumo por categoria',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 210, 52, 105),
      ),
      body: const SingleChildScrollView(child: ItensSummaryPage()),
      bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.drag_handle_sharp),
            label: "Extrato",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: "Cadastrar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_bar_chart_outlined),
            label: "Resumo",
          ),
        ],),
    );
  }
}

