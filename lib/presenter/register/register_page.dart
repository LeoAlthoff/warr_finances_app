import 'package:flutter/material.dart';

import '../../dio/model/operation_model.dart';

import 'widgets/body_register.dart';

class RegistrationPage extends StatelessWidget {
  final OperationModel? operation;
  const RegistrationPage({
    Key? key,
    this.operation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BodyRegister(
          operation: operation,
        ),
      ),
    );
  }
}
