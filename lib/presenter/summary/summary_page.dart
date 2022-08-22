import 'package:flutter/material.dart';

import 'widgets/body_summary.dart';

class Summary extends StatelessWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: BodySummary(),
      ),
    );
  }
}
