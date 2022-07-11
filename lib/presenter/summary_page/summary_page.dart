import 'package:flutter/material.dart';
import 'widgets/itens_summary_page.dart';

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
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: ItensSummaryPage(),
      ),
    );
  }
}
