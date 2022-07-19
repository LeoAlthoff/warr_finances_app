import 'package:flutter/material.dart';

import 'widgets/body_summary_page.dart';

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
