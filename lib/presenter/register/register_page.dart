import 'package:flutter/material.dart';

import 'widgets/body_register.dart';

class RegistrationPage extends StatefulWidget {
  int? id;
  RegistrationPage({Key? key, this.id}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BodyRegister(
          id: widget.id,
        ),
      ),
    );
  }
}
