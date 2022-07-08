import 'package:flutter/material.dart';

import '../../../shared/utils/format_money.dart';

class MainContainerHome extends StatelessWidget {
  final int index;
  final double value;
  late final String entry;
  late final IconData icon;
  late final Color iconColor;
  late final Color textColor;
  late final Color background;

  // ignore: prefer_const_constructors_in_immutables
  MainContainerHome({
    Key? key,
    required this.index,
    required this.value,
  }) : super(key: key);

  void defineContainer(entrada) {
    switch (index) {
      case 1:
        entry = "Entradas";
        icon = Icons.arrow_circle_up;
        iconColor = Colors.green;
        textColor = Colors.black;
        background = Colors.white;
        break;
      case 2:
        entry = "Saídas";
        icon = Icons.arrow_circle_down;
        iconColor = Colors.red;
        textColor = Colors.black;
        background = Colors.white;
        break;
      case 3:
        entry = "Total";
        icon = Icons.attach_money;
        iconColor = Colors.white;
        textColor = Colors.white;
        background = const Color.fromARGB(255, 233, 70, 124);
    }
  }

  @override
  Widget build(BuildContext context) {
    defineContainer(index);
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      height: 150,
      width: 370,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 5,
            color: Colors.grey.shade200,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  entry,
                  style: TextStyle(
                    fontSize: 20,
                    color: textColor,
                  ),
                ),
                Icon(
                  icon,
                  size: 35,
                  color: iconColor,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              getCurrency(value),
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Última entrada dia 1º de julho',
              style: TextStyle(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
