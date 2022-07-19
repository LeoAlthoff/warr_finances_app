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
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Entrar na sua conta',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ]),
              Container(
                //padding: EdgeInsets.only(left = 0.0,  top = 0.0, right = 0.0,  bottom = 0.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  
                ),
                height: 40,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10,
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    
                    icon: Icon(Icons.email),
                    labelText: 'E-mail',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10,
                ),
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    icon: Icon(Icons.lock),
                    labelText: 'Senha',
                    labelStyle: TextStyle(
                      color: Colors.black,
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
