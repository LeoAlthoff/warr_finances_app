import 'package:flutter/material.dart';

import '../home_page/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 52, 105),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(children: [
              const Icon(Icons.attach_money, size: 70),
              const Text(
                'Warr Finances',
                style: TextStyle(fontSize: 45, color: Colors.white),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Controle suas finanças de forma',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'muito simples',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 55,
              ),
              const Text(
                ' Faça seu login com uma conta Google abaixo',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.grey,
                    fixedSize: const Size(300, 40)),
                // ignore: prefer_const_constructors
                child: Text(
                  textAlign: TextAlign.right,
                  'Entrar com Google',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                onPressed: () {
                  nagigateToHomeScreen(context);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    'assets/images/grafico.png',
                    width: 520,
                    height: 300,
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void nagigateToHomeScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }
}
