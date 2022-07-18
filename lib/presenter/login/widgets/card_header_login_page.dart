import 'package:flutter/material.dart';
import 'package:flutter_teste_app/presenter/register/widgets/custom_button.dart';
import 'package:lottie/lottie.dart';

class CardHeaderLogin extends StatefulWidget {
  const CardHeaderLogin({
    Key? key,
  }) : super(key: key);

  @override
  State<CardHeaderLogin> createState() => CardHeaderLoginState();
}

class CardHeaderLoginState extends State<CardHeaderLogin> {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color.fromRGBO(238, 46, 93, 1),
          child: Column(
            children: [
              SizedBox(
                child: Container(
                  width: 120,
                  height: 150,
                  child: Lottie.asset(
                    'assets/lottie/pig2.json',
                  ),
                ),
              ),
              Column(children: [
                Text(
                  'Warr Finances',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                SizedBox(height: 15),
                const Text(
                  'Controle suas finanças de forma',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'muito simples',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 20,
                ),
              ]),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10,
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.email),
                    labelText: 'E-mail',
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10,
                ),
                child: TextField(
                  
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.lock),
                    labelText: 'Senha',
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
