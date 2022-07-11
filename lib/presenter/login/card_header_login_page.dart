import 'package:flutter/material.dart';

class CardHeaderLogin extends StatelessWidget {
  const CardHeaderLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
      'assets/images/dinheiro.png',
      width: 90,
      height: 90,
    ),
    const SizedBox(
      height: 30,
    ),
    const Text(
      'Warr Finances',
      style: TextStyle(fontSize: 30, color: Colors.white),
    ),
    const SizedBox(
      height: 50,
    ),
    const Text(
      'Controle suas finanças de forma',
      style: TextStyle(
          fontSize: 17,
          color: Colors.white,
          fontStyle: FontStyle.italic),
    ),
    const SizedBox(
      height: 20,
    ),
    const Text(
      'muito simples',
      style: TextStyle(
          fontSize: 17,
          color: Colors.white,
          fontStyle: FontStyle.italic),
    ),
      ],
    );
  }
}