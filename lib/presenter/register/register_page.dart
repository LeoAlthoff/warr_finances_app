import 'package:flutter/material.dart';

import 'widgets/body_register.dart';

class RegistrationPage extends StatelessWidget {
  final int? id;
  const RegistrationPage({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BodyRegister(
          id: id,
        ),
      ),
    );
  }
}
