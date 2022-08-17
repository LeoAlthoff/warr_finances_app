import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'widgets/body_register.dart';

class RegistrationPage extends StatelessWidget {
  User user;
  int? id;
  RegistrationPage({Key? key, required this.user, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BodyRegister(
          id: id,
          user: user,
        ),
      ),
    );
  }
}
