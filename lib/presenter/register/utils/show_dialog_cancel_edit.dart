import 'package:flutter/material.dart';

import '../../home/home_page.dart';

Future<dynamic> showAlertDialogCancelEdit(
    BuildContext context, bool isEditing, Function? callback) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Cancelar'),
        content: const Text('Deseja cancelar a edição?'),
        actions: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(238, 46, 93, 1)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Não',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(238, 46, 93, 1)),
            ),
            onPressed: () {
              isEditing = false;
              callback;
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomePage(currentPage: 1),
                ),
              );
            },
            child: const Text(
              'Sim',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}
