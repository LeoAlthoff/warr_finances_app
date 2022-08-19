import 'package:flutter/material.dart';

class DialogInvalidInfo extends StatelessWidget {
  final String msg;
  const DialogInvalidInfo({
    Key? key,
    required this.msg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Informações inválidas!'),
      content: Text(msg),
      actions: [
        TextButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(const Color.fromRGBO(238, 46, 93, 1)),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Ok',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
