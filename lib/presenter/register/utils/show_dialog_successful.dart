import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../home/home_page.dart';

Future<dynamic> showDialogSuccessfulRegister(
    BuildContext context, User user, Function function) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Cadastro'),
        content: const Text('Cadastro realizado com sucesso!'),
        actions: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(238, 46, 93, 1)),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomePage(currentPage: 1, user: user),
                ),
              );
              function();
            },
            child: const Text(
              'Ok',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      );
    },
  );
}
