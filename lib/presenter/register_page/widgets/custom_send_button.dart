import 'package:flutter/material.dart';

class CustomSendButton extends StatelessWidget {
  const CustomSendButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(238, 46, 93, 1),
        borderRadius: BorderRadius.circular(5),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Enviar',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
