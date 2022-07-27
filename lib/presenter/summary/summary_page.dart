import 'package:flutter/material.dart';

import 'widgets/body_summary_page.dart';

class Summary extends StatelessWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ItensSummaryPage(dateRaw: DateTime.now()),
      ),
    );
  }
}
