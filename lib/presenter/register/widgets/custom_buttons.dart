import 'package:flutter/material.dart';

import '../../../shared/utils/is_dark.dart';
import '../../../theme.dart';

class CustomButtons extends StatelessWidget {
  const CustomButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {},
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey.shade900)),
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: const Text(
              'Limpar',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Container(
            decoration: BoxDecoration(
              color: isDark(context)
                  ? const Color.fromARGB(214, 238, 46, 94)
                  : const Color.fromRGBO(238, 46, 93, 1),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: const Text(
              'Enviar',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
